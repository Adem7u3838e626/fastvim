local M = {}
M.setup = function()
  require("catppuccin").setup({
    flavour = "mocha",
    background = { light = "latte", dark = "mocha" },
    transparent_background = false,
    term_colors = true,
    styles = { comments = { "italic" }, functions = { "bold" } },
    integrations = { treesitter = true, native_lsp = { enabled = true } },
  })
  vim.cmd("colorscheme catppuccin")
end
return M
