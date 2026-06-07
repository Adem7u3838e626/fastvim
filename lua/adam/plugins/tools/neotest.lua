return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
  },
  keys = {
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file" },
    { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run all tests" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle summary" },
    { "<leader>to", function() require("neotest").output.open() end, desc = "Open output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug test" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-plenary"),
        require("neotest-python"),
        require("neotest-go"),
      },
    })
  end,
}
