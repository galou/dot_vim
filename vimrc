" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nocompatible

" NeoBundle activation
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle (required)
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'vim-scripts/vim-addon-commenting.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'sjl/gundo.vim.git'
NeoBundle 'vim-scripts/mru.vim.git'
" Python-mode completion is incompatible with YouCompleteMe (cf. below)
NeoBundle 'klen/python-mode.git'
NeoBundle 'vim-scripts/The-NERD-tree.git'
" snipMate is incompatible with YouCompleteMe
" NeoBundle 'msanders/snipmate.vim.git'
" UltiSnips is used instead of snipMate because of compatibility with YCM
NeoBundle 'vim-scripts/UltiSnips.git'
" Default snippets for UltiSnips
NeoBundle 'honza/vim-snippets.git'
NeoBundle 'tmhedberg/SimpylFold.git'
NeoBundle 'vim-scripts/taglist.vim.git'
NeoBundle 'trotter/autojump.vim.git'
NeoBundle 'hobbestigrou/vimtips-fortune.git'
NeoBundle 'othree/xml.vim.git'
NeoBundle 'wincent/Command-T.git'
NeoBundle 'ivanov/vim-ipython.git'
NeoBundle 'c9s/bufexplorer.git'
NeoBundle 'vim-scripts/FuzzyFinder.git'
NeoBundle 'vim-scripts/L9.git'
NeoBundle 'vim-scripts/project.tar.gz.git'
NeoBundle 'vim-scripts/ProjectBrowse.git', {'branch': 'unix-eol'}
NeoBundle 'taketwo/vim-ros.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'whiledoing/cmakecomplete.git'
NeoBundle 'tpope/vim-unimpaired.git'
" Powerline is installed with pip on Ubuntu, so don't install it here.
" NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
NeoBundle 'git://git.code.sf.net/p/atp-vim/code'
" cmake.vim changes makeprg in a way that is incompatible with vim-ros
" NeoBundle 'jalcine/cmake.vim'
" Just to remember that YouCompleteMe could be installed.
" On Ubuntu 14.04, it's offered system-wide and activated with
" 'vim-addons install youcompleteme'.
" NeoBundle 'Valloric/YouCompleteMe.git'
"
" delimitMate was not really satisfying (didn't insert <CR> after '{',
" broke '.' for repeat last insert
" https://github.com/Raimondi/delimitMate/issues/138)
" NeoBundle 'Raimondi/delimitMate.git'


call neobundle#end()

" Use 'user-system-wide' powerline installation.
set runtimepath+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

syntax on
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Windows always have the same size (doesn't work on Ubuntu)
set equalalways

set autochdir
set diffopt=vertical
set wildmode=longest,list:longest
set laststatus=2
set title
" insert the longest common prefix of all the suggestions
set completeopt+=longest
set tabstop=4
set shiftwidth=4
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=100		" keep 100 lines of command line history
" viminfo option
" :100  :  up to 100 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
set viminfo+=:100
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch
set noshowmode " Mode is shown by the powerline plugin

" Use the system clipboard as default clipboard
" set clipboard=unnamedplus

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Gui configuration
if has('gui_running')
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" wildignore: files to ignore when tab-completing
set wildignore=*.o,*.lo,*.pyc

" command :Calc as a calculator using python
command! -nargs=+ Calc :!python -c "from math import *; print(<args>)"

" Tip from http://vim.wikia.com/wiki/Insert_a_single_character
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
"nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
"nnoremap <SPACE> i_<ESC>r
nnoremap <SPACE> :<C-U>exec "silent normal i".nr2char(getchar())<CR>
"nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" autocommands
if has("autocmd")
    au BufNewFile,BufRead *.FCMacro set filetype=python
    au BufNewFile,BufRead *.nc set filetype=cpp
    au BufNewFile,BufRead *.ops set filetype=cpp foldmethod=syntax
    " load a template when creating a new file
    au BufNewFile *.py silent! 0r ~/.vim/template/template.%:e
    " load a template for all file types when creating a new file
    " au! BufNewFile * silent! 0r ~/.vim/template/template.%:e
	
	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78
	
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\   exe "normal! g`\"" |
				\ endif

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Use CTRL-S for saving, also in Insert mode
nnoremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" tag configuration (look for a tag file recursively in parent dir).
set tags=tags;/

" Show vimtips-fortune on Fridays.
let weekday=system("echo -n $(LANG=EN_us date +%A)")
if weekday != "Friday"
    let g:loaded_fortune_vimtips = 1
endif

" ProjectBrowse configuration
let s:find_path='/usr/bin/find'
let s:cache_path='$HOME/.cache/vim-projectbrowse-cache.txt'
"let s:filter='-regex .*\.cpp\|.*\.hp?p?\|.*\.ops\|.*\.osd\|.*\.sh\|.*CMakeLists.txt\|.*\.xml'
map <A-o> :ProjectBrowseCached<CR>

" Project configuration
" default: let g:proj_flags+="imstb"
let g:proj_flags="mstbcg"

" Fugitive configuration
autocmd BufReadPost fugitive://* set bufhidden=delete
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" ros-vim configuration
let g:ros_make='current'
let g:ros_build_system='catkin'

" Syntastic configuration
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" YouCompleteMe configuration
let g:ycm_extra_conf_globlist = ['/home/gael/ros_indigo_ws/*']
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>

" Python-mode configuration
let g:pymode_rope_completion = 0  " Completion is done with YouCompleteMe

" FuzzyFinder configuration
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fd :FufBookmarkDir<CR>
nnoremap <leader>ff :FufFileWithFullCwd<CR>
nnoremap <leader>fg :call fuf#givenfile#launch('', 0, '>', split(system("git ls-tree -r --name-only HEAD"), "\n"))<CR>
nnoremap <leader>fh :FufHelp<CR>
nnoremap <leader>fl :FufLine<CR>
nnoremap <leader>ft :FufTag<CR>
nnoremap <leader>fq :FufQuickfix<CR>

" UltiSnips compatibility with YouCompleteMe
let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"


