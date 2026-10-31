{
  lsp.servers = {
    "*".config = {
      capabilities.textDocument.semanticTokens.multilineTokenSupport = true;
      root_markers = [
        ".git"
        "flake.nix"
      ];
    };

    # keep-sorted start

    basedpyright.enable = true; # python
    bashls.enable = true; # bash
    clangd.enable = true; # c / c++
    glsl_analyzer.enable = true; # glsl (shaders)
    gopls.enable = true; # go
    graphql.enable = true;
    html.enable = true; # html
    jdtls.enable = true;
    jsonls.enable = true; # json
    just.enable = true; # just
    lua_ls.enable = true;
    neocmake.enable = true; # CMake
    nil_ls.enable = true; # nix
    sqls.enable = true; # sql
    statix.enable = true; # nix
    svelte.enable = true; # svelte
    tinymist.enable = true; # typst
    ts_ls.enable = true; # typescript
    yamlls.enable = true; # yaml
    zls.enable = true; # zig

    # keep-sorted end
  };
}
