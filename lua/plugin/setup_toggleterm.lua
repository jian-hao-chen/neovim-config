require("toggleterm").setup({
  open_mapping = [[<C-\>]],
})

local wk = require("which-key")
wk.register({
  ["<leader>t"] = { name = "+Terminal" },
  ["<leader>tt"] = { "<Cmd>ToggleTerm<CR>",
    "Toggle terminal",
    mode = { "n", "v", "t" }
  },
  ["<leader>ts"] = { "<Cmd>wincmd w<CR>",
    "Switch focus",
    mode = { "n", "t" }
  },
  ["<leader>tv"] = { "<Cmd>ToggleTermSendVisualSelection<CR>",
    "Send selected text",
    mode = { "n", "v" },
  },
})
