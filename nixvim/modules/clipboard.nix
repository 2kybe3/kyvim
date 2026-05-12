{
  clipboard = {
    register = "";
    providers.wl-copy.enable = true;
  };

  keymaps = [
    {
      key = "y";
      action = ''"+y'';
      mode = [
        "n"
        "x"
      ];
    }
    {
      key = "Y";
      action = ''"+Y'';
      mode = [
        "n"
      ];
    }
    {
      key = "yy";
      action = ''"+yy'';
      mode = [
        "n"
      ];
    }
    {
      key = "p";
      action = ''"+p'';
      mode = [
        "n"
        "x"
      ];
    }
  ];
}
