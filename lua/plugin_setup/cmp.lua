-- Setup nvim-cmp (https://github.com/hrsh7th/nvim-cmp).

local cmp = require('cmp')
local ls = require('luasnip')

local has_words_before = function()
  local line_col = vim.api.nvim_win_get_cursor(0)
  local line = line_col[1]  -- TODO: use unpack when compatible.
  local col = line_col[2]
  print('line: ' .. line .. ', col: ' .. col) -- DEBUG
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      ls.lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = {
    -- cmp.SelectBehavior.Insert changes the already typed text, Select not.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      elseif (fallback ~= nil) then
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif ls.jumpable(-1) then
        ls.jump(-1)
      elseif ls.choice_active() then
        ls.change_choice(-1)
      elseif (fallback ~= nil) then
        fallback()
      end
    end, { "i", "s" }),

    ["<C-Tab>"] = cmp.mapping(function(fallback)
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      elseif (fallback ~= nil) then
        fallback()
      end
    end, { "i", "s" }),

    -- <C-S-Tab> requires special support from the terminal emulator.
    -- Cf. https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/.
    ["<C-S-Tab>"] = cmp.mapping(function(fallback)
      if ls.jumpable(-1) then
        ls.jump(-1)
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      elseif (fallback ~= nil) then
        fallback()
      end
    end, { "i", "s" }),

    ['<C-c>'] = cmp.mapping(function(fallback)
      if ls.choice_active() then
        ls.change_choice(1)
      elseif (fallback ~= nil) then
        fallback()
      end
    end),

    ['<S-c>'] = cmp.mapping(function(fallback)
      if ls.choice_active() then
        ls.change_choice(1)
      elseif (fallback ~= nil) then
        fallback()
      end
    end),

    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,   -- Automatically select the first item.
    }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-e>'] = cmp.config.disable,
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-q>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  },

  -- Different groups define different priorities. The 2nd group will be called
  -- if the first one doesn't return anything.
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'path' },
    { name = 'nvim_lua' },  -- nvim lua API completion.
  }, {
    { name = 'buffer' },
    { name = 'rg' },
    { name = 'latex_symbols' },
  }),
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.score,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      require('clangd_extensions.cmp_scores'),
      require('cmp-under-comparator').under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        latex_symbols = "[LaTeX]",
        luasnip = "[LuaSnip]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        rg = "[rg]",
        ultisnips = "[UltiSnips]",
      })[entry.source.name]
      return vim_item
    end
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- `cmp.config.mapping.cmd_line` + <Up> + <Down>
local cmd_mapping = function(override)
  local mapping = require('cmp.config.mapping')
  local misc = require('cmp.utils.misc')
  local feedkeys = require('cmp.utils.feedkeys')
  local keymap = require('cmp.utils.keymap')
  return misc.merge(override or {}, {
    ['<Tab>'] = {
      c = function()
        local cmp = require('cmp')
        if cmp.visible() then
          cmp.select_next_item()
        else
          feedkeys.call(keymap.t('<C-z>'), 'n')
        end
      end,
    },
    ['<S-Tab>'] = {
      c = function()
        local cmp = require('cmp')
        if cmp.visible() then
          cmp.select_prev_item()
        else
          feedkeys.call(keymap.t('<C-z>'), 'n')
        end
      end,
    },
    ['<C-n>'] = {
      c = function(fallback)
        local cmp = require('cmp')
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
    },
    ['<C-p>'] = {
      c = function(fallback)
        local cmp = require('cmp')
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    },
    ['<C-e>'] = {
      c = mapping.close(),
    },
    ['<Up>'] = {
      c = function(fallback)
        fallback()
      end,
    },
    ['<Down>'] = {
      c = function(fallback)
        fallback()
      end,
    },
  })
end

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmd_mapping(),
  sources = {
    { name = 'buffer',
      max_item_count = 3,
    }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmd_mapping(),
  sources = cmp.config.sources({
    {
      {name = 'cmdline'},
    { name = 'copilot' },
    },
    {
      {name = 'path'},
    },
  })
})

-- Use spell suggestions.
cmp.setup.filetype('rst', {
  sources = cmp.config.sources({
    {
      {name = 'spell'},
    },
  })
})

-- Use spell suggestions.
cmp.setup.filetype('text', {
  sources = cmp.config.sources({
    {
      {name = 'spell'},
    },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },  -- Requires https://github.com/petertriho/cmp-git.
  }, {
    { name = 'buffer' },
  })
})

-- Cf. lspconfig.lua for further configuration.
