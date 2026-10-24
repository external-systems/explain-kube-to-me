# CLAUDE.md

Plain-language Kubernetes explainer: a MkDocs website (`documentation/`)
and a reveal.js deck (`slides/`), built by a Nix flake that consumes the
`external-systems/presenting` flake-parts module. Zero npm.

## Rule: never commit build artifacts

The website and the deck are built in CI and published to GitHub Pages
only. Never commit what a build produces:

- no `result` / `result-*` links, no `_site/`, no `site/`, no
  `documentation/site/` (all gitignored);
- no copies of the built deck or site anywhere in the tree (e.g. a
  built `slides/` with `reveal/` inside, or HTML generated from
  `slides.md`);
- no `gh-pages` branch pushes and no "publish" commits.

`.github/workflows/pages.yml` runs `nix flake check`, builds
`.#documentation` (deck embedded at `/slides/`) and deploys it to Pages
on pushes to `main`. To publish, merge to `main`. If something needs to
be in the built site, change the sources or the flake, not the output.

Vendored *sources* the deck loads at runtime (`slides/vendor/rough.js`,
`slides/icons/`) are inputs, not build output, and stay committed.

## Build and check

```bash
nix run .#serve-slides          # live deck → http://127.0.0.1:8000
nix run .#watch-documentation   # live docs → http://127.0.0.1:8000
nix build .#slides              # deck only
nix build .#documentation       # website, deck at /slides/
nix flake check                 # both builds + alejandra/statix/deadnix
```

Nix only sees files git tracks: `git add` new files before building.

## Layout

- `flake.nix`: inputs (locked in `flake.lock`) and the
  `inputs.presenting.flakeModules.default` import. The deck build and the
  reveal.js pin live in presenting; update with `nix flake update presenting`.
  Don't copy presenting's build code back into this repo.
- `flake-parts/`: this repo's config (auto-imported): `presenting.slides.dir`,
  `documentation.*`, checks.
- `documentation/`: `mkdocs.yml` + `docs/*.md`. Link the deck with plain
  HTML (`../slides/index.html`), not Markdown links: strict builds
  validate Markdown links against `docs/`, where `/slides/` doesn't exist.
- `slides/`: `index.html` + `slides.md` (+ `custom.css`, `sketch.js`,
  `icons/`, `vendor/`).
