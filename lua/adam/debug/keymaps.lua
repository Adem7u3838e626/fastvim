local dap = require("dap")

vim.keymap.set("n", "<F5>", dap.continue, { desc = "continue_debugging" })
vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "continue_debugging" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "step_over" })
vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "step_over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "step_into" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "step_into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "step_out" })
vim.keymap.set("n", "<leader>dk", dap.step_out, { desc = "step_out" })


vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle_breakpoint" })

vim.keymap.set("n", "<leader>dr", function()
  dap.repl.open()
end, { desc = "open_debug_repl" })

vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "run_last_debug" })
