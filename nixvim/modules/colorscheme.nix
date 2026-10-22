{
  pkgs,
  theme ? null,
  ...
}:
if theme != null then
  {
    extraPlugins = [ theme.theme ];
    extraConfigLua = ''
      vim.g.tinted_background_transparent = 1
      vim.cmd.colorscheme('${theme.name}')
    '';
  }
else
  {
    colorschemes.catppuccin.enable = true;
    extraConfigLua = ''
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
