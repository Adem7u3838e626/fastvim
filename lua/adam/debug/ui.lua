local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup()
