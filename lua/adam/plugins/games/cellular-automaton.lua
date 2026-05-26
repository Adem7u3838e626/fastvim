return {
  "eandrju/cellular-automaton.nvim",

  config = function()
    local cellular_automaton = require("cellular-automaton")

    local config = {
      fps = 50,
      name = "slide",

      update = function(grid)
        for i = 1, #grid do
          local prev = grid[i][#grid[i]]

          for j = 1, #grid[i] do
            grid[i][j], prev = prev, grid[i][j]
          end
        end

        return true
      end,
    }

    cellular_automaton.register_animation(config)

    vim.keymap.set(
      "n",
      "<leader>fml",
      "<cmd>CellularAutomaton make_it_rain<CR>",
      { desc = "Make it rain animation" }
    )
  end,
}
