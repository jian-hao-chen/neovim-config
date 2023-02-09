-- 使用 lazy.nvim 載入插件，優先設定 <leader> 按鍵確保 lazy 能夠正確設定
vim.g.mapleader = " "

-- 要載入的插件列表
require("lazy").setup(
  {
    -- 主題
    { "Mofiqul/dracula.nvim",   lazy = true, },
    { "EdenEast/nightfox.nvim", lazy = true, },
    { "folke/tokyonight.nvim",  lazy = true, },
    { "catppuccin/nvim",        lazy = true, name = "catppuccin", },

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

    { -- 快速切換註釋
      "numToStr/Comment.nvim",
      config = function() require("Comment").setup() end
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
    },

    { -- 自動插入成對括號
      "windwp/nvim-autopairs",
      lazy = true,
      dependencies = { "hrsh7th/nvim-cmp" },
    },
  },

  {
    -- lazy.nvim 的設定
    ui = {
      size = { width = 0.7, height = 0.7 },
      border = "none",
    },
  }
)


-- 實際載入插件
require("plugin.setup.theme")
require("plugin.setup.which_key")
require("plugin.setup.nvim_tree")
require("plugin.setup.lualine")
require("plugin.setup.alpha")
require("plugin.setup.telescope")
require("plugin.setup.mason")
require("plugin.setup.nvim_cmp")
require("plugin.setup.lspconfig")
require("plugin.setup.nvim_autopairs")

-- 設定打開 Lazy 的快捷鍵
local wk = require("which-key")
wk.register({
  ["<leader>l"] = { name = "+Lazy / +LSP" },
  ["<leader>lp"] = { "<Cmd>Lazy<CR>", "Plugin dashboard" },
  ["<leader>ls"] = { "<Cmd>Mason<CR>", "LSP dashboard" },
})
