{
  plugins.rustaceanvim = {
    enable = true;
    settings.server.on_attach = /* lua */ ''
      function(client, bufnr)
        vim.keymap.set(
          "n",
          "<leader>j",
          function()
            vim.cmd.RustLsp({'moveItem', 'down'})
          end,
          { silent = true, buffer = bufnr }
        )
        vim.keymap.set(
          "n",
          "<leader>k",
          function()
            vim.cmd.RustLsp({'moveItem', 'up'})
          end,
          { silent = true, buffer = bufnr }
        )
      end,
    '';
  };
}
