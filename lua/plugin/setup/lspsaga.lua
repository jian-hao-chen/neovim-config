require("lspsaga").setup({
  ui = {
    winblend = 10,
  },
  scroll_preview = {
    scroll_down = "<C-Down>",
    scroll_up = "<C-Up>",
  },
  symbol_in_winbar = {
    separator = " > ",
  },
  lightbulb = {
    enable_in_insert = false,
    virtual_text = false,
  },
})

-- 設定快捷鍵
vim.keymap.set("n", "gD", "<Cmd>Lspsaga lsp_finder<CR>",
  {
    desc = "Find references of symbol",
    silent = true,
  }
)

vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>",
  {
    desc = "Peek definition of symbol",
    silent = true,
  }
)

vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>",
  {
    desc = "Rename symbols",
    silent = true,
  }
)

vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc ++keep<CR>",
  {
    desc = "Preview documentation",
    silent = true,
  }
)
