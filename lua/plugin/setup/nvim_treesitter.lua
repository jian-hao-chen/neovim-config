require("nvim-treesitter.configs").setup({
  -- 用於自動化安裝列出的語言解析器
  ensure_installed = {
    "markdown", "markdown_inline" -- dependency to make ":Lspsaga hover_doc" working
  },
  sync_install = true, -- 同步安裝, 只對 "ensure_installed" 生效
  auto_install = false, -- 打開支援語言的檔案後, 自動安裝解析器
  ignore_install = {}, -- 不要安裝的語言列表
  highlight = {
    enable = true,
    -- disable = {}, -- 關掉特定"語言解析器"
    -- 或是設定自訂條件: 開啟大量文字檔案時自動關閉
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB 大約等於 10 萬個 char (中文算 2 個 char)
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
})
