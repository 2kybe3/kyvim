{ pkgs, ... }: {
  extraPackages = with pkgs; [
    # keep-sorted start

    keep-sorted
    nixfmt
    opentofu
    prettier
    prettierd
    stylua
    xmlformat

    # keep-sorted end
  ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      log_level = "trace";
      format_on_save = {
        timeout_ms = 10 * 1000; # 10s
        lsp_format = "fallback";
      };
      formatters.injected.options.ignore_errors = false;

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
          svelte = prettier;
          html = prettier;
          css = prettier;

          xml = [ "xmlformatter" ];
          cs = {
            lsp_format = "prefer";
          };

          terraform = [ "tofu_fmt" ];
          terraform-vars = [ "tofu_fmt" ];
          hcl = [ "tofu_fmt" ];

          nix = [ "nixfmt" ];
          lua = [ "stylua" ];
          rust = [ "rustfmt" ];
          "*" = [
            "injected"
            "keep-sorted"
          ];
        };
    };
  };
}
