return {
  "folke/which-key.nvim",

  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,

  opts = {
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },

    win = {
      wo = {
        winblend = 10,
      },

      border = "double",
      padding = { 2, 2, 2, 2 },
    },

    layout = {
      align = "center",
      min_height = 4,
      max_height = 20,
      min_width = 20,
      max_width = 50,
    },
  },
}
