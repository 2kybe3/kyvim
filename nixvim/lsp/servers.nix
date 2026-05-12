{
  plugins.lsp = {
    enable = true;
    servers = {
      nil_ls = {
        enable = true;
        settings.nix.flake = {
          autoArchive = true;
        };
      };
      zls.enable = true;
      just.enable = true;
      ts_ls.enable = true;
      pylsp.enable = true;
      svelte.enable = true;
      yamlls.enable = true;
      statix.enable = true;
      jsonls.enable = true;
      bashls.enable = true;
      fish_lsp.enable = true;
      superhtml.enable = true;
      tailwindcss.enable = true;
    };
  };
}
