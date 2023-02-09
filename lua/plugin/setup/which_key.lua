-- 設定 which-key.nvim
require("which-key").setup({
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },

  window = {
    border = "rounded",
    padding = { 1, 1, 1, 1 },
  },

  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 60 },
    spacing = 5,
    align = "center",
  },
})
