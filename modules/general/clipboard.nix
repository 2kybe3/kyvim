{
  clipboard.providers.wl-copy.enable = true;

  keymaps = [
    {
      mode = [
        "v"
        "n"
      ];
      key = "<leader>y";
      action = "\"+y";
    }
    {
      mode = "n";
      key = "<leader>p";
      action = "\"+p";
    }
    {
      mode = "x";
      key = "<leader>p";
      action = "\"_dP";
    }
  ];
}
