{
  plugins.lsp.enable = true;
  lsp.inlayHints.enable = true;
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
