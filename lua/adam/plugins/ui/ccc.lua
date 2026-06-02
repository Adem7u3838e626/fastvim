return {
  "nvchad/minty",
  dependencies = {
    "nvchad/volt",
  },

  cmd = { "Huefy", "Shades" },

  config = function()
    vim.keymap.set("n", "<leader>ch", function()
      vim.cmd("")
    end, { desc = "Huefy" })

    vim.keymap.set("n", "<leadercs", function()
      vim.cmd("Shades")
    end, { desc = "Shades" })
  end,
}
