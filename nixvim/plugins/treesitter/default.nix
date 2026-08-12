{ pkgs, ... }: {
  extraFiles."queries/nix/injections.scm".source = ./injections.scm;

  plugins = {
    treesitter-context = {
      enable = true;
      settings.max_lines = 4;
    };

    treesitter = {
      enable = true;
      highlight.enable = true;
      nixvimInjections = false;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        # keep-sorted start block=yes

        bash
        c
        c-sharp
        caddy
        cmake
        comment
        css
        csv
        git-rebase
        html
        hurl
        javascript
        json
        just
        latex
        lua
        make
        markdown
        nix
        razor
        regex
        ron
        rust
        sql
        toml
        typescript
        vim
        vimdoc
        xml
        yaml
        zsh

        # keep-sorted end
      ];
    };
  };
}
