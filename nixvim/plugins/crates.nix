{
  plugins.crates = {
    enable = true;
    settings.lsp = {
      enabled = true;
      hover = true;
      actions = true;
      completion = true;
    };
  };
}
