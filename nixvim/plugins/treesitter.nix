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
        typescript
        javascript
        git-rebase
        superhtml
        markdown
        vimdoc
        regex
        caddy
        rust
        just
        yaml
        bash
        make
        toml
        json
        hurl
        lua
        nix
        vim
        csv
        xml
        css
        ron
      ];
    };
  };
}
