return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,

      direction = "float",

      float_opts = {
        border = "rounded",
        winblend = 10,
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- terminals instances
    local float_term = Terminal:new({
      cmd = "fish",
      direction = "float",
      hidden = true,
    })

    local horizontal_term = Terminal:new({
      direction = "horizontal",
      hidden = true,
    })

    local vertical_term = Terminal:new({
      direction = "vertical",
      hidden = true,
    })

    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
    })

    -- keymaps
    vim.keymap.set("n", "<leader>tf", function()
      float_term:toggle()
    end, { desc = "Toggle Floating Terminal" })

    vim.keymap.set("n", "<leader>th", function()
      horizontal_term:toggle()
    end, { desc = "Toggle Horizontal Terminal" })

    vim.keymap.set("n", "<leader>tv", function()
      vertical_term:toggle()
    end, { desc = "Toggle Vertical Terminal" })

    vim.keymap.set("n", "<leader>tg", function()
      lazygit:toggle()
    end, { desc = "Toggle Lazygit" })
  end,
}
