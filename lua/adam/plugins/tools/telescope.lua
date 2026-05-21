return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-media-files.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        dynamic_preview_title = true,
        file_ignore_patterns = { ".git/", "node_modules/", ".cache/" },

        mappings = {
          i = {
            ["<Tab>"] = actions.move_selection_previous,
            ["<S-Tab>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-t>"] = open_with_trouble,
            ["<Esc>"] = actions.close,
          },
          n = {
            ["<C-t>"] = open_with_trouble,
            ["<Esc>"] = actions.close,
          },
        },
      },

      extensions = {
        media_files = {
          filetypes = { "png", "jpg", "jpeg", "webp", "gif" },
          find_cmd = "rg",
          chafa = {
            args = { "-s", "140x70" },
          },
        },
      },

      pickers = {
        find_files = { hidden = true },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
    })

    telescope.load_extension("media_files")
    telescope.load_extension("fzf")

    local keymap = vim.keymap
    keymap.set("n", "<leader>fi", "<cmd>Telescope media_files<cr>", { desc = "Image preview" })
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Grep string under cursor" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
  end,
}
