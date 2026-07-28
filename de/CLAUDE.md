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
`_data/-orcid.yaml` also feeds into the publications list.

**Reusable page components** live in `_includes/` (e.g. `card.html`, `list.html`, `list_small.html`,
`grid.html`, `feature.html`, `cols.html`, `paper-list.html`, `post-list.html`) and are composed from
Markdown pages / layouts with Liquid `{% include %}` calls plus parameters (mirrors the `filter=`,
`field=` style seen in `t_field.html`/`t_list.html` above). When adding a new content block on a page,
check `_includes/` first for an existing component before writing new HTML.

**Static assets**: `_styles/` (Sass, compiled via Jekyll's `sass_dir`) and `_scripts/` (vendored JS —
jQuery, Bootstrap, Slick, parallax, tilt, wow.js — plus `zzz_main.js`, the site's own init code, named
to load last). Both are force-included in the build (`include:` in `_config.yaml`) and excluded from
per-language duplication.

## Adding a new lab member

Add a file to `_members/` (copy an existing one, e.g. `_members/jonathan-dortheimer.md`) with front
matter: `name`, `image`, `description`, `role`, `group`, `page: true`, `tags`, `projects`, `links`,
`key` (must match the filename slug), `collection: members`. The `_layouts/member.html` layout and
`team/index.md` listing pick it up automatically via the collection.
