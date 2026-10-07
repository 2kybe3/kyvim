{ lib, pkgs, ... }: {
  keymaps = [
    {
      action = lib.nixvim.mkRaw "require('dapui').toggle";
      key = "<leader>dd";
    }
  ];
  plugins = {
    dap-virtual-text.enable = true;
    dap-ui.enable = true;
    dap = {
      enable = true;

      adapters = {
        rust-gdb = lib.nixvim.mkRaw /* lua */ ''
          {
            type = "executable",
            command = "${lib.getExe' pkgs.rustc "rust-gdb"}",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
          }
        '';
        gdb = lib.nixvim.mkRaw /* lua */ ''
          {
            type = "executable",
            command = "${lib.getExe pkgs.gdb}",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
          }
        '';
        coreclr = lib.nixvim.mkRaw /* lua */ ''
          {
            type = 'executable',
            command = '${lib.getExe pkgs.netcoredbg}',
            args = { '--interpreter=vscode' }
          }
        '';
      };

      configurations = rec {
        rust = [
          {
            name = "launch";
            type = "rust-gdb";
            request = "launch";
            program.__raw = /* lua */ ''
              function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end
            '';
            args = { };
            cwd = "\${workspaceFolder}";
            stopAtBeginningOfMainSubprogram = false;
          }
          {
            name = "Select and attach to process";
            type = "gdb";
            request = "attach";
            program.__raw = /* lua */ ''
              function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end
            '';
            pid.__raw = /* lua */ ''
              function()
                local name = vim.fn.input('Executable name (filter): ')
                return require("dap.utils").pick_process({ filter = name })
              end
            '';
            cwd = "\${workspaceFolder}";
          }
          {
            name = "Attach to gdbserver :1234";
            type = "gdb";
            request = "attach";
            target = "localhost:1234";
            program.__raw = /* lua */ ''
              function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end
            '';
            cwd = "\${workspaceFolder}";
          }
        ];
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
