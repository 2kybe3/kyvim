{ pkgs, ... }: {
  plugins = {
    treesitter-context = {
      enable = true;
      settings.max_lines = 4;
    };
    treesitter = {
      enable = true;
      highlight.enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        # keep-sorted start block=yes

        bash
        c
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
