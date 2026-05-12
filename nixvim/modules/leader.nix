{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  extraConfigLua = ''
    vim.g.mapleader = " "
    vim.g.maplocalleader = ","
    vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
    vim.keymap.set("v", "<Space>", "<Nop>", { silent = true })
  '';
}
