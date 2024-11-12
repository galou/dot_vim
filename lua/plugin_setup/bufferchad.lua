-- Configuration for BufferChad.
-- https://github.com/mrquantumcodes/bufferchad.nvim.

require('bufferchad').setup({
  mapping = '<leader>bb', -- Map any key, or set to NONE to disable key mapping, ('<leader>fb' to emulate Telescope's buffer list).
  mark_mapping = '<leader>bm', -- The keybinding to display just the marked buffers
  order = 'LAST_USED_UP', -- LAST_USED_UP (default)/ASCENDING/DESCENDING/REGULAR
  style = 'telescope', -- default, modern (requires dressing.nvim and nui.nvim), telescope (requires telescope.nvim)
  close_mapping = '<Esc><Esc>', -- only for the default style window.
})

-- Other keybindings defined by the plugin (normal mode):
-- mset: mark buffer
-- 1set, 2set, ...: mark buffer 1, 2, ...
-- 1nav, 2nav, ...: jump to buffer 1, 2, ...
-- mdel: delete mark
