-- 複製時高亮複製的內容
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch", 
      timeout = 200,
    })
  end,
})

