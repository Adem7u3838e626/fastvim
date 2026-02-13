return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    icons = {
      breadcrumb = "»",  -- يظهر مسار المفاتيح
      separator = "➜",   -- بين المفتاح والوصف
      group = "+",       -- علامة المجموعات
    },
    window = {
      border = "double",  -- نوع الحدود: "none" | "single" | "double" | "rounded" | "solid" | "shadow"
      position = "bottom", -- موضع النافذة: "bottom" | "top"
      margin = { 1, 0, 1, 0 }, -- المسافة من حواف الشاشة {top,right,bottom,left}
      padding = { 2, 2, 2, 2 }, -- المسافة داخل النافذة
      winblend = 10,      -- شفافية النافذة (0-100)
    },
    layout = {
      align = "center",   -- محاذاة الأعمدة: "left" | "center" | "right"
      min_height = 4,
      max_height = 20,
      min_width = 20,
      max_width = 50,
    },
  },
}
