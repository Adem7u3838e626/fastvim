return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { light = "latte", dark = "mocha" },
        transparent_background = false,
        term_colors = true,
        styles = {
          comments = { "italic" },
          functions = { "bold" },
        },
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true,
        terminal_colors = true,
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        transparent_mode = false,
      })
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
      })
    end,
  },

  {
    "nvim-lua/plenary.nvim",
    config = function()
      local function apply(theme)
        vim.cmd("colorscheme " .. theme)
      end

      local theme = "tokyonight"

      if theme == "catppuccin" then
        apply("catppuccin")
      elseif theme == "tokyonight" then
        apply("tokyonight-moon")
      elseif theme == "gruvbox" then
        apply("gruvbox")
      elseif theme == "kanagawa" then
        apply("kanagawa")
      end
    end,
  },
}
