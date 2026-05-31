local dap = require("dap")

-- =====================
-- PYTHON
-- =====================
dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return "python"
    end,
  },
}

-- =====================
-- CODELLDB (C/C++/Rust)
-- =====================
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}

local cpp_rust_config = {
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

dap.configurations.cpp = cpp_rust_config
dap.configurations.c = cpp_rust_config
dap.configurations.rust = cpp_rust_config
