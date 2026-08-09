{ lib, pkgs, ... }: {
  keymaps = [
    {
      action = lib.nixvim.mkRaw "require('dapui').toggle";
      key = "<leader>d";
    }
  ];
  plugins = {
    dap-virtual-text.enable = true;
    dap-ui.enable = true;
    dap = {
      enable = true;

      adapters = {
        coreclr = lib.nixvim.mkRaw /* lua */ ''
          {
            type = 'executable',
            command = '${lib.getExe pkgs.netcoredbg}',
            args = { '--interpreter=vscode' }
          }
        '';
      };

      configurations = {
        cs = [
          {
            type = "coreclr";
            name = "launch - netcoredbg";
            request = "launch";
            program.__raw = /* lua */ ''
              function()
                return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
              end
            '';
          }

          {
            type = "coreclr";
            name = "attach - netcoredbg";
            request = "attach";
            program.__raw = /* lua */ ''
              function()
                return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
              end
            '';
            processId.__raw = /* lua */ ''
              function()
                local name = vim.fn.input('Executable name (filter): ')
                return require("dap.utils").pick_process({ filter = name })
              end
            '';
          }
        ];
      };
    };
  };
}
