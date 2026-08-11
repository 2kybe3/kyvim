{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };
      formatters_by_ft =
        let
          prettier = [
            "prettierd"
            "prettier"
          ];
        in
        {
          javascript = prettier;
          typescript = prettier;
          html = prettier;
          css = prettier;

          xml = [ "xmlformatter" ];
          cs = {
            lsp_format = "prefer";
          };

          nix = [ "nixfmt" ];
          rust = [ "rustfmt" ];
          "*" = [ "keep-sorted" ];
        };
    };
  };
}
