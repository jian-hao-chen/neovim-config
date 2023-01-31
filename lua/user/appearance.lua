-- 顯示更多顏色
vim.opt.termguicolors = true

-- 設定文字寬度
-- vim.opt.textwidth = 80

-- 超過設定的文字寬度改變背景顏色
-- vim.opt.colorcolumn = "+0"

-- 設定顏色
local colors = {
    bg = "#22212C",
    fg = "#F8F8F2",
    selection = "#7970A9",
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
    menu = "#FFFFFF",
    visual = "#454158",
    gutter_fg = "#F8F8F2",
    nontext = "#3B4048",
    white = "#FFFFFF",
    black = "#0B0A10",
}

-- 設定主題 (注意: 不同主題載入方法可能不一樣)
local theme = require("dracula")
theme.setup({
  colors = colors,
  lualine_bg_color = "#151320",
})
vim.cmd("colorscheme dracula")
