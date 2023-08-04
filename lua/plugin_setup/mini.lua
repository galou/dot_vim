-- mini.ai
-- text objects with count (count is either level or neighbor)
-- `va)a)` or `v2a)`: select 2-nd level parantheses
-- `?`: user prompt
-- `t`: tag
-- `f`: function call, with function name
-- `a`: function argument
-- `.`: a number
-- `d`: a date with format YYYY-MM-DD
-- Generic keys:
-- `b`: brackets
-- `q`: quotes (",',`)

-- Expand the region [a,e] with the new region [new_a, new_e]
-- Return the original region if the new region is outside it.
-- Start and end are inclusive.
local function expand_bbox(a, e, new_a, new_e)
  if ((new_a == nil)
      or (new_e == nil)
      or (new_e < a)
      or (new_a > e)) then
    return a, e
  end
  return math.min(a, new_a), math.max(e, new_e)
end

-- Specialized string.find for numbers (int, float, xEy)
local function find_number(s, init)
  -- The following piece of code was supposed to avoid selecting
  -- also the following character when the cursor is on it.
  -- if string.find(string.sub(s, init, init), '[+%-0-9.a-fA-FxXoO]') == nil then
  --   -- Cursor not on a number.
  --   return nil
  -- end
  local patterns = {
    '[+-]?%.?%d+',  -- 123, -.123, .123
    '[+-]?%d+%.?%d*[eE]?[+-]?%d+',  -- 123, -123.45, +45.64e3
    '0?[xX]?%x+',  -- F5, 0xF5, 0XAA
    '0?[oO]?%x+',  -- 0o45
  }
  local first_a = 1000000
  local last_e = init
  local at_least_one_match = false
  for i = 1, #patterns do
    local a, e = string.find(s, patterns[i], init)
    if a ~= nil then
      first_a = math.min(a, first_a)
      at_least_one_match = true
    end
    first_a, last_e = expand_bbox(first_a, last_e, a, e)
  end
  if not at_least_one_match then
    return nil, nil
  end
  return first_a, last_e
end

-- Return the region `{from, to}` for text object number
-- Bug: return the number plus the following character if the cursor is on the following character.
local function get_number_region(_, _, table)
  local line_nr = table.reference_region.to.line
  local col_nr = table.reference_region.to.col
  local line = vim.fn.getline(line_nr)
  local a, e = find_number(line, col_nr)
  local from = {line = line_nr, col = 1}
  local to = {line = line_nr, col = 1}
  if a ~= nil then
    -- We have a found but we need to expand towards the beginning of the line.
    from.col = a
    to.col = e
    local last_a = a
    for col=(col_nr - 1),1,-1 do
      local aa, _ = find_number(line, col)
      if aa == last_a then
        return { from = from, to = to }
      else
        from.col = col
        last_a = aa
      end
    end
  else
    return nil
  end
end

local gen_spec = require('mini.ai').gen_spec

require('mini.ai').setup({
    custom_textobjects = {
      -- Whole buffer
      g = function()
        local from = { line = 1, col = 1 }
        local to = {
          line = vim.fn.line('$'), col = math.max(vim.fn.getline('$'):len(), 1)
        }
        return { from = from, to = to }
      end,

      -- A number.
      -- 123
      -- 12345.6789
      -- -12345.6789
      -- -12345.6789e4
      ['.'] = get_number_region,
      -- ['.'] = gen_spec.treesitter({ a = '@number', i = '@number' }),

      -- A date [YY]YY-MM-DD
      -- 2022-09-01
      -- %f[%d] = %d after, not %d before
      d = { '()%f[%d]%d?%d?%d%d%-%d%d%-%d%d()' },

      f = gen_spec.treesitter({ a = '@function_definition.outer', i = '@function_definition.inner' }),
  }
})

-- mini.align
-- gA and ga (without preview)
-- For markdown and rst tables: `|tm ` = split:|, trim, merge:' '
require('mini.align').setup({})

-- mini.bracketed
-- Jump around.
--  Target                                              Mappings
--  Buffer                                              [B [b ]b ]B
--  Comment block                                       [C [c ]c ]C
--  Conflict marker                                     [X [x ]x ]X
--  Diagnostic                                          [D [d ]d ]D
--  File on disk                                        [F [f ]f ]F
--  Indent change                                       [I [i ]i ]I
--  Jump from jumplist inside current buffer            [J [j ]j ]J
--  Location from location list                         [L [l ]l ]L
--  Old files                                           [O [o ]o ]O, deactivated
--  Quickfix entry from quickfix list                   [Q [q ]q ]Q
--  Tree-sitter node and parents                        [T [t ]t ]T
--  Undo states from specially tracked linear history   [U [u ]u ]U
--  Window in current tab                               [W [w ]w ]W
--  Yank selection replacing latest put region          [Y [y ]y ]Y
require('mini.bracketed').setup({
  oldfile = { suffix = '', options = {} },
})

-- mini.clue
-- Show next key clues.
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

-- require('mini.completion').setup({
--   -- Delay (debounce type, in ms) between certain Neovim event and action.
--   -- This can be used to (virtually) disable certain automatic actions by
--   -- setting very high delay time (like 10^7).
--   delay = {completion = 100, info = 100, signature = 50},
--
--   -- Maximum dimensions of floating windows for certain actions. Action entry
--   -- should be a table with 'height' and 'width' fields.
--   window_dimensions = {
--     info = {height = 25, width = 80},
--     signature = {height = 25, width = 80},
--   },
--
--   -- Way of how module does LSP completion:
--   -- - `source_func` should be one of 'completefunc' or 'omnifunc'.
--   -- - `auto_setup` should be boolean indicating if LSP completion is set up on
--   --   every `BufEnter` event.
--   -- - `process_items` should be a function which takes LSP
--   --   'textDocument/completion' response items and word to complete. Its
--   --   output should be a table of the same nature as input items. The most
--   --   common use-cases are custom filtering and sorting. You can use
--   --   default `process_items` as `MiniCompletion.default_process_items()`.
--   lsp_completion = {
--     source_func = 'completefunc',
--     auto_setup = true,
--     --process_items = --<function: filters 'not snippets' by prefix and sorts by LSP specification>,
--   },
--
--   -- Fallback action. It will always be run in Insert mode. To use Neovim's
--   -- built-in completion (see `:h ins-completion`), supply its mapping as
--   -- string. For example, to use 'whole lines' completion, supply '<C-x><C-l>'.
--   --fallback_action = --<function equivalent to '<C-n>' completion>,
--
--   -- Module mappings. Use `''` (empty string) to disable one. Some of them
--   -- might conflict with system mappings.
--   mappings = {
--     force_twostep  = '<C-Space>', -- Force two-step completion
--     force_fallback = '<A-Space>', -- Force fallback completion
--   },
--
--   -- Whether to set Vim's settings for better experience (modifies
--   -- `shortmess` and `completeopt`)
--   set_vim_settings = true
-- })

require('mini.cursorword').setup({
    -- Delay (in ms) between when cursor moved and when highlighting appeared
    delay = 1000,
})

-- Activate but disable.
-- let g:miniindentscope_disable=v:false or let g:miniindentscope_disable=v:false to enable.
require('mini.indentscope').setup({})
vim.g.miniindentscope_disable=true

-- Manage pairs of parentheses, brackets, ...
-- Add surrounding with Sa (in visual mode or on motion).
-- Delete surrounding with Sd.
-- Replace surrounding with Sc.
-- Find surrounding with Sf or SF (move cursor right or left).
-- Highlight surrounding with Sh.
-- Change number of neighbor lines with Sn (see |MiniSurround-algorithm|).
require('mini.surround').setup({
    mappings = {
      add = 'Sa', -- Add surrounding in Normal and Visual modes
      delete = 'Sd', -- Delete surrounding
      find = 'Sf', -- Find surrounding (to the right)
      find_left = 'SF', -- Find surrounding (to the left)
      highlight = 'Sh', -- Highlight surrounding
      update_n_lines = 'Sn', -- Update `n_lines`
      replace = 'Sc', -- Replace surrounding, default `sr`.
    },
    -- Whether to respect selection type:
    -- - Place surroundings on separate lines in linewise mode.
    -- - Place surroundings on each line in blockwise mode.
    respect_selection_type = true,
})

require('mini.trailspace').setup({})

