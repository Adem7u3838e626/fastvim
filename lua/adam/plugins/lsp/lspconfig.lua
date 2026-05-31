return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

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
      "lua_ls",
      "html",
      "cssls",
      "tailwindcss",
      "pyright",
      "clangd",
      "qmlls",
      "bashls",
      "jsonls",
      "tsserver",
      "intelephense",
      "sqlls",
      "solargraph",
      "gopls",
    }

    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
    end
    vim.lsp.enable(servers)
  end,
}
