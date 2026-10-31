{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        { name = "async_path"; }
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "buffer"; }
      ];
      mapping = {
        "<C-Space>" = /* lua */ "cmp.mapping.complete()";
        "<Tab>" = /* lua */ ''cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" })'';
        "<S-Tab>" = /* lua */ ''cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" })'';
        "<CR>" = /* lua */ "cmp.mapping.confirm({ select = true })";
      };
    };
  };
}
