local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- 設定起始畫面圖案
-- local banner = {
--     [[                                                                            ]],
--     [[  ██████   █████                      █████   █████   ███                   ]],
--     [[ ░░██████ ░░███                      ░░███   ░░███   ░░░                    ]],
--     [[  ░███░███ ░███    ██████    ██████   ░███    ░███   ████   █████████████   ]],
--     [[  ░███░░███░███   ███░░███  ███░░███  ░███    ░███  ░░███  ░░███░░███░░███  ]],
--     [[  ░███ ░░██████  ░███████  ░███ ░███  ░░███   ███    ░███   ░███ ░███ ░███  ]],
--     [[  ░███  ░░█████  ░███░░░   ░███ ░███   ░░░█████░     ░███   ░███ ░███ ░███  ]],
--     [[  █████  ░░█████ ░░██████  ░░██████      ░░███       █████  █████░███ █████ ]],
--     [[ ░░░░░    ░░░░░   ░░░░░░    ░░░░░░        ░░░       ░░░░░  ░░░░░ ░░░ ░░░░░  ]],
--     [[                                                                            ]],
-- }

-- local banner = {
--     [[  __    __                         __     __   __                 ]],
--     [[ /  \  /  |                       /_/|   /_/| /_/|                ]],
--     [[ $$  \ $$ |   ______     ______   $$ |   $$ | $$/   _____  ____   ]],
--     [[ $$$  \$$ |  /     /\   /     /\  $$ |   $$ | / /| /    /\/   /\  ]],
--     [[ $$$$  $$ | /$$$$$$ /| /$$$$$$ /| $$ \  /$$/  $$ | $$$$$$ $$$$  | ]],
--     [[ $$ $$ $$ | $$    $$ | $$ |  $$ |  $$ \/$$/   $$ | $$ | $$ | $$ | ]],
--     [[ $$ |$$$$ | $$$$$$$$/  $$ \__$$ |   $$ $$/    $$ | $$ | $$ | $$ | ]],
--     [[ $$ | $$$ | $$/      | $$/   $$/     $$$/     $$ | $$ | $$ | $$ | ]],
--     [[ $$/   $$/   $$$$$$$/   $$$$$$/       $/      $$/  $$/  $$/  $$/  ]],
-- }

local banner = {
  [[  __    __                         __      __   __                 ]],
  [[ / /\  / /|                       / /|    / /| / /|                ]],
  [[ ██ /\ ██ |   ______     ______   ██ |    ██ | ██/   _____  ____   ]],
  [[ ███ /\██ |  /     /\   /     /\  ██ |    ██ | / /| /    /\/   /\  ]],
  [[ ████ /██ | /██████ /| /██████ /| ██/\    ██/  ██ | ██████/████ /| ]],
  [[ ██ ██ ██ | ██    ██ | ██ |  ██ |  ██/\  ██/   ██ | ██ | ██ | ██ | ]],
  [[ ██ |████ | ████████/  ██ |__██ |   ██/\██/    ██ | ██ | ██ | ██ | ]],
  [[ ██ | ███ | ██/     /| ██/   ██/     ████/     ██ | ██ | ██ | ██ | ]],
  [[ ██/   ██/   ███████/   ██████/       ██/      ██/  ██/  ██/  ██/  ]],
  [[                                                                   ]],
}
dashboard.section.header.val = banner
-- dashboard.section.header.opts.hl = "Operator"

-- 設定選單
dashboard.section.buttons.val = {
  dashboard.button("<Space> f n", "  New file", "<Cmd>ene <Bar> startinsert<CR>"),
  dashboard.button("<Space> f e", "  File explorer", "<Cmd>NvimTreeToggle<CR>"),
  dashboard.button("<Space> l p", "  Plugin manager", "<Cmd>Lazy<CR>"),
  dashboard.button("<Space> l s", "  LSP manager", "<Cmd>Mason<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- 設定額外資訊
local function get_footer()
  local text = {}
  local stat = require("lazy").stats()
  text[1] = "  " .. stat.count .. " plugins installed"
  local v = vim.version()
  text[2] = "  v" .. v.major .. "." .. v.minor .. "." .. v.patch
  return table.concat(text, "  ")
end

dashboard.section.footer.val = get_footer()

-- 載入起始畫面
alpha.setup(dashboard.config)
