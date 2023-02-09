-- 設定 LSP 管理器
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lsp_cfg = require("lspconfig")

mason.setup({
  ui = {
    width = 0.7,
    height = 0.7,
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
    keymaps = {
      install_package = "I",
    }
  }
})

mason_lsp.setup({
  -- 這個列表內的語言伺服器會自動安裝, 用來快速更換平台或分享給其他人
  -- 參考: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
  ensure_installed = {
    "sumneko_lua", -- Lua
    "clangd", -- C/C++
    "pylsp", -- Python
  },
})
