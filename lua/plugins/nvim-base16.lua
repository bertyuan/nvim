return {
  { "RRethy/nvim-base16", lazy = false, priority = 1000 },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "base16"
    end,
  },
}

