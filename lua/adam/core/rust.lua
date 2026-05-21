vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<leader>rr", function()
        vim.cmd.RustLsp("runnables")
      end, { buffer = bufnr, desc = "Rust Runnables" })

      vim.keymap.set("n", "<leader>rd", function()
        vim.cmd.RustLsp("debuggables")
      end, { buffer = bufnr, desc = "Rust Debuggables" })
    end,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
        -- inlayHints = {
        --   enable = true,
        -- },
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
        },

        procMacro = {
          enable = true,
        },
      },
    },
  },
}
