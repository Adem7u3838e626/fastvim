return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
      enable_moveright = true,
      map_cr = true,
      map_bs = true,
    })
  end
}
