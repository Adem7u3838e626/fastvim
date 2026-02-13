return {
  { "nvim-lua/plenary.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      require("adam.plugins.colorscheme").setup()
    end,
  },
}
