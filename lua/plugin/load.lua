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
      branch = "0.1.x",
    },

    { -- LSP 相關
      "williamboman/mason.nvim",
      lazy = true,
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
      },
    },

    { -- 自動補全
      "hrsh7th/nvim-cmp",
      lazy = true,
      dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp", -- completion source
        "hrsh7th/cmp-buffer", -- completion source
        "hrsh7th/cmp-cmdline", -- completion source
        "hrsh7th/cmp-path", -- completion source
        "hrsh7th/cmp-vsnip", -- bridge from vim-vsnip to nvim-cmp
        "hrsh7th/vim-vsnip", -- snippets engine
        "onsails/lspkind.nvim", -- type symbols in completion list
      },
    }
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
require("plugin.setup_telescope")
require("plugin.setup_mason")
require("plugin.setup_nvim_cmp")
require("plugin.setup_lspconfig")


-- 設定打開 Lazy 的快捷鍵
local wk = require("which-key")
wk.register({
  ["<leader>l"] = { name = "+Lazy / +LSP" },
  ["<leader>ld"] = { "<Cmd>Lazy<CR>", "Lazy dashboard" },

})
