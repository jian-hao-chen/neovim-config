-- 設定 Leader 鍵為空白鍵
vim.g.mapleader = " "


-- 設定格式:
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
--   * {mode} [string|table]    映射生效的模式
--   * {lhs}  [string]          觸發的按鍵
--   * {rhs}  [string|function] 觸發後執行的功能，可以是按鍵、函式、或其他內建功能
--   * {opts} [table|nil]       其他設定選項


-- Ctrl+S 儲存文件
vim.keymap.set("", "<C-s>", "<Cmd>write<CR>", { desc = "Save to file" })
vim.keymap.set("i", "<C-s>", "<C-o><Cmd>write<CR>")

-- 按空白件時不要移動游標
-- vim.keymap.set({ "n", "v" }, "<space>", "<nop>")

-- 捲動畫面後游標置中
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- 在搜尋結果之間跳轉游標時游標置中
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- 選取並覆蓋內容時保留緩衝區內的內容
vim.keymap.set("x", "<Leader>p", [["_dP]],
  { desc = "Paste and keep the content in register" }
)

-- 複製到系統剪貼簿
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]],
  { desc = "Copy to system clipboard" }
)
vim.keymap.set({ "n", "v" }, "<Leader>Y", [["+Y]],
  { desc = "Copy to system clipboard (to end of line)" }
)

-- 從系統剪貼簿貼上
vim.keymap.set("n", "<Leader>p", [["+p]],
  { desc = "Paste from system clipboard" }
)

-- 刪除內容且不要存放到緩衝區
vim.keymap.set({ "n", "v" }, "<Leader>d", [["_d]],
  { desc = "Delete w/o writing to register" }
)
vim.keymap.set({ "n", "v" }, "<Leader>D", [["_D]],
  { desc = "Delete w/o writing to register (to end of line)" }
)

-- 消除搜尋高亮
vim.keymap.set("n", "<Esc><Esc>", "<Cmd>noh<CR>",
  { desc = "Clear highlights" }
)

-- 建立新檔案
vim.keymap.set("n", "<Leader>fn", "<Cmd>ene <Bar> startinsert<CR>",
  { desc = "New file" }
)
