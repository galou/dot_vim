" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nocompatible

if has('nvim')
  let config_dir = "~/.config/nvim"
else
  let config_dir = "~/.vim"
endif

" Program to use for evaluating Python code. Setting this makes NeoVim's
" startup faster.
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog  = '/usr/bin/python2'

" Disable some unused providers.
let g:loaded_python_provider = 1  " Python 2.
let g:loaded_ruby_provider = 1
let g:loaded_perl_provider = 1

" Plugin configuration in dein.vim.
execute "source ".config_dir."/dein.vim"

" Use 'user-system-wide' or 'system-wide' powerline installation.
if has('nvim')
  " No support for powerline in NeoVim
  " set runtimepath+=/usr/lib/python2.7/dist-packages/powerline/bindings/vim
  " set runtimepath+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim
else
  set runtimepath+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim
endif

" General configuration
filetype plugin indent on
syntax on

if has('nvim')
  " Highlight search and perform live replace.
  " Cf. https://thoughtbot.com/upcase/videos/neat-little-neovim-features.
  set inccommand=nosplit
endif

" Windows always have the same size (doesn't work on Ubuntu)
set equalalways

set autochdir
set diffopt=vertical
set wildmode=longest,list:longest
set laststatus=2
set title
" insert the longest common prefix of all the suggestions
"set completeopt+=longest " For YouCompleteMe
"set completeopt-=longest " For Kite
"set completeopt+=noinsert " For Kite
set completeopt=menuone,noselect
set tabstop=4
set shiftwidth=4
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=1000  " keep that many lines of command line history
" viminfo option
" :500  :  up to 500 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
set viminfo+=:500
set ruler  " show the cursor position all the time
set showcmd  " display incomplete commands
set incsearch  " do incremental searching
set hlsearch
set noshowmode " Mode is shown by the powerline plugin
set nobackup
"How to show whitespace in list mode.
set listchars=eol:$,tab:↦‧
set smarttab
" Automatically reloads the file if externally modified and unchanged in vim.
set autoread
" Automatically executes .nvimrc if found.
set exrc

if v:version > 703 || v:version == 703 && has("patch541")
  " Delete comment character when joining commented lines.
  set formatoptions+=j
endif

" Use the system clipboard as default clipboard
" set clipboard=unnamedplus

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

colorscheme gaels

" Gui configuration
if has('gui_running')
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
  colorscheme torte
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" wildignore: files to ignore when tab-completing
set wildignore=*.o,*.lo,*.pyc,*~

" command :Calc as a calculator using python
command! -nargs=+ Calc :!python -c "from math import *; print(<args>)"

" Tip from http://vim.wikia.com/wiki/Insert_a_single_character
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction

" autocommands
if has("autocmd")
    au BufNewFile,BufRead *.FCMacro setlocal filetype=python
    au BufNewFile,BufRead *.fcmacro setlocal filetype=python
    au BufNewFile,BufRead *.ino setlocal filetype=cpp
    au BufNewFile,BufRead *.launch setlocal filetype=xml
    au BufNewFile,BufRead *.md setlocal filetype=markdown
    au BufNewFile,BufRead *.nc setlocal filetype=cpp
    au BufNewFile,BufRead *.nxc setlocal filetype=nxc
    au BufNewFile,BufRead *.ops setlocal filetype=cpp foldmethod=syntax
    au BufNewFile,BufRead *.sdf setlocal filetype=xml
    au BufNewFile,BufRead *.sip setlocal filetype=sip
    au BufNewFile,BufRead *.tikz setlocal filetype=tex
    au BufNewFile,BufRead *.world setlocal filetype=xml

    " load a template when creating a new file
    execute "au BufNewFile *.tex silent! 0r ".config_dir."/template/template.%:e"
    execute "au BufNewFile *.FCMacro silent! 0r ".config_dir."/template/template.%:e"
    execute "au BufNewFile *.fcmacro silent! 0r ".config_dir."/template/template.%:e"
    execute "au BufNewFile *.h silent! 0r ".config_dir."/template/template.%:e"
    " load a template for all file types when creating a new file
    "execute "au BufNewFile * silent! 0r ".config_dir."/template/template.%:e"

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " For the ViewSourceWith plugin for Firefox
    autocmd BufNewFile,BufRead /tmp/*.txt setlocal textwidth=0 showbreak=⏎\  linebreak

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
    autocmd BufReadPost svn-commit.tmp exe "normal! gg0"

    " Open some files as archives.
    autocmd BufReadCmd *.jar,*.fcstd call zip#Browse(expand("<amatch>"))
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

" Key-bindings.
execute "source ".config_dir."/bindings.vim"

" Configuration for lua plugins.
lua << EOF
require('comment') -- lua/comment.lua.
EOF
