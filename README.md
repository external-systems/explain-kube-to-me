# explain-kube-to-me

**Kubernetes, The Extensible API, a Platform that Develops itself.**

A plain-language website and slide deck that explain Kubernetes to someone
who knows Windows Server, IIS, DotNetNuke, Payload CMS, SQL and APIs, but
not Linux, containers or Kubernetes. No code on any page or slide: only
pictures and comparisons.

- `documentation/docs/`: the website, seven short chapters + a dictionary.
- `slides/slides.md`: the deck. Every slide has speaker notes (press `S`).

Created from the [presenting](https://github.com/external-systems/presenting)
template: a Nix flake (flake-parts + mkdocs-flake + reveal.js), zero npm.

```bash
nix run .#serve-slides          # rehearse the deck → http://127.0.0.1:8000 (S = speaker notes)
nix run .#watch-documentation   # live docs preview → http://127.0.0.1:8000

nix build .#slides              # ./result = the deck on its own (opens from disk)
nix build .#documentation       # ./result = the website, deck included at /slides/
nix flake check                 # build both + lint the Nix code
```

Pushes to `main` publish the website, deck included, to GitHub Pages
(`.github/workflows/pages.yml`). One-time setup: Settings → Pages → Source:
"GitHub Actions".

Remember to `git add` new files: Nix only sees files git tracks.
