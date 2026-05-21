local dap = require("dap")

-- Python
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
  },
}

-- C / C++ / Rust
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",

    program = function()
      return vim.fn.input("Path: ", vim.fn.getcwd() .. "/", "file")
    end,

    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
