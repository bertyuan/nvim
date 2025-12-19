return {
  -- Base16 with LSP/Treesitter
  {
    "snelling-a/base16.nvim",
    build = ":Base16Update",
    lazy = false,
    priority = 1000,
  },

  -- tell LazyVim use which colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base16-default-dark",
    },
  },
}

