-- 使用 lazy.nvim 載入插件，優先設定 <leader> 按鍵確保 lazy 能夠正確設定
vim.g.mapleader = " "
require("lazy").setup(
-- 要載入的插件列表
  {
    { -- Dracula 主題
      "Mofiqul/dracula.nvim",
      lazy = true,
    },


    { -- Which-Key 按鍵提示
      "folke/which-key.nvim",
      lazy = true,
    },

    { -- 檔案總管
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { -- 狀態列
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { -- 自訂起始畫面
      "goolord/alpha-nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
  },

  -- lazy.nvim 的設定
  {
    ui = {
      border = "rounded",
    },
  }
)

-- 實際載入插件
require("plugin.setup_which_key")
require("plugin.setup_nvim_tree")
require("plugin.setup_lualine")
require("plugin.setup_alpha")
