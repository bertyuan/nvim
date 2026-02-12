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
      -- 禁用 nvim-tree 背景颜色
      disable_nvimtree_bg = true,
      -- 将主题颜色应用到终端
      terminal_colors = true,
      -- 覆盖颜色（参见 lua/vscode/colors.lua）
      color_overrides = {
        -- vscLineNumber = "#FFFFFF",
      },
      -- 覆盖高亮组（参见 lua/vscode/theme.lua）
      group_overrides = {
        -- 支持与 vim.api.nvim_set_hl 相同的参数
        -- 可以通过 require('vscode.colors') 使用主题颜色
        -- Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
      },
    })

    vim.cmd.colorscheme("vscode")
  end,
}
