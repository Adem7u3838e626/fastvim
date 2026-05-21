return {
  "folke/trouble.nvim",
  opts = {
    auto_preview = true,
    auto_refresh = true,
    icon= true;
    modes = {
      diagnostics = {
        win = {
          type = "split",
          border = "rounded",
        },
      },

      symbols = {
        win = {
          type = "split",
          border = "rounded",
        },
      },
      lsp = {
        win = {
          type = "split",
          border = "rounded",
        },
      },
    },
  },
  cmd = "Trouble",
  keys = {
    keys = {
      {
        "<leader>xn",
        function() require("trouble").next({ skip_groups = true }) end,
        desc = "Next diagnostic",
      },
      {
        "<leader>xp",
        function() require("trouble").previous({ skip_groups = true }) end,
        desc = "Previous diagnostic",
      },
    },
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
