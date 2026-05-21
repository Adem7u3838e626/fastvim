return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  tag = "stable",

  config = function()
    local crates = require("crates")

    crates.setup({
      text = {
        loading = "  Loading...",
      },

      completion = {
        cmp = {
          enabled = true,
        },
      },

      open_programs = true,

      lsp = {
        enabled = true,
      },

      popup = {
        autofocus = true,
      },
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "Cargo.toml",
      callback = function()
        local crates = require("crates")

        vim.keymap.set("n", "<leader>ct", crates.toggle, {
          buffer = true,
          silent = true,
          desc = "Toggle crates UI",
        })

        vim.keymap.set("n", "<leader>cr", crates.reload, {
          buffer = true,
          silent = true,
          desc = "Reload crates data",
        })

        vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, {
          buffer = true,
          silent = true,
          desc = "Show crate versions",
        })

        vim.keymap.set("n", "<leader>cu", crates.update_crate, {
          buffer = true,
          silent = true,
          desc = "Update selected crate",
        })

        vim.keymap.set("n", "<leader>ca", crates.update_all_crates, {
          buffer = true,
          silent = true,
          desc = "Update all crates",
        })
      end,
    })
  end,
}
