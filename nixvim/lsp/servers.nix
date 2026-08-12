{
  plugins.lspconfig.enable = true;
  lsp = {
    servers = {
      "*".config = {
        capabilities.textDocument.semanticTokens.multilineTokenSupport = true;
        root_markers = [ ".git" ];
      };

      # keep-sorted start

      basedpyright.enable = true;
      bashls.enable = true;
      gopls.enable = true;
      html.enable = true;
      jsonls.enable = true;
      just.enable = true;
      nil_ls.enable = true;
      sqls.enable = true;
      statix.enable = true;
      ts_ls.enable = true;
      yamlls.enable = true;
      zls.enable = true;

      # keep-sorted end
    };
    inlayHints.enable = true;
  };

  plugins.roslyn.enable = true;
}
