return {
  "lmantw/themify.nvim",

  lazy = false,
  priority = 999,

  config = function()
    require("themify").setup({
      -- 🌌 Popular themes
      "catppuccin/nvim",
      "folke/tokyonight.nvim",
      "rose-pine/neovim",

      -- 🏮 Kanagawa family
      "rebelot/kanagawa.nvim",
      "sho-87/kanagawa-paper.nvim",

      -- 🌿 Gruvbox
      "ellisonleao/gruvbox.nvim",

      -- 🌙 Nightfox ecosystem
      "EdenEast/nightfox.nvim",

      -- ✨ Experimental
      {
        "comfysage/evergarden",
        branch = "mega",
      },

      -- 🧱 fallback
      "default",
    })
  end,
}
