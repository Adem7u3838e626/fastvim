return {
  'Thiago4532/mdmath.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    filetypes = { 'markdown', 'text' },
    foreground = 'Normal',
    anticonceal = true,
    hide_on_insert = true,
    dynamic = true,
    dynamic_scale = 1.0,
    update_interval = 400,
    internal_scale = 1.0,
  }
}
