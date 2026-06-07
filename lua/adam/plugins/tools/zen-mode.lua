return {
  "folke/zen-mode.nvim",
  dependencies = { "folke/twilight.nvim" },
  keys = {
    { "<leader>z", function() require("zen-mode").toggle({ window = { width = 120 } }) end, desc = "Toggle Zen Mode" },
  },
  cmd = "ZenMode",
  config = function()
    require("zen-mode").setup({
      window = {
        width = 120,
        options = {
          signcolumn = "no",
          number = true,
          relativenumber = true,
          cursorline = true,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        twilight = { enabled = true },
        gitsigns = { enabled = true },
        tmux = { enabled = true },
      },
    })

    require("twilight").setup({
      context = 10,
      treesitter = false,
    })
  end,
}
