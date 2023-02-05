-- 退出 Neovim 後回復游標樣式
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  desc = "Restore cursor style after leaving Neovim.",
  pattern = "*",
  command = "set guicursor=a:ver25-blinkwait700-blinkoff400-blinkon250-Cursor"
})


-- 複製時高亮複製的內容
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight selection on yank.",
  pattern = "*",
  command = "silent! lua vim.highlight.on_yank()"
  --  callback = function()
  --    vim.cmd([[silent! lua vim.highlight.on_yank()]])
  --    vim.highlight.on_yank({
  --      higroup = "IncSearch",
  --      timeout = 200,
  --    })
  --  end,
})
