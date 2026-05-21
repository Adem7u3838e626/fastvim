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

    -- 🟢 terminals
    local float_term = Terminal:new({
      cmd = "fish",
      direction = "float",
      hidden = true,
    })

    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
    })

    -- 🧠 RUNNER / COMPILER SYSTEM
    local function run_file()
      local file = vim.fn.expand("%")
      local ft = vim.bo.filetype
      local cmd = ""

      if ft == "python" then
        cmd = "python3 " .. file

      elseif ft == "javascript" then
        cmd = "node " .. file

      elseif ft == "bash" or ft == "sh" then
        cmd = "bash " .. file

      elseif ft == "rust" then
        cmd = "cargo run"

      elseif ft == "c" then
        cmd = "gcc " .. file .. " -o out && ./out"

      elseif ft == "cpp" then
        cmd = "g++ " .. file .. " -o out && ./out"

      else
        print("No runner for: " .. ft)
        return
      end

      float_term:send(cmd)
      float_term:toggle()
    end

    -- 🧠 COMPILER ONLY
    local function compile_file()
      local file = vim.fn.expand("%")
      local ft = vim.bo.filetype
      local cmd = ""

      if ft == "c" then
        cmd = "gcc " .. file .. " -o out"

      elseif ft == "cpp" then
        cmd = "g++ " .. file .. " -o out"

      elseif ft == "rust" then
        cmd = "cargo build"

      else
        print("No compiler for: " .. ft)
        return
      end

      float_term:send(cmd)
      float_term:toggle()
    end

    -- 🟢 keymaps
    vim.keymap.set("n", "<leader>r", run_file, { desc = "Run file" })
    vim.keymap.set("n", "<leader>c", compile_file, { desc = "Compile file" })

    vim.keymap.set("n", "<leader>tf", function()
      float_term:toggle()
    end, { desc = "Toggle Floating Terminal" })

    vim.keymap.set("n", "<leader>tg", function()
      lazygit:toggle()
    end, { desc = "Toggle Lazygit" })

    vim.keymap.set("t", "jk", [[<C-\><C-n>]])
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
  end,
}
