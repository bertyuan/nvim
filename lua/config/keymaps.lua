-- keymaps
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })

-- sign off
vim.keymap.set("n", "<leader>so", function()
  local signoff = "Signed-off-by: Bertrand Yuan <me@bertyuan.com>"
  local bufnr = 0
  local row = vim.api.nvim_win_get_cursor(0)[1] -- 当前行(1-based)
  local cnt = vim.api.nvim_buf_line_count(bufnr)

  local next_line = ""
  local has_next = row < cnt
  if has_next then
    next_line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1] or ""
  end

  local next_is_blank = has_next and next_line:match("^%s*$") ~= nil

  if next_is_blank then
    local insert_at = row + 1 -- 0-based：在 next line 后面插入
    vim.api.nvim_buf_set_lines(bufnr, insert_at, insert_at, false, { signoff })
  else
    local insert_at = row -- 0-based：在当前行下面插入
    vim.api.nvim_buf_set_lines(bufnr, insert_at, insert_at, false, { "", signoff })
  end
end, { desc = "Insert (optional blank) + Signed-off-by" })

vim.cmd([[
cnoreabbrev <expr> git
      \ getcmdtype() ==# ':' && getcmdline() ==# 'git'
      \ ? 'Git'
      \ : 'git'
]])
