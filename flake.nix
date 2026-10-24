{
  description = "Kubernetes, The Extensible API: docs site (MkDocs) + slide deck (reveal.js)";

  # Every outside dependency is an input below. `flake.lock` records the
  # exact commit + content hash of each one, so every machine builds the
  # same site. Update them with `nix flake update` (all) or
  # `nix flake update <name>` (one).
  inputs = {
    # Nixpkgs — the package set (python, mkdocs' runtime, alejandra, ...).
    # Pinned to a stable release branch; flake.lock holds the exact commit.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Utility Flakes
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";

    # Presenting — docs site (MkDocs) + slide deck (reveal.js) as one
    # flake-parts module (github:external-systems/presenting). It carries
    # mkdocs-flake, the reveal.js pin and the deck build, so this repo only
    # sets `presenting.slides.dir` + `documentation.*` (flake-parts/default.nix).
    # Upgrade docs tooling or reveal.js with `nix flake update presenting`.
    presenting = {
      url = "github:external-systems/presenting";
      # Nested `inputs = {...}`: flat `inputs.<x>.follows` lines trip
      # statix's repeated-keys lint (W20).
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        import-tree.follows = "import-tree";
      };
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      # Add "aarch64-linux" / "aarch64-darwin" here to build on those too.
      systems = [
        "x86_64-linux"
      ];

      imports = [
        # Every .nix file under ./flake-parts is a flake-parts module,
        # loaded automatically — no import list to keep in sync.
        (inputs.import-tree ./flake-parts)
        # packages.{documentation,slides}, apps.{watch-documentation,serve-slides},
        # and the deck embedded in the site at /slides/.
        inputs.presenting.flakeModules.default
      ];
    };
}
