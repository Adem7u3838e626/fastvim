return {
  "monaqa/dial.nvim",

  config = function()
    local augend = require("dial.augend")
    local dial = require("dial.config")

    dial.augends:register_group({
      default = {
        augend.constant.alias.bool,
        augend.constant.alias.alpha,
        augend.constant.new({
          elements = { "on", "off" },
          word = true,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "enable", "disable" },
          word = true,
          cyclic = true,
        }),
      },
    })

    vim.keymap.set("n", "<leader>tt", function()
      require("dial.map").manipulate("increment", "normal")
    end)

    vim.keymap.set("n", "<leader>tT", function()
      require("dial.map").manipulate("decrement", "normal")
    end)
  end,
}
