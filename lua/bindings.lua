-- LuaSnip
-- -------

local ls = require('luasnip')

-- <C-e> is the expansion key.
-- This will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<C-e>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <C-S-e> requires special support from the terminal emulator.
-- Cf. https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/.
vim.keymap.set({ "i", "s" }, "<C-S-e>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

