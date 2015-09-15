" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nocompatible

" Plugin configuration
source ~/.vim/setup/neobundle.vim

source ~/.vim/setup/ProjectBrowse.vim
source ~/.vim/setup/project.tar.gz.vim
source ~/.vim/setup/python-mode.vim
source ~/.vim/setup/syntastic.vim
source ~/.vim/setup/UltiSnips.vim
source ~/.vim/setup/vim-fugitive.vim
source ~/.vim/setup/vim-ros.vim
source ~/.vim/setup/vimtips-fortune.vim
source ~/.vim/setup/youcompleteme.vim
source ~/.vim/setup/vim-signify.vim
source ~/.vim/setup/unite.vim

" Use 'user-system-wide' powerline installation.
set runtimepath+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

" General configuration
syntax on
filetype plugin indent on

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
set history=500		" keep 500 lines of command line history
" viminfo option
" :500  :  up to 100 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
set viminfo+=:500
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch
set noshowmode " Mode is shown by the powerline plugin
set nobackup

" Use the system clipboard as default clipboard
" set clipboard=unnamedplus

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Gui configuration
if has('gui_running')
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
  colorscheme torte
endif

" wildignore: files to ignore when tab-completing
set wildignore=*.o,*.lo,*.pyc,*~

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
    au BufNewFile,BufRead *.FCMacro setlocal filetype=python
    au BufNewFile,BufRead *.nc setlocal filetype=cpp
    au BufNewFile,BufRead *.ops setlocal filetype=cpp foldmethod=syntax
    au BufNewFile,BufRead *.md setlocal filetype=markdown
    au BufNewFile,BufRead *.ino setlocal filetype=cpp
    " load a template when creating a new file
    au BufNewFile *.py silent! 0r ~/.vim/template/template.%:e
    " load a template for all file types when creating a new file
    " au! BufNewFile * silent! 0r ~/.vim/template/template.%:e
	
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " For the ViewSourceWith plugin for Firefox
    autocmd BufNewFile,BufRead /tmp/*.txt setlocal textwidth=0 linebreak showbreak=⏎\  
    autocmd BufNewFile,BufRead /tmp/*.txt map <buffer> j gj
    autocmd BufNewFile,BufRead /tmp/*.txt map <buffer> k gk

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
	  \ if line("'\"") > 1 && line("'\"") <= line("$") |
	  \   exe "normal! g`\"" |
	  \ endif
    " Don't do it for special files.
    autocmd BufReadPost COMMIT_EDITMSG exe "normal! gg0"

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" tag configuration (look for a tag file recursively in parent dir).
set tags=tags;/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings

" Use CTRL-S for saving, also in Insert mode
nnoremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

map <A-o> :ProjectBrowseCached<CR>

" Select last pasted text with 'gb', cf.
" http://vim.wikia.com/wiki/Selecting_your_pasted_text.
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" YouCompleteMe
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>

" FuzzyFinder
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fd :FufBookmarkDir<CR>
nnoremap <leader>ff :FufFileWithFullCwd<CR>
nnoremap <leader>fg :call fuf#givenfile#launch('', 0, '>', split(system("git ls-tree -r --name-only HEAD"), "\n"))<CR>
nnoremap <leader>fh :FufHelp<CR>
nnoremap <leader>fl :FufLine<CR>
nnoremap <leader>ft :FufTag<CR>
nnoremap <leader>fq :FufQuickfix<CR>

" Unite
nnoremap <leader>uu :Unite file file_rec file_mru buffer<CR>
nnoremap <leader>ub :Unite buffer<CR>
nnoremap <leader>ud :Unite bookmark<CR>
nnoremap <leader>uf :Unite file_rec<CR>
nnoremap <leader>ug :Unite file_rec/git<CR>
"nnoremap <leader>uh :Unite help<CR>
nnoremap <leader>ul :Unite line<CR>
"nnoremap <leader>ut :Unite tag<CR>
"nnoremap <leader>uq :FufQuickfix<CR>
nnoremap <leader>um :Unite file_mru<CR>
nnoremap <leader>ur :Unite grep:$HOME/ros_indigo_ws/src<CR>

" Disable mappings to :Dbg
let g:vim_debug_disable_mappings = 1
