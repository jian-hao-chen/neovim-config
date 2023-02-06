-- 啟用滑鼠
vim.opt.mouse = 'a'

-- 啟用輸入按鍵顯示
vim.opt.showcmd = true

-- 設定檔案編碼格式
vim.opt.encoding = 'utf-8'


-- === 行號相關設定 ===
-- 1. 顯示行號
vim.opt.number = true

-- 2. 顯示相對行號
vim.opt.relativenumber = false

-- 3. 總是顯示標號欄
vim.opt.signcolumn = 'yes'


-- === 搜尋相關設定 ===
-- 1. 搜尋時忽略大小寫
vim.opt.ignorecase = true

-- 2. 若搜尋模式出現大寫則區分大小寫
vim.opt.smartcase = true

-- 3. 輸入搜尋模式同時高亮部分匹配
vim.opt.incsearch = true


-- === Tab 相關設定 ===
-- 1. 讀取到 Tab 字元時顯示的寬度
vim.opt.tabstop = 8

-- 2. 縮排時使用的寬度
vim.opt.shiftwidth = 2

-- 3. 是否以空格代替 Tab 字元
vim.opt.expandtab = true

-- 4. 智慧型 Tab
vim.opt.smarttab = true

-- 5. 不要摺疊過長的內容
vim.opt.wrap = false
