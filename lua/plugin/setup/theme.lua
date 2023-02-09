-- 設定顏色模板
local dracula = {
  -- Base colors
  bg = "#22212C",
  bg_alt = "#151320",
  bg_alt2 = "#0B0A10",
  fg = "#F8F8F2",
  selection = "#454158",
  comment = "#7970A9",
  -- Accent colors
  cyan = "#80FFEA",
  green = "#8AFF80",
  pink = "#FF80BF",
  blue = "#9580FF",
  red = "#FF9580",
  yellow = "#FFFF80",
  orange = "#FFCA80",
  bright_cyan = "#99FFEE",
  bright_green = "#A2FF99",
  bright_pink = "#FF99CC",
  bright_blue = "#AA99FF",
  bright_red = "#FFAA99",
  bright_yellow = "#FFFF99",
}

-- === Themes from nightfox.nvim ===
-- require("nightfox")
-- local theme = "nightfox"
-- local theme = "dayfox"
-- local theme = "dawnfox"
-- local theme = "duskfox"
-- local theme = "nordfox"
-- local theme = "terafox"
-- local theme = "carbonfox"

-- === Themes from dracula.nvim ===
-- require(dracula)
-- local theme = "dracula"

-- === Themes from tokyonight.nvim ===
-- require("tokyonight").setup({
--   styles = {
--     comments = { italic = false },
--     keywords = { italic = false },
--   },
-- })
-- local theme = "tokyonight"
-- local theme = "tokyonight-storm"
-- local theme = "tokyonight-night"
-- local theme = "tokyonight-moon"
-- local theme = "tokyonight-day"

-- === Themes from catppuccin/nvim ===
require("catppuccin").setup({
  no_italic = true,
})
-- local theme = "catppuccin"
-- local theme = "catppuccin-latte"
local theme = "catppuccin-frappe"
-- local theme = "catppuccin-macchiato"
-- local theme = "catppuccin-mocha"

vim.cmd("colorscheme " .. theme)
