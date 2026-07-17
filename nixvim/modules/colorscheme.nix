{
  colorschemes.catppuccin.enable = true;
  extraConfigLua = /* lua */ ''
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = true,
      float = {
        transparent = true,
        solid = false,
      },
      lsp_styles = {
        integrations = {
          cmp = true,
          gitsigns = true,
        },
      },
    })
    vim.cmd("colorscheme catppuccin-nvim")
  '';
}
