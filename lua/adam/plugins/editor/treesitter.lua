return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },

  init = function()
    -- منع تعارض اختصارات Neovim الافتراضية
    vim.g.no_plugin_maps = true
  end,

  config = function()
    local ok, ts_textobjects = pcall(require, "nvim-treesitter-textobjects")
    if not ok then
      vim.notify("Failed to load nvim-treesitter-textobjects", vim.log.levels.ERROR)
      return
    end

    -- =========================
    -- SELECT (اختيار النصوص)
    -- =========================
    ts_textobjects.setup({
      select = {
        lookahead = true,

        selection_modes = {
          ["@parameter.outer"] = "v",
          ["@function.outer"] = "V",
          ["@class.outer"] = "V",
        },

        include_surrounding_whitespace = false,
      },

      -- =========================
      -- MOVE (التنقل بين الكتل)
      -- =========================
      move = {
        set_jumps = true,

        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]p"] = "@parameter.inner",
        },

        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[p"] = "@parameter.inner",
        },

        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
        },

        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
        },
      },

      -- =========================
      -- SWAP (تبديل العناصر)
      -- =========================
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    })

    -- =========================
    -- KEYMAPS إضافية (SELECT يدوي)
    -- =========================
    local select = require("nvim-treesitter-textobjects.select")

    vim.keymap.set({ "x", "o" }, "af", function()
      select.select_textobject("@function.outer", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "if", function()
      select.select_textobject("@function.inner", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "ac", function()
      select.select_textobject("@class.outer", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "ic", function()
      select.select_textobject("@class.inner", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "ap", function()
      select.select_textobject("@parameter.outer", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "ip", function()
      select.select_textobject("@parameter.inner", "textobjects")
    end)
  end,
}
