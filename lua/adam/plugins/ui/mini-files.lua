return {
  {
    "echasnovski/mini.files",
    version = false,
    config = function()
      local MiniFiles = require("mini.files")

      MiniFiles.setup({
        content = {
          prefix = function(fs_entry)
            local devicons = require("nvim-web-devicons")
            local icon, hl = devicons.get_icon(fs_entry.name, fs_entry.fs_type)

            if fs_entry.fs_type == "directory" then
              return " ", "Directory"
            end

            return icon or " ", hl
          end,
        },

        options = {
          use_as_default_explorer = false,
        },

        windows = {
          preview = false,
          width_focus = 40,
          width_nofocus = 25,
          winblend = 10,
          pumblend = 15,
          winborder = "rounded"
        },

        mappings = {
          close       = 'q',
          go_in       = 'l',
          go_in_plus  = 'L',
          go_out      = 'h',
          go_out_plus = 'H',
          mark_goto   = "'",
          mark_set    = 'm',
          reset       = '<BS>',
          reveal_cwd  = '@',
          show_help   = 'g?',
          synchronize = '=',
          trim_left   = '<',
          trim_right  = '>',
        },
      })

      vim.o.winborder = "rounded"

      local function open_on_current_file()
        local path = vim.api.nvim_buf_get_name(0)
        if path ~= "" then
          MiniFiles.open(path)
        else
          MiniFiles.open(vim.loop.cwd())
        end
      end

      local function toggle_files()
        if MiniFiles.close() then
          return
        end
        open_on_current_file()
      end

      vim.keymap.set("n", "<leader>te", open_on_current_file, { desc = "Explorer" })
      vim.keymap.set("n", "<leader>E", function()
        MiniFiles.open(vim.loop.cwd())
      end, { desc = "Explorer (cwd)" })
      vim.keymap.set("n", "<leader>e", toggle_files, { desc = "Toggle mini.files" })
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },
}
