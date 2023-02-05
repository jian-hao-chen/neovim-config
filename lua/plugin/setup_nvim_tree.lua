-- 設定 nvim-tree.nvim
require("nvim-tree").setup({
  hijack_cursor = true,
  sync_root_with_cwd = true,

  -- 布局相關設定
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "a", action = "" }, -- default create
        { key = "c", action = "" }, -- default copy
        { key = "o", action = "" }, -- default edit
        { key = "O", action = "" }, -- default edit_no_picker
        { key = "x", action = "" }, -- default cut
        { key = "r", action = "" }, -- default rename
        { key = "H", action = "" }, -- default toggle_dotfiles
        { key = "g?", action = "" }, -- default toogle_help
        { key = "D", action = "" }, -- default trash
        { key = "J", action = "" }, -- default last_sibling
        { key = "K", action = "" }, -- default first_sibling
        { key = "<C-]>", action = "" }, -- default cd
        { key = "<2-RightMouse>", action = "" }, -- default cd

        { key = "<CR>", action = "rename" },
        { key = "<Del>", action = "trash" },
        { key = "<Left>", action = "close_node" },
        { key = "<Right>", action = "preview" },
        { key = "<Space>", action = "edit" },
        { key = "<C-c>", action = "copy" },
        { key = "<C-x>", action = "cut" },
        { key = "=", action = "cd" },
        { key = ".", action = "toggle_dotfiles" },
        { key = "?", action = "toggle_help" },
        { key = "%", action = "run_file_command" },
        { key = "n", action = "create" },
        { key = "s", action = "search_node" },
        { key = "S", action = "system_open" },
      },
    },
  },

  -- 顯示相關設定
  renderer = {
    full_name = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "signcolumn",
      symlink_arrow = " -> ",
      show = {
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "M", -- "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "U", -- "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },

  -- 互動相關設定
  actions = {
    file_popup = {
      open_win_config = {
        border = "rounded",
      },
    },
    open_file = {
      quit_on_open = true,
    },
  },



  -- 過濾規則
  filters = {
    custom = {
      "^.git$",
    },
  },
  live_filter = {
    always_show_folders = false,
  },
})


local wk = require("which-key")
wk.register({
  ["<leader>f"] = { name = "+File / +Find" },
  ["<leader>fe"] = { "<Cmd>NvimTreeToggle<CR>", "File explore" },
})
