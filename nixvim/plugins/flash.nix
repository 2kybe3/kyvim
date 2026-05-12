{
  plugins.flash = {
    enable = true;
    luaConfig.post = ''
      vim.keymap.set({ "n", "x", "o" }, "zk", function() require("flash").jump() end, { desc = "flash" })
    '';
  };
}
