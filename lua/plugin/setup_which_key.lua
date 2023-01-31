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
  },

  layout = {
    height = { min = 5, max = 10 },
    width = { min = 10, max = 120 },
    spacing = 5,
    align = "center",
  },
})