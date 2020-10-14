" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" To uninstall a plugin:
" - Remove call dein#add() in this file
" - :call map(dein#check_clean(), "delete(v:val, 'rf')")
" - :call dein#recache_runtimepath()

if dein#load_state('~/.cache/dein')
  call dein#begin(expand('~/.cache/dein'))

  " Let dein manage dein (required)
  call dein#add('~/.cache/dein')

  let g:dein#enable_notification=1

  """"""""""""""""""""""
  " Personal must have "
  """"""""""""""""""""""

  " git integration.
  call dein#add('tpope/vim-fugitive')

  " Interactive git log viewer.
  call dein#add('kablamo/vim-git-log')

  " Snippets.
  call dein#add('SirVer/ultisnips')

  " Default snippets for UltiSnips
  call dein#add('honza/vim-snippets')

  " Python-mode
  call dein#add('klen/python-mode',
              \ {'on_ft': 'python'}
              \ )

  " Basic support for .env files, ':Dotenv {file}'.
  call dein#add('tpope/vim-dotenv',
              \ {'on_ft': 'python'}
              \ )

  call dein#add('vim-scripts/The-NERD-tree')

  " Show a tip on vim startup.
  call dein#add('hobbestigrou/vimtips-fortune')

  call dein#add('whiledoing/cmakecomplete',
              \ {'on_ft': 'cmake'}
              \ )

  " Editing ROS source files.
  call dein#add('taketwo/vim-ros')

  call dein#add('othree/xml.vim',
              \ )

  call dein#add('ivanov/vim-ipython',
              \ {'on_ft': 'python'}
              \ )

  call dein#add('broesler/jupyter-vim',
              \ {'on_ft': 'python'}
              \ )


  " Manage parentheses and similar.
  call dein#add('tpope/vim-surround')

  " Pairs of handy bracket mappings.
  call dein#add('tpope/vim-unimpaired')

  " Automatic indent detection.
  call dein#add('tpope/vim-sleuth')

  " Block commenting.
  call dein#add('tpope/vim-commentary')

  " Repeat also for complex mapping (for example surround).
  call dein#add('tpope/vim-repeat')

  " vim-abolish provides:
  " - ':Subvert': replace a word with another while respecting case and plural.
  " - Change between variable conventions (dash-case, MixedCase, camelCase, ...).
  "   Mapped to 'cr_', 'cr-', 'crm', 'crc', 'cr.',
  call dein#add('tpope/vim-abolish')

  " Argumentative aids with manipulating and moving between function
  " arguments.
  " Shifting arguments with `<,` and `>,`.
  call dein#add('PeterRincker/vim-argumentative')

  " Set the `path` variable for more efficient jump to file (gf).
  call dein#add('tpope/vim-apathy')

  " TeX support, work better than atp with NeoVim.
  call dein#add('lervag/vimtex')

  " Editor agnostic configuration.
  call dein#add('editorconfig/editorconfig-vim')

  if has('nvim')
    " Use airline as alternative to unsupported powerline.
    call dein#add('vim-airline/vim-airline')
  else
    " Powerline is installed with pip on Ubuntu, so don't install it here.
    "call dein#add('Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'})
  endif

  " A code-completion engine.
  " On Ubuntu 14.04, it's also offered system-wide and activated with
  " 'vim-addons install youcompleteme'.
  " Lock to revision 'f928f7dd975d26b608d5310a9139dc5fc310e4a9' because newer
  " commits require vim 7.4.143+, not available on Ubuntu 14.04.
  if has('nvim')
    call dein#add('Valloric/YouCompleteMe',
                \ {'build': 'python3 install.py --clang-completer',
                \  'timeout': 600
                \ }
                \ )
                " '--gocode-completer' requires go >= 1.11, so deactivated on
                " Ubuntu 18.04 which has 1.10.
  else
    if (v:version < 800)
      call dein#add('Valloric/YouCompleteMe',
                  \ {'build': 'python install.py --clang-completer --gocode-completer',
                  \  'timeout': 600,
                  \  'rev': 'f928f7dd975d26b608d5310a9139dc5fc310e4a9'
                  \ }
                  \ )
    else
      call dein#add('Valloric/YouCompleteMe',
                  \ {'build': 'python install.py --clang-completer --gocode-completer',
                  \  'timeout': 600
                  \ }
                  \ )
    endif
  endif

  " Configure YouCompleteMe thanks to cmake compile information.
  call dein#add('kgreenek/vim-ros-ycm')

  " Help complete parameters of functions (requires YouCompleteMe).
  call dein#add('tenfyzhong/CompleteParameter.vim')

  " Debugging in vim.
  call dein#add('puremourning/vimspector')
  " Then install gadgets with
  " './install_gadget.py --enable-python --enable-c --enable-bash --enable-go'.
  " An extra step is required to use 'gadgets' for vimspector (installed via
  " 'install_gadget.py'):
  " 'ln -s \
  "     ~/.cache/dein/repos/github.com/puremourning/vimspector/gadgets \
  "     ~/.cache/dein/.cache/init.vim/.dein/gadgets'.

  " Alternative to YouCompleteMe based on the Language Server Protocol.
  " Provides refactor with LanguageClient#textDocument_rename().
  " First activate with `:LanguageClientStart`.
  call dein#add('autozimu/LanguageClient-neovim', {
        \ 'rev': 'next',
        \  'build': 'bash install.sh',
        \ })

  " C/C++ debugger for Neovim, based on LLDB.
  call dein#add('critiqjo/lldb.nvim')

  " Browse files, buffers, lines ... (:Unite).
  call dein#add('Shougo/unite.vim')

  " Unite plugin using locate
  call dein#add('vim-scripts/unite-locate')

  " Most-recently-used support for Unite (:Unite file_mru)
  call dein#add('Shougo/neomru.vim')

  " Tag source for Unite
  call dein#add('tsukkee/unite-tag')

  " Interactive command execution (for :Unite file_rec/async)
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  " A class outline viewer, requires ctags.
  call dein#add('majutsushi/tagbar')

  " Regenerate tag files on the go.
  call dein#add('ludovicchabant/vim-gutentags')

  " extended % matching for HTML, LaTeX, and many other languages
  call dein#add('tmhedberg/matchit')

  " Lego Mindstorms (nxc) syntax.
  call dein#add('vim-scripts/nxc.vim')

  " SIP syntax (Python binding for C++).
  call dein#add('vim-scripts/sip.vim')

  " Syntax checking.
  call dein#add('vim-scripts/syntastic')

  " ABB Rapid support.
  call dein#add('KnoP-01/rapid-for-vim')

  " Support for csv files
  call dein#add('chrisbra/csv.vim')

  " Highlight yanked text briefly
  call dein#add('machakann/vim-highlightedyank')

  " Syntax highlighting for i3 config.
  call dein#add('mboughaba/i3config.vim')

  " Integration of cheatsheets from https://cht.sh/.
  " <leader>KK: show in pager.
  " <leader>KB: show in buffer.
  " <leader>Kp, <leader>KP, <leader>KR: paste
  " <leader>KE: query the error
  " <leader>KC: toggle comments (switch comments off)
  call dein#add('dbeniamine/cheat.sh-vim')

  " Switch between header and source file.
  " Alternatively: https://github.com/LucHermitte/alternate-lite
  call dein#add('derekwyatt/vim-fswitch')

  """""""""""""""""
  " Local plugins "
  """""""""""""""""

  execute "call dein#local('".config_dir."/bundle/local/castem')"
  execute "call dein#local('".config_dir."/bundle/local/mbdyn')"
  execute "call dein#local('".config_dir."/bundle/local/orocos')"

  """"""""""""""""""""""""""""""""
  " Not often used but practical "
  """"""""""""""""""""""""""""""""

  " Undo management (:GundoToggle).
  call dein#add('sjl/gundo.vim')

  " Syntax highlighting support for Pweave files, scientific report with
  " LaTeX and Python.
  call dein#add('naught101/vim-pweave')

  " JSON bindings.
  " aj provides a text object for the outermost JSON object, array, string, number, or keyword.
  " gqaj pretty prints (wraps/indents/sorts keys/otherwise cleans up) the JSON construct under the cursor.
  " gwaj takes the JSON object on the clipboard and extends it into the JSON object under the cursor.
  call dein#add('tpope/vim-jdaddy')

  " Generation of .ycm_extra_conf.py
  call dein#add('rdnetto/YCM-Generator')

  " Rust support.
  call dein#add('rust-lang/rust.vim')
  call dein#add('racer-rust/vim-racer')

  " Treat new lines from pasted text differently than typed ones.
  " Allow to indent already indented text.
  call dein#add('ConradIrwin/vim-bracketed-paste')

  """"""""""""""""""
  " In testing phase
  """"""""""""""""""
  " Open Jupyter notebooks (*.ipynb) thanks to the external jupytext
  " executable.
  call dein#add('goerz/jupytext.vim')

  " Integrate ranger in vim.
  call dein#add('francoiscabrol/ranger.vim')
  " Dependency of vim-ranger.
  if has('nvim')
    call dein#add('rbgrouleff/bclose.vim')
  endif

  " Show diffs in git repositories.
  " Enable with :GitGutterEnable.
  call dein#add('airblade/vim-gitgutter')

  " Manage tabs.
  " Enter vim-tabmode with <leader><Tab> or :TabmodeEnter.
  call dein#add('Iron-E/nvim-tabmode')
  " Dependency of vim-tabmode.
  call dein#add('Iron-E/nvim-libmodal')

  " Set some variables for project scope.
  " Drop a '_vimrc_local.vim' file into any project root directory to use.
  " Also takes .editorconfig into account.
  call dein#add('LucHermitte/local_vimrc')

  " Show cursors jumps.
  if has('nvim')
    call dein#add('danilamihailov/beacon.nvim')
  endif

  " Align things over several rows.
  " Mapped to ga in visual mode (e.g. ga= to align on first equal sign).
  call dein#add('junegunn/vim-easy-align')

  " Visualize indent.
  " Enable with `:IndentGuidesEnable`.
  call dein#add('nathanaelkane/vim-indent-guides')

  " Various helper for C++.
  " <C-X>i: add #include for symbol under cursor.
  " <M-i>: add #include for symbol under cursor and add scope.
  call dein#add('LucHermitte/lh-cpp')

  " Dependencies for lh-cpp!
  call dein#add('LucHermitte/lh-vim-lib') " Dependency of mu-template.
  call dein#add('LucHermitte/lh-style') " Dependency of mu-template.
  call dein#add('LucHermitte/lh-tags')
  call dein#add('LucHermitte/lh-dev') " Dependency of mu-template.
  call dein#add('LucHermitte/lh-brackets') " Dependency of mu-template.
  call dein#add('LucHermitte/searchInRuntime')
  call dein#add('LucHermitte/mu-template')
  call dein#add('tomtom/stakeholders_vim')
  " call dein#add('LucHermitte/alternate-lite')

  " Set some variables for project scope.
  " Drop a '_vimrc_local.vim' file into any project root directory to use.
  call dein#add('LucHermitte/local_vimrc')
  " Edit tables the spreadsheet way in Markdown.
  " Requires -- a patched version of -- sc-im.
  " As of 2020-10-14, requires the branch markdown-import of https://github.com/mipmip/sc-im.
  call dein#add('mipmip/vim-scimark')

  """""""""""""""""""""""""""""""""""""""""""
  " Why not but short startup time prefered "
  """""""""""""""""""""""""""""""""""""""""""

  "call dein#add('tmhedberg/SimpylFold')
  "call dein#add('vim-scripts/taglist.vim')
  "call dein#add('trotter/autojump.vim')

  "call dein#add('vim-scripts/project.tar.gz')

  " Show a VCS diff using Vim's sign column
  "call dein#add('mhinz/vim-signify')

  " Experimental minimap
  "call dein#add('severin-lemaignan/vim-minimap')

  """""""""""""""""""""""""""""""""""""""""""""
  " Functionalities provided by other plugins "
  """""""""""""""""""""""""""""""""""""""""""""

  " minimal commenting plugin.
  "call dein#add('vim-scripts/vim-addon-commenting')

  " Most recently used (:MRU)
  " Deactivated in favor of Unite.
  "call dein#add('vim-scripts/mru.vim')

  " Python completion (included in YouCompleteMe)
  "call dein#add('davidhalter/jedi-vim.git')

  " snipMate is incompatible with YouCompleteMe
  " UltiSnips is used instead of snipMate because of compatibility with YCM
  "call dein#add('msanders/snipmate.vim')

  " Fast file navigation.
  " Deactivated in favor of Unite (:Unite file).
  "call dein#add('wincent/command-t')

  " quickly and easily switch between buffers.
  " Deactivated in favor of Unite (:Unite buffer).
  "call dein#add('c9s/bufexplorer')

  " buffer/file/command/tag/etc explorer with fuzzy matching
  " Deactivated in favor of Unite.
  "call dein#add('vim-scripts/FuzzyFinder')

  """"""""""""""""""""""""""""""""""
  " Useless or problematic plugins "
  """"""""""""""""""""""""""""""""""

  " provides some utility functions and commands for programming in Vim.
  " Only a dependency.
  "call dein#add('vim-scripts/L9')

  " Project Management.
  " Deactivated because not used and problem with end of lines.
  "call dein#add('vim-scripts/ProjectBrowse', {rev: 'unix-eol'})

  " cmake.vim changes makeprg in a way that is incompatible with vim-ros
  "call dein#add('jalcine/cmake.vim')

  " delimitMate was not really satisfying (didn't insert <CR> after '{',
  " broke '.' for repeat last insert
  " https://github.com/Raimondi/delimitMate/issues/138)
  "call dein#add('Raimondi/delimitMate')

  " Syntax and occurences highlighting
  " requires Vim 7.4p330+
  "call dein#add('bbchung/clighter.git')

  " Automatic bracket insertion.
  " Two dependencies of lh-brackets
  " Not ideal because doesn't support redo, as of 2015-10.
  "call dein#add('LucHermitte/lh-vim-lib')
  "call dein#add('LucHermitte/lh-dev')
  "call dein#add('LucHermitte/lh-brackets')

  """""""""""""""
  " Interesting "
  """""""""""""""
  " More user-friendly registers.
  " https://github.com/svermeulen/vim-easyclip

  " A solid language pack for Vim.
  " https://github.com/sheerun/vim-polyglot

  " Better? vim-surround: https://github.com/machakann/vim-sandwich.

  call dein#end()
  call dein#save_state()

endif  " if dein#load_state('~/.cache/dein')

