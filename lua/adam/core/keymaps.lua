vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
keymap.set("v", "p", '"_dP', { desc = "Paste without overwrite yank" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- splits
-- resize splits with ctrl+shift+hjkl
vim.keymap.set("n", "<c-s-h>", "<c-w><")
vim.keymap.set("n", "<c-s-l>", "<c-w>>")
vim.keymap.set("n", "<c-s-k>", "<c-w>+")
vim.keymap.set("n", "<c-s-j>", "<c-w>-")
keymap.set("n", "<leader>bc", ":close<cr>", { noremap = true, silent = true, desc = "close current window" })
keymap.set("n", "<c-h>", "<c-w>h", { desc = "move left" })
keymap.set("n", "<c-l>", "<c-w>l", { desc = "move right" })
keymap.set("n", "<c-j>", "<c-w>j", { desc = "move down" })
keymap.set("n", "<c-k>", "<c-w>k", { desc = "move up" })

