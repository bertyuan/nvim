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
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruber-darker",
        callback = function()

          local fg      = "#e4e4ef"
          local green   = "#73c936"
          local quartz  = "#95a99f"
          local yellow  = "#ffdd33"
          local bg      = "#181818"
          local bg_1    = "#101010"
          local bg1     = "#282828"

          -- ========================
          -- 基础色值修正
          -- ========================
          vim.api.nvim_set_hl(0, "Normal", { fg = fg, bg = bg })
          vim.api.nvim_set_hl(0, "NormalNC", { fg = fg, bg = bg })
          vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = bg1 })
          vim.api.nvim_set_hl(0, "NormalSB", { fg = fg, bg = bg_1 })

          -- ========================
          -- keyword -> yellow + bold
          -- ========================
          -- 旧版名称
          vim.api.nvim_set_hl(0, "@conditional", { fg = yellow, bold = true })
          vim.api.nvim_set_hl(0, "@conditional.ternary", { fg = fg })
          vim.api.nvim_set_hl(0, "@constant.builtin", { fg = yellow, bold = true })
          -- 新版名称
          vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = yellow, bold = true })
          vim.api.nvim_set_hl(0, "@keyword.conditional.ternary", { fg = fg })
          vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = yellow, bold = true })
          vim.api.nvim_set_hl(0, "@keyword.return", { fg = yellow, bold = true })
          vim.api.nvim_set_hl(0, "@keyword.operator", { fg = yellow, bold = true })
          vim.api.nvim_set_hl(0, "@keyword.exception", { fg = yellow, bold = true })

          -- ========================
          -- type -> quartz
          -- ========================
          vim.api.nvim_set_hl(0, "@type.builtin", { fg = quartz })
          -- const/volatile: simpc 中属于 keywords -> yellow+bold
          -- 但 @type.qualifier fallback 到 @type -> quartz, 必须修正
          vim.api.nvim_set_hl(0, "@type.qualifier", { fg = yellow, bold = true })

          -- ========================
          -- preprocessor -> quartz
          -- ========================
          vim.api.nvim_set_hl(0, "@keyword.import", { fg = quartz })
          vim.api.nvim_set_hl(0, "@keyword.directive", { fg = quartz })
          vim.api.nvim_set_hl(0, "@keyword.directive.define", { fg = quartz })
          vim.api.nvim_set_hl(0, "Include", { fg = quartz })
          vim.api.nvim_set_hl(0, "PreProc", { fg = quartz })
          vim.api.nvim_set_hl(0, "Define", { fg = quartz })
          vim.api.nvim_set_hl(0, "Macro", { fg = quartz })
          vim.api.nvim_set_hl(0, "PreCondit", { fg = quartz })
          vim.api.nvim_set_hl(0, "@preproc", { fg = quartz })
          vim.api.nvim_set_hl(0, "@define", { fg = quartz })
          vim.api.nvim_set_hl(0, "@function.macro", { fg = quartz })

          -- ========================
          -- string -> green #73c936
          -- ========================
          vim.api.nvim_set_hl(0, "String", { fg = green })
          vim.api.nvim_set_hl(0, "Character", { fg = green })
          vim.api.nvim_set_hl(0, "@string", { fg = green })
          vim.api.nvim_set_hl(0, "@string.documentation", { fg = green })
          vim.api.nvim_set_hl(0, "@character", { fg = green })
          vim.api.nvim_set_hl(0, "@comment.documentation", { fg = green })

          -- ========================
          -- 以下全部是 simpc 不高亮的 -> fg
          -- ========================

          -- 函数名
          vim.api.nvim_set_hl(0, "Function", { fg = fg })
          vim.api.nvim_set_hl(0, "@function", { fg = fg })
          vim.api.nvim_set_hl(0, "@function.call", { fg = fg })
          vim.api.nvim_set_hl(0, "@function.builtin", { fg = fg })
          vim.api.nvim_set_hl(0, "@method", { fg = fg })
          vim.api.nvim_set_hl(0, "@method.call", { fg = fg })
          vim.api.nvim_set_hl(0, "@constructor", { fg = fg })
          vim.api.nvim_set_hl(0, "@function.method", { fg = fg })
          vim.api.nvim_set_hl(0, "@function.method.call", { fg = fg })

          -- 变量名/参数名
          vim.api.nvim_set_hl(0, "Identifier", { fg = fg })
          vim.api.nvim_set_hl(0, "@variable", { fg = fg })
          vim.api.nvim_set_hl(0, "@variable.builtin", { fg = fg })
          vim.api.nvim_set_hl(0, "@variable.parameter", { fg = fg })
          vim.api.nvim_set_hl(0, "@parameter", { fg = fg })
          vim.api.nvim_set_hl(0, "@variable.member", { fg = fg })
          vim.api.nvim_set_hl(0, "@module", { fg = fg })
          vim.api.nvim_set_hl(0, "@namespace", { fg = fg })

          -- 数字
          vim.api.nvim_set_hl(0, "Number", { fg = fg })
          vim.api.nvim_set_hl(0, "Float", { fg = fg })
          vim.api.nvim_set_hl(0, "@number", { fg = fg })
          vim.api.nvim_set_hl(0, "@float", { fg = fg })

          -- 常量
          vim.api.nvim_set_hl(0, "Constant", { fg = fg })
          vim.api.nvim_set_hl(0, "@constant", { fg = fg })

          -- 括号 {} () []
          vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = fg })

          -- 特殊标点
          vim.api.nvim_set_hl(0, "@punctuation.special", { fg = fg })

          -- 分隔符 ; . ,
          vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = fg })
          vim.api.nvim_set_hl(0, "Delimiter", { fg = fg })

          -- 字段/属性
          vim.api.nvim_set_hl(0, "@field", { fg = fg })
          vim.api.nvim_set_hl(0, "@property", { fg = fg })
          vim.api.nvim_set_hl(0, "@property.css", { fg = fg })

          -- 运算符
          vim.api.nvim_set_hl(0, "Operator", { fg = fg })
          vim.api.nvim_set_hl(0, "@operator", { fg = fg })

          -- Special
          vim.api.nvim_set_hl(0, "Special", { fg = fg })
          vim.api.nvim_set_hl(0, "SpecialChar", { fg = fg })
          vim.api.nvim_set_hl(0, "@character.special", { fg = fg })
          vim.api.nvim_set_hl(0, "@string.regex", { fg = fg })
          vim.api.nvim_set_hl(0, "@string.escape", { fg = fg })
          vim.api.nvim_set_hl(0, "@string.special", { fg = fg })

          -- Tag
          vim.api.nvim_set_hl(0, "Tag", { fg = fg })

          -- ========================
          -- 禁用 LSP semantic highlighting
          -- ========================
          for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
            vim.api.nvim_set_hl(0, group, {})
          end

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
