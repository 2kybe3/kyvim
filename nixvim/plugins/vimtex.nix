{ pkgs, ... }: {
  plugins.vimtex = {
    enable = true;
    texlivePackage = pkgs.texliveFull;
  };
  globals.vimtex_view_method = "zathura";
}
