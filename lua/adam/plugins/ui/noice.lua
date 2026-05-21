return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  config = function()
    require("noice").setup({
      messages = {
        enabled = false,
      },
      
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },

      views = {
        cmdline_popup = {
          position = {
            row = "40%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
          },
        },
      },
      
      notify = {
        enabled = true,
      },

      lsp = {
        progress = {
          enabled = true,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
      },
    })
    
    vim.notify = require("notify")
    vim.keymap.set("n", "<leader>yc", function()
      local cmd = vim.fn.histget("cmd", -1)
      vim.fn.setreg("+", cmd)
    end, { desc = "Copy last command to clipboard" })
  end,
}
