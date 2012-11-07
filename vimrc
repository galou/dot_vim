syntax off
filetype plugin indent off

call pathogen#infect()

syntax on
filetype plugin indent on

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
    "au BufNewFile, BufRead *.py set tabstop=4 shiftwidth=4 nonumber
    au BufNewFile,BufRead *.py set nonumber fo-=t tw=79
    au BufNewFile,BufRead *.FCMacro set filetype=python
    au BufNewFile,BufRead *.nc set filetype=cpp
    au BufNewFile,BufRead *.ops set filetype=cpp foldmethod=syntax
    " load a template when creating a new file
    au BufNewFile *.py silent! 0r ~/.vim/template/template.%:e
    " load a template for all file types when creating a new file
    " au! BufNewFile * silent! 0r ~/.vim/template/template.%:e
    au BufNewFile,BufRead *.go set filetype=go
endif

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" python-mode options
let g:pymode_options_other=0

" vimtips-fortune options
let g:fortune_vimtips_auto_display=1

" latex-suite configuration
let g:Tex_DefaultTargetFormat="pdf"

" ipython configuration
let g:ipy_perform_mappings = 0

au BufNewFile,BufRead *.py map <buffer> <silent> <F5> :python run_this_file()<CR>
au BufNewFile,BufRead *.py map <buffer> <silent> <F9> :python run_this_line()<CR>
au BufNewFile,BufRead *.py map <buffer> <silent> <S-F9> :python run_these_lines()<CR>
au BufNewFile,BufRead *.py map <buffer> <silent> <leader>d :py get_doc_buffer()<CR>
au BufNewFile,BufRead *.py map <buffer> <silent> <leader>s :py if update_subchannel_msgs(force=True): echo("vim-ipython shell updated",'Operator')<CR>
au BufNewFile,BufRead *.py map <buffer> <silent> <C-F9> :python toggle_reselect()<CR>
au BufNewFile,BufRead *.py imap <buffer> <F5> <C-O><F5>
au BufNewFile,BufRead *.py imap <buffer> <F9> <C-O><F9>
"au BufNewFile,BufRead *.py imap <buffer> <silent> <F5> <C-O><F5>
"au BufNewFile,BufRead *.py map <C-F5> :call <SID>toggle_send_on_save()<CR>
au BufNewFile,BufRead *.py map <buffer> <silent> <F12> :python run_command("plt.show()")<cr>
au BufNewFile,BufRead *.py imap <buffer> <silent> <F12> :python run_command("plt.show()")<cr>
au BufNewFile,BufRead *.py map <buffer> <silent> <S-F12> :python run_command("plt.close('all')")<cr>
au BufNewFile,BufRead *.py imap <buffer> <silent> <S-F12> :python run_command("plt.close('all')")<cr>

"pi custom
"map <silent> <C-Return> :python run_this_file()<CR>
"map <silent> <C-s> :python run_this_line()<CR>
"imap <silent> <C-s> <C-O>:python run_this_line()<CR>
"map <silent> <M-s> :python dedent_run_this_line()<CR>
"vmap <silent> <C-S> :python run_these_lines()<CR>
"vmap <silent> <M-s> :python dedent_run_these_lines()<CR>
"map <silent> <M-c> I#<ESC>
"vmap <silent> <M-c> I#<ESC>
"map <silent> <M-C> :s/^\([ \t]*\)#/\1/<CR>
"vmap <silent> <M-C> :s/^\([ \t]*\)#/\1/<CR>


