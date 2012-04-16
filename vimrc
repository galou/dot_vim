call pathogen#infect()

set nocompatible
" Windows alwas have the same size (doesn't work on Ubuntu)
set equalalways
source $VIMRUNTIME/vimrc_example.vim

set autochdir
set diffopt=vertical
set wildmode=longest,list:longest
set laststatus=2
" insert the longest common prefix of all the suggestions
set completeopt+=longest

" tabstop as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" viminfo option
" :50  :  up to 50 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
set viminfo+=:50

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
nnoremap S :<C-U>exec "silent normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" autocommands
if has("autocmd")
    "au BufNewFile, BufRead *.py set tabstop=4 shiftwidth=4 nonumber
    au BufNewFile,BufRead *.py set nonumber fo-=t tw=79
    au BufNewFile,BufRead *.FCMacro set filetype=python
    " load a template when creating a new file
    autocmd! BufNewFile * silent! 0r ~/.vim/template/template.%:e
endif

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" python-mode options
let g:pymode_options_other=0
