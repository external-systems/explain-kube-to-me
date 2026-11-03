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

    # No consumer-facing inputs: the site and deck are dev-partition
    # outputs. presenting, treefmt-nix and dev-nixpkgs are in dev/flake.nix.
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
        inputs.flake-parts.flakeModules.partitions
        (inputs.import-tree ./flake-parts)
      ];

      # Apps, checks and the formatter are evaluated only on demand; the
      # dev shell is devenv (devenv.yaml), not a flake output.
      partitionedAttrs = {
        apps = "dev";
        checks = "dev";
        formatter = "dev";
        # Docs/slides: `nix build .#documentation` / `.#slides`
        # (org-pkgs flakeModules.dev, documentation/flake-module.nix).
        legacyPackages = "dev";
      };

      partitions.dev = {
        module = ./dev/flake-module.nix;
        extraInputsFlake = ./dev;
      };
    };
}
