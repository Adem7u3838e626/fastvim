vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Exit insert mode
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })

-- Paste without overwriting yank
keymap.set("v", "p", '"_dP', { desc = "Paste without overwrite yank" })

-- Disable Q
keymap.set("n", "Q", "<nop>")

-- Splits
keymap.set("n", "<leader>sf", ":vsplit<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>sv", ":split<CR>", { noremap = true, silent = true })
-- Resize splits with Ctrl+Shift+HJKL
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Balance windows" })
-- Close current split/window
keymap.set("n", "<leader>cc", ":close<CR>", { noremap = true, silent = true, desc = "Close current window" })

keymap.set("n", "<leader>qw", ":wq!<CR>", vim.tbl_extend("force", opts, { desc = "Quit with saving" }))
keymap.set("n", "<leader>Q", ":qa!<CR>", vim.tbl_extend("force", opts, { desc = "Quit all without saving" }))
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd("startinsert")
  end,
})
