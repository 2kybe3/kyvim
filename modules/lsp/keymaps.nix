{ lib, ... }: {
  lsp.keymaps = [
    {
      key = "<leader>fm";
      lspBufAction = "format";
    }
    {
      key = "<leader>rr";
      lspBufAction = "rename";
    }
    {
      key = "K";
      lspBufAction = "hover";
    }
    {
      key = "<leader>ca";
      action = lib.nixvim.mkRaw "require('actions-preview').code_actions";
    }
    {
      action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=1, float=true }) end";
      key = "<leader>dj";
    }
    {
      action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=-1, float=true }) end";
      key = "<leader>dk";
    }
  ];
}
