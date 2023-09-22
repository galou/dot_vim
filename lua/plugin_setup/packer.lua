local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()

  -- Packer manages Packer.
  use 'wbthomason/packer.nvim'

  ------------------------
  -- Personal must-have --
  ------------------------

  -- git integration.
  use 'tpope/vim-fugitive'

  -- Interactive git log viewer.
  -- Provides :GitLog.
  use {'kablamo/vim-git-log',
    requires = {'tpope/vim-fugitive'}
  }

  -- Snippets.
  use 'L3MON4D3/LuaSnip'
  -- Some common snippets.
  use 'rafamadriz/friendly-snippets'

  -- use 'SirVer/ultisnips'

  -- Default snippets for UltiSnips
  use 'honza/vim-snippets'

  -- Basic support for .env files, ':Dotenv {file}'.
  use {'tpope/vim-dotenv',
    ft = {'python'}
  }

  -- Show a tip on vim startup.
  use 'hobbestigrou/vimtips-fortune'

  -- Editing ROS source files.
  -- use 'taketwo/vim-ros'

  use {'othree/xml.vim',
    ft = {'xml'}
  }

  use {'ivanov/vim-ipython',
    ft = {'python'}
  }

  use {'jupyter-vim/jupyter-vim',
    ft = {'python'}
  }

  -- Pairs of handy bracket mappings.
  use 'tpope/vim-unimpaired'

  -- Automatic indent detection.
  use 'tpope/vim-sleuth'

  -- Block commenting.
  -- Supports line comment (gc{move}) or block comment (gb{move}).
  use {'numToStr/Comment.nvim',
    config = function() require('plugin_setup.comment') end,
  }

  -- Repeat ('.') also for complex mapping.
  use 'tpope/vim-repeat'

  -- vim-abolish provides:
  -- - ':Subvert': replace a word with another while respecting case and plural.
  -- - Change between variable conventions (dash-case, MixedCase, camelCase, ...).
  --   Mapped to 'cr_', 'cr-', 'crm', 'crc', 'cr.',
  use 'tpope/vim-abolish'

  -- Argumentative aids with manipulating and moving between function
  -- arguments.
  -- Shifting arguments with `<,` and `>,`.
  use 'PeterRincker/vim-argumentative'

  -- Set the `path` variable for more efficient jump to file (gf).
  use 'tpope/vim-apathy'

  -- TeX support, work better than atp with NeoVim.
  use 'lervag/vimtex'

  -- Editor agnostic configuration.
  use 'editorconfig/editorconfig-vim'

  -- Use airline as alternative to unsupported powerline.
  use 'vim-airline/vim-airline'

  -- Debugging in vim.
  use {'puremourning/vimspector',
    -- run = './install_gadget.py --enable-python --enable-c --enable-bash --enable-go',
    run = ':VimspectorInstall python c bash go'  -- post-install/update hook.
  }

  -- Debugging in vim with the Debug Adapter Protocol.
  -- :lua require('dap').continue() to launch.
  use {'mfussenegger/nvim-dap',
    -- config = function() require('plugin_setup/nvim-dap') end,
  }

  -- Extensions for nvim-dap.
  use {'mfussenegger/nvim-dap-python',
    requires = {'mfussenegger/nvim-dap'},
    config = function() require('dap-python').setup('python') end,
  }

  -- UI extension for 'nvim-dap'
  use {'rcarriga/nvim-dap-ui',
    requires = {'mfussenegger/nvim-dap'},
  }

  -- Browse files, buffers, lines ...
  -- Replacement for the deprecated 'Shougo/unite.vim'.
  use {'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('plugin_setup.telescope') end,
  }
  -- Frequent/recent files for Telescope.
  use {'nvim-telescope/telescope-frecency.nvim',
    requires = {
      {'kkharji/sqlite.lua'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = function() require('telescope').load_extension('frecency') end, -- plugin setup at vim startup.
  }
  -- Project-based file search for Telescope.
  use {'nvim-telescope/telescope-project.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('project') end,
  }
  -- Tab switching for Telescope.
  use {'TC72/telescope-tele-tabby.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('tele_tabby') end,
  }
  -- find_files in a specific ROS package for Telescope.
  use {'bi0ha2ard/telescope-ros.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('ros') end,
  }
  -- Register LSP handlers for Telescope.
  use {'gbrlsnchs/telescope-lsp-handlers.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('lsp_handlers') end,
  }
  -- Switch between heading in Telescope.
  use {'crispgm/telescope-heading.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('heading') end,
  }
  -- Ctags outline for Telescope.
  use {'fcying/telescope-ctags-outline.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    config = function() require('telescope').load_extension('ctags_outline') end,
  }
  -- Vimspector integration in Telescope.
  use {'nvim-telescope/telescope-vimspector.nvim',
    requires = {{'nvim-telescope/telescope.nvim'}, {'puremourning/vimspector'}},
    config = function() require('telescope').load_extension('vimspector') end,
  }
  -- Tab switching for Telescope.
  use {'LukasPietzschmann/telescope-tabs',
	requires = {'nvim-telescope/telescope.nvim'},
	config = function() require'telescope-tabs'.setup({}) end,
}

  -- Provide autocompletion (i.e. no need to `<C-x><C-o>`.
  -- Alternatives: https://github.com/ms-jpq/coq_nvim.
  -- Deprecates hrsh7th/compe.
  use {'hrsh7th/nvim-cmp',
    requires = {
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
      require('plugin_setup.nvim-cmp')
      require('plugin_setup.luasnip')
    end,
  }

  -- A class outline viewer, requires ctags.
  use 'majutsushi/tagbar'

  -- Regenerate tag files on the go.
  use 'ludovicchabant/vim-gutentags'

  -- extended % matching for HTML, LaTeX, and many other languages
  use 'tmhedberg/matchit'

  -- Lego Mindstorms (nxc) syntax.
  use 'vim-scripts/nxc.vim'

  -- SIP syntax (Python binding for C++).
  use 'vim-scripts/sip.vim'

  -- ABB Rapid support.
  use 'KnoP-01/rapid-for-vim'

  -- Support for csv files
  use 'chrisbra/csv.vim'

  -- Highlight yanked text briefly
  -- Can also be done via autocmd
  -- (https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42)
  -- but not nice with hl_IncSearch.
  use 'machakann/vim-highlightedyank'

  -- Syntax highlighting for i3 config.
  use 'mboughaba/i3config.vim'

  -- Integration of cheatsheets from https://cht.sh/.
  -- <leader>KK: show in pager.
  -- <leader>KB: show in buffer.
  -- <leader>Kp, <leader>KP, <leader>KR: paste
  -- <leader>KE: query the error
  -- <leader>KC: toggle comments (switch comments off)
  use 'dbeniamine/cheat.sh-vim'

  -- Switch between header and source file.
  -- Alternatively: https://github.com/LucHermitte/alternate-lite
  use 'derekwyatt/vim-fswitch'

  -- Collection of minimal, independent, and fast Lua modules.
  -- mini.align: text alignment, replacement of 'junegunn/vim-easy-align'.
  -- mini.completion: two-stage completion, used to show the signature.
  -- mini.cursorword: highlight word under cursor.
  -- mini.trailspace: Automatically highlight trailing whitespaces:
  -- mini.surround: Add surrounding brackets.
  --   `lua MiniTrailspace.trim()`.
  use {'echasnovski/mini.nvim',
    config = function() require('plugin_setup.mini') end,
  }

  -- Show cursors jumps.
  use 'danilamihailov/beacon.nvim'

  -- Interface to cycle through git diffs.
  -- :Diffview..
  use {'sindrets/diffview.nvim',
    requires = {
      'nvim-lua/plenary.nvim',  -- Utility functions.
      'kyazdani42/nvim-web-devicons',
    }
  }

  -- Jump to the last location when opening.
  -- Used to be as autocommand but the autocommand didn't open folds.
  use {'ethanholz/nvim-lastplace',
    config = function() require('plugin_setup.nvim-lastplace') end,
  }

  -- Per-project LSP configuration.
  -- `:LspSettings buffer`: Open the global settings file that
  --                        matches the current buffer.
  -- `:LspSettings local buffer`: Open the local settings file
  --                              of the server corresponding
  --                              to the current buffer.
  use {'tamago324/nlsp-settings.nvim',
    requires = {'neovim/nvim-lspconfig'},
    -- Optional: 'rcarriga/nvim-notify'
    config = function() require('plugin_setup.nlspsettings') end,
  }

  -- Provide some installation scripts for some LSP servers, DAP servers,
  -- linters, and formatters.
  -- Replacement for 'williamboman/nvim-lsp-installer'
  use {'williamboman/mason.nvim',
    config = function() require('mason').setup({}) end,
  }

  -- Companion to mason.nvim.
  -- Provides :LspInstall.
  use {'williamboman/mason-lspconfig.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
    },
    config = function() require('mason-lspconfig').setup({}) end,
  }

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
  use {'nvimdev/lspsaga.nvim',
    requires = {
        'nvim-treesitter/nvim-treesitter',  -- optional
        'nvim-tree/nvim-web-devicons', -- optional
    },
    after = 'nvim-lspconfig',
    config = function()
        require('lspsaga').setup({})
    end,
  }

  -- Provide some configurations for the built-in LSP client.
  use {'neovim/nvim-lspconfig',
    config = function() require('plugin_setup.nvim-lspconfig') end,  -- Must be after mason and mason-lspconfig.
  }

  -- Extra features for clangd LSP.
  -- Configuration in `clangd_extensions.lua`.
  -- :ClangdSymbolInfo
  -- :ClangdTypeHierarchy
  -- :ClangdSwitchHeader
  use {'https://git.sr.ht/~p00f/clangd_extensions.nvim',
    config = function() require('plugin_setup.clangd_extensions') end,
    commit = '798e377ec859087132b81d2f347b5080580bd6b1', -- Bug in 6d0bf368 (2023-05-23) with virtual text.
  }


  -- Code refactoring.
  -- :'<,'>Refactor {extract_block_to_file, extract, extract_block, extract_var, extract_to_file}.
  -- Extract function or variable from last visual selection.
  use {'ThePrimeagen/refactoring.nvim',
    requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-treesitter/nvim-treesitter'}
    },
}

  -- Github's Copilot.
  -- Instead of the official copilot plugin (use {'github/copilot.vim'}).
  use {'zbirenbaum/copilot.lua',
    cmd = 'Copilot',  -- Lazy-load with :Copilot.
    event = 'InsertEnter',  -- Lazy-load on InsertEnter.
    config = function() require('plugin_setup.copilot') end,
  }

  -- Integration of zbirenbaum/copilot with cmp.
  use {'zbirenbaum/copilot-cmp',
    after = {'copilot.lua'},
    config = function ()
      require('copilot_cmp').setup()
    end
  }

  use {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugin_setup.nvim-treesitter') end,
  }

  -- Debug TreeSitter.
  -- Offers :TSHighlightCapturesUnderCursor.
  -- :TSPlaygroundToggle, show TS tree.
  use {'nvim-treesitter/playground',
    requires = {'nvim-treesitter/nvim-treesitter'},
  }

  -- Always show the function prototype.
  -- :TSContextToggle.
  use {'nvim-treesitter/nvim-treesitter-context',
    requires = {'nvim-treesitter/nvim-treesitter'},
    config = function() require('plugin_setup.nvim-treesitter-context') end,
  }

  -- Jump or move elements according to their function
  -- E.g. move arguments in a function prototype, elements in a list.
  -- <A-j>, <A-k>: visual select something and swap it with an element of the same level.
  -- HJKL: in visual mode select according to node levels.
  -- vx, vn: in normal mode, enter visual mode and select master or current node, resp.
  -- vU, vD: in normal mode, swap master nodes (vu, vd for current nodes).
  -- gfu + f or j: in normal mode, jump to the previous, next function declaration.
  -- <A-n>, <A-p>: in normal mode, repeat the last jump.
  use {'ziontee113/syntax-tree-surfer',
    requires = {'nvim-treesitter/nvim-treesitter'},
  }

  -- Toggle between one-liner and "open" code.
  -- :TSJToggle, :TSJSplit, :TSJJoin.
  use {'Wansmer/treesj',
    requires = {'nvim-treesitter'},
    config = function() require('plugin_setup.treesj') end,
  }

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
  use {'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function() require('plugin_setup.nvim_bqf') end,
  }

  -- Diff on part of files.
  -- Visual selection + :'<,'>Linediff twice on non-overlapping parts.
  use 'AndrewRadev/linediff.vim'

  -- Run code chunks.
  -- :'<,'>SnipRun
  use {'michaelb/sniprun',
    run = 'bash install.sh'
  }

  -- Visualize indent.
  -- Enable with `:IndentGuidesEnable`.
  use 'nathanaelkane/vim-indent-guides'

  -- Manage a terminal buffer easierly.
  -- Bound to '<leader>tt'
  -- Alternatively, cf. https://github.com/caenrique/nvim-toggle-terminal.
  use 'itmecho/bufterm.nvim'

  -- Search for different pattern in different buffers.
  -- Activate with "<leader>/"
  use 'mox-mox/vim-localsearch'

  -- More `increment` commands (<C-a>, <C-x>).
  -- Alternatively: RutaTang/compter.nvim.
  use {'monaqa/dial.nvim',
    config = function() require('plugin_setup.dial') end,
  }

  -- Notifications as pop-up rather than :messages.
  -- `:lua vim.notify = require('notify')` to activate.
  use {'rcarriga/nvim-notify'}

  -- Completely replace the UI for messages, cmdline and the popupmenu.
  -- use {'folke/noice.nvim',
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     'MunifTanjim/nui.nvim',
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     'rcarriga/nvim-notify',
  --     {'nvim-treesitter', opt = true},
  --   }
  -- }

  -- Displays interactive vertical scrollbars and signs.
  use {'dstein64/nvim-scrollview',
    config = function() require('plugin_setup.nvim-scrollview') end,
  }

  -- Code outline window.
  -- :AerialToggle
  -- :AerialToggle! to stay in the same window.
  -- The configuration doesn't work yet, `:lua require('aerial').setup({})`
  -- needs to be called manully.
  use {'stevearc/aerial.nvim',
    config = function() require('aerial').setup({}) end,
    cmd = {'AerialToggle', 'AerialNavToggle', 'Aerial*'},
  }

  ------------------
  -- Color themes --
  ------------------

  -- use 'folke/tokyonight.nvim'

  -------------------
  -- Local plugins --
  -------------------

  use {fn.stdpath('config')..'/bundle/local/castem'}
  use {fn.stdpath('config')..'/bundle/local/mbdyn'}
  use {fn.stdpath('config')..'/bundle/local/orocos'}

  ----------------------------------
  -- Not often used but practical --
  ----------------------------------

  -- Undo management (:GundoToggle).
  use 'sjl/gundo.vim'

  -- Syntax highlighting support for Pweave files, scientific report with
  -- LaTeX and Python.
  use 'naught101/vim-pweave'

  -- JSON bindings.
  -- aj provides a text object for the outermost JSON object, array, string, number, or keyword.
  -- gqaj pretty prints (wraps/indents/sorts keys/otherwise cleans up) the JSON construct under the cursor.
  -- gwaj takes the JSON object on the clipboard and extends it into the JSON object under the cursor.
  use 'tpope/vim-jdaddy'

  -- Rust support.
  use 'rust-lang/rust.vim'
  use 'racer-rust/vim-racer'

  -- Treat new lines from pasted text differently than typed ones.
  -- Allow to indent already indented text.
  use 'ConradIrwin/vim-bracketed-paste'

  -- Additional 'icons'.
  use 'ryanoasis/vim-devicons'

  -- Open Jupyter notebooks (*.ipynb) thanks to the external jupytext
  -- executable.
  use 'goerz/jupytext.vim'

  -- Show diffs in git repositories.
  -- Enable with :GitGutterEnable.
  use 'airblade/vim-gitgutter'

  -- Manage tabs.
  -- Enter vim-tabmode with <leader><Tab> or :TabmodeEnter.
  -- Can be replaced by barbar.nvim.
  use {'Iron-E/nvim-tabmode',
    requires = {{'Iron-E/nvim-libmodal'}}
  }

  -- Set some variables for project scope.
  -- Drop a '_vimrc_local.vim' file into any project root directory to use.
  -- Also takes .editorconfig into account.
  -- use 'LucHermitte/local_vimrc'

  -- User ranger as file browser.
  -- The difference with francoiscabrol/ranger.vim is the rnvimr is a floating
  -- window.
  -- Inside ranger:
  -- - <C-t>: tabedit,
  -- - <C-x>: split,
  -- - <C-v>: vsplit,
  use {'kevinhwang91/rnvimr',
    branch = 'lua'
  }

  -- Create intelligent implementations for C++.
  -- Provides:
  -- - TSCppMakeConcreteClass: create a concrete class implementing all the
  --     pure virtual functions.
  -- - TSCppRuleOf3: adds the missing function declarations to the class to
  --     obey the Rule of 3.
  -- - TSCppRuleOf5: adds the missing function declarations to the class to
  --     obey the Rule of 5.
  use {'Badhi/nvim-treesitter-cpp-tools',
    requires = 'nvim-treesitter/nvim-treesitter',
    ft = {'cpp'}
  }

  -- Standalone UI for nvim-lsp progress.
  use {'j-hui/fidget.nvim',
    branch = 'legacy',  -- Fixed on 2023-06-19 before announced breaking changes.
    config = function() require('fidget').setup{} end,
  }

  ----------------------
  -- In testing phase --
  ----------------------

  -- Various helper for C++.
  -- <C-X>i: add #include for symbol under cursor.
  -- <M-i>: add #include for symbol under cursor and add scope.
  -- use {'LucHermitte/lh-cpp',
  --   requires = {
  --     {'LucHermitte/lh-vim-lib'},
  --     {'LucHermitte/lh-style'},
  --     {'LucHermitte/lh-tags'},
  --     {'LucHermitte/lh-dev'},
  --     {'LucHermitte/lh-brackets'},
  --     {'LucHermitte/searchInRuntime'},
  --     {'LucHermitte/mu-template'},
  --     {'tomtom/stakeholders_vim'},
  --     {'LucHermitte/alternate-lite'}
  --   }
  -- }

  -- Edit tables the spreadsheet way in Markdown.
  -- Requires sc-im (https://github.com/andmarti1424/sc-im.git).
  -- Provides :OpenInScim.
  use {'mipmip/vim-scimark',
    config = function() require('plugin_setup.scimark') end,
  }

  -- Use Wandbox (https://wandbox.org/) in vim.
  -- :Wandbox
  use 'rhysd/wandbox-vim'

  -- Asynchronous Lint Engine: asynchronous linting.
  use 'dense-analysis/ale'

  -- Fade inactive buffers.
  use 'TaDaa/vimade'

  -- Minimap.
  use {'wfxr/minimap.vim',
    run = 'cargo install --locked code-minimap'
  }
  -- Replacement for :make.
  use 'neomake/neomake'

  -- Easily configure neomake to recognize your PlatformIO project's include
  -- path.
  use 'coddingtonbear/neomake-platformio'

  -- Show hunks and add them to the index.
  -- `:Gitsigns toggle_signs` then `<leader>hs`.
  -- Has more features then gitgutter but gitgutter better handles folds, as of
  -- 2022-09-01.
  use {'lewis6991/gitsigns.nvim',
    config = function() require('plugin_setup.gitsigns') end,
  }

  -- File browser
  -- :Neotree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "MunifTanjim/nui.nvim",  -- UI Component Library.
      "kyazdani42/nvim-web-devicons",  -- not strictly required, but recommended
      "nvim-lua/plenary.nvim",  -- Utility functions.
    }
  }

  -- Sets filetype for dotfiles in chezmoi source path.
  use {'alker0/chezmoi.vim'}

  -- Runs `chezmoi apply` on save.
  -- Doesn't work since chezmoi creates a temporary file to edit (2022-09).
  use {'Lilja/vim-chezmoi'}

  ---------------------------------------------
  -- Why not but short startup time prefered --
  ---------------------------------------------

  -- use 'tmhedberg/SimpylFold'
  -- use 'vim-scripts/taglist.vim'
  -- use 'trotter/autojump.vim'

  -- use 'vim-scripts/project.tar.gz'

  -- Show a VCS diff using Vim's sign column
  -- use 'mhinz/vim-signify'

  -- Experimental minimap
  -- use 'severin-lemaignan/vim-minimap'

  -----------------------------------------------
  -- Functionalities provided by other plugins --
  -----------------------------------------------

  -- minimal commenting plugin.
  -- use 'vim-scripts/vim-addon-commenting'

  -- Most recently used (:MRU)
  -- Deactivated in favor of Unite.
  -- use 'vim-scripts/mru.vim'

  -- Python completion (included in YouCompleteMe)
  -- use 'davidhalter/jedi-vim.git'

  -- snipMate is incompatible with YouCompleteMe
  -- UltiSnips is used instead of snipMate because of compatibility with YCM
  -- use 'msanders/snipmate.vim'

  -- Fast file navigation.
  -- Deactivated in favor of Unite (:Unite file).
  -- use 'wincent/command-t'

  -- quickly and easily switch between buffers.
  -- Deactivated in favor of Unite (:Unite buffer).
  -- use 'c9s/bufexplorer'

  -- buffer/file/command/tag/etc explorer with fuzzy matching
  -- Deactivated in favor of Unite.
  -- use 'vim-scripts/FuzzyFinder'

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
  --               \ }
  --               \ )
  --               " '--gocode-completer' requires go >= 1.11, so deactivated on
  --               " Ubuntu 18.04 which has 1.10.
  -- else
  --   if (v:version < 800)
  --     call dein#add('Valloric/YouCompleteMe',
  --                 \ {'build': 'python install.py --clang-completer --gocode-completer',
  --                 \  'timeout': 600,
  --                 \  'rev': 'f928f7dd975d26b608d5310a9139dc5fc310e4a9'
  --                 \ }
  --                 \ )
  --   else
  --     call dein#add('Valloric/YouCompleteMe',
  --                 \ {'build': 'python install.py --clang-completer --gocode-completer',
  --                 \  'timeout': 600
  --                 \ }
  --                 \ )
  --   endif
  -- endif

  -- Generation of .ycm_extra_conf.py
  -- use 'rdnetto/YCM-Generator'

  -- Configure YouCompleteMe thanks to cmake compile information.
  -- use 'kgreenek/vim-ros-ycm'

  -- Help complete parameters of functions (requires YouCompleteMe).
  -- use 'tenfyzhong/CompleteParameter.vim'

  -- call dein#add('whiledoing/cmakecomplete',
  --             \ {'on_ft': 'cmake'}
  --             \ )

  -- Alternative to YouCompleteMe based on the Language Server Protocol.
  -- Provides refactor with LanguageClient#textDocument_rename().
  -- First activate with `:LanguageClientStart`.
  -- call dein#add('autozimu/LanguageClient-neovim', {
  --       \ 'rev': 'next',
  --       \  'build': 'bash install.sh',
  --       \ })

  -- Replacement for netrw and The-NERD-tree.
  -- use 'vim-scripts/The-NERD-tree'

  -- Integrate ranger in vim.
  -- Replace with chadtree in the future?
  -- Replaced with rnvimr.
  -- ranger.vim has the issue that the directory is incorrect on the second
  -- invocation.
  -- use {'francoiscabrol/ranger.vim',
  --   requires = {'rbgrouleff/bclose.vim'}
  -- }

  -- C/C++ debugger for Neovim, based on LLDB.
  -- use 'critiqjo/lldb.nvim'

  -- Alternative to Unite.
  -- Then `:Clap install-binary`.
  -- use {'liuchengxu/vim-clap',
  --   run = ':Clap install-binary',
  --   requires = {'liuchengxu/vista.vim'}
  -- }

  -- Fuzzy finder
  -- Replaced by Telescope.
  -- use {'junegunn/fzf',
  --   run = function() vim.fn['fzf#install']() end,
  -- }

  -- Syntax checking.
  -- Replaced by nvim-treesitter.
  -- use 'vim-scripts/syntastic'

  ------------------------------------
  -- Useless or problematic plugins --
  ------------------------------------

  -- Project Management.
  -- Deactivated because not used and problem with end of lines.
  --call dein#add('vim-scripts/ProjectBrowse', {'rev': 'unix-eol'})

  -- cmake.vim changes makeprg in a way that is incompatible with vim-ros
  -- use 'jalcine/cmake.vim'

  -- delimitMate was not really satisfying (didn't insert <CR> after '{',
  -- broke '.' for repeat last insert
  -- https://github.com/Raimondi/delimitMate/issues/138)
  -- use 'Raimondi/delimitMate'

  -- Syntax and occurences highlighting
  -- requires Vim 7.4p330+
  -- use 'bbchung/clighter.git'

  -- Nicer tab line with buffers and tabs.
  -- I would prefer not to show hidden buffers.
  -- There was also an issue with the current completer.
  -- use 'bagrat/vim-buffet'

  -- Nicer tabs.
  -- Messes with `gt` and doesn't play nicely with splits as of 2022-09-01.
  -- use {'romgrk/barbar.nvim',
  --   requires = {
  --     'kyazdani42/nvim-web-devicons',
  --   }
  -- }

  -- Auto-sessions.
  -- `nvim .` to avoid. `:RestoreSession` to force.
  -- `:SaveSession` to force save.
  -- Pollutes the directory where vim is launched with '~/.cache/nvim/sessions'.
  -- use 'rmagatti/auto-session'

  -- File browser
  -- Doesn't make the tree automatically jump to show the current directory.
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = {
  --     'kyazdani42/nvim-web-devicons', -- optional, for file icon
  --   },
  --   config = function() require'nvim-tree'.setup {} end
  -- }

  -----------------
  -- Interesting --
  -----------------

  -- More user-friendly registers.
  -- https://github.com/svermeulen/vim-easyclip

  -- A solid language pack for Vim.
  -- https://github.com/sheerun/vim-polyglot

  -- Project management (per-project sessions, ..):
  -- https://github.com/charludo/projectmgr.nvim

  ------------------
  -- Incompatible --
  ------------------

  -- Replacement for netrw and The-NERD-tree.
  -- Requires Python>=3.8.
  -- Even the legacy branch is compatible because it requires Python>=3.7.
  -- if has('nvim')
  --   call dein#add('ms-jpq/chadtree', {'rev': 'chad', 'build': 'python3 -m chadtree deps'})
  -- endif

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end
)
