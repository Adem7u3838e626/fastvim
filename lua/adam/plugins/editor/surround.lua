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

      keymaps = {
        insert = "<C-g>s",
        normal = "ys",
        delete = "ds",
        change = "cs",
        change_line = "cS",
      },
    })
  end
}
