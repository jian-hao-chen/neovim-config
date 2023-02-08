-- 顯示更多顏色
vim.opt.termguicolors = true

-- 設定唯一狀態列
vim.opt.laststatus = 3

-- 不顯示預設的模式文字
vim.opt.showmode = false

-- 設定高亮當前行
vim.opt.cursorline = true

-- 設定緩衝區結束字元為空白
vim.opt.fillchars = "eob: "

-- 設定游標形狀
vim.opt.guicursor = "n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20"

-- 設定彈出視窗的透明度
vim.opt.pumblend = 5


-- -- 設定游標所在列的行號顏色
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.orange })
--
-- -- 設定緩衝區分隔線顏色
-- vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.visual })
--
-- -- 重新指定 nvim-tree.nvim 背景顏色
-- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = colors.bg })
--
-- -- 重新指定 nvim-cmp 選單邊框背景顏色
-- vim.api.nvim_set_hl(0, "CmpMenuBorder", { blend = 5, bg = colors.menu, fg = colors.comment })
-- -- vim.api.nvim_set_hl(0, "CmpMenu", { blend = 5, bg = colors.bg })
