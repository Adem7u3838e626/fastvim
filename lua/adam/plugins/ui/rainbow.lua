return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = require('rainbow-delimiters').strategy.global,
      },
      query = {
        [''] = 'rainbow-delimiters',
      },
      priority = {
        [''] = 110,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
    require('rainbow-delimiters.setup').setup()
  end,
}
