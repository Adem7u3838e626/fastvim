return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/trouble.nvim",
  },

  opts = function()
    local trouble = require("trouble")

    local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name}",
    })

    return {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },

        lualine_c = {
          "filename",
          {
            symbols.get,
            cond = symbols.has,
          },
        },

        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },

      inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "location" },
      },

      extensions = { "nvim-tree" },
    }
  end,

  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
