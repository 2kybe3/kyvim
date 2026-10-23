{
  description = "kyvim - My nixvim (neovim) config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    basenix.url = "git+https://git.kybe.xyz/2kybe3/basenix.git";
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
        };
      in
      {
        packages.default = (self.lib.mkPackage { inherit pkgs; }).wrapped;
      }
    )
    // {
      lib.mkPackage =
        {
          pkgs,
          basenix ? inputs.basenix.lib.mkLib {
            inherit pkgs;
            theme = "gruvbox-dark";
          },
        }:
        rec {
          unwrapped = nixvim.legacyPackages.${pkgs.stdenv.hostPlatform.system}.makeNixvimWithModule {
            inherit pkgs;
            module = import ./nixvim;
            extraSpecialArgs = {
              inherit inputs basenix;
            };
          };
          wrapped = pkgs.symlinkJoin {
            inherit (unwrapped) name meta;

            paths = [ unwrapped ];

            buildInputs = with pkgs; [ makeWrapper ];

            postBuild = ''
              wrapProgram $out/bin/nvim \
                --prefix PATH : ${
                  pkgs.lib.makeBinPath (
                    with pkgs;
                    [
                      # formatter
                      nixfmt
                      prettier
                      xmlformat
                      prettierd
                      keep-sorted

                      # pdf viewer (latex)
                      zathura

                      # DAP
                      gdb
                    ]
                  )
                }
            '';
          };
        };
    };
}
