return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        path_display = { "smart" },
        dynamic_preview_title = true,
        mappings = {
          i = {
            ["<Tab>"] = actions.move_selection_previous, -- move to prev result
            ["<S-Tab>"] = actions.move_selection_next, -- move to next result
            ["<leader>c"] = function(prompt_bufnr)
              actions.send_selected_to_qflist(prompt_bufnr)
              actions.open_qflist(prompt_bufnr)
            end,
          },  
        },
      },
    })
    telescope.load_extension("fzf")
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>cs", "<cmd>Telescope colorscheme<cr>", { desc = "Pick colorscheme" })
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
  end,
}
