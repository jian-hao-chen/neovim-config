local autopairs = require("nvim-autopairs")
autopairs.setup()

-- 設定自動完成觸發時插入成對括號
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)

-- 可以自行設定觸發規則
-- local Rule = require("nvim-autopairs.rule")
-- autopairs.add_rule(
--   Rule("$$", "$$", { "tex", "latex" })
-- )
