return {
  "lewis6991/gitsigns.nvim",

  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▋" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },

      signcolumn = true,
      numhl = false,
      linehl = false,

      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },

      attach_to_untracked = true,

      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
        ignore_whitespace = false,
      },

      preview_config = {
        border = "rounded",
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- navigation
        map("n", "]c", gs.next_hunk, "Next Hunk")
        map("n", "[c", gs.prev_hunk, "Prev Hunk")

        -- actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")

        -- preview
        map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")

        -- blame
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame Line")

        -- toggle
        map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Blame")
      end,
    })
  end,
}
