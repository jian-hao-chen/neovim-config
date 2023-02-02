local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- 設定起始畫面圖案


-- 設定選單
-- dashboard.section.buttons.val = {
--     dashboard.button("<Space> f n", "  New file", ":ene <Bar> startinsert <CR>"),
--     dashboard.button("<Space> f e", "  File explorer", ""),
-- }


-- 載入起始畫面
alpha.setup(dashboard.config)
