{
  plugins.lsp = {
    enable = true;
    servers = {
      # keep-sorted start block=yes

      bashls.enable = true;
      fish_lsp.enable = true;
      gopls.enable = true;
      jsonls.enable = true;
      just.enable = true;
      nil_ls = {
        enable = true;
        settings.nix.flake = {
          autoArchive = true;
        };
      };
      pylsp.enable = true;
      statix.enable = true;
      superhtml.enable = true;
      svelte.enable = true;
      ts_ls.enable = true;
      yamlls.enable = true;
      zls.enable = true;

      # keep-sorted end
    };
  };
}
