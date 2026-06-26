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
        hurl
        javascript
        json
        just
        lua
        make
        markdown
        nix
        regex
        ron
        rust
        sql
        superhtml
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
