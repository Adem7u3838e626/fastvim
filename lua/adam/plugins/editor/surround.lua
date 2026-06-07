return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      surrounds = {
        ["("] = {
          add = { "(", ")" },
          find = function()
            return require("nvim-surround.config").get_selection()
          end,
          delete = "^%(().*(%)$",
          change = {
            target = "^%(().*(%)$",
            replacement = function()
              return { { "(" }, { ")" } }
            end,
          },
        },
      },
    })

    vim.keymap.set("i", "<C-g>s", "<Plug>(nvim-surround-insert)")
    vim.keymap.set("n", "ys", "<Plug>(nvim-surround-normal)")
    vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)")
    vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)")
    vim.keymap.set("n", "cS", "<Plug>(nvim-surround-change-line)")
  end
}
