return {
  "akinsho/toggleterm.nvim",
  version = "*", -- 或者直接删掉这一行
  config = function()
    require("toggleterm").setup({
      -- 最基础配置，全部用默认值，只改个方向方便看
      size = 15,          -- 水平终端高度
      open_mapping = [[<c-\>]], -- 默认就是这个快捷键
      shade_terminals = true,
      direction = "horizontal", -- 水平分屏终端
    })

    -- 可选：创建一个浮动终端的快捷方式（不需要可以删掉）
    local Terminal = require("toggleterm.terminal").Terminal
    local float_term = Terminal:new({ direction = "float" })

    function _FLOAT_TERM_TOGGLE()
      float_term:toggle()
    end

    -- <leader>tf 打开/关闭浮动终端（按需改）
    vim.keymap.set("n", "<leader>tf", _FLOAT_TERM_TOGGLE, { desc = "Toggle float terminal" })
  end,
}

