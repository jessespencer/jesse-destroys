# Jesse Destroys

Personal case study portfolio and landing page at [jessedestroys.com](https://jessedestroys.com).

## What It Is

A single-page static site showcasing experiments and side projects. Features a rotating tagline, embedded media (YouTube/Loom/images), and social links. Pure HTML/CSS/JS — no build tools, no dependencies.

## Project Structure

```
jesse-destroys/
├── index.html          # Single-page site (markup, styles, and script)
├── jesse-destroys.gif  # Animated logo
├── CNAME               # Custom domain config for GitHub Pages
└── CLAUDE.md           # Project-specific Claude Code instructions
```

## Running Locally

Open `index.html` directly, or serve it:

```bash
python3 -m http.server 3000
```

Then visit `http://localhost:3000`.

## Deployment

Hosted on GitHub Pages. Push to `main` and it deploys automatically.

## Adding a New Case Study

Duplicate an `<article class="experiment">` block in `index.html`. Each entry supports:

- **Image thumbnail** — wrap an `<img>` in an `<a class="experiment-thumb">`
- **Embedded video** — use the `.embed-wrap` iframe pattern (16:9 aspect ratio)
- **External link** — add an `<a class="experiment-link">` in `.experiment-info`
