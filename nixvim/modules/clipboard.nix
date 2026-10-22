{
  clipboard.providers.wl-copy.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>cc";
      action = /* lua */ ''
        <cmd>lua
          local default_reg = vim.fn.getreg('"')
          local system_reg = vim.fn.getreg('+')
          vim.fn.setreg('+', default_reg)
          vim.fn.setreg('"', system_reg)
        <CR>
      '';
    }
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
