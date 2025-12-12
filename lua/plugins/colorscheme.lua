return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('base16-colorscheme').setup({
        -- 背景色系 (从深到浅)
      base00 = '#2c2e30', -- 主背景
      base01 = '#363a3d', -- 稍亮背景 (行号、状态栏)
      base02 = '#42474b', -- 选中区域、高亮行
      base03 = '#5c6370', -- 注释、隐藏文本

      -- 前景色系 (从暗到亮)
      base04 = '#848b98', -- 暗前景 (状态栏文字)
      base05 = '#abb2bf', -- 主前景 (普通文本)
      base06 = '#c8cdd5', -- 亮前景
      base07 = '#e6e9ed', -- 最亮前景 (高亮)

      -- 语法高亮色
      base08 = '#9cdcfe', -- 浅蓝 (变量、参数)
      base09 = '#b5cea8', -- 浅绿 (数字)
      base0A = '#dcdcaa', -- 淡黄 (函数名)
      base0B = '#ce9178', -- 橙棕 (字符串)
      base0C = '#4ec9b0', -- 青绿 (类型、类名)
      base0D = '#569cd6', -- 蓝色 (关键字)
      base0E = '#c586c0', -- 紫色 (控制流 if/for/return)
      base0F = '#d16969', -- 红色 (正则、特殊)
      })
    end,
  },
}
