" NeoBundle activation
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle (required)
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'vim-scripts/vim-addon-commenting'
" git integration
NeoBundle 'tpope/vim-fugitive'
" Undo management (:GundoToggle)
NeoBundle 'sjl/gundo.vim'
" Most recently used (:MRU)
NeoBundle 'vim-scripts/mru.vim'
" Python-mode completion is incompatible with YouCompleteMe (cf. below)
NeoBundle 'klen/python-mode'
NeoBundle 'vim-scripts/The-NERD-tree'

" snipMate is incompatible with YouCompleteMe
" NeoBundle 'msanders/snipmate.vim'
" UltiSnips is used instead of snipMate because of compatibility with YCM
NeoBundle 'vim-scripts/UltiSnips'

" Default snippets for UltiSnips
NeoBundle 'honza/vim-snippets'

NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'trotter/autojump.vim'
NeoBundle 'hobbestigrou/vimtips-fortune'
NeoBundle 'othree/xml.vim'
NeoBundle 'wincent/Command-T'
NeoBundle 'ivanov/vim-ipython'
NeoBundle 'c9s/bufexplorer'
NeoBundle 'vim-scripts/FuzzyFinder'
NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-scripts/project.tar.gz'
NeoBundle 'vim-scripts/ProjectBrowse', {'branch': 'unix-eol'}
NeoBundle 'taketwo/vim-ros'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'whiledoing/cmakecomplete'
NeoBundle 'tpope/vim-unimpaired'
" Automatic indent detection
NeoBundle 'tpope/vim-sleuth'
" Block commenting
NeoBundle 'tpope/vim-commentary'
NeoBundle 'git://git.code.sf.net/p/atp-vim/code'

" cmake.vim changes makeprg in a way that is incompatible with vim-ros
" NeoBundle 'jalcine/cmake.vim'

" Powerline is installed with pip on Ubuntu, so don't install it here.
" NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}

" Just to remember that YouCompleteMe could be installed.
" On Ubuntu 14.04, it's offered system-wide and activated with
" 'vim-addons install youcompleteme'.
" NeoBundle 'Valloric/YouCompleteMe'
"
" delimitMate was not really satisfying (didn't insert <CR> after '{',
" broke '.' for repeat last insert
" https://github.com/Raimondi/delimitMate/issues/138)
" NeoBundle 'Raimondi/delimitMate'

" Browse files, buffers, lines ... (:Unite)
NeoBundle 'Shougo/unite.vim'

" Most-recently-used support for Unite (:Unite file_mru)
NeoBundle 'Shougo/neomru.vim'

" Interactive command execution (for :Unite file_rec/async)
NeoBundle 'Shougo/vimproc.vim', {
			\    'build' : {
	    	\      'windows' : 'tools\\update-dll-mingw',
	    	\      'cygwin' : 'make -f make_cygwin.mak',
	    	\      'mac' : 'make -f make_mac.mak',
	    	\      'linux' : 'make',
	    	\      'unix' : 'gmake',
	    	\    }
	    	\  }

" A class outline viewer
NeoBundle 'majutsushi/tagbar'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

