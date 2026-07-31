{
  plugins.lsp = {
    enable = true;
    servers = {
      # keep-sorted start block=yes

      basedpyright.enable = true;
      bashls.enable = true;
      gopls.enable = true;
      jsonls.enable = true;
      just.enable = true;
      nil_ls.enable = true;
      statix.enable = true;
      ts_ls.enable = true;
      yamlls.enable = true;
      zls.enable = true;

      # keep-sorted end
    };
  };
}
