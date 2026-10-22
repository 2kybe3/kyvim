{
  basenix,
  ...
}:
{
  extraPlugins = [
    (basenix.vimTheme "kyvim")
  ];
  extraConfigLua = ''
    vim.g.tinted_background_transparent = 1
    vim.cmd.colorscheme('kyvim')
  '';
}
