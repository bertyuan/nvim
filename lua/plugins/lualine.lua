return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- use rectangle theme
      opts.options.section_separators = { left = "", right = "" }

      -- use line to separate components
      opts.options.component_separators = { left = "│", right = "│" }

      return opts
    end,
  },
}

