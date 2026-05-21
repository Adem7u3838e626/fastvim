return {
  {
    "mfussenegger/nvim-dap",

    dependencies = {

      -- UI
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },

        config = function()
          local dap = require("dap")
          local dapui = require("dapui")

          dapui.setup()

          dap.listeners.after.event_initialized["dapui"] = function()
            dapui.open()
          end

          dap.listeners.before.event_terminated["dapui"] = function()
            dapui.close()
          end

          dap.listeners.before.event_exited["dapui"] = function()
            dapui.close()
          end
        end,
      },

      -- Mason DAP
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim" },

        config = function()
          require("mason-nvim-dap").setup({
            ensure_installed = {
              "codelldb",
              "python",
              "bash",
            },

            automatic_installation = true,
          })
        end,
      },

      -- Virtual text
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup()
        end,
      },
    },

    config = function()
      local dap = require("dap")

      -- Breakpoint icon

      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DiagnosticError",
      })

      -- Python

      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",

          program = "${file}",

          pythonPath = function()
            return "python"
          end,
        },
      }

      -- C / C++ / Rust
      local mason_path = vim.fn.stdpath("data") .. "/mason/"

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = mason_path .. "bin/codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.cpp = {
        {
          name = "Launch file",

          type = "codelldb",
          request = "launch",

          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/",
              "file"
            )
          end,

          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      -- Bash
      dap.configurations.sh = {
        {
          type = "bash",
          request = "launch",
          name = "Launch Bash",

          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }

      local keymap = vim.keymap

      keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debug" })
      keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
      keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
      keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })

      keymap.set(
        "n",
        "<leader>db",
        dap.toggle_breakpoint,
        { desc = "Toggle Breakpoint" }
      )

      keymap.set(
        "n",
        "<leader>B",
        function()
          dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        { desc = "Conditional Breakpoint" }
      )

      keymap.set(
        "n",
        "<leader>dr",
        dap.repl.open,
        { desc = "Open REPL" }
      )

      keymap.set(
        "n",
        "<leader>dl",
        dap.run_last,
        { desc = "Run Last Debug" }
      )

      -- which-key integration

      local wk = require("which-key")

      wk.register({
        d = {
          name = "Debug",
          b = "Toggle Breakpoint",
          B = "Conditional Breakpoint",
          r = "Open REPL",
          l = "Run Last",
          S = "Start Debug",
          o = "Step Over",
          i = "Step Into",
          u = "Step Out",
        },
      }, { prefix = "<leader>" })
    end,
  },
}
