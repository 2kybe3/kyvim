{ lib, ... }:
{
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
