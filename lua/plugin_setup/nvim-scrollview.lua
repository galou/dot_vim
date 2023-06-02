-- Configuration for the `nvim-scrollview` plugin (https://github.com/dstein64/nvim-scrollview).

require('scrollview').setup({
  excluded_filetypes = {'nerdtree'},
  winblend = 75,  -- Transparency (0 = opaque, 100 = invisible)
  current_only = true,
  base = 'right',
  -- Possible values: conflics, cursor, diagnostics, folds, loclist, marks,
  --                  quickfix, search, spell, textwidth, trail.
  signs_on_startup = {'conflicts', 'diagnostics', 'search'},
  signs_show_in_folds = false,

  -- Configuration of `conflicts` signs.
  conflicts_top_symbol = '',
  conflicts_bottom_symbol = '',

  -- Configuration of `search` signs.
  -- search_symbol = {'①', '②', '③', '④', '⑤', '⑥', '⑦', '⑧', '⑨', '⓪'},
  search_symbol = {'.', '⬥'},

  -- Configuration of `diagnostics` signs.
  diagnostics_error_symbol = '',
  diagnostics_warn_symbol = '', -- '',
  diagnostics_info_symbol = '', -- '',
  diagnostics_hint_symbol = '', -- '',
})
