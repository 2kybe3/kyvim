{
  plugins.orgmode = {
    enable = true;
    settings = {
      org_agenda_files = "~/orgfiles/**/*";
      org_default_notes_file = "~/orgfiles/refile.org";
    };
    luaConfig.post = ''
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'org',
        callback = function()
          vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
            silent = true,
            buffer = true,
          })
        end,
      })
      vim.lsp.enable('org')
    '';
  };
}
