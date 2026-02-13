return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
  config = function()
    local nvimtree = require("nvim-tree")
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        number = false,
        relativenumber = false,
      },
      renderer = {
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            folder = { arrow_closed = ">", arrow_open = "↳" },
          },
        },
      },
      actions = { open_file = { window_picker = { enable = false } } },
      filters = { custom = { ".DS_Store" } },
      git = { ignore = false },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Folder"))
        vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
        vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
        vim.keymap.set("n", "r", api.tree.reload, opts("Reload Tree"))
        vim.keymap.set("n", "a", api.fs.create, opts("Create File/Folder"))
        vim.keymap.set("n", "d", api.fs.remove, opts("Delete File/Folder"))
        vim.keymap.set("n", "R", api.fs.rename, opts("Rename"))
      end,
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
  end,
}
