-- 設定 Leader 鍵為空白鍵
vim.g.mapleader = " "


-- 設定格式:
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
--   * {mode} [string|table]    映射生效的模式
--   * {lhs}  [string]          觸發的按鍵
--   * {rhs}  [string|function] 觸發後執行的功能，可以是按鍵、函式、或其他內建功能
--   * {opts} [table|nil]       其他設定選項


-- 按空白件時不要移動游標
vim.keymap.set({ "n", "v" }, "<space>", "<nop>")

-- 捲動畫面後游標置中
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- 在搜尋結果之間跳轉游標時游標置中
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- 選取並覆蓋內容時保留緩衝區內的內容
vim.keymap.set("x", "<leader>p", [["_dP]])

-- 複製到系統剪貼簿
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])

-- 刪除內容且不要存放到緩衝區
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>D", [["_D]])



