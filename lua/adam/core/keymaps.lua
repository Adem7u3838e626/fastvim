vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
keymap.set("v", "p", '"_dP', { desc = "Paste without overwrite yank" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- splits
-- resize splits with alt+hjkl (Ctrl+Shift isn't reliably detected by terminals)
vim.keymap.set("n", "<a-h>", "<c-w><")
vim.keymap.set("n", "<a-l>", "<c-w>>")
vim.keymap.set("n", "<a-k>", "<c-w>+")
vim.keymap.set("n", "<a-j>", "<c-w>-")
keymap.set("n", "<leader>bc", ":close<cr>", { noremap = true, silent = true, desc = "close current window" })
-- vim-tmux-navigator handles window movement



vim.keymap.set("n", "<leader>ch", function()
  vim.cmd("Huefy")
end, { desc = "Huefy" })

vim.keymap.set("n", "<leadercs", function()
  vim.cmd("Shades")
end, { desc = "Shades" })

vim.keymap.set("n", "<C-t>", function()
  require("nvshad.themes").open { border = true }
end, { desc = "Shades" })
