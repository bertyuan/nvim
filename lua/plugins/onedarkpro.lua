return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000, -- load first
    opts = {
      -- choose: onedark / onelight / onedark_vivid / onedark_dark
      theme = "onedark",
      options = {
        transparency = false,
        terminal_colors = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
