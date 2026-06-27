{
  plugins.image = {
    enable = false;
    settings = {
      backend = "kitty";
      integrations = {
        markdown.enabled = true;
        typst.enabled = true;
        neorg.enabled = true;
        syslang.enabled = true;
        html.enabled = false;
        css.enabled = false;
      };
      hijack_file_patterns = [
        "*.png"
        "*.jpg"
        "*.jpeg"
        "*.gif"
        "*.webp"
        "*.avif"
      ];
    };
  };
}
