-- 使用 lazy.nvim 載入插件，優先設定 <leader> 按鍵確保 lazy 能夠正確設定
vim.g.mapleader = " " 
require("lazy").setup(
  -- 要載入的插件列表
  {
    -- Dracula 主題
    { "Mofiqul/dracula.nvim", lazy=true },
    
    -- Which-Key 按鍵提示
    { "folke/which-key.nvim", lazy=true },
  },

  -- lazy.nvim 的設定
  {
    ui = {
      border = "rounded",
    },
  }
)
