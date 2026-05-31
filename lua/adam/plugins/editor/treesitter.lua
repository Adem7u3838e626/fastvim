return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },

  init = function()
    vim.g.no_plugin_maps = true
  end,

  config = function()
    local ok, ts_textobjects = pcall(require, "nvim-treesitter-textobjects")
    if not ok then
      vim.notify("Failed to load nvim-treesitter-textobjects", vim.log.levels.ERROR)
      return
    end

    ts_textobjects.setup({
      select = {
        lookahead = true,

        selection_modes = {
          ["@parameter.outer"] = "v",
          ["@function.outer"] = "V",
          ["@class.outer"] = "V",
          ["@loop.outer"] = "V",
          ["@conditional.outer"] = "V",
        },

        include_surrounding_whitespace = false,
      },

      move = {
        set_jumps = true,

        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]p"] = "@parameter.inner",
          ["]l"] = "@loop.outer",
          ["]i"] = "@conditional.outer",
        },

        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[p"] = "@parameter.inner",
          ["[l"] = "@loop.outer",
          ["[i"] = "@conditional.outer",
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

    -- SELECT (visual / operator pending)

    local select = require("nvim-treesitter-textobjects.select")
    vim.keymap.set({ "x", "o" }, "ai", function()
      require("nvim-treesitter-textobjects.select")
      .select_textobject("@conditional.outer", "textobjects")
    end, { desc = "Around if/conditional" })

    vim.keymap.set({ "x", "o" }, "ii", function()
      require("nvim-treesitter-textobjects.select")
      .select_textobject("@conditional.inner", "textobjects")
    end, { desc = "Inside if/conditional" })

    vim.keymap.set({ "x", "o" }, "af", function()
      select.select_textobject("@function.outer", "textobjects")
    end, { desc = "Select around function" })

    vim.keymap.set({ "x", "o" }, "if", function()
      select.select_textobject("@function.inner", "textobjects")
    end, { desc = "Select inside function" })

    vim.keymap.set({ "x", "o" }, "ac", function()
      select.select_textobject("@class.outer", "textobjects")
    end, { desc = "Select around class" })

    vim.keymap.set({ "x", "o" }, "ic", function()
      select.select_textobject("@class.inner", "textobjects")
    end, { desc = "Select inside class" })

    vim.keymap.set({ "x", "o" }, "ap", function()
      select.select_textobject("@parameter.outer", "textobjects")
    end, { desc = "Select around parameter" })

    vim.keymap.set({ "x", "o" }, "ip", function()
      select.select_textobject("@parameter.inner", "textobjects")
    end, { desc = "Select inside parameter" })

    vim.keymap.set({ "x", "o" }, "al", function()
      select.select_textobject("@loop.outer", "textobjects")
    end, { desc = "Select around loop" })

    vim.keymap.set({ "x", "o" }, "il", function()
      select.select_textobject("@loop.inner", "textobjects")
    end, { desc = "Select inside loop" })

    -- MOVE (navigation)

    local move = require("nvim-treesitter-textobjects.move")

    vim.keymap.set({ "n", "x", "o" }, "]f", function()
      move.goto_next_start("@function.outer", "textobjects")
    end, { desc = "Next function start" })

    vim.keymap.set({ "n", "x", "o" }, "[f", function()
      move.goto_previous_start("@function.outer", "textobjects")
    end, { desc = "Previous function start" })

    vim.keymap.set({ "n", "x", "o" }, "]c", function()
      move.goto_next_start("@class.outer", "textobjects")
    end, { desc = "Next class start" })

    vim.keymap.set({ "n", "x", "o" }, "[c", function()
      move.goto_previous_start("@class.outer", "textobjects")
    end, { desc = "Previous class start" })

    vim.keymap.set({ "n", "x", "o" }, "]p", function()
      move.goto_next_start("@parameter.inner", "textobjects")
    end, { desc = "Next parameter" })

    vim.keymap.set({ "n", "x", "o" }, "[p", function()
      move.goto_previous_start("@parameter.inner", "textobjects")
    end, { desc = "Previous parameter" })

    -- SWAP (parameter manipulation)

    local swap = require("nvim-treesitter-textobjects.swap")

    vim.keymap.set("n", "<leader>a", function()
      swap.swap_next("@parameter.inner")
    end, { desc = "Swap parameter next" })

    vim.keymap.set("n", "<leader>A", function()
      swap.swap_previous("@parameter.inner")
    end, { desc = "Swap parameter previous" })
  end,
}
