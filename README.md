# explain-kube-to-me

[![ci](https://img.shields.io/github/actions/workflow/status/external-systems/explain-kube-to-me/ci.yml?branch=main&label=ci&logo=github)](https://github.com/external-systems/explain-kube-to-me/actions/workflows/ci.yml)
[![release](https://img.shields.io/github/v/release/external-systems/explain-kube-to-me?label=release&color=d97757)](https://github.com/external-systems/explain-kube-to-me/releases/latest)
[![docs](https://img.shields.io/website?url=https%3A%2F%2Fexplain-kube-to-me.external.systems%2F&label=docs&up_message=online&down_message=offline)](https://explain-kube-to-me.external.systems/)
[![license](https://img.shields.io/github/license/external-systems/explain-kube-to-me)](https://github.com/external-systems/explain-kube-to-me/blob/main/LICENSE)
[![built with Nix](https://img.shields.io/badge/built_with-Nix-5277C3?logo=nixos&logoColor=white)](https://nixos.org)

**Kubernetes, The Extensible API, a Platform that Develops itself.**

A plain-language website and slide deck that explain Kubernetes to someone
who knows Windows Server, IIS, DotNetNuke, Payload CMS, SQL and APIs, but
not Linux, containers or Kubernetes. Pictures, web addresses and
comparisons; the only code is one short PayloadSite order form.

- `documentation/docs/`: the website, eight short chapters + a dictionary.
- `documentation/slides/slides.md`: the deck, 8 topics (↓ for more on each). Every slide
  has speaker notes (press `S`).
- `documentation/slides/custom.css`: this deck's own blocks (route pills, kinds,
  levels). The look, speaker sync and the hand-drawn `<svg class="sketch">`
  diagrams come from the org style in external-systems/pkgs.
- `documentation/slides/icons/`: product logos and line icons, with their sources and
  licenses in `documentation/slides/CREDITS.txt`.

The repo follows the external-systems org flake standard: one input,
external-systems/pkgs, whose `flakeModules.default` brings the formatter, the
checks and the docs and deck build (MkDocs from nixpkgs, the reveal.js
pin, the org style). The settings that differ from the org defaults are
in `flake-parts/docs.nix`. Update the tooling with
`nix flake update org-pkgs`, then `sync-locks`. Zero npm. The dev shell is
devenv (`devenv shell`, or `devenv up` for docs on :8981 and slides on :8982).

```bash
nix run .#serve-slides          # rehearse the deck → http://127.0.0.1:8982 (S = speaker notes)
nix run .#watch-documentation   # live docs preview → http://127.0.0.1:8981

nix build .#slides              # ./result = the deck on its own (opens from disk)
nix build .#documentation       # ./result = the website, deck included at /slides/
nix flake check                 # build both, treefmt lint, lock-sync
```

Pushes to `main` publish the website, deck included, to GitHub Pages
(`.github/workflows/ci.yml`, the external-systems/pkgs org CI). One-time setup: Settings → Pages → Source:
"GitHub Actions". Build output is never committed: CI builds and deploys
it, and `result`, `_site/` and `site/` are gitignored.

Remember to `git add` new files: Nix only sees files git tracks.
