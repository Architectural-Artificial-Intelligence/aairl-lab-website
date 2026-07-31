# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

This is the Jekyll-based website for the Architectural AI Research Lab (AAIRL), built on
[Lab Website Template](https://github.com/greenelab/lab-website-template) (see `template/docs` for
upstream docs). Content is authored as Markdown/YAML front matter; layouts and includes are Liquid
templates; a handful of custom Ruby plugins add filters used across the templates, plus one generator
that turns the BibTeX bibliography into site data (see Publications/citations below).

## Commands

Local development runs inside Docker (Ruby version and deps are pinned via `Gemfile.lock`):

```bash
./.docker/run.sh              # build image and run `jekyll serve` with hot reload at :4000
```

Without Docker, using the pinned Ruby 3.1 + bundler:

```bash
bundle install
bundle exec jekyll serve --livereload    # local dev server, http://localhost:4000
bundle exec jekyll build                 # production build -> _site/
JEKYLL_ENV=production bundle exec jekyll build   # matches CI build (on-push -> Pages)
```

There is no test suite or linter configured. `html-proofer` runs automatically as a post-build Jekyll
hook (`_plugins/misc.rb`, `HtmlProofer` module) and checks the generated `_site/` for broken links/refs;
it is controlled by the `proofer` key in `_config.yaml` (currently `false` for local dev). To validate
a build, set `proofer: true` (or override at build time) and inspect `_site/` output for errors.

## Deployment

GitHub Actions workflows (`.github/workflows/`) handle deploy:
- `on-push.yaml` → `build-site.yaml`: builds with `JEKYLL_ENV=production` and pushes `_site/` to the
  `gh-pages` branch on every push to `main`.
- `on-pull-request.yaml` → `build-preview.yaml`: builds a preview for PRs.
- `first-time-setup.yaml`: one-time repo bootstrap (creates `gh-pages`, strips template-only files).

There's no manual deploy step — merging to `main` triggers the live rebuild.

## Architecture

**Collections drive the content model.** Each content type is a Jekyll collection defined in
`_config.yaml` (`members`, `posts`, `topics`, `jobs`, `projects`, `products`), backed by a directory
prefixed with `_` (`_members/`, `_posts/`, `_topics/`, `_jobs/`, `_projects/`, `_products/`) and a
layout in `_layouts/` (`member.html`, `post.html`, `topic.html`, `jobs.html`, `project.html`). Front
matter defaults map collection type → layout (see the `defaults:` block in `_config.yaml`). Adding a
new item of an existing type is almost always just adding a new Markdown file to the matching `_x/`
folder with the right front matter (copy a sibling file as a template) — the corresponding public page
under `members/`, `news/`, `topics/`, `jobs/`, `publications/`, etc. is generated automatically.

**Multilingual (i18n) via jekyll-polyglot**, three languages: `en` (default), `he`, `de`
(`languages:` / `default_lang:` in `_config.yaml`). Translated UI strings live in `_data/i18n/{en,he,de}.yml`.
Per-content translations resolve through two custom includes rather than polyglot's native per-file
translation:
- `_includes/t_field.html` — looks up `site.data.i18n[lang][collection][key][field]`, falling back to a
  `<field>_he` front-matter key, then the base front-matter field, then (for `body`/`bio`) rendered page
  content.
- `_includes/t_list.html` — same resolution for list-valued fields.

  So translating a member bio/post body means adding an entry under
  `site.data.i18n.he.members.<key>.bio` (etc.) or a `bio_he:` front-matter field — not a separate
  Markdown file per language. `key`/`collection` on each document (set in front matter, e.g. see
  `_members/*.md`) is what ties a document to its i18n entry.
- **Convention: all prose content — including the default English — lives in `_data/i18n/en.yml`
  under `members.<key>`, not in front matter or the Markdown body.** Nearly every member's `bio` (and,
  for the structured About fields described below, `research_focus`/`current_work`/`background`/
  `interests`) is defined this way; `he.yml`/`de.yml` mirror the same keys with translations. Front
  matter should only hold structural/enum fields (`name`, `image`, `role`, `group`, `tags`, `projects`,
  `links`, `orcid`, `key`, `collection`) — never hand-written paragraphs, since anything placed directly
  in front matter or the Markdown body renders as-is on every language version of the page (see
  `footer_ai_translation` in `en.yml`: translations are AI-generated, so English is the only version a
  human should be editing directly). A one-off shared string used across many members (e.g. the lab's
  university affiliation) should be a single top-level i18n key (see `lab_university`) rather than
  repeated per-member front matter.
- `exclude_from_localization` in `_config.yaml` lists paths (images, `_scripts`, `_styles`, assets)
  that exist only at the site root and are not duplicated per-language.

**Custom Liquid filters** (`_plugins/*.rb`) back template logic used throughout `_includes/` and
`_layouts/`: `array.rb` (`array_filter`, `array_carve`), `hash.rb` (`hash_default` for merging
front-matter defaults), `regex.rb` (`regex_scan`, `regex_replace`, `regex_strip`), `file.rb`
(`file_exists`, `file_read`), `misc.rb` (`is_nil`, `object_items`, `data_filter` — arbitrary Ruby-expression
filtering of a collection, used for the `filter="..."` syntax in list components, `google_fonts`).

**Publications/citations**: `_bibliography/references.bib` is the single source of truth for papers — no
`_data/papers.yaml` exists. `_plugins/papers.rb` is a Jekyll generator (uses `bibtex-ruby`, already a
jekyll-scholar dependency) that parses the bib file at build time and populates `site.data.papers`, which
`publications/index.md`, `paper-list.html`, and `citation.html` all read from exactly as if it were a data
file. Per-paper overrides live as custom BibTeX fields directly on each entry: `tags` (comma-separated),
`url` (falls back to `https://doi.org/<doi>` if absent), and an optional `date` field (`YYYY-MM-DD`) for
day-level precision when `year`/`month` alone aren't specific enough (e.g. to match a news post's publish
date). Publisher/venue is read from `booktitle`, `journal`, `school`, `institution`, or `publisher`,
whichever is present. jekyll-scholar itself (configured via `scholar:` in `_config.yaml`) is otherwise
unused — no template calls its `{% bibliography %}` tag. Citation counts/data live in `_data/citations.yaml`.

Each `_members/*.md` may also set a top-level `orcid:` field (a bare ORCID iD, e.g.
`0000-0002-7464-8526`). `bin/fetch_orcid_works.rb` is a standalone script (not run during the Jekyll
build; run manually or via the `refresh-orcid` scheduled GitHub Action) that calls the public ORCID API
for each such member and writes `_data/orcid_works/<member-key>.yml` (works/employment/education).
`_plugins/papers.rb` merges each member's ORCID works into `site.data.papers`, skipping any whose DOI
already matches a `references.bib` entry, **or whose normalized title matches a bib entry's title when
the ORCID record has no DOI** (ORCID conference-paper records often lack one) — either check avoids
listing the same paper twice. Surviving ORCID-only works are tagged `lab: false` with an `owner_key` of
that member — vs. `lab: true` for every bib-derived paper. `_layouts/member.html` renders bib papers
under "Papers" (`paper-list.html match="members"`) and the member's non-lab ORCID works under "Other
Publications" (`match="orcid_other"`, rendered `compact=true` and `collapse_after=5` — see below), plus
Education/Employment sections read directly from `site.data.orcid_works[page.key]`.
`publications/index.md` (the site-wide list) filters to `lab: true` only.

ORCID `start`/`end` dates are plain strings and are sometimes year-only (`"2017"`) rather than full
`YYYY-MM-DD`, since ORCID doesn't always have month/day precision. Liquid's `date` filter misparses a
bare 4-digit year as a Unix timestamp (e.g. `"2017" | date: "%b %Y"` → `"Jan 1970"`), so always format
ORCID dates through `_includes/friendly_date.html` (`{% include friendly_date.html value=edu.start %}`)
instead of piping directly through `| date:`.

`_includes/paper-list.html` supports `compact=true` (passed through to `citation.html`, adds a
`paper-compact` CSS class for a denser card) and `collapse_after=<n>` (wraps everything past the first
`n` matched papers in a native `<details>`/`<summary>` "show more" toggle, no JS). `citation.html` also
turns a paper's tag pills into links whenever a `_topics/*.md` entry's `tag` matches (case-sensitive),
falling back to a plain unlinked pill otherwise — most raw tags currently have no corresponding topic
page, so this is a partial/best-effort feature, not full tag-based browsing.

**Reusable page components** live in `_includes/` (e.g. `card.html`, `list.html`, `list_small.html`,
`grid.html`, `feature.html`, `cols.html`, `paper-list.html`, `post-list.html`) and are composed from
Markdown pages / layouts with Liquid `{% include %}` calls plus parameters (mirrors the `filter=`,
`field=` style seen in `t_field.html`/`t_list.html` above). When adding a new content block on a page,
check `_includes/` first for an existing component before writing new HTML.

**Static assets**: `_styles/` (Sass, compiled via Jekyll's `sass_dir`) and `_scripts/` (vendored JS —
jQuery, Bootstrap, Slick, parallax, tilt, wow.js — plus `zzz_main.js`, the site's own init code, named
to load last). Both are force-included in the build (`include:` in `_config.yaml`) and excluded from
per-language duplication. Custom page-specific CSS (as opposed to the vendored `style.css`) belongs in
`_styles/-theme.scss`; RTL-only overrides belong in `_styles/_rtl.scss` under the `[dir="rtl"]` selector.

**Member profile page** (`_layouts/member.html`): left column is a sticky quick-facts card (photo,
name, optional `tagline` i18n field, role via `roles:` lookup, optional `department` i18n field, shared
`lab_university` string, social links from `page.links`). Right column's About section checks
`site.data.i18n.en.members[page.key]` for `research_focus`/`current_work`/`background`/`interests` — if
any are present it renders four labeled sub-blocks (via `t_field.html`, so each resolves per-language),
otherwise it falls back to the single plain `bio` field/body. Projects render as a `member_project_grid`
CSS grid (auto-fit columns, so a lone trailing card stretches instead of leaving a gap) with a clickable
topic pill when `proj.tag` matches a `_topics/*` page. Education/Employment render as a CSS-only
timeline (`edu_timeline`) fed by `site.data.orcid_works[page.key]` — see the ORCID date-formatting note
above. A Prev/Next nav at the bottom walks `site.members` filtered to the same `group`, sorted by name.

## Adding a new lab member

Add a file to `_members/` (copy an existing one, e.g. `_members/haya-brama.md`) with front matter:
`name`, `image`, `description`, `role`, `group`, `page: true`, `tags`, `projects`, `links`, `orcid`
(optional), `degree` (optional), `key` (must match the filename slug), `collection: members`. The
`_layouts/member.html` layout and `team/index.md` listing pick it up automatically via the collection.

`degree` is independent of `role` — `role` is the member's current status/position at the lab
(`msc`, `postdoc`, `pi`, ...), while `degree` is a list of completed academic degrees/titles/
professional credentials to display next to their name (e.g. `degree: [arch, phd]`) and should
only include what's actually earned (an in-progress M.Sc. student should leave it unset). It is
always an array, even for a single value (e.g. `degree: [arch]`), since a member can hold more
than one (e.g. an architect who also holds a Ph.D.). Each key must match an entry in the
`degree_titles` (rendered as a prefix, e.g. `arch` → "Arch. Name") or `degree_suffixes` (rendered as
a suffix, comma-joined if multiple, e.g. `phd` → "Name, Ph.D.") maps in
`_data/i18n/{en,he,de}.yml`; `_includes/member_name.html` does the lookup and is used everywhere a
member's name renders (profile heading, team-grid cards, prev/next nav, post author bylines) instead
of calling `t_field.html field="name"` directly.

Do **not** put a hand-written bio, tagline, or department in the front matter or the Markdown body —
per the i18n convention above, add it under `members.<key>` in `_data/i18n/en.yml` instead (a plain
`bio` field, or the four structured `research_focus`/`current_work`/`background`/`interests` fields for
the redesigned About section), so it can be localized like every other member's content.
