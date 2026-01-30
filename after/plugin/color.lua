vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "gruber-darker",
  callback = function()
    vim.api.nvim_set_hl(0, "String", { fg = "#73c936" })
    vim.api.nvim_set_hl(0, "Character", { fg = "#73c936" })
    vim.api.nvim_set_hl(0, "@string", { fg = "#73c936" })
    vim.api.nvim_set_hl(0, "@string.documentation", { fg = "#73c936" })
  end,
})
