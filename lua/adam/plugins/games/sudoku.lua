return {
  'jim-fx/sudoku.nvim',
  cmd = "Sudoku",
  config = function()
    require("sudoku").setup({
      persist_settings = true,
      persist_games = true,
      default_mappings = true,
      mappings = {
        { key = "x",     action = "clear_cell" },
        { key = "r1",    action = "insert=1" },
        { key = "r2",    action = "insert=2" },
        { key = "r3",    action = "insert=3" },
        { key = "r4",    action = "insert=4" },
        { key = "r5",    action = "insert=5" },
        { key = "r6",    action = "insert=6" },
        { key = "r7",    action = "insert=7" },
        { key = "r8",    action = "insert=8" },
        { key = "r9",    action = "insert=9" },
        { key = "gn",    action = "new_game" },
        { key = "gr",    action = "reset_game" },
        { key = "gs",    action = "view=settings" },
        { key = "gt",    action = "view=tip" },
        { key = "gz",    action = "view=zen" },
        { key = "gh",    action = "view=help" },
        { key = "u",     action = "undo" },
        { key = "<C-r>", action = "redo" },
        { key = "+",     action = "increment" },
        { key = "-",     action = "decrement" },
      },
      custom_highlights = {
        board = { fg = "#7d7d7d" },
        number = { fg = "white", bg = "black" },
        active_menu = { fg = "white", bg = "black", gui = "bold" },
        hint_cell = { fg = "white", bg = "yellow" },
        square = { bg = "#292b35", fg = "white" },
        column = { bg = "#14151a", fg = "#d5d5d5" },
        row = { bg = "#14151a", fg = "#d5d5d5" },
        settings_disabled = { fg = "#8e8e8e", gui = "italic" },
        same_number = { fg = "white", gui = "bold" },
        set_number = { fg = "white", gui = "italic" },
        error = { fg = "white", bg = "#843434" },
      }
    })

    vim.keymap.set("n", "<leader>fms", "<cmd>Sudoku clear_cell<CR>", { desc = "Clear Sudoku cell" })
  end,
}
