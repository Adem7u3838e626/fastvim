return {
  "VonHeikemen/fine-cmdline.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local fine_cmdline = require("fine-cmdline")

    fine_cmdline.setup({
      cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = " ",
      },
      popup = {
        position = {
          row = "10%",
          col = "50%",
        },
        size = {
          width = "40%",
        },
        border = {
          style = "rounded",
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
      },
      hooks = {
        before_mount = function(input)
          local status, fcitx5 = pcall(require, "fcitx5")
          if status then
            fcitx5.disable()
          end
        end,
        after_mount = function(input)
        end,
        set_keymaps = function(imap, feedkeys)
          imap("<C-c>", function()
            return "<Esc>"
          end)
        end,
      },
    })

    vim.keymap.set("n", ":", function()
      require("fine-cmdline").open({
        prompt = ": "
      })
    end, { desc = "Open Fine Cmdline" })

    vim.keymap.set("n", "/", function()
      require("fine-cmdline").open({
        prompt = "/"
      })
    end, { desc = "Open Fine Search" })

  end,
}
