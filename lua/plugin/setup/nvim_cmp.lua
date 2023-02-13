-- 設定自動補全 (nvim-cmp)
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local has_words_before = function()
  unpack = unpack or table.unpack
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, row - 1, row, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      -- For vsnip engine
      -- vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.
      luasnip.lsp_expand(args.body)

      -- For `snippy` users.
      -- require('snippy').expand_snippet(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  view = {
    -- entries = { name = "custom", selection_order = "near_cursor" }
  },
  window = {
    completion = cmp.config.window.bordered({
      border = { '', '', '', '', '', '', '', '' },
      winhighlight = 'Normal:Pmenu,FloatBorder:CmpMenuBorder,CursorLine:PmenuSel,Search:None',
      col_offset = 1,
      side_padding = 1,
    }),
    -- documentation = cmp.config.window.bordered({}),
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable( -1) then
        luasnip.jump( -1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "nvim_lsp_signature_help" },
  }, {
    { name = "buffer" },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      max_width = 80,
      ellipsis_char = "...",

      -- 選單文字內容排版, 這個函數會 lspkind 在加上圖標之前調用, 所以可以讓你自訂選單的
      -- 文字內容或順序等格式, 參考: https://github.com/onsails/lspkind-nvim/pull/30
      -- before = function(entry, vim_item)
      --   -- vim_item.abbr = ' ' .. vim_item.abbr
      --   -- vim_item.menu = (vim_item.menu or '') .. ' '
      --   return vim_item
      -- end
    })
  },
})

-- 設定命令行使用 buffer 來源自動補全
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline({
    ['<Down>'] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
    ['<Up>'] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
  }),
  sources = {
    { name = "buffer" }
  }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline({
    ['<Down>'] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
    ['<Up>'] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
  }),
  sources = cmp.config.sources({
    { name = "buffer" }
  }, {
    { name = "cmdline" }
  }, {
    { name = "path" }
  })
})

-- 針對檔案格式的個別設定
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
-- -- 這種 cmp_* 的選項要特別安裝才能用, 非預設值
--     { name = 'cmp_git' },
--   }, {
--     { name = 'buffer' },
--   })
-- })
