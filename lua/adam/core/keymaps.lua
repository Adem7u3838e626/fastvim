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

-- Bufferline
keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Close buffer" })
keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- Splits
keymap.set("n", "<leader>sf", ":vsplit<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>sv", ":split<CR>", { noremap = true, silent = true })
-- Terminal splits
keymap.set("n", "<Leader>st", ":botright split | resize 15 | terminal<CR>", { noremap = true, silent = true })
keymap.set("n", "<Leader>vt", ":vsplit | terminal<CR>", { noremap = true, silent = true })


-- Close current split/window
keymap.set("n", "<leader>cc", ":close<CR>", { noremap = true, silent = true, desc = "Close current window" })
-- Navigate windows using leader+Tab if needed
keymap.set("n", "<leader><Tab>", "<C-w>w", { noremap = true, silent = true })
keymap.set("n", "<leader><S-Tab>", "<C-w>W", { noremap = true, silent = true })


keymap.set("n", "<leader>q", function()
    local choice = vim.fn.confirm("Do you want to save before quitting?", "&Yes\n&No\n&Cancel", 1)
    if choice == 1 then
        vim.cmd("w")
        vim.cmd("q")
    elseif choice == 2 then
        vim.cmd("q!")
    else
    end
end, vim.tbl_extend("force", opts, { desc = "Quit with save confirmation" }))
keymap.set("n", "<leader>Q", ":qa!<CR>", vim.tbl_extend("force", opts, { desc = "Quit all without saving" }))

