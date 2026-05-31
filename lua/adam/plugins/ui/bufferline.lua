return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",

  opts = {
    options = {
      numbers = "ordinal",
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },

  config = function(_, opts)
    require("bufferline").setup(opts)

    vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
    vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
    vim.keymap.set("n", "<leader>b=", "<c-w>=", { desc = "balance windows" })
    vim.keymap.set("n", "<leader>bfs", function()
      vim.cmd("vsplit")
      require("telescope.builtin").find_files()
    end, { desc = "Vsplit + find files" })
    vim.keymap.set("n", "<leader>bvs", function()
      vim.cmd("split")
      require("telescope.builtin").find_files()
    end, { desc = "split + find files" })

  end,
}
