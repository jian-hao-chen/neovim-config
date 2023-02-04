-- 檢查 ripgrep 是否有安裝
if (vim.fn.executable("rg") == 0) then
  local cfg_path = vim.fn.stdpath("config")
  local slash = (jit.os == "Windows") and "\\" or "/"
  error([["ripgrep" not installed, please check ]] 
    .. cfg_path
    .. slash
    .. "README.md"
  )
end
