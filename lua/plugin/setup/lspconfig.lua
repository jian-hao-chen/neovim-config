local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 儲存時自動格式化
local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- 設定各語言伺服器的通用設定, 快捷鍵等
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  if client.server_capabilities.documentFormattingProvider then
    enable_format_on_save(client, bufnr)
  end
end

-- === 載入各語言伺服器的設定 ===
-- C/C++: clangd
nvim_lsp.clangd.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Lua: sumneko_lua
nvim_lsp.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        -- 讓語言伺服器找的到全域變數
        globals = { "vim" },
      },
      workspace = {
        -- 讓語言伺服器找到 Neovim runtime 文件
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          continuation_indent = "2",
        },
      },
    },
  },
})

-- 設定語言檢查說明
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      update_in_insert = true,
      virtual_text = { spacing = 4, prefix = "🔥" },
      severity_sort = true,
    }
  )

-- 設定語言檢查符號
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = "●"
--   },
--   update_in_insert = true,
--   float = { source = "always" },
-- })
