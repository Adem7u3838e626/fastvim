return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },

  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    -- Keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- capabilities
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- diagnostic icons
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = "",
      })
    end

    mason_lspconfig.setup()

    local servers = mason_lspconfig.get_installed_servers()

    for _, server_name in ipairs(servers) do
      if server_name ~= "lua_ls" then
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end
    end

    -- Lua
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    -- Rust
    lspconfig["rust_analyzer"].setup({
      capabilities = capabilities,
    })

    -- C / C++
    lspconfig["clangd"].setup({
      capabilities = capabilities,
    })

    -- Bash
    lspconfig["bashls"].setup({
      capabilities = capabilities,
    })

    -- JSON
    lspconfig["jsonls"].setup({
      capabilities = capabilities,
    })

    -- HTML
    lspconfig["html"].setup({
      capabilities = capabilities,
    })

    -- CSS
    lspconfig["cssls"].setup({
      capabilities = capabilities,
    })

    -- JavaScript / TypeScript
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
    })

    -- PHP
    lspconfig["intelephense"].setup({
      capabilities = capabilities,
    })

    -- SQL
    lspconfig["sqlls"].setup({
      capabilities = capabilities,
    })
  end,
}
