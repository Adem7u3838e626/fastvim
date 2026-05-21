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
  vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
  vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
  vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
}
