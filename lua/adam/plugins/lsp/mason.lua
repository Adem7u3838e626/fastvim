return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

  mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls",                     -- Lua
      "html",                       -- HTML
      "cssls",                      -- CSS
      "tailwindcss",                -- Tailwind
      "pyright",                    -- Python
      "qmlls",                      -- QML
      "rust_analyzer",              -- Rust
      "clangd",                     -- C/C++
      "bashls",                     -- Bash
      "jsonls",                     -- JSON
    },
  })
  end,
}
