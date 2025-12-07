-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- show special characters
vim.opt.list = true

vim.opt.listchars = {
  tab = "-->",
  space = "·",    -- space as `·`
  trail = "·",    -- spaces in the end of line
  extends = "▶",
  precedes = "◀",
  nbsp = "␣",
}
