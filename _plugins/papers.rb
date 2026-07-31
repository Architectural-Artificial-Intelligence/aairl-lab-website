require 'bibtex'
require 'set'
require 'yaml'
require 'date'

module Jekyll
  # Populates site.data.papers from the BibTeX bibliography so the publications
  # page and paper-list includes render straight from _bibliography/*.bib
  # instead of a hand-maintained data file.
  class PapersGenerator < Generator
    priority :high

    MONTHS = %w[jan feb mar apr may jun jul aug sep oct nov dec].freeze

    def generate(site)
      scholar_config = site.config['scholar'] || {}
      source_dir = scholar_config['source'] || '_bibliography'
      bib_file = scholar_config['bibliography'] || 'references.bib'
      bib_path = File.join(site.source, source_dir, bib_file)
      return unless File.exist?(bib_path)

      bibliography = BibTeX.open(bib_path)

      papers = bibliography.select { |item| item.is_a?(BibTeX::Entry) }
                            .map { |entry| paper_from_entry(entry) }

      papers.concat(orcid_only_papers(site, papers))

      papers.sort_by! { |paper| paper['date'] }
      papers.reverse!

      site.data['papers'] = papers
    end

    private

    def paper_from_entry(entry)
      {
        'id' => entry.key.to_s,
        'title' => clean(entry.title),
        'authors' => format_authors(entry),
        'date' => format_date(entry),
        'publisher' => clean(entry.booktitle || entry.journal || entry.school || entry.institution || entry.publisher),
        'link' => paper_link(entry),
        'tags' => format_tags(entry),
        'doi' => entry.field?('doi') ? clean(entry.doi) : nil,
        'lab' => true,
      }
    end

    # Supplements the bib-derived (lab) papers with each member's other ORCID
    # works -- excluding anything whose DOI already matches a lab paper, so a
    # paper never shows up twice. These are tagged `lab: false` and scoped to
    # a single member via `owner_key`, so they never enter lab-wide listings.
    def orcid_only_papers(site, lab_papers)
      lab_dois = lab_papers.filter_map { |p| p['doi']&.downcase }.to_set
      lab_titles = lab_papers.filter_map { |p| normalize_title(p['title']) }.to_set

      orcid_dir = File.join(site.source, '_data', 'orcid_works')
      return [] unless Dir.exist?(orcid_dir)

      Dir.glob(File.join(orcid_dir, '*.yml')).flat_map do |path|
        member_key = File.basename(path, '.yml')
        works = (YAML.safe_load_file(path, permitted_classes: [Date]) || {})['works'] || []

        # A lab paper and an ORCID-fetched work can be the same publication even
        # when the ORCID record lacks a DOI (common for conference papers), so
        # fall back to a normalized title match to avoid listing it twice.
        works.reject do |w|
          (w['doi'] && lab_dois.include?(w['doi'].downcase)) ||
            lab_titles.include?(normalize_title(w['title']))
        end.map { |w| w.merge('date' => w['date'] || '0000-01-01', 'lab' => false, 'owner_key' => member_key) }
      end
    end

    def normalize_title(title)
      return nil if title.nil?
      title.to_s.downcase.gsub(/[^a-z0-9]+/, ' ').strip
    end

    def clean(value)
      return nil if value.nil?
      value.to_s.gsub(/[{}]/, '').strip
    end

    def format_authors(entry)
      return [] unless entry.author
      entry.author.map { |name| [name.first, name.last].compact.map(&:to_s).join(' ') }
    end

    # a custom `date = {YYYY-MM-DD}` field allows day-level precision (e.g. to
    # match a news post's publish date); otherwise falls back to year/month.
    def format_date(entry)
      return clean(entry.date) if entry.field?('date')

      year = clean(entry.year)
      return '0000-01-01' if year.nil? || year.empty?

      month = entry.field?('month') ? month_number(clean(entry.month)) : '01'
      "#{year}-#{month}-01"
    end

    def month_number(month)
      index = MONTHS.index(month.downcase[0..2])
      index ? format('%02d', index + 1) : '01'
    end

    def paper_link(entry)
      return clean(entry.url) if entry.field?('url')
      return "https://doi.org/#{clean(entry.doi)}" if entry.field?('doi')
      nil
    end

    def format_tags(entry)
      return [] unless entry.field?('tags')
      clean(entry.tags).split(',').map(&:strip)
    end
  end
end
