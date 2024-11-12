local opts = {noremap = true, silent = true}

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

-- nvim-scissors.
-- --------------
vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)
-- When used in visual mode prefills the selection as body.
vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)

-- Syntax Tree Surfer
-- ------------------
-- Cf. https://github.com/ziontee113/syntax-tree-surfer.

local sts = require('syntax-tree-surfer')

-- Normal Mode Swapping:
-- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vU", function()
	vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vD", function()
	vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

-- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vd", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vu", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

--> If the mappings above don't work, use these instead (no dot repeatable)
-- vim.keymap.set("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', opts)
-- vim.keymap.set("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', opts)
-- vim.keymap.set("n", "vD", '<cmd>STSSwapDownNormal<cr>', opts)
-- vim.keymap.set("n", "vU", '<cmd>STSSwapUpNormal<cr>', opts)

-- Visual Selection from Normal Mode
vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', opts)
vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', opts)

-- Select Nodes in Visual Mode
vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', opts)
vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', opts)
vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', opts)
vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', opts)

-- Swapping Nodes in Visual Mode
vim.keymap.set("x", "<A-j>", '<cmd>STSSwapNextVisual<cr>', opts)
vim.keymap.set("x", "<A-k>", '<cmd>STSSwapPrevVisual<cr>', opts)

-- Jump to functions
-- The Lua language schema uses "function", Python uses "function_definition".
-- We include both, so this keymap will work on both languages.
vim.keymap.set("n", "gfu", function()
    sts.targeted_jump({ "function", "arrrow_function", "function_definition" })
  end, opts)

-- Repeat the last jump.
-- "default" means that you jump to the default_desired_types or your lastest jump types
vim.keymap.set("n", "<A-n>", function()
      sts.filtered_jump("default", true) --> true means jump forward
  end, opts)
vim.keymap.set("n", "<A-p>", function()
      sts.filtered_jump("default", false) --> false means jump backwards
  end, opts)

-- dial (improved increment)
-- -------------------------
-- Use [count]g<C-a> in line-wise or block-wise visual mode to
-- increment by [count] at each line relative to its predecessor.
local dm = require('dial.map')
vim.keymap.set("n", "<C-a>", dm.inc_normal(), opts)
vim.keymap.set("n", "<C-x>", dm.dec_normal(), opts)
vim.keymap.set("v", "<C-a>", dm.inc_visual(), opts)
vim.keymap.set("v", "<C-x>", dm.dec_visual(), opts)
vim.keymap.set("v", "g<C-a>", dm.inc_gvisual(), opts)
vim.keymap.set("v", "g<C-x>", dm.dec_gvisual(), opts)

-- Aerial
-- ------
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')

-- query-secretary
-- ---------------
vim.keymap.set('n', '<leader>s', require('query-secretary').query_window_initiate, opts)

-- <C-*> for * with telescope-live-grep-args.
-- vim.keymap.set('n', '<C-*>', require('telescope-live-grep-args.shortcuts').live_grep_args_shortcuts.grep_word_under_cursor, opts)

-- BufferChad
-- ----------
-- In normal mode
-- <leader>fb: opens the bufferchad window.
-- <leader>f': opens the bufferchad window with only the marked buffers.
-- mset: mark buffer
-- 1set, 2set, ...: mark buffer 1, 2, ...
-- 1nav, 2nav, ...: jump to buffer 1, 2, ...
-- mdel: delete mark

-- ros-nvim
-- --------
-- <leader>fr: Telescope ros ros
-- follow links in launch files
vim.keymap.set('n', '<leader>rol', function() require('ros-nvim.ros').open_launch_include() end, opts)
-- show definition for interfaces (messages/services) in floating window
vim.keymap.set('n', '<leader>rdi', function() require('ros-nvim.ros').show_interface_definition() end, opts)
-- before.nvim
-- -----------
local before = require('before')

-- Jump to previous entry in the edit history
vim.keymap.set('n', '<C-k>', before.jump_to_last_edit, opts)

-- Jump to next entry in the edit history
vim.keymap.set('n', '<C-j>', before.jump_to_next_edit, opts)

-- Look for previous edits in quickfix list
vim.keymap.set('n', '<leader>oq', before.show_edits_in_quickfix, opts)

-- Look for previous edits in telescope (needs telescope, obviously)
vim.keymap.set('n', '<leader>oe', before.show_edits_in_telescope, opts)
