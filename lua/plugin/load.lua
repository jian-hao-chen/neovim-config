-- 使用 lazy.nvim 載入插件，優先設定 <leader> 按鍵確保 lazy 能夠正確設定
vim.g.mapleader = " "
require("lazy").setup(
-- 要載入的插件列表
  {
    { -- Dracula 主題
      "Mofiqul/dracula.nvim",
      lazy = true,
    },

    { -- 按鍵提示
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

    { -- 檔案搜尋 & 快速跳轉
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
      },
      -- tag = "0.1.1",
    },
  },

  -- lazy.nvim 的設定
  {
    ui = {
      border = "rounded",
    },
  }
)

--設定打開 Lazy 的快捷鍵
vim.keymap.set("", "<Leader>ld", "<Cmd>Lazy<CR>",
  { desc = "Lazy dashboard" }
)

-- 實際載入插件
require("plugin.setup_which_key")
require("plugin.setup_nvim_tree")
require("plugin.setup_lualine")
require("plugin.setup_alpha")
