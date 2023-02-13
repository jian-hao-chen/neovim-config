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

    { -- 程式碼模板
      "L3MON4D3/LuaSnip",
      lazy = true,
      version = "v1.*",
    },

    { -- 自動補全
      "hrsh7th/nvim-cmp",
      lazy = true,
      event = { "InsertEnter", "CmdlineEnter" }, -- 第一次進入 Insert 模式才載入
      dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp", -- completion source
        "hrsh7th/cmp-buffer", -- completion source
        "hrsh7th/cmp-cmdline", -- completion source
        "hrsh7th/cmp-path", -- completion source
        "saadparwaiz1/cmp_luasnip", -- bridge from LuaSnip to nvim-cmp
        "L3MON4D3/LuaSnip", -- snippets engine
        "onsails/lspkind.nvim", -- type symbols in completion list
      },
      config = function() require("plugin.setup.nvim_cmp") end,
    },

    { -- 自動插入成對括號
      "windwp/nvim-autopairs",
      lazy = true,
      event = "InsertEnter",
      dependencies = { "hrsh7th/nvim-cmp" },
      config = function() require("plugin.setup.nvim_autopairs") end,
    },

    { -- 程式碼高亮解析器
      "nvim-treesitter/nvim-treesitter",
      lazy = true,
      event = "BufRead",
      build = ":TSUpdate",
      config = function() require("plugin.setup.nvim_treesitter") end,
    },

    { -- LSP UI 整合
      "glepnir/lspsaga.nvim",
      lazy = true,
      event = "LspAttach",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter"
      },
      config = function() require("plugin.setup.lspsaga") end,
    },

    { -- LSP 函數參數顯示
      "ray-x/lsp_signature.nvim",
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


-- 實際載入插件, 注意: 有些插件需要特定載入順序
require("plugin.setup.theme")
require("plugin.setup.which_key")
require("plugin.setup.nvim_tree")
require("plugin.setup.lualine")
require("plugin.setup.alpha")
require("plugin.setup.telescope")
require("plugin.setup.mason")
require("plugin.setup.lspconfig")

-- 設定打開 Lazy 的快捷鍵
local wk = require("which-key")
wk.register({
  ["<leader>l"] = { name = "+Lazy / +LSP" },
  ["<leader>lp"] = { "<Cmd>Lazy<CR>", "Plugin dashboard" },
  ["<leader>ls"] = { "<Cmd>Mason<CR>", "LSP dashboard" },
  ["<leader>li"] = { "<Cmd>LspInfo<CR>", "LSP information" },
})
