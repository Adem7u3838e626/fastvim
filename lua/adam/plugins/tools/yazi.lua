return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("yazi").setup({
      open_for_directories = true,

      keymaps = {
        show_help = "<f1>",
      },
    })

    vim.keymap.set("n", "<leader>y", "<cmd>Yazi<CR>", {
      desc = "Open Yazi",
    })

    vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<CR>", {
      desc = "Open Yazi in cwd",
    })
  end,
}
