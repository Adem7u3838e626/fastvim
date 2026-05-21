return {
  "abecodes/tabout.nvim",
  event = "InsertEnter", -- تحميل الإضافة عند دخول وضع الإدخال لتسريع البدء
  config = function()
    require("tabout").setup({
      tabkey = "<Tab>", -- الزر المستخدم للخروج (يمكن تغييره إلى <C-j> مثلاً)
      backwards_tabkey = "<S-Tab>", -- الزر للرجوع للخلف (Shift+Tab)
      
      act_as_tab = true, -- إذا لم تكن هناك أقواس للخروج منها، يتصرف كـ Tab عادي
      act_as_shift_tab = false, -- نفس الشيء لـ Shift+Tab
      
      enable_backwards = true, -- تفعيل الرجوع للخلف
      completion = true, -- التوافق مع إضافات الإكمال التلقائي (مثل cmp)
      
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "<", close = ">" }, -- مفيد في JSX/TSX أو generics
      },
      
      ignore_beginning = true, -- تجاهل الخروج إذا كان المؤشر في بداية السطر
      exclude = {} -- استثناء بعض أنواع الملفات إذا أردت
    })
  end,
  dependencies = { -- اعتماديات اختيارية لتحسين التكامل
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp" 
  }
}
