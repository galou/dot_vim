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

  use {'broesler/jupyter-vim',
    ft = {'python'}
  }

  -- Manage parentheses and similar.
  use 'tpope/vim-surround'

  -- Pairs of handy bracket mappings.
  use 'tpope/vim-unimpaired'

  -- Automatic indent detection.
  use 'tpope/vim-sleuth'

  -- Block commenting.
  -- Supports line comment (gc{move}) or block comment (gb{move}).
  use 'numToStr/Comment.nvim'

  -- Repeat ('.') also for complex mapping (for example surround).
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

  -- Browse files, buffers, lines ...
  -- Replacement for the deprecated 'Shougo/unite.vim'.
  use {'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  }
  -- Frequent/recent files for Telescope.
  use {'nvim-telescope/telescope-frecency.nvim',
    requires = {{"tami5/sqlite.lua"}, {'nvim-telescope/telescope.nvim'}},
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
      -- {'quangnguyen30192/cmp-nvim-ultisnips'},
      {'saadparwaiz1/cmp_luasnip'},
      -- Additional functionnalities for cmp.
      {'lukas-reineke/cmp-under-comparator'}, -- Sort private members at the end.
    }
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
  -- mini.completion: two-stage completion, used to show the signature.
  -- mini.cursorword: highlight word under cursor.
  -- mini.trailspace: Automatically highlight trailing whitespaces:
  -- `lua MiniTrailspace.trim()`.
  use 'echasnovski/mini.nvim'

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
  use {'https://git.sr.ht/~jhn/remember.nvim',
    config = function() require('remember').setup {} end,
  }

  -- Provide some configurations for the built-in LSP client.
  use {'neovim/nvim-lspconfig',
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

  use {'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {'nvim-treesitter/playground',
    requires = {'nvim-treesitter/nvim-treesitter'},
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
    config = function() require('plugin_setup/nvim_bqf') end,
  }

  -- Diff on part of files.
  -- Visual selection + :'<,'>Linediff twice on non-overlapping parts.
  use 'AndrewRadev/linediff.vim'

  -- Run code chunks.
  -- :'<,'>SnipRun
  use {'michaelb/sniprun',
    run = 'bash install.sh'
  }

  -- Align things over several rows.
  -- Mapped to ga in visual mode (e.g. ga= to align on first equal sign).
  use 'junegunn/vim-easy-align'

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
    config = function() require'fidget'.setup{} end,
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
  use 'mipmip/vim-scimark'

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
  use {'lewis6991/gitsigns.nvim'}

  -- File browser
  -- :Neotree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "MunifTanjim/nui.nvim",  -- UI Component Library.
      "kyazdani42/nvim-web-devicons",  -- not strictly required, but recommended
      "nvim-lua/plenary.nvim",  -- Utility functions.
    }
  }

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

  -- Better? vim-surround: https://github.com/machakann/vim-sandwich.

  -- Alternative to vimspector.
  -- Debug Adapter Protocol client implementation.
  -- use 'mfussenegger/nvim-dap'

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
