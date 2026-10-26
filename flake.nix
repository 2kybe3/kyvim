{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    basenix = {
      url = "git+https://git.kybe.xyz/2kybe3/basenix.git";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "";
      };
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { self, ... }: {
        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];

        perSystem =
          { pkgs, ... }:
          let
            lib = (self.lib.mkPackage { inherit pkgs; });
          in
          {
            packages.default = lib.config.build.package;
            checks.kyvim = lib.config.build.test;
          };

        flake.lib.mkPackage =
          {
            pkgs,
            basenix ? inputs.basenix.lib.mkLib {
              inherit pkgs;
              theme = "gruvbox-dark";
            },
          }:
          inputs.nixvim.lib.evalNixvim {
            modules = [
              (inputs.import-tree ./modules)
              { nixpkgs.pkgs = pkgs; }
            ];
            extraSpecialArgs = {
              inherit inputs basenix;
            };
          };
      }
    );
}
