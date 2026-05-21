return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,        -- يستخدم tree-sitter لتجنب الأقواس داخل التعليقات أو النصوص
      enable_moveright = true, -- يسمح بالقفز فوق الأقواس المغلقة تلقائيًا
      map_cr = true,           -- يسمح بعمل auto-pairs عند الضغط على Enter
      map_bs = true,           -- يسمح بالتعامل مع Backspace بشكل ذكي
    })
  end
}
