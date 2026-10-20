# Jesse Destroys — Project Instructions

## Overview

Static single-page portfolio site. No framework, no build step — just `index.html` with inline `<style>` and `<script>`.

## Tech Stack

- HTML, CSS, vanilla JS (all in `index.html`)
- No package manager, no dependencies
- Hosted on GitHub Pages with custom domain (`jessedestroys.com`)
- `covers/` holds the thumbnail template and source shots — excluded from the Pages build
- `_config.yml` only excludes repo docs and `covers/` from the Pages build — add any new top-level `.md` there, or Pages will publish it
- `AGENTS.md` is a symlink to this file (for Codex) — edit `CLAUDE.md`, never the link

## Architecture

Everything lives in `index.html`:
- **Styles**: Inline `<style>` block in `<head>` — responsive via a single `@media (max-width: 768px)` breakpoint
- **Layout**: CSS flexbox, max-width 1400px container
- **Script**: IIFE at the bottom of `<body>` handles the rotating tagline animation
- **Design**: Dark theme (#000 background, #f5f5f5 text, rgba white for muted elements)

## Key Patterns

- Case studies are `<article class="experiment">` blocks in `<main class="experiments">`
- Two embed types: image thumbnails (`.experiment-thumb > img`) and 16:9 iframe embeds (`.embed-wrap`)
- Rotating tagline uses class-based CSS fade transitions (`#rotating-text`, `.fade-out`)
- Social links use inline SVG icons in the header

## Code Style (Project-Specific)

- This is a zero-dependency static site — do not introduce build tools, frameworks, or package managers unless explicitly asked
- Keep all code in `index.html` (inline styles and scripts) unless the site grows significantly
- Use vanilla JS — no jQuery, no module imports
- Maintain the existing design language: dark background, subtle hover states, minimal borders using `rgba(255,255,255,0.1)`

## Adding Content

To add a new case study, duplicate an `<article class="experiment">` block and update:
1. `.experiment-year` — year label
2. `.experiment-title` — project name
3. `.experiment-desc` — one-line description
4. `.experiment-link` — optional external URL
5. Embed: either an image thumbnail or an iframe in `.embed-wrap`. Thumbnails are 1600×840 JPEG covers in `images/`, all rendered from `covers/template.html` so the set stays uniform — never drop in a raw screenshot or a site's `og:image`:
   - Capture the live project at 1440×900, 2x, dark mode, into `covers/shots/<slug>.jpg` (stage light-only pages on a dark background)
   - Render with the headless Chrome command in the template's header comment; `n` is the row's position, so renumber covers when rows are added or reordered

To add a new rotating tagline, append a string to the `phrases` array in the `<script>` block.
