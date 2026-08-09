{ pkgs, lib, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    omnisharp-extended-lsp-nvim
  ];

  plugins = {
    web-devicons.enable = true;
    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
      };
    };
  };

  keymaps = [
    {
      action = lib.nixvim.mkRaw "require('omnisharp_extended').telescope_lsp_definition";
      key = "gd";
    }
    {
      action = lib.nixvim.mkRaw "function() require('omnisharp_extended').telescope_lsp_definition({ jump_type = \"vsplit\" }) end";
      key = "sgd";
    }
    {
      action = lib.nixvim.mkRaw "require('omnisharp_extended').telescope_lsp_references";
      key = "gD";
    }

    {
      action = lib.nixvim.mkRaw "require('telescope.builtin').diagnostics";
      key = "<leader>dd";
    }
    {
      action = lib.nixvim.mkRaw "require('telescope.builtin').git_commits";
      key = "<leader>gc";
    }
    {
      action = lib.nixvim.mkRaw "require('telescope.builtin').git_branches";
      key = "<leader>gb";
    }
    {
      action = lib.nixvim.mkRaw "require('telescope.builtin').git_status";
      key = "<leader>gs";
    }
  ];
}
