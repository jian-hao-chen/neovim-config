if (jit.os == "Windows") then
  vim.opt.shell = "pwsh.exe"
elseif (jit.os == "") then
  vim.opt.shell = "zsh"
else
  vim.opt.shell = "bash"
end

-- 載入插件
require("plugin.check_lazy")
require("plugin.check_ripgrep")
require("plugin.load")


-- 載入使用者設定
require("user.editor")
require("user.keymap")
require("user.appearance")
require("user.autocmd")
