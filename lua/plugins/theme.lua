return {
  -- load colorscheme (RRethy/nvim-base16)
  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      -- or: base16-gruvbox-dark-hard
      colorscheme = "base16-default-dark",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "auto"
    end,
  },
}
