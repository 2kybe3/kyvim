{
  description = "kyvim - My nixvim (neovim) config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixvim,
      nixpkgs,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        base = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = import ./nixvim;
          extraSpecialArgs = {
            inherit inputs;
          };
        };

        nvim =
          pkgs.symlinkJoin {
            name = "nvim";

            paths = [ base ];

            buildInputs = with pkgs; [ makeWrapper ];

            postBuild = ''
              wrapProgram $out/bin/nvim \
                --prefix PATH : ${
                  pkgs.lib.makeBinPath (
                    with pkgs;
                    [
                      emacs
                      pandoc
                      texliveFull
                      js-beautify
                    ]
                  )
                }
            '';
          }
          // {
            meta = base.meta;
          };
      in
      {
        packages.default = nvim;
      }
    );
}
