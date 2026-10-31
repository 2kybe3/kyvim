{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    luaConfig.post = /* lua */ ''
      local harpoon = require("harpoon")

      harpoon:setup()

      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)
    '';
  };
}
