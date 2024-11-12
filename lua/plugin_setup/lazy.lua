-- Bootstrap lazy.nvim if it doesn't exist.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- git integration.
  {'tpope/vim-fugitive',
    cmd = {
      'GBrowse',
      'GDelete',
      'GMove',
      'GRemove',
      'GRename',
      'GUnlink',
      'Gbrowse',
      'GcLog',
      'Gcd',
      'Gclog',
      'Gdiffsplit',
      'Gdrop',
      'Gedit',
      'Ggrep',
      'Ghdiffsplit',
      'Git',
      'GlLog',
      'Glcd',
      'Glgrep',
      'Gllog',
      'Gpedit',
      'Gread',
      'Gsplit',
      'Gtabedit',
      'Gvdiffsplit',
      'Gvsplit',
      'Gwq',
      'Gwrite',
    },
  },

  -- Interactive git log viewer.
  -- Provides :GitLog.
  {'kablamo/vim-git-log',
    dependencies = {'tpope/vim-fugitive'},
  },

  -- Snippets.
  'L3MON4D3/LuaSnip',
  -- Some common snippets.
  'rafamadriz/friendly-snippets',
  -- Automatic snippet creation.
  -- Bindings defined in ../bindings.lua.
  {
    'chrisgrieser/nvim-scissors',
    dependencies= {'nvim-telescope/telescope.nvim'}, -- optional
    opts = {
      snippetDir = vim.fn.stdpath("data") .. "/snippets",
    },
  },

  -- Basic support for .env files, ':Dotenv {file}'.
  {'tpope/vim-dotenv',
    ft = {'python'},
  },

  -- Show a tip on vim startup.
  {'hobbestigrou/vimtips-fortune',
    event = {'VimEnter'},
  },

  -- Editing ROS source files.
  -- 'taketwo/vim-ros',

  {'othree/xml.vim',
    ft = {'xml'},
  },

  {'ivanov/vim-ipython',
    ft = {'python'},
  },

  {'jupyter-vim/jupyter-vim',
    ft = {'python'},
  },

  -- Pairs of handy bracket mappings.
  'tpope/vim-unimpaired',

  -- Automatic indent detection.
  -- Alternative: 'nathanaelkane/vim-indent-guides',
  {'tpope/vim-sleuth',
    -- event= {'BufEnter', 'BufRead'},
    even = {'VimEnter'},
  },

  -- Block commenting.
  -- Supports line comment (gc{move}) or block comment (gb{move}).
  -- https://github.com/numToStr/Comment.nvim
  -- Alternative: https://github.com/alexshelto/boringcomment.nvim
  {'numToStr/Comment.nvim',
    config = function() require('plugin_setup.comment') end,
    keys = {'gc', 'gb'},
  },

  -- Repeat ('.') also for complex mapping.
  'tpope/vim-repeat',

  -- vim-abolish provides:
  -- - ':Subvert': replace a word with another while respecting case and plural.
  -- - Change between variable conventions (dash-case, MixedCase, camelCase, ...).
  --   Mapped to 'cr_', 'cr-', 'crm', 'crc', 'cr.',
  {'tpope/vim-abolish',
    keys = {'cr'},
    cmd = {'Subvert'},
  },

  -- Argumentative aids with manipulating and moving between function
  -- arguments.
  -- Shifting arguments with `<,` and `>,`.
  'PeterRincker/vim-argumentative',

  -- Set the `path` variable for more efficient jump to file (gf).
  'tpope/vim-apathy',

  -- TeX support, work better than atp with NeoVim.
  'lervag/vimtex',

  -- Editor agnostic configuration.
  'editorconfig/editorconfig-vim',

  -- Use airline as alternative to unsupported powerline.
  {'vim-airline/vim-airline',
    lazy = false,
  },

  -- Debugging in vim.
  {'puremourning/vimspector',
    -- build = './install_gadget.py --enable-python --enable-c --enable-bash --enable-go',
    build = ':VimspectorInstall python c bash go'  -- post-install/update hook.
  },

  -- Debugging in vim with the Debug Adapter Protocol.
  -- :lua require('dap').continue() to launch.
  {'mfussenegger/nvim-dap',
    config = function() require('plugin_setup/dap') end,
  },
  -- Extensions for nvim-dap.
  {'mfussenegger/nvim-dap-python',
    dependencies = {'mfussenegger/nvim-dap'},
    config = function() require('dap-python').setup('python') end,
  },
  -- UI extension for 'nvim-dap'
  -- Configured also in `neodev.lua`.
  -- `:lua require("dapui").open()`.
  {'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function() require('dapui').setup({}) end,
  },

  -- Browse files, buffers, lines ...
  -- Replacement for the deprecated 'Shougo/unite.vim'.
  -- Telescope's which_key (insert mode: <C-/>, normal mode: ?) to list mappings attached to your picker.
  -- Keys maps (mostly `<leader>f?`) in ../../bindings.vim.
  {'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',  -- Utility functions.
    },
    config = function() require('plugin_setup.telescope') end,
    lazy = false,
  },
  -- Frequent/recent files for Telescope.
  {'nvim-telescope/telescope-frecency.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('frecency') end, -- plugin setup at vim startup.
  },
  -- Project-based file search for Telescope.
  -- :Telescope project search for files in the current project.
  {'nvim-telescope/telescope-project.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('project') end,
  },
  -- Tab switching for Telescope.
  {'TC72/telescope-tele-tabby.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('tele_tabby') end,
  },
  -- find_files in a specific ROS package for Telescope.
  -- Too slow compared with tadachs/ros-nvim.
  -- {'bi0ha2ard/telescope-ros.nvim',
  --   dependencies = {'nvim-telescope/telescope.nvim'},
  --   config = function() require('telescope').load_extension('ros') end,
  -- },
  -- Register LSP handlers for Telescope.
  {'gbrlsnchs/telescope-lsp-handlers.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('lsp_handlers') end,
  },
  -- Switch between heading in Telescope.
  {'crispgm/telescope-heading.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('heading') end,
  },
  -- Ctags outline for Telescope.
  {'fcying/telescope-ctags-outline.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('ctags_outline') end,
  },
  -- Vimspector integration in Telescope.
  {'nvim-telescope/telescope-vimspector.nvim',
    dependencies = {{'nvim-telescope/telescope.nvim'}, {'puremourning/vimspector'}},
    config = function() require('telescope').load_extension('vimspector') end,
  },
  -- Tab switching for Telescope.
  {'LukasPietzschmann/telescope-tabs',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope-tabs').setup({}) end,
  },
  -- File browser from the current directory.
  {'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',  -- Utility functions.
    },
    config = function() require('telescope').load_extension('file_browser') end,
  },
  -- Interface to fzf.
  -- fzf syntax:
  -- Token   Match type                 Description
  -- ------- -------------------------- ------------
  -- sbtrkt  fuzzy-match                Items that match sbtrkt
  -- 'wild   exact-match (quoted)       Items that include wild
  -- ^music  prefix-exact-match         Items that start with music
  -- .mp4$   suffix-exact-match         Items that end with .mp3
  -- !fire   inverse-exact-match        Items that do not include fire
  -- !^music inverse-prefix-exact-match Items that do not start with music
  -- !.mp4$  inverse-suffix-exact-match Items that do not end with .mp3
  {'nvim-telescope/telescope-fzf-native.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  -- Search through commit messages, content, authors, files, ...
  -- Extension configuration in `telescope.lua`.
  {'aaronhallaert/advanced-git-search.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        -- to show diff splits and open commits in browser
        'tpope/vim-fugitive',
        -- to open commits in browser with fugitive
        'tpope/vim-rhubarb',
        -- optional: to replace the diff from fugitive with diffview.nvim
        -- (fugitive is still needed to open in browser with vim-rhubarb)
        'sindrets/diffview.nvim',
    },
    config = function() require('telescope').load_extension('advanced_git_search') end,
  },
  -- Live grep args picker for telescope.nvim.
  -- Enables passing arguments to the grep command.
  -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
  -- `require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()`
  {'nvim-telescope/telescope-live-grep-args.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('live_grep_args') end,
  },
  -- Buffer Manager
  -- https://github.com/mrquantumcodes/bufferchad.nvim.
  -- Keybindinds defined in plugin_setup.bufferchad.lua:
  -- - \bb show all, \bm show marked
  -- - 1set, 2set, ...: mark buffer 1, 2, ...
  -- - 1nav, 2nav, ...: jump to buffer 1, 2, ...
  {'mrquantumcodes/bufferchad.nvim',
    dependencies = {
    --    {"nvim-lua/plenary.nvim"},
    --    {"MunifTanjim/nui.nvim"},
    --    {"stevearc/dressing.nvim"},
       {'nvim-telescope/telescope.nvim'} -- needed for fuzzy search, but should work fine even without it
    },
    config = function() require('plugin_setup.bufferchad') end,
  },

  -- Provide autocompletion (i.e. no need to `<C-x><C-o>`.
  -- Alternatives: https://github.com/ms-jpq/coq_nvim.
  -- Deprecates hrsh7th/compe.
  {'hrsh7th/nvim-cmp',
    dependencies = {
      -- Completion sources for cmp.
      {'f3fora/cmp-spell'}, -- Suggestion from spell.
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-path'},
      {'kdheepak/cmp-latex-symbols'},
      {'lukas-reineke/cmp-rg'},  -- ripgrep the current directory.
      {'petertriho/cmp-git'}, -- Completion from git commit messages.
      -- {'quangnguyen30192/cmp-nvim-ultisnips'},
      {'saadparwaiz1/cmp_luasnip'},
      -- Additional functionnalities for cmp.
      {'lukas-reineke/cmp-under-comparator'}, -- Sort private members at the end.
    },
    config = function()
      require('plugin_setup.cmp')
      require('plugin_setup.luasnip')
    end,
    -- event = {'BufEnter', 'BufRead'},
    lazy = false,
  },

  -- A class outline viewer, requires ctags.
  -- :Tagbar
  'majutsushi/tagbar',

  -- Regenerate tag files on the go.
  -- Alternative: https://github.com/JMarkin/gentags.lua.git.
  'ludovicchabant/vim-gutentags',

  -- extended % matching for HTML, LaTeX, and many other languages
  'tmhedberg/matchit',

  -- Lego Mindstorms (nxc) syntax.
  'vim-scripts/nxc.vim',

  -- SIP syntax (Python binding for C++).
  'vim-scripts/sip.vim',

  -- ABB Rapid support.
  'KnoP-01/rapid-for-vim',

  -- Support for csv files
  'chrisbra/csv.vim',

  -- Highlight yanked text briefly
  -- Can also be done via autocmd
  -- (https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42)
  -- but not nice with hl_IncSearch.
  {'machakann/vim-highlightedyank',
    event = {'TextYankPost'},
  },

  -- Syntax highlighting for i3 config.
  'mboughaba/i3config.vim',

  -- Integration of cheatsheets from https://cht.sh/.
  -- <leader>KK: show in pager.
  -- <leader>KB: show in buffer.
  -- <leader>Kp, <leader>KP, <leader>KR: paste
  -- <leader>KE: query the error
  -- <leader>KC: toggle comments (switch comments off)
  'dbeniamine/cheat.sh-vim',

  -- Collection of minimal, independent, and fast Lua modules.
  -- https://github.com/echasnovski/mini.nvim
  -- mini.align: text alignment, replacement of 'junegunn/vim-easy-align'.
  -- mini.completion: two-stage completion, used to show the signature.
  -- mini.cursorword: highlight word under cursor.
  -- mini.trailspace: Automatically highlight trailing whitespaces:
  -- mini.surround: Add surrounding brackets.
  --   `lua MiniTrailspace.trim()`.
  {'echasnovski/mini.nvim',
    config = function() require('plugin_setup.mini') end,
    event = {'BufEnter', 'BufRead'},
  },

  -- Show cursors jumps.
  'danilamihailov/beacon.nvim',

  -- Interface to cycle through git diffs.
  -- :Diffview..
  {'sindrets/diffview.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Jump to the last location when opening.
  -- Used to be as autocommand but the autocommand didn't open folds.
  {'ethanholz/nvim-lastplace',
    config = function() require('plugin_setup.lastplace') end,
    event = {'BufEnter', 'BufRead'},
  },

  -- Per-project LSP configuration.
  -- https://github.com/tamago324/nlsp-settings.nvim.git
  -- `:LspSettings buffer`: Open the global settings file that
  --                        matches the current buffer.
  -- `:LspSettings local buffer`: Open the local settings file
  --                              of the server corresponding
  --                              to the current buffer.
  {'tamago324/nlsp-settings.nvim',
    dependencies = {'neovim/nvim-lspconfig'},
    -- Optional: 'rcarriga/nvim-notify'
    config = function() require('plugin_setup.nlspsettings') end,
  },

  -- Provide some installation scripts for some LSP servers, DAP servers,
  -- linters, and formatters.
  -- Replacement for 'williamboman/nvim-lsp-installer'
  -- Alternative: https://github.com/dundalek/lazy-lsp.nvim.
  {'williamboman/mason.nvim',
    config = function() require('mason').setup({}) end,
    -- event = {'BufEnter', 'BufRead'},
    lazy = false,
  },

  -- Companion to mason.nvim.
  -- Provides :LspInstall.
  {'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
    },
    config = function() require('mason-lspconfig').setup({}) end,
    -- event = {'BufEnter', 'BufRead'},
    lazy = false,
  },

  -- LSP extra functionnalities.
  -- :Lspsaga finder: UI to show LSP methods search result.
  -- :LspSaga show_buf_diagnostics: UI to show buffer diagnostics.
  -- :Lspsaga diagnostic_jump_next and :Lspsaga diagnostic_jump_prev.
  -- :Lspsaga code_action: UI to show code actions.
  -- :Lspsaga rename: UI to rename symbols.
  -- :Lspsaga signature_help: UI to show signature help.
  -- :Lspsaga preview_definition: UI to show definition preview.
  -- :Lspsaga hover_doc: UI to show hover doc.
  -- :Lspsaga incoming_calls and :Lspsaga outgoing_calls.
  {'nvimdev/lspsaga.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',  -- optional
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function() require('lspsaga').setup({}) end,
    cmd = {'Lspsaga'},
  },

  -- Provide some configurations for the built-in LSP client.
  -- https://github.com/neovim/nvim-lspconfig
  {'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function() require('plugin_setup.lspconfig') end,
    event = {'BufEnter', 'BufRead'},
  },

  -- Extra features for clangd LSP.
  -- Configuration in `clangd_extensions.lua`.
  -- :ClangdSymbolInfo
  -- :ClangdTypeHierarchy
  -- :ClangdSwitchSourceHeader
  {'https://git.sr.ht/~p00f/clangd_extensions.nvim',
    config = function() require('plugin_setup.clangd_extensions') end,
    commit = '798e377ec859087132b81d2f347b5080580bd6b1', -- Bug in 6d0bf368 (2023-05-23) with virtual text.
    cmd = {
      'ClangdDisableInlayHints',
      'ClangdMemoryUsage',
      'ClangdSetInlayHints',
      'ClangdSwitchSourceHeader',
      'ClangdSymbolInfo',
      'ClangdToggleInlayHints',
      'ClangdTypeHierarchy',
      'ClangdAST',
    }
  },


  -- Code refactoring.
  -- :'<,'>Refactor {extract_block_to_file, extract, extract_block, extract_var, extract_to_file}.
  -- Extract function or variable from last visual selection.
  {'ThePrimeagen/refactoring.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',  -- Utility functions.
        'nvim-treesitter/nvim-treesitter',
    },
    config = function() require('plugin_setup.refactoring') end,
    cmd = {'Refactor'},
  },

  -- Adding/remove code for debug print.
  -- https://github.com/andrewferrier/debugprint.nvim
  -- Mode 	Default Key / Cmd 	Purpose 	Above/Below Line
  -- Normal 	g?p 	Plain debug 	Below
  -- Normal 	g?P 	Plain debug 	Above
  -- Normal 	g?v 	Variable debug 	Below
  -- Normal 	g?V 	Variable debug 	Above
  -- Visual 	g?v 	Variable debug 	Below
  -- Visual 	g?V 	Variable debug 	Above
  -- Op-pending 	g?o 	Variable debug 	Below
  -- Op-pending 	g?O 	Variable debug 	Above
  -- Command 	:DebugPrintsDelete 	Delete debug lines in buffer 	-
  -- Command 	:DebugPrintsToggleComment 	Comment/uncomment debug lines in buffer 	-
  {'andrewferrier/debugprint.nvim',
    dependencies = {
        -- 'echasnovski/mini.nvim', -- Needed to enable :ToggleCommentDebugPrints for NeoVim <= 0.9
        'nvim-treesitter/nvim-treesitter' -- Needed to enable treesitter for NeoVim 0.8
    },
    -- Remove the following line to use development versions,
    -- not just the formal releases
    version = "*",
    config = function() require('plugin_setup.debugprint') end,
    keys = {
      { "g?p", mode = 'n' },
      { "g?P", mode = 'n' },
      { "g?v", mode = 'n' },
      { "g?V", mode = 'n' },
      { "g?o", mode = 'n' },
      { "g?O", mode = 'n' },
      { "g?v", mode = 'x' },
      { "g?V", mode = 'x' },
    },
    cmd = {'DebugPrintsDelete', 'DebugPrintsToggleComment'},
  },

  -- Github's Copilot.
  -- Instead of the official copilot plugin ('github/copilot.vim').
  {'zbirenbaum/copilot.lua',
    cmd = 'Copilot',  -- Lazy-load with :Copilot.
    config = function() require('plugin_setup.copilot') end,
    -- event = 'InsertEnter',  -- Lazy-load on InsertEnter.
    event = {'BufEnter', 'BufRead'},
  },

  -- Integration of zbirenbaum/copilot with cmp.
  -- https://github.com/zbirenbaum/copilot-cmp
  {'zbirenbaum/copilot-cmp',
    dependencies = {'zbirenbaum/copilot.lua'},
    config = function () require('copilot_cmp').setup() end,
    event = {'BufEnter', 'BufRead'},
  },

  -- Syntax highlighting.
  -- :Inspect and :InspectTree for debugging.
  {'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function() require('plugin_setup.treesitter') end,
    event = {'BufEnter', 'BufRead'},
  },

  -- Write TreeSitter queries for you.
  {'ziontee113/query-secretary'},

  -- Always show the function prototype.
  -- :TSContextToggle.
  {'nvim-treesitter/nvim-treesitter-context',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
    config = function() require('plugin_setup.treesitter-context') end,
    cmd = {'TSContextToggle'},
  },

  -- Jump or move elements according to their function
  -- E.g. move arguments in a function prototype, elements in a list.
  -- <A-j>, <A-k>: visual select something and swap it with an element of the same level.
  -- HJKL: in visual mode select according to node levels.
  -- vx, vn: in normal mode, enter visual mode and select master or current node, resp.
  -- vU, vD: in normal mode, swap master nodes (vu, vd for current nodes).
  -- gfu + f or j: in normal mode, jump to the previous, next function declaration.
  -- <A-n>, <A-p>: in normal mode, repeat the last jump.
  {'ziontee113/syntax-tree-surfer',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
  },

  -- Toggle between one-liner and "open" code.
  -- :TSJToggle, :TSJSplit, :TSJJoin.
  {'Wansmer/treesj',
    dependencies = {'nvim-treesitter'},
    config = function() require('plugin_setup.treesj') end,
    cmd = {'TSJToggle', 'TSJSplit', 'TSJJoin'},
  },

  -- Improve layout and preview of the Quickfix window.
  -- Shortcuts:
  --   t: open in a new tab
  --   T: open in a new tab, keep quickfix open
  --   crtl-v: open in a new vertical split
  --   crtl-x: open in a new horizontal split
  --   <: previous quickfix list
  --   >: next quickfix list
  --   p: toggle preview (P: temporarily)
  --   zf: open fzf
  --   crtl-t: in fzf, open in a new tab
  --   crtl-v: in fzf, open in a new vertical split
  --   crtl-x: in fzf, open in a new horizontal split
  {'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function() require('bqf').setup({}) end,
  },

  -- Diff on part of files.
  -- Visual selection + :'<,'>Linediff twice on non-overlapping parts.
  'AndrewRadev/linediff.vim',

  -- Run code chunks.
  -- :'<,'>SnipRun
  {'michaelb/sniprun',
    build = 'bash install.sh'
  },

  -- Manage a terminal buffer easierly.
  -- Bound to '<leader>tt'
  -- Alternatively, cf. https://github.com/caenrique/nvim-toggle-terminal.
  'itmecho/bufterm.nvim',

  -- Search for different pattern in different buffers.
  -- Activate with "<leader>/"
  'mox-mox/vim-localsearch',

  -- More `increment` commands (<C-a>, <C-x>).
  -- Alternatively: RutaTang/compter.nvim.
  {'monaqa/dial.nvim',
    config = function() require('plugin_setup.dial') end,
  },

  -- Notifications as pop-up rather than :messages.
  -- `:lua vim.notify = require('notify')` to activate.
  {'rcarriga/nvim-notify'},

  -- Completely replace the UI for messages, cmdline and the popupmenu.
  -- {'folke/noice.nvim',
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     'MunifTanjim/nui.nvim',
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to the notification view.
  --     --   If not available, we `mini` as the fallback
  --     'rcarriga/nvim-notify',
  --     {'nvim-treesitter', lazy = true},
  --   },
  -- },

  -- Displays interactive vertical scrollbars and signs.
  {'dstein64/nvim-scrollview',
    config = function() require('plugin_setup.scrollview') end,
  },

  -- Code outline window.
  -- :AerialToggle
  -- :AerialToggle! to stay in the same window.
  -- The configuration doesn't work yet, `:lua require('aerial').setup({})`
  -- needs to be called manully.
  {'stevearc/aerial.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function()
      require('aerial').setup({})
      require('telescope').load_extension('aerial')
    end,
    cmd = {'AerialToggle', 'AerialNavToggle'},
  },

  {'luukvbaal/statuscol.nvim',
    config = function() require('plugin_setup.statuscol') end,
  },

  -- Local LLM.
  -- Start the ollama LLM server `ollama serve`.
  -- Then `:Gen {prompt}`
  -- Cf. `prompt.lua` for the list of prompts.
  -- Cf. https://dev.to/ottercyborg/neovim-my-setup-for-developer-assistant-with-local-language-models-2nim
  -- for the ability to switch between local and remote models.
  {'David-Kunz/gen.nvim',
    config = function() require('plugin_setup.gen_config') end,
    cmd = {'Gen'},
  },

  -- Neodev
  -- Neovim setup for init.lua and plugin development with full signature
  -- help, docs and completion for the nvim lua API.
  {'folke/neodev.nvim',
    config = function() require('plugin_setup.neodev') end,
  },

  -- A framework for interacting with tests.
  -- Configured also in `neodev.lua`.
  {'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',  -- Utility functions.
      -- 'antoinemadec/FixCursorHold.nvim', -- Probably not needed as of 2023-12-04.
    },
    -- config = function() require('plugin_setup.neotest') end,
  },
  -- GTest adapter for neotest.
  -- Configured in `neotest.lua`.
  {'alfaix/neotest-gtest',
    dependencies = {
      'nvim-neotest/neotest',
    },
  },

  -- Provide auto indent when cursor at the first column and press <TAB> key.
  {'vidocqh/auto-indent.nvim',
    -- config = function() require('auto_indent') end,
  },



  -- Undo management (:GundoToggle).
  {'sjl/gundo.vim',
    cmd = {
      'GundoToggle',
    },
  },

  -- Jump to changes, also accross files.
  -- https://github.com/bloznelis/before.nvim
  -- Key bindings in bindings.lua.
  {
  'bloznelis/before.nvim',
   config = function() require('plugin_setup.before') end,
   event = {'BufModifiedSet'},
  },

  -- Syntax highlighting support for Pweave files, scientific report with
  -- LaTeX and Python.
  {'naught101/vim-pweave',
    ft = {'pweave'},
  },

  -- JSON bindings.
  -- aj provides a text object for the outermost JSON object, array, string, number, or keyword.
  -- gqaj pretty prints (wraps/indents/sorts keys/otherwise cleans up) the JSON construct under the cursor.
  -- gwaj takes the JSON object on the clipboard and extends it into the JSON object under the cursor.
  {'tpope/vim-jdaddy',
    ft = {'json'},
  },

  -- Rust support.
  {'rust-lang/rust.vim',
    ft = {'rust'},
  },
  {'racer-rust/vim-racer',
    ft = {'rust'},
  },

  -- Treat new lines from pasted text differently than typed ones.
  -- Allow to indent already indented text.
  'ConradIrwin/vim-bracketed-paste',

  -- Additional 'icons'.
  'nvim-tree/nvim-web-devicons',

  -- Open Jupyter notebooks (*.ipynb) thanks to the external jupytext
  -- executable.
  'goerz/jupytext.vim',

  -- Show diffs in git repositories.
  -- Enable with :GitGutterEnable.
  {'airblade/vim-gitgutter',
    cmd = {
      'GitGutter',
      'GitGutterAll',
      'GitGutterBufferDisable',
      'GitGutterBufferEnable',
      'GitGutterBufferToggle',
      'GitGutterDebug',
      'GitGutterDiffOrig',
      'GitGutterDisable',
      'GitGutterEnable',
      'GitGutterFold',
      'GitGutterLineHighlightsDisable',
      'GitGutterLineHighlightsEnable',
      'GitGutterLineHighlightsToggle',
      'GitGutterLineNrHighlightsDisable',
      'GitGutterLineNrHighlightsEnable',
      'GitGutterLineNrHighlightsToggle',
      'GitGutterNextHunk',
      'GitGutterPrevHunk',
      'GitGutterPreviewHunk',
      'GitGutterQuickFix',
      'GitGutterQuickFixCurrentFile',
      'GitGutterSignsDisable',
      'GitGutterSignsEnable',
      'GitGutterSignsToggle',
      'GitGutterStageHunk',
      'GitGutterToggle',
      'GitGutterUndoHunk',
    },
  },

  -- Manage tabs.
  -- Enter vim-tabmode with <leader><Tab> or :TabmodeEnter.
  -- Can be replaced by barbar.nvim.
  {'Iron-E/nvim-tabmode',
    dependencies = {{'Iron-E/nvim-libmodal'}},
    cmd = {
      'TabmodeEnter',
    }
  },

  -- Set some variables for project scope.
  -- Drop a '_vimrc_local.vim' file into any project root directory to use.
  -- Also takes .editorconfig into account.
  -- 'LucHermitte/local_vimrc',

  -- User ranger as file browser.
  -- The difference with francoiscabrol/ranger.vim is the rnvimr is a floating
  -- window.
  -- Inside ranger:
  -- - <C-t>: tabedit,
  -- - <C-x>: split,
  -- - <C-v>: vsplit,
  {'kevinhwang91/rnvimr',
    branch = 'lua'
  },

  -- Create intelligent implementations for C++.
  -- Provides:
  -- - TSCppMakeConcreteClass: create a concrete class implementing all the
  --     pure virtual functions.
  -- - TSCppRuleOf3: adds the missing function declarations to the class to
  --     obey the Rule of 3.
  -- - TSCppRuleOf5: adds the missing function declarations to the class to
  --     obey the Rule of 5.
  {'Badhi/nvim-treesitter-cpp-tools',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = {'cpp'},
    cmd = {'TSCppMakeConcreteClass', 'TSCppRuleOf3', 'TSCppRuleOf5'},
    -- event = {'VimEnter'},
  },

  -- Standalone UI for nvim-lsp progress.
  {'j-hui/fidget.nvim',
    branch = 'legacy',  -- Fixed on 2023-06-19 before announced breaking changes.
    config = function() require('fidget').setup({}) end,
    lazy = false,
  },


  -- Various helper for C++.
  -- <C-X>i: add #include for symbol under cursor.
  -- <M-i>: add #include for symbol under cursor and add scope.
  -- {'LucHermitte/lh-cpp',
  --   dependencies = {
  --     {'LucHermitte/lh-vim-lib'},
  --     {'LucHermitte/lh-style'},
  --     {'LucHermitte/lh-tags'},
  --     {'LucHermitte/lh-dev'},
  --     {'LucHermitte/lh-brackets'},
  --     {'LucHermitte/searchInRuntime'},
  --     {'LucHermitte/mu-template'},
  --     {'tomtom/stakeholders_vim'},
  --     {'LucHermitte/alternate-lite'},
  --   },
  -- },

  -- Show the documentation of a function when the cursor is on it.
  -- Alternatively:
  -- Edit tables the spreadsheet way in Markdown.
  -- Requires sc-im (https://github.com/andmarti1424/sc-im.git).
  -- Provides :OpenInScim.
  {'mipmip/vim-scimark',
    config = function() require('plugin_setup.scimark') end,
    ft = {'markdown'},
  },

  -- Use Wandbox (https://wandbox.org/) in vim.
  -- :Wandbox
  'rhysd/wandbox-vim',

  -- Fade inactive buffers.
  'TaDaa/vimade',

  -- Minimap.
  {'wfxr/minimap.vim',
    build = 'cargo install --locked code-minimap'
  },
  -- Replacement for :make.
  'neomake/neomake',

  -- Easily configure neomake to recognize your PlatformIO project's include
  -- path.
  'coddingtonbear/neomake-platformio',

  -- Show hunks and add them to the index.
  -- `:Gitsigns toggle_signs` then `<leader>hs`.
  -- Has more features then gitgutter but gitgutter better handles folds, as of
  -- 2022-09-01.
  {'lewis6991/gitsigns.nvim',
    config = function() require('plugin_setup.gitsigns') end,
  },

  -- File browser
  -- https://github.com/nvim-neo-tree/neo-tree.nvim.
  -- :Neotree
  -- Ctrl-n
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'MunifTanjim/nui.nvim',  -- UI Component Library.
      'nvim-tree/nvim-web-devicons',  -- not strictly required, but recommended
      'nvim-lua/plenary.nvim',  -- Utility functions.
    },
  },

  -- Sets filetype for dotfiles in chezmoi source path.
  {'alker0/chezmoi.vim'},

  -- Runs `chezmoi apply` on save.
  -- Doesn't work since chezmoi creates a temporary file to edit (2022-09).
  {'Lilja/vim-chezmoi'},


  -- 'tmhedberg/SimpylFold',
  -- 'vim-scripts/taglist.vim',
  -- 'trotter/autojump.vim',

  -- 'vim-scripts/project.tar.gz',

  -- Show a VCS diff using Vim's sign column
  -- 'mhinz/vim-signify',

  -- Experimental minimap
  -- 'severin-lemaignan/vim-minimap',

  -----------------------------------------------
  -- Functionalities provided by other plugins --
  -----------------------------------------------

  -- minimal commenting plugin.
  -- 'vim-scripts/vim-addon-commenting',

  -- Most recently used (:MRU)
  -- Deactivated in favor of Unite.
  -- 'vim-scripts/mru.vim',

  -- Python completion (included in YouCompleteMe)
  -- 'davidhalter/jedi-vim.git',

  -- snipMate is incompatible with YouCompleteMe
  -- UltiSnips is used instead of snipMate because of compatibility with YCM
  -- 'msanders/snipmate.vim',

  -- Fast file navigation.
  -- Deactivated in favor of Unite (:Unite file).
  -- 'wincent/command-t',

  -- quickly and easily switch between buffers.
  -- Deactivated in favor of Unite (:Unite buffer).
  -- 'c9s/bufexplorer',

  -- buffer/file/command/tag/etc explorer with fuzzy matching
  -- Deactivated in favor of Unite.
  -- 'vim-scripts/FuzzyFinder',

  -- A code-completion engine.
  -- Replaced with the built-in LSP client in Neovim.
  -- On Ubuntu 14.04, it's also offered system-wide and activated with
  -- 'vim-addons install youcompleteme'.
  -- Lock to revision 'f928f7dd975d26b608d5310a9139dc5fc310e4a9' because newer
  -- commits require vim 7.4.143+, not available on Ubuntu 14.04.
  -- if has('nvim')
  --   call dein#add('Valloric/YouCompleteMe',
  --               \ {'build': 'python3 install.py --clang-completer',
  --               \  'timeout': 600
  --               \ },
  --               \ )
  --               " '--gocode-completer' requires go >= 1.11, so deactivated on
  --               " Ubuntu 18.04 which has 1.10.
  -- else
  --   if (v:version < 800)
  --     call dein#add('Valloric/YouCompleteMe',
  --                 \ {'build': 'python install.py --clang-completer --gocode-completer',
  --                 \  'timeout': 600,
  --                 \  'rev': 'f928f7dd975d26b608d5310a9139dc5fc310e4a9'
  --                 \ },
  --                 \ )
  --   else
  --     call dein#add('Valloric/YouCompleteMe',
  --                 \ {'build': 'python install.py --clang-completer --gocode-completer',
  --                 \  'timeout': 600
  --                 \ },
  --                 \ )
  --   endif
  -- endif

  -- Generation of .ycm_extra_conf.py
  -- 'rdnetto/YCM-Generator',

  -- Configure YouCompleteMe thanks to cmake compile information.
  -- 'kgreenek/vim-ros-ycm',

  -- Help complete parameters of functions (requires YouCompleteMe).
  -- 'tenfyzhong/CompleteParameter.vim',

  -- call dein#add('whiledoing/cmakecomplete',
  --             \ {'on_ft': 'cmake'},
  --             \ )

  -- Alternative to YouCompleteMe based on the Language Server Protocol.
  -- Provides refactor with LanguageClient#textDocument_rename().
  -- First activate with `:LanguageClientStart`.
  -- call dein#add('autozimu/LanguageClient-neovim', {
  --       \ 'rev': 'next',
  --       \  'build': 'bash install.sh',
  --       \ })

  -- Replacement for netrw and The-NERD-tree.
  -- 'vim-scripts/The-NERD-tree',

  -- Integrate ranger in vim.
  -- Replace with chadtree in the future?
  -- Replaced with rnvimr.
  -- ranger.vim has the issue that the directory is incorrect on the second
  -- invocation.
  -- {'francoiscabrol/ranger.vim',
  --   dependencies = {'rbgrouleff/bclose.vim'},
  -- },

  -- C/C++ debugger for Neovim, based on LLDB.
  -- 'critiqjo/lldb.nvim',

  -- Alternative to Unite.
  -- Then `:Clap install-binary`.
  -- {'liuchengxu/vim-clap',
  --   build = ':Clap install-binary',
  --   dependencies = {'liuchengxu/vista.vim'},
  -- },

  -- Fuzzy finder
  -- Replaced by Telescope.
  -- {'junegunn/fzf',
  --   build = function() vim.fn['fzf#install']() end,
  -- },

  -- Syntax checking.
  -- Replaced by nvim-treesitter.
  -- 'vim-scripts/syntastic',

})

