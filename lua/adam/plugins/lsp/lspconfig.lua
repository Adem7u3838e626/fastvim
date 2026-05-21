return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    local servers = {
      "lua_ls",                     -- Lua
      "html",                       -- HTML
      "cssls",                      -- CSS
      "tailwindcss",                -- Tailwind
      "pyright",                    -- Python
      "qmlls",                      -- QML
      -- "rust_analyzer",              -- Rust --changed rustaceanvim
      "clangd",                     -- C/C++
      "bashls",                     -- Bash
      "jsonls",                     -- JSON
      "ts_ls",                      -- JS/TS
      "intelephense",               -- PHP
      "sqlls",                      -- SQL
      "solargraph",                 -- Ruby
      "gopls",                      -- Go
    }

    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
    end

    vim.lsp.enable({
      "lua_ls",                     -- Lua
      "html",                       -- HTML
      "cssls",                      -- CSS
      "tailwindcss",                -- Tailwind
      "pyright",                    -- Python
      "qmlls",                      -- QML
      -- "rust_analyzer",              -- Rust
      "clangd",                     -- C/C++
      "bashls",                     -- Bash
      "jsonls",                     -- JSON
      "tsserver",                   -- JS/TS
      "intelephense",               -- PHP
      "sqlls",                      -- SQL
      "solargraph",                 -- Ruby
      "gopls",                      -- Go
    })
  end,
}
