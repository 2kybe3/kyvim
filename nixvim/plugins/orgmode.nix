{
  plugins.orgmode = {
    enable = true;
    settings = {
      org_agenda_files = "~/orgfiles/**/*";
      org_default_notes_file = "~/orgfiles/refile.org";
      mappings.org_return_uses_meta_return = true;
    };
    luaConfig.post = ''
      vim.lsp.enable('org')
    '';
  };
}
