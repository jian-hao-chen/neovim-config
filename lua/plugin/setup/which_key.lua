-- 設定 which-key.nvim
require("which-key").setup({
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
  window = {
    border = "none",
    padding = { 1, 0, 1, 0 },
  },
  layout = {
    -- height = { min = 4, max = 25 },
    -- width = { min = 20, max = 60 },
    spacing = 3,
    align = "left",
  },
})
