# AGENTS.md

Plain-language Kubernetes explainer: a MkDocs website and a reveal.js
deck in `documentation/`, built by a Nix flake on the org flake standard
(nix-style skill). The deck and site builds come from
external-systems/presenting through the dev partition. Zero npm.

## Layout
- `flake.nix`: inputs (all follow external-systems/pkgs) and the dev partition wiring. No consumer-facing inputs.
- `flake-parts/`: consumer-facing flake-parts modules, auto-imported (import-tree). Empty for now.
- `dev/flake.nix` + `dev/flake.lock`: dev-only inputs (dev-nixpkgs, treefmt-nix, presenting). `dev/flake-module.nix`: the dev partition (formatter, checks, apps, docs).
- `devenv.yaml` + `devenv.lock` + `devenv.nix`: the dev shell. The org shell comes from external-systems/pkgs (`org-pkgs/devenv` in devenv.yaml).
- `documentation/flake-module.nix`: imports `presenting.flakeModules.default`; sets `documentation.*` and `presenting.slides.*`.
- `documentation/mkdocs.yml` + `documentation/docs/*.md`: the website. Link the deck with plain HTML (`../slides/index.html`), not Markdown links: strict builds validate Markdown links against `docs/`, where `/slides/` doesn't exist.
- `documentation/slides/`: the deck, `index.html` + `slides.md` (+ `custom.css`, `sketch.js`, `speaker-sync.js`, `icons/`, `vendor/`).
- `.github/workflows/ci.yml`: the org CI, calling external-systems/pkgs `org-ci.yml`. `nix flake check` on PRs (`ci / flake-check`); on main pushes the Pages deploy (deck at `/slides/`) and the `0.<minor>.<commits>` release. `.github/rulesets/default.json`: the org branch ruleset. Change CI only in pkgs, never here.
- `.vscode/`: nixd settings, resolved from this flake's own inputs and `debug` options.

## Build and check

```bash
devenv up                      # docs on :8981, slides on :8982
docs / slides                  # devenv scripts: live preview
nix build .#documentation      # website, deck at /slides/
nix build .#slides             # deck only
fmt && check                   # treefmt, then nix flake check
```

## Tool loop
- The shell is devenv. If `DEVENV_ROOT` is unset, run commands with `devenv shell -- <cmd>`.
- `git add` new files before any `nix` command: Nix only sees tracked files.
- `fmt`, then `check`. Both must pass before a change is done.
- After `nix flake update org-pkgs`, run `sync-locks` in the same commit. Update the deck tooling with `nix flake update --flake ./dev presenting`.

## Rules
- Load the `nix-style` skill before editing any `.nix` file.
- Dev-only inputs go in `dev/flake.nix`, never `flake.nix`.
- Don't copy presenting's build code into this repo.
- Work on a branch and open a PR. Never push to `main`; the ruleset requires a PR with a green `ci / flake-check`.
- Never commit build output: no `result` / `result-*`, `_site/`, `site/`, `documentation/site/` (all gitignored), no built deck or HTML generated from `slides.md`, no `gh-pages` pushes. To publish, merge to `main`.
- Vendored *sources* the deck loads at runtime (`documentation/slides/vendor/rough.js`, `documentation/slides/icons/`) are inputs, not build output, and stay committed.
