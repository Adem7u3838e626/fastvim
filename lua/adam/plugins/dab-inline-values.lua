return {
  "Monster0506/dap-inline-values.nvim",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("dap_inline_values").setup()
  end
}
