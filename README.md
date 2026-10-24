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
- `slides/icons/`: product logos and line icons, with their sources and
  licenses in `slides/CREDITS.txt`.

Built with the [presenting](https://github.com/external-systems/presenting)
flake-parts module: `flake.nix` imports `inputs.presenting.flakeModules.default`
and sets `presenting.slides.dir`; mkdocs-flake, the reveal.js pin and the deck
build all come from that one input (`nix flake update presenting`). Zero npm.

```bash
nix run .#serve-slides          # rehearse the deck → http://127.0.0.1:8000 (S = speaker notes)
nix run .#watch-documentation   # live docs preview → http://127.0.0.1:8000

nix build .#slides              # ./result = the deck on its own (opens from disk)
nix build .#documentation       # ./result = the website, deck included at /slides/
nix flake check                 # build both + lint the Nix code
```

Pushes to `main` publish the website, deck included, to GitHub Pages
(`.github/workflows/pages.yml`). One-time setup: Settings → Pages → Source:
"GitHub Actions". Build output is never committed: CI builds and deploys
it, and `result`, `_site/` and `site/` are gitignored.

Remember to `git add` new files: Nix only sees files git tracks.
