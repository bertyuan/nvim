return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"

    local c = require("vscode.colors").get_colors()

    require("vscode").setup({
      transparent = true,
      underline_links = true,
      disable_nvimtree_bg = true,
      terminal_colors = true,

      color_overrides = {},

      group_overrides = {
        Keyword = { bold = true },
        ["@keyword"] = { bold = true },

        ["@keyword.conditional"] = { bold = true },
        ["@keyword.repeat"] = { bold = true },
        ["@keyword.import"] = { bold = true },
        ["@keyword.return"] = { bold = true },
      },
    })

    vim.cmd.colorscheme("vscode")
  end,
}
