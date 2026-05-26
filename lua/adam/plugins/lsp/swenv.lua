return {
  "AckslD/swenv.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },

  ft = { "python" },

  config = function()
    local swenv_api = require("swenv.api")

    require("swenv").setup({
      venvs_path = vim.fn.expand("~/.virtualenvs"),

      post_set_venv = function()
        vim.cmd("LspRestart")
      end,
    })

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local conf = require("telescope.config").values

    local function get_python_versions()
      local versions = {}

      local candidates = {
        "python3.14",
        "python3.13",
        "python3.12",
        "python3.11",
        "python3.10",
        "python3",
      }

      for _, py in ipairs(candidates) do
        if vim.fn.executable(py) == 1 then
          local v = vim.fn.system(py .. " --version"):gsub("\n", "")
          table.insert(versions, { py = py, label = v })
        end
      end

      return versions
    end

    local function pick_venv_with_telescope()
      local venvs = swenv_api.get_venvs(vim.fn.expand("~/.virtualenvs"))

      table.insert(venvs, {
        name = "➕ Create new venv",
        path = "__create__",
      })

      pickers.new({}, {
        prompt_title = "Python environments",
        finder = finders.new_table({
          results = venvs,
          entry_maker = function(entry)
            return {
              value = entry,
              display = entry.name,
              ordinal = entry.name,
            }
          end,
        }),

        sorter = conf.generic_sorter({}),

        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry().value
            actions.close(prompt_bufnr)

            -- 🟣 CREATE VENV
            if selection.path == "__create__" then
              vim.ui.input({ prompt = "Venv name: " }, function(input)
                if not input or input == "" then return end

                vim.ui.select(get_python_versions(), {
                  prompt = "Select Python version:",
                  format_item = function(item)
                    return item.label
                  end,
                }, function(py)
                  if not py then return end

                  local venv_path = vim.fn.expand("~/.virtualenvs/" .. input)

                  vim.fn.system({
                    py.py,
                    "-m",
                    "venv",
                    venv_path,
                  })

                  vim.notify("Created venv: " .. input .. " (" .. py.label .. ")")

                  swenv_api.set_venv(venv_path)
                end)
              end)
            else
              -- 🟢 SELECT EXISTING
              swenv_api.set_venv(selection.path)
            end
          end)

          return true
        end,
      }):find()
    end

    vim.keymap.set("n", "<leader>vs", pick_venv_with_telescope, {
      desc = "Switch Python venv",
    })
  end,
}
