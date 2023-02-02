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

-- 設定顏色
local colors = {
  bg = "#22212C",
  fg = "#F8F8F2",
  selection = "#454158",
  comment = "#7970A9",
  red = "#FF9580",
  orange = "#FFCA80",
  yellow = "#FFFF80",
  green = "#8AFF80",
  purple = "#9580FF",
  cyan = "#80FFEA",
  pink = "#FF80BF",
  bright_red = "#FFAA99",
  bright_green = "#A2FF99",
  bright_yellow = "#FFFF99",
  bright_blue = "#AA99FF",
  bright_magenta = "#FF99CC",
  bright_cyan = "#99FFEE",
  bright_white = "#FFFFFF",
  menu = "#151320",
  visual = "#454158",
  gutter_fg = "#F8F8F2",
  nontext = "#7970A9",
  white = "#F8F8F2",
  black = "#151320",
}

-- 設定主題 (注意: 不同主題載入方法可能不一樣)
local theme = require("dracula")
theme.setup({
  colors = colors,
  lualine_bg_color = colors.menu,
})
vim.cmd("colorscheme dracula")


-- 設定游標所在列的行號顏色
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.orange })

-- 設定緩衝區分隔線顏色
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.visual })

-- 重新指定 nvim-tree.nvim 背景顏色
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = colors.bg })
