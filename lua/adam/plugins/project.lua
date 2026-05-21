return {
  "DrKJeff16/project.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },

  keys = {
    { "<leader>pp", "<cmd>Telescope projects<CR>", desc = "Projects List" },
    { "<leader>pf", "<cmd>Telescope find_files<CR>", desc = "Find Files in Project" },
    { "<leader>ps", "<cmd>Telescope live_grep<CR>", desc = "Search in Project" },
  },

  config = function()
    -- إعداد project.nvim
    require("project").setup({
      manual_mode = false,
      patterns = {
        ".git",
        "pyproject.toml",
        "package.json",
        ".nvim.lua",
      },
    })

    -- إعداد Telescope
    require("telescope").setup({
      extensions = {
        projects = {
          prompt_prefix = "󱎸  ",
          layout_strategy = "horizontal",
          layout_config = {
            anchor = "N",
            height = 0.30,
            width = 0.60,
            prompt_position = "bottom",
          },
        },
      },
    })

    -- تحميل extension
    require("telescope").load_extension("projects")
  end,
}

