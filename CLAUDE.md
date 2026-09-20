# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Hugo static site for the UCLA MFE R Workshop — a three-half-day intensive. Published to
GitHub Pages at https://ucla-mfe-r-workshop.com via the root `CNAME`.

## Commands

    hugo server -D          # local preview at localhost:1313 (hugo extended required)
    hugo --minify           # production build into public/
    git submodule update --init --recursive   # after a fresh clone; the theme is a submodule

CI ([.github/workflows/hugo.yml](.github/workflows/hugo.yml)) builds with Hugo extended
0.134.2 and deploys on every push to `main`. The theme requires Hugo >= 0.121.0.

## Architecture

- **Theme**: `hugo-theme-relearn` as a git submodule under `themes/`. Never edit files
  there — override by mirroring the theme's path under the repo's own `layouts/` or
  `assets/`. Current overrides: `layouts/partials/logo.html` (UCLA Anderson SVG) and
  `layouts/partials/menu-footer.html`.
- **Content**: every page is a branch bundle — one `_index.md` per directory under
  `content/`. Sidebar order comes from `weight` (`ordersectionsby = "weight"`), not from
  directory names. Session pages use `pre = "<b>N. </b>"` for the numbered sidebar prefix.
  Page images live beside the `_index.md` that uses them and are referenced by bare
  filename (`![](rstudio.png)`). The workshop's `.R` and `.qmd` scripts live the same way
  — `content/1-r-objects/code1-vectors.R` is linked as `[vectors](code1-vectors.R)` and
  Hugo publishes it to `/1-r-objects/code1-vectors.R`. These files are the source of
  truth; the Dropbox copies under
  `~/Library/CloudStorage/Dropbox/teaching_materials/ucla/MFE R Workshop <year>/code/`
  are now just an archive, so edit the repo copies.
- **Theming**: `hugo.toml` declares one Relearn theme variant, `zen-auto`, pairing
  `auto = ['zen-light', 'zen-dark']`. Relearn resolves each name to
  `assets/css/theme-<name>.css`, so the filenames `theme-zen-light.css` and
  `theme-zen-dark.css` are load-bearing. Colors are CSS custom properties in `:root`.
- **baseURL**: the `hugo.toml` value is a placeholder; CI overrides it with `--baseURL`.
  Don't rely on it locally.

## Gotchas

- `public/` is gitignored and untracked; the deploy rebuilds from source, so local build
  output never affects the live site.
- `CNAME` sits at the repo root, not in `static/`, so it is not part of the build output.
  The custom domain comes from the repo's Pages settings — moving it to `static/CNAME`
  would be needed if that ever breaks.

## Updating for a new cohort

These values are year-specific and appear in several places:

- Canvas course ID `144052` — `content/_index.md` and `README.md` (course page), plus the
  per-session attendance assignment IDs at the top of each numbered session page.
- The day's scripts themselves, which live in each session's page bundle (see Content
  above) — update them in place; the "Files for today" links are relative and need no
  edit. The one exception is `solutions.R` on the day-3 page, still a Dropbox link.
- Dates and room in `content/0-schedule/_index.md`.
- The cohort year ("MFE 2025") in `content/_index.md` and `README.md`.
- The pinned R version in `content/0-getting-set-up/_index.md`.
