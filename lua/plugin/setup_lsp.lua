-- 設定自動補全 (nvim-cmp)
local cmp = require("cmp")
local types = require("cmp.types")
local lspkind = require("lspkind")
cmp.setup({
  snippet = {
    expand = function(args)
      -- For vsnip engine
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)

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
    -- documentation = cmp.config.window.bordered({
    --   border = "single",
    --   side_padding = 0,
    --   winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenuBorder,CursorLine:PmenuSel,Search:None",
    -- }),
  },

  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
  }, {
    { name = "buffer" },
  }),

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      max_width = 80,
      ellipsis_char = "…",

      -- The function below will be called before any actual modifications from
      -- lspkind so that you can provide more controls on popup customization.
      -- (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        -- vim_item.abbr = ' ' .. vim_item.abbr
        -- vim_item.menu = (vim_item.menu or '') .. ' '
        return vim_item
      end
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

-- 設定 LSP 設定值
local capabilities = require("cmp_nvim_lsp").default_capabilities()
