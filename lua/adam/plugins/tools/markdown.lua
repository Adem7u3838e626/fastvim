return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.nvim",
    },

    opts = {
      heading = {
        enabled = true,
        sign = false,
        icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
        position = "overlay",
      },

      paragraph = {
        enabled = false,
      },

      code = {
        enabled = true,
        sign = false,
        style = "full",
        language_pad = 1,
        right_pad = 1,
      },

      bullet = {
        enabled = true,
        icons = { "•", "○", "◆", "■" },
      },

      checkbox = {
        enabled = true,
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 " },
        custom = {
          todo = { raw = "TODO", rendered = "󰄱 TODO" },
          done = { raw = "DONE", rendered = "󰱒 DONE" },
        },
      },

      quote = {
        enabled = true,
        icon = "▋",
      },

      pipe_table = {
        enabled = true,
        preset = "round",
      },

      link = {
        enabled = true,
        image = "󰥶 ",
        email = "󰀓 ",
        hyperlink = "󰌹 ",
      },

      win_options = {
        conceallevel = {
          default = 2,
          rendered = 2,
        },
        concealcursor = {
          default = "",
          rendered = "",
        },
      },
    },
  },

  {
    "preservim/vim-markdown",
    ft = { "markdown" },

    config = function()
      vim.g.vim_markdown_folding_disabled = 0
      vim.g.vim_markdown_folding_style_pythonic = 0
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_toml_frontmatter = 1
      vim.g.vim_markdown_json_frontmatter = 1

      vim.g.vim_markdown_conceal = 2
      vim.g.vim_markdown_conceal_code_blocks = 0
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",

    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_browser = ""
    end,
  },

  -- =========================================
  -- Tables / alignment helper
  -- =========================================
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    config = function()
      vim.g.table_mode_corner = "|"
    end,
  },
}
