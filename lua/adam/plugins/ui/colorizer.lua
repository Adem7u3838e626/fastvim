return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require("colorizer").setup({
      filetypes = {
        "*",
        "qml",
        "css",
      },

      user_default_options = {
        names = false,
        css = true,
        rgb_fn = true,
        hsl_fn = true,
      },
    })
  end,
}
