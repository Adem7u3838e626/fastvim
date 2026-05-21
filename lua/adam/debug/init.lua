return {
  "mfussenegger/nvim-dap",

  dependencies = {

    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },

  event = "VeryLazy",

  config = function()

    require("adam.plugins.debug.go-dap")
    require("adam.plugins.debug.ui")
    require("adam.plugins.debug.mason")
    require("adam.plugins.debug.signs")
    require("adam.plugins.debug.adapters")
    require("adam.plugins.debug.configs")
    require("adam.plugins.debug.keymaps")
  end,
}
