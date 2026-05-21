
return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },

  event = "VeryLazy",

  config = function()
    require("adam.debug.go-dab")
    require("adam.debug.ui")
    require("adam.debug.mason")
    require("adam.debug.signs")
    require("adam.debug.adapters")
    require("adam.debug.configs")
    require("adam.debug.keymaps")
  end,
}
