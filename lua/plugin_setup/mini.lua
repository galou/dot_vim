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

require('mini.trailspace').setup({})

