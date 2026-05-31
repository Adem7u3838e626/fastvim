return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    {
      "<leader>ws",
      "<cmd>AutoSession save<CR>",
      desc = "Quick save current session",
    },    {
      "<leader>wn",
      function()
        vim.ui.input({
          prompt = "Session name: ",
        }, function(input)
          if input and input ~= "" then
            vim.cmd("AutoSession save" .. input)
          end
        end)
      end,
      desc = "Save new named session",
    },
    {
      "<leader>ww",
      "<cmd>AutoSession search<CR>",
      desc = "Search sessions",
    },

    {
      "<leader>wa",
      "<cmd>AutoSession toggle<CR>",
      desc = "Toggle autosave",
    },
  },

  opts = {
    auto_save_enabled = true,
    auto_restore_enabled = true,
    cwd_change_handling = true,
    suppressed_dirs = {
      "~/",
      "~/Projects",
      "~/Downloads",
      "~/.config/nvim",
      "~/.config/hypr",
      "/",
    },

    session_lens = {
      load_on_setup = true,

      picker = nil,

      mappings = {
        delete_session = { "i", "<C-d>" },
        alternate_session = { "i", "<C-s>" },
        copy_session = { "i", "<C-y>" },
      },

      picker_opts = {
        border = true,
        layout_config = {
          width = 0.8,
          height = 0.5,
        },
      },
    },

    log_level = "error",
  },
}
