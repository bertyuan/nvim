return {
  {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      bold = true,
      italic = {
        strings = false,
        comments = false,
        folds = false,
        operators = false,
      },
    },
    config = function(_, opts)
      require("gruber-darker").setup(opts)

      local fg      = "#e4e4ef"
      local green   = "#73c936"
      local quartz  = "#95a99f"
      local yellow  = "#ffdd33"
      local bg      = "#181818"
      local bg_1    = "#101010"
      local bg1     = "#282828"

      -- =============================================
      -- 全局修正：只修正色值偏差，不改变高亮逻辑
      -- 这些对所有语言都是正确的
      -- =============================================
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruber-darker",
        callback = function()
          -- fg 色值修正: 原版 #e4e4ef, blazkowolf 用了 #e4e4e4
          vim.api.nvim_set_hl(0, "Normal", { fg = fg, bg = bg })
          vim.api.nvim_set_hl(0, "NormalNC", { fg = fg, bg = bg })
          vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = bg1 })
          vim.api.nvim_set_hl(0, "NormalSB", { fg = fg, bg = bg_1 })

          -- green 色值修正: 原版 #73c936, blazkowolf 用了 #73d936
          vim.api.nvim_set_hl(0, "String", { fg = green })
          vim.api.nvim_set_hl(0, "Character", { fg = green })
          vim.api.nvim_set_hl(0, "@string", { fg = green })
          vim.api.nvim_set_hl(0, "@string.documentation", { fg = green })
          vim.api.nvim_set_hl(0, "@character", { fg = green })
          vim.api.nvim_set_hl(0, "@comment.documentation", { fg = green })

          -- @type.builtin 修正: 原版 type-face -> quartz, blazkowolf 用了 yellow
          vim.api.nvim_set_hl(0, "@type.builtin", { fg = quartz })

          -- preprocessor 修正: 新版 TS 用 @keyword.import/@keyword.directive
          vim.api.nvim_set_hl(0, "@keyword.import", { fg = quartz })
          vim.api.nvim_set_hl(0, "@keyword.directive", { fg = quartz })
          vim.api.nvim_set_hl(0, "@keyword.directive.define", { fg = quartz })

          -- 禁用 LSP semantic highlighting
          for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
            vim.api.nvim_set_hl(0, group, {})
          end
        end,
      })

      -- =============================================
      -- C/C++ 专用：完全还原 simpc-mode 极简风格
      -- 只在 C/C++ 缓冲区中生效
      -- =============================================
      local c_overrides = {
        -- 函数名: simpc 不高亮
        ["@function"]              = { fg = fg },
        ["@function.call"]         = { fg = fg },
        ["@function.builtin"]      = { fg = fg },
        ["@function.macro"]        = { fg = quartz },
        ["@function.method"]       = { fg = fg },
        ["@function.method.call"]  = { fg = fg },
        ["@method"]                = { fg = fg },
        ["@method.call"]           = { fg = fg },
        ["@constructor"]           = { fg = fg },
        -- 变量名/参数名
        ["@variable"]              = { fg = fg },
        ["@variable.builtin"]      = { fg = fg },
        ["@variable.parameter"]    = { fg = fg },
        ["@variable.member"]       = { fg = fg },
        ["@parameter"]             = { fg = fg },
        ["@module"]                = { fg = fg },
        -- 数字
        ["@number"]                = { fg = fg },
        ["@float"]                 = { fg = fg },
        -- 常量
        ["@constant"]              = { fg = fg },
        ["@constant.builtin"]      = { fg = yellow, bold = true },
        -- 括号/标点
        ["@punctuation.bracket"]   = { fg = fg },
        ["@punctuation.delimiter"] = { fg = fg },
        ["@punctuation.special"]   = { fg = fg },
        -- 字段/属性
        ["@field"]                 = { fg = fg },
        ["@property"]              = { fg = fg },
        -- 运算符
        ["@operator"]              = { fg = fg },
        -- 特殊
        ["@character.special"]     = { fg = fg },
        ["@string.regex"]          = { fg = fg },
        ["@string.escape"]         = { fg = fg },
        ["@string.special"]        = { fg = fg },
        -- keyword 修正
        ["@conditional"]                = { fg = yellow, bold = true },
        ["@conditional.ternary"]        = { fg = fg },
        ["@keyword.conditional"]        = { fg = yellow, bold = true },
        ["@keyword.conditional.ternary"] = { fg = fg },
        ["@keyword.repeat"]             = { fg = yellow, bold = true },
        ["@keyword.return"]             = { fg = yellow, bold = true },
        ["@keyword.operator"]           = { fg = yellow, bold = true },
        ["@keyword.exception"]          = { fg = yellow, bold = true },
        -- const/volatile 是 keyword 不是 type
        ["@type.qualifier"]             = { fg = yellow, bold = true },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "h" },
        callback = function(ev)
          for group, hl in pairs(c_overrides) do
            -- 使用 ns=0 + priority 或直接对 buffer 设置
            vim.api.nvim_set_hl(0, group .. ".c", hl)
            vim.api.nvim_set_hl(0, group .. ".cpp", hl)
          end
          -- 同时对 vim 内置组覆盖 (buffer-local 无法实现,
          -- 但 .c/.cpp 后缀的 TS 组只对对应语言生效)
        end,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruber-darker",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "auto"
    end,
  },
}
