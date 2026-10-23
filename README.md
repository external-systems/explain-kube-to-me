# explain-kube-to-me

**Kubernetes, The Extensible API, a Platform that Develops itself.**

A plain-language website and slide deck that explain Kubernetes to someone
who knows Windows Server, IIS, DotNetNuke, Payload CMS, SQL and APIs, but
not Linux, containers or Kubernetes. Pictures, web addresses and
comparisons; the only code is one short PayloadSite order form.

- `documentation/docs/`: the website, eight short chapters + a dictionary.
- `slides/slides.md`: the deck, 8 topics (↓ for more on each). Every slide
  has speaker notes (press `S`).
- `slides/sketch.js` + `slides/vendor/rough.js`: turn the `<svg class="sketch">`
  diagrams in the deck into hand-drawn, Excalidraw-style drawings.
- `slides/icons/`, `slides/fonts/`: product logos, line icons and the
  handwriting font, with their sources and licenses in `slides/CREDITS.txt`.

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
