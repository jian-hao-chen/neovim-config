require("lspsaga").setup({
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
  { desc = "Find definition of symbol" }
)

vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>",
  { desc = " Peek definition of symbol" }
)

vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc ++keep<CR>",
  { desc = "Preview documentation" }
)

local function check_trigger_char(cursor_line, trigger_char)
  if trigger_char == nil then
    return false
  end
  for _, ch in ipairs(trigger_char) do
    local current_ch = string.sub(cursor_line, #cursor_line - #ch + 1, #cursor_line)
    if current_ch == ch then
      return true
    end
    -- if current_ch == " " and  then

    -- end
  end
end
