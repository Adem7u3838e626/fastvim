vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client.name == "rust_analyzer" then
      vim.defer_fn(function()
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      end, 100)
    end
  end,
})
