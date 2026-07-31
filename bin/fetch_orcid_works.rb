#!/usr/bin/env ruby
# frozen_string_literal: true

# Fetches each lab member's public ORCID record (works, employments, educations)
# and writes it to _data/orcid_works/<member-key>.yml for the Jekyll build to
# read statically (no network calls happen during `jekyll build` itself).
#
# Usage: ruby bin/fetch_orcid_works.rb

require 'net/http'
require 'uri'
require 'json'
require 'yaml'
require 'date'
require 'fileutils'

ROOT = File.expand_path('..', __dir__)
MEMBERS_DIR = File.join(ROOT, '_members')
OUTPUT_DIR = File.join(ROOT, '_data', 'orcid_works')
ORCID_API = 'https://pub.orcid.org/v3.0'

def front_matter(path)
  content = File.read(path)
  return nil unless content.start_with?('---')

  _, fm, = content.split('---', 3)
  YAML.safe_load(fm, permitted_classes: [Date, Time], aliases: true)
end

def fetch_json(url)
  uri = URI(url)
  req = Net::HTTP::Get.new(uri)
  req['Accept'] = 'application/json'
  res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |http| http.request(req) }
  raise "HTTP #{res.code} for #{url}" unless res.is_a?(Net::HTTPSuccess)

  JSON.parse(res.body)
end

def clean(value)
  value.nil? || value == '' ? nil : value
end

def orcid_date(date_hash, pad: false)
  return pad ? '0000-01-01' : nil unless date_hash

  year = date_hash.dig('year', 'value')
  return pad ? '0000-01-01' : nil unless year

  month = date_hash.dig('month', 'value') || (pad ? '01' : nil)
  day = date_hash.dig('day', 'value') || (pad ? '01' : nil)

  [year, month, day].compact.join('-')
end

# credit-name on ORCID contributors is usually "Last, First" (as deposited by
# the source, often mirroring BibTeX); normalize to "First Last" to match the
# format `_plugins/papers.rb` produces from the bib file, so name-based
# matching against `page.aliases` keeps working if a paper is later added to
# the bib.
def format_contributor_name(credit_name)
  return nil unless credit_name

  if credit_name.include?(',')
    last, first = credit_name.split(',', 2).map(&:strip)
    [first, last].compact.join(' ')
  else
    credit_name
  end
end

# ORCID's public API only returns full metadata (contributors/authors) from
# the per-work bulk endpoint, not the /works summary list -- fetch it in
# batches of 50 put-codes (the API's documented max) per ORCID API docs.
def fetch_full_works(orcid, put_codes)
  put_codes.each_slice(50).flat_map do |batch|
    data = fetch_json("#{ORCID_API}/#{orcid}/works/#{batch.join(',')}")
    (data['bulk'] || []).filter_map { |entry| entry['work'] }
  end.to_h { |work| [work['put-code'], work] }
end

# Fallback for venue when ORCID's own journal-title is blank (common for
# preprints/SSRN deposits) -- Crossref has it under container-title or
# publisher for the same DOI.
def crossref_venue(doi)
  return nil unless doi

  data = fetch_json("https://api.crossref.org/works/#{URI.encode_www_form_component(doi)}")
  message = data['message'] || {}
  clean(message['container-title']&.first) || clean(message['publisher'])
rescue StandardError
  nil
end

def extract_works(orcid)
  data = fetch_json("#{ORCID_API}/#{orcid}/works")
  summaries = (data['group'] || []).filter_map { |group| group.dig('work-summary', 0) }
  full_works = fetch_full_works(orcid, summaries.map { |s| s['put-code'] })

  summaries.map do |summary|
    put_code = summary['put-code']
    work = full_works[put_code] || summary

    external_ids = work.dig('external-ids', 'external-id') || []
    doi_entry = external_ids.find { |id| id['external-id-type'] == 'doi' }
    doi = doi_entry && clean(doi_entry['external-id-value'])

    authors = (work.dig('contributors', 'contributor') || [])
              .filter_map { |c| format_contributor_name(c.dig('credit-name', 'value')) }

    publisher = clean(work.dig('journal-title', 'value')) || crossref_venue(doi)

    {
      'id' => "orcid-#{put_code}",
      'title' => clean(work.dig('title', 'title', 'value')),
      'authors' => authors,
      'date' => orcid_date(work['publication-date'], pad: true),
      'publisher' => publisher,
      'link' => doi ? "https://doi.org/#{doi}" : clean(work['url']&.dig('value')),
      'doi' => doi,
      'tags' => [],
    }
  end
end

def extract_affiliations(orcid, endpoint, summary_key)
  data = fetch_json("#{ORCID_API}/#{orcid}/#{endpoint}")
  groups = (data['affiliation-group'] || []).flat_map { |g| g['summaries'] || [] }
  groups.filter_map do |summary_wrapper|
    summary = summary_wrapper[summary_key]
    next unless summary

    {
      'org' => clean(summary.dig('organization', 'name')),
      'role' => clean(summary['role-title']) || clean(summary['department-name']),
      'start' => orcid_date(summary['start-date']),
      'end' => orcid_date(summary['end-date']),
    }
  end
end

FileUtils.mkdir_p(OUTPUT_DIR)

Dir.glob(File.join(MEMBERS_DIR, '*.md')).each do |member_path|
  fm = front_matter(member_path)
  orcid = fm && clean(fm['orcid'])
  next unless orcid

  key = fm['key'] || File.basename(member_path, '.md')
  out_path = File.join(OUTPUT_DIR, "#{key}.yml")

  begin
    works = extract_works(orcid)
    employment = extract_affiliations(orcid, 'employments', 'employment-summary')
    education = extract_affiliations(orcid, 'educations', 'education-summary')
  rescue StandardError => e
    warn "[fetch_orcid_works] #{key} (#{orcid}): #{e.message} -- leaving existing data untouched"
    next
  end

  File.write(out_path, <<~YAML)
    # DO NOT EDIT -- generated by bin/fetch_orcid_works.rb from ORCID #{orcid}
    #{{ 'works' => works, 'employment' => employment, 'education' => education }.to_yaml.sub(/\A---\n/, '')}
  YAML

  puts "[fetch_orcid_works] #{key}: #{works.size} works, #{employment.size} employment, #{education.size} education"
end
