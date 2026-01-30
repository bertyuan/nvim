-- -- Version 1
--
-- return {
--   -- load colorscheme (RRethy/nvim-base16)
--   {
--     "RRethy/nvim-base16",
--     lazy = false,
--     priority = 1000,
--   },
--
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       -- or: base16-gruvbox-dark-hard
--       colorscheme = "base16-default-dark",
--     },
--   },
--
--   {
--     "nvim-lualine/lualine.nvim",
--     opts = function(_, opts)
--       opts.options.theme = "auto"
--     end,
--   },
-- }

-- -- Version 2
-- return {
--   -- load colorscheme (RRethy/nvim-base16)
--   {
--     "RRethy/nvim-base16",
--     lazy = false,
--     priority = 1000,
--   },
--
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "base16-default-dark",
--     },
--   },
--
--   {
--     "nvim-lualine/lualine.nvim",
--     opts = function(_, opts)
--       opts.options.theme = "auto"
--     end,
--   },
--
--   -- Override comment highlights to remove italics
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = function()
--       vim.api.nvim_create_autocmd("ColorScheme", {
--         pattern = "*",
--         callback = function()
--           -- Get the current Comment highlight and remove italic
--           local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
--           comment_hl.italic = false
--           vim.api.nvim_set_hl(0, "Comment", comment_hl)
--           vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
--         end,
--       })
--       -- Apply immediately for the current colorscheme
--       vim.schedule(function()
--         local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
--         comment_hl.italic = false
--         vim.api.nvim_set_hl(0, "Comment", comment_hl)
--         vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
--       end)
--     end,
--   },
-- }

-- -- Version 3
-- return {
--   {
--     "RRethy/nvim-base16",
--     lazy = false,
--     priority = 1000,
--   },
--
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "base16-default-dark",
--     },
--   },
--
--   {
--     "nvim-lualine/lualine.nvim",
--     opts = function(_, opts)
--       opts.options.theme = "auto"
--     end,
--   },
--
--   -- 移除注释的斜体样式
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = function()
--       local function fix_comment_hl()
--         ---@type vim.api.keyset.highlight
--         local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment", link = false })
--         comment_hl.italic = nil  -- 使用 nil 而不是 false
--         vim.api.nvim_set_hl(0, "Comment", comment_hl)
--         vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
--       end
--
--       vim.api.nvim_create_autocmd("ColorScheme", {
--         pattern = "*",
--         callback = fix_comment_hl,
--       })
--
--       vim.schedule(fix_comment_hl)
--     end,
--   },
-- }

-- -- Version 4
-- return {
--   -- load colorscheme (RRethy/nvim-base16)
--   {
--     "RRethy/nvim-base16",
--     lazy = false,
--     priority = 1000,
--   },
--
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       -- or: base16-gruvbox-dark-hard
--       colorscheme = "base16-default-dark",
--     },
--   },
--
--   {
--     "nvim-lualine/lualine.nvim",
--     opts = function(_, opts)
--       opts.options.theme = "auto"
--     end,
--   },
--
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = function()
--       local function fix_comment_hl()
--         local hl_info = vim.api.nvim_get_hl(0, { name = "Comment", link = false })
--         ---@type vim.api.keyset.highlight
--         local comment_hl = {
--           fg = hl_info.fg,
--           bg = hl_info.bg,
--           bold = hl_info.bold,
--         }
--         vim.api.nvim_set_hl(0, "Comment", comment_hl)
--         vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
--       end
--
--       vim.api.nvim_create_autocmd("ColorScheme", {
--         pattern = "*",
--         callback = fix_comment_hl,
--       })
--
--       vim.schedule(fix_comment_hl)
--     end,
--   },
-- }

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
      },
    },
    config = function(_, opts)
      require("gruber-darker").setup(opts)
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruber-darker",
        callback = function()

          -- use original green for strings from tsoding
          vim.api.nvim_set_hl(0, "String", { fg = "#73c936" })
          vim.api.nvim_set_hl(0, "Character", { fg = "#73c936" })
          vim.api.nvim_set_hl(0, "@string", { fg = "#73c936" })
          vim.api.nvim_set_hl(0, "@string.documentation", { fg = "#73c936" })

          -- Change all #565f73 (niagara-1/dark_niagara) highlight groups to white.
          vim.api.nvim_set_hl(0, "GruberDarkerDarkNiagara", { fg = "#ffffff" })
          vim.api.nvim_set_hl(0, "GruberDarkerDarkNiagaraBold", { fg = "#ffffff", bold = true })
          vim.api.nvim_set_hl(0, "@property", { fg = "#ffffff" })
          vim.api.nvim_set_hl(0, "@property.css", { fg = "#ffffff" })
          vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#ffffff" })
          vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#ffffff" })
          vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#ffffff" })

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
      -- or: opts.options.theme = "gruber-darker"
    end,
  },

  -- -- 3) optional
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     vim.api.nvim_create_autocmd("ColorScheme", {
  --       pattern = "*",
  --       callback = function()
  --         vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
  --       end,
  --     })
  --     return opts
  --   end,
  -- },
}
