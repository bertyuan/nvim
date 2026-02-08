-- Linux Kernel coding style
-- Reference: https://www.kernel.org/doc/html/latest/process/coding-style.html

-- Tab = 8 个字符宽度
vim.opt_local.tabstop = 8

-- 使用 Tab 字符，不用空格
vim.opt_local.expandtab = false

-- 缩进宽度 = 8（与 tabstop 一致）
vim.opt_local.shiftwidth = 8

-- 按 Tab 键时插入的宽度 = 0 表示跟随 tabstop
vim.opt_local.softtabstop = 0

-- switch-case 不额外缩进（case 与 switch 对齐）
vim.opt_local.cinoptions = ":0"

-- 开启 C 风格自动缩进
vim.opt_local.cindent = true

-- 使用 kernel 风格的注释格式（/* ... */）
vim.opt_local.commentstring = "/* %s */"

-- 行宽限制提示线（你已经在 autocmds.lua 中设置了，这里可以省略）
-- vim.opt_local.colorcolumn = "81"
-- vim.opt_local.textwidth = 80
