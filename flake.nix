{
  description = "kyvim - My nixvim (neovim) config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:nix-community/nixvim";
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

        nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = import ./nixvim;
          extraSpecialArgs = {
            inherit inputs;
          };
        };
      in
      {
        packages.default = nvim;
      }
    );
}
