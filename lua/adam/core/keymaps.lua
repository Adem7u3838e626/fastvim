vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
keymap.set("v", "p", '"_dP', { desc = "Paste without overwrite yank" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- splits
keymap.set("n", "<leader>sf", function()
  vim.cmd("vsplit")
  require("telescope.builtin").find_files()
end, { desc = "Vsplit + find files" })
keymap.set("n", "<leader>sv", function()
  vim.cmd("split")
  require("telescope.builtin").find_files()
end, { desc = "split + find files" })
-- resize splits with ctrl+shift+hjkl
vim.keymap.set("n", "<c-s-h>", "<c-w><")
vim.keymap.set("n", "<c-s-l>", "<c-w>>")
vim.keymap.set("n", "<c-s-k>", "<c-w>+")
vim.keymap.set("n", "<c-s-j>", "<c-w>-")
vim.keymap.set("n", "<leader>=", "<c-w>=", { desc = "balance windows" })
-- close current split/window
keymap.set("n", "<leader>cc", ":close<cr>", { noremap = true, silent = true, desc = "close current window" })
-- window navigation
keymap.set("n", "<c-h>", "<c-w>h", { desc = "move left" })
keymap.set("n", "<c-l>", "<c-w>l", { desc = "move right" })
keymap.set("n", "<c-j>", "<c-w>j", { desc = "move down" })
keymap.set("n", "<c-k>", "<c-w>k", { desc = "move up" })


-- Disable Q
keymap.set("n", "Q", "<nop>")


keymap.set("n", "<leader>qw", ":wq!<CR>", vim.tbl_extend("force", opts, { desc = "Quit with saving" }))
keymap.set("n", "<leader>Q", ":qa!<CR>", vim.tbl_extend("force", opts, { desc = "Quit all without saving" }))
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd("startinsert")
  end,
})
