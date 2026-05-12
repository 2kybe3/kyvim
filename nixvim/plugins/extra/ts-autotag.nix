{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    nvim-ts-autotag
  ];

  extraConfigLua = ''
    require('nvim-ts-autotag').setup({})
  '';
}
