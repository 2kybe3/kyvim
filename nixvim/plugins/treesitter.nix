{ pkgs, ... }:
{
  plugins = {
    treesitter-context = {
      enable = true;
      max_lines = 4;
    };
    treesitter = {
      enable = true;
      highlight.enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        typescript
        javascript
        superhtml
        markdown
        vimdoc
        svelte
        regex
        rust
        just
        yaml
        bash
        make
        toml
        fish
        json
        lua
        nix
        vim
        csv
        xml
        css
      ];
    };
  };
}
