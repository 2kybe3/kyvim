{
  imports = [
    ./keymaps.nix
    ./servers.nix
  ];

  extraConfigLua = ''
    vim.diagnostic.config({
      float = true,
      underline = true,
      virtual_lines = {
        enabled = true,
        current_line = true,
      },
    })
  '';
}
