syntax off
filetype plugin indent off

call pathogen#infect()

syntax on
filetype plugin indent on

set nocompatible
" Windows always have the same size (doesn't work on Ubuntu)
set equalalways
source $VIMRUNTIME/vimrc_example.vim

set autochdir
set diffopt=vertical
set wildmode=longest,list:longest
set laststatus=2
set title
" insert the longest common prefix of all the suggestions
set completeopt+=longest
set tabstop=4
set shiftwidth=4

" viminfo option
" :50  :  up to 50 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
set viminfo+=:50

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
endif

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" python-mode options
let g:pymode_options_other=0
let g:pymode_lint_checker="pyflakes"

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
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" tag configuration (look for a tag file recursively in parent dir).
set tags=tags;/

" FuzzyFinder configuration
nnoremap \fb :FufBuffer<CR>
nnoremap \fd :FufBookmarkDir<CR>
nnoremap \ff :FufFileWithFullCwd<CR>
nnoremap \fg :call fuf#givenfile#launch('', 0, '>', split(system("git ls-tree -r --name-only HEAD"), "\n"))<CR>
nnoremap \fh :FufHelp<CR>
nnoremap \fl :FufLine<CR>
nnoremap \ft :FufTag<CR>
nnoremap \fq :FufQuickfix<CR>
