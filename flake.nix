{
  description = "Kubernetes, The Extensible API: docs site (MkDocs) + slide deck (reveal.js)";

  inputs = {
    # Shared-input authority for the org: nixpkgs, flake-parts and
    # import-tree come from the artifact flake. Named org-pkgs, never
    # pkgs: `pkgs` is the nixpkgs package set everywhere else. After
    # `nix flake update org-pkgs`, run `sync-locks` in the same commit.
    org-pkgs.url = "github:external-systems/pkgs";
    nixpkgs.follows = "org-pkgs/nixpkgs";
    flake-parts.follows = "org-pkgs/flake-parts";
    import-tree.follows = "org-pkgs/import-tree";

    # No other inputs: formatting, the site and the deck all come from
    # org-pkgs (flakeModules.dev).
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      # Exposes debug.options / currentSystem.options, which nixd
      # (.vscode/settings.json) reads for flake-parts option hints.
      debug = true;

      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      imports = [
        # treefmt, docs + slides (settings in flake-parts/docs.nix),
        # lock-sync.
        inputs.org-pkgs.flakeModules.dev
        (inputs.import-tree ./flake-parts)
      ];
    };
}
