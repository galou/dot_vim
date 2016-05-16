" dein activation
set runtimepath^=~/.vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/bundle'))
" Let dein manage dein (required)
call dein#add('Shougo/dein.vim')

" minimal commenting plugin.
"call dein#add('vim-scripts/vim-addon-commenting')

" git integration.
call dein#add('tpope/vim-fugitive')

" Undo management (:GundoToggle).
call dein#add('sjl/gundo.vim')

" Most recently used (:MRU)
"call dein#add('vim-scripts/mru.vim')

" Python-mode
call dein#add('klen/python-mode')

" Python completion (included in YouCompleteMe)
"call dein#add('davidhalter/jedi-vim.git')

call dein#add('vim-scripts/The-NERD-tree')

" snipMate is incompatible with YouCompleteMe
" NeoBundle 'msanders/snipmate.vim'
" UltiSnips is used instead of snipMate because of compatibility with YCM
call dein#add('vim-scripts/UltiSnips')

" Default snippets for UltiSnips
call dein#add('honza/vim-snippets')

"call dein#add('tmhedberg/SimpylFold')
"call dein#add('vim-scripts/taglist.vim')
"call dein#add('trotter/autojump.vim')

" Show a tip on vim startup.
call dein#add('hobbestigrou/vimtips-fortune')

call dein#add('othree/xml.vim')
"call dein#add('wincent/Command-T')
call dein#add('ivanov/vim-ipython')
"call dein#add('c9s/bufexplorer')
" buffer/file/command/tag/etc explorer with fuzzy matching
" Deactivated in favor of unite.
"call dein#add('vim-scripts/FuzzyFinder')
" provides some utility functions and commands for programming in Vim.
" Only a dependency.
"call dein#add('vim-scripts/L9')
"call dein#add('vim-scripts/project.tar.gz')

" Project Management.
" Deactivated because not used and problem with end of lines.
"call dein#add('vim-scripts/ProjectBrowse', {rev: 'unix-eol'}

call dein#add('taketwo/vim-ros')

" Syntax checking.
call dein#add('scrooloose/syntastic')

call dein#add('tpope/vim-surround')
call dein#add('whiledoing/cmakecomplete')

" Pairs of handy bracket mappings.
call dein#add('tpope/vim-unimpaired')

" Automatic indent detection.
call dein#add('tpope/vim-sleuth')

" Block commenting.
call dein#add('tpope/vim-commentary')

" Automatic LaTeX plugin.
" The original is http (i.e. not https) and not supported by dein.
" NeoBundle 'http://git.code.sf.net/p/atp-vim/code', {'name': 'atp-vim'}
call dein#add('coot/atp_vim')

" Editor agnostic configuration.
call dein#add('editorconfig/editorconfig-vim')

" cmake.vim changes makeprg in a way that is incompatible with vim-ros
"call dein#add('jalcine/cmake.vim')

" Powerline is installed with pip on Ubuntu, so don't install it here.
"call dein#add('Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'})

" Just to remember that YouCompleteMe could be installed.
" On Ubuntu 14.04, it's offered system-wide and activated with
" 'vim-addons install youcompleteme'.
call dein#add('Valloric/YouCompleteMe', {'build': 'python install.py --clang-completer --gocode-completer'})
"let g:neobundle#install_process_timeout = 600

" delimitMate was not really satisfying (didn't insert <CR> after '{',
" broke '.' for repeat last insert
" https://github.com/Raimondi/delimitMate/issues/138)
"call dein#add('Raimondi/delimitMate')

" Browse files, buffers, lines ... (:Unite).
call dein#add('Shougo/unite.vim')

" Most-recently-used support for Unite (:Unite file_mru)
call dein#add('Shougo/neomru.vim')

" Interactive command execution (for :Unite file_rec/async)
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" A class outline viewer
call dein#add('majutsushi/tagbar')

" Show a VCS diff using Vim's sign column
"call dein#add('mhinz/vim-signify')

" MoinMoin syntax highlighting.
call dein#add('vim-scripts/moin.vim.git')

" Syntax and occurences highlighting
" requires Vim 7.4p330+
"call dein#add('bbchung/clighter.git')

" Experimental minimap
"call dein#add('severin-lemaignan/vim-minimap')

" Automatic bracket insertion.
" Two dependencies of lh-brackets
" Not ideal because doesn't support redo, as of 2015-10.
"call dein#add('LucHermitte/lh-vim-lib')
"call dein#add('LucHermitte/lh-dev')
"call dein#add('LucHermitte/lh-brackets')

" Syntax highlighting support for Pweave files, scientific report with
" LaTeX and Python.
call dein#add('naught101/vim-pweave')

call dein#end()

