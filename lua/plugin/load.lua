-- 使用 lazy.nvim 載入插件，優先設定 <leader> 按鍵確保 lazy 能夠正確設定
vim.g.mapleader = " " 
require("lazy").setup({
  { "Mofiqul/dracula.nvim", lazy=true },
})
