return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  config = function()
    require("persistence").setup({
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
      stop_on_saving = true,
    })
    local map = vim.keymap
    -- map.set("m", "<leader>qs", function() require("persistence").save() end, {desc = "Save Session"})
    map.set("n", "<leader>qr", function() require("persistence").load() end, { desc = "Restore Session" })
    map.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore Last Session" })
    map.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't Save Current Session" })
  end,
}
