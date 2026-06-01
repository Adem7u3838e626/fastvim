return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
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

    vim.lsp.enable(vim.tbl_extend("force", servers, { "lua_ls" }))

    vim.lsp.enable(servers)
  end,
}
