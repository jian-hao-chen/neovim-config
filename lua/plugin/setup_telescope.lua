-- 設定 telescope.nvim
require("telescope").setup({
  defaults = {
    scroll_strategy = "limit",
    winblend = 10,
  },
})

local builtin = require("telescope.builtin")
local wk = require("which-key")
wk.register({
  ["<leader>ff"] = { builtin.find_files, "Find files" },
  ["<leader>fg"] = { builtin.live_grep, "Find pattern in files" },
  ["<leader>fs"] = { builtin.grep_string, "Find string under cursor in files" },
})
