"  Cf. https://github.com/AyeSpacey/Nvimfy for clearer configuration with lua.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nocompatible

if has('nvim')
  let g:config_dir = "~/.config/nvim"
else
  let g:config_dir = "~/.vim"
endif

" Program to use for evaluating Python code. Setting this makes NeoVim's
" startup faster.
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog  = '/usr/bin/python2'

" Disable some unused providers.
let g:loaded_python_provider = 1  " Python 2.
let g:loaded_ruby_provider = 1
let g:loaded_perl_provider = 1

" Use GUI colors in terminal.
" Required by noice for some animations.
" Required by the colorizer plugin (before loading the plugin).
set termguicolors

" Load plugins.
if has('nvim')
  lua require('plugin_setup/lazy') -- file `lua/plugin_setup/lazy.lua`.
endif

" General configuration
" chezmoi.vim requires `filetype on` to be called after loading the plugin.
filetype plugin indent on
syntax on

" Custom filetypes are defined in ~/.config/nvim/filetype.lua.

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

set number
set relativenumber

" Delete comment character when joining commented lines.
set formatoptions+=j

" Indent after <p> (cf. :h html-indent).
let g:html_indent_inctags = "p"

" Use the system clipboard as default clipboard
" set clipboard=unnamedplus

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

colorscheme gaels

" Gui configuration
if has('gui_running')
  "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
  set guifont="MesloLGS NF"
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

" Returns the the highlight group under the cursor.
" Cf. https://stackoverflow.com/a/37040415/1749379.
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Tip from http://vim.wikia.com/wiki/Insert_a_single_character
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction

" Use Treesitter as folding method.
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" autocommands
if has("autocmd")

  " Resize windows equally on VimResized event.
  au VimResized * wincmd =

  " load a template when creating a new file
  execute "au BufNewFile *.tex silent! 0r ".config_dir."/template/template.%:e"
  execute "au BufNewFile *.FCMacro silent! 0r ".config_dir."/template/template.%:e"
  execute "au BufNewFile *.fcmacro silent! 0r ".config_dir."/template/template.%:e"
  execute "au BufNewFile *.h silent! 0r ".config_dir."/template/template.%:e"
  " load a template for all file types when creating a new file
  "execute "au BufNewFile * silent! 0r ".config_dir."/template/template.%:e"

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " For the ViewSourceWith Firefox plugin.
  autocmd BufNewFile,BufRead /tmp/*.txt setlocal textwidth=0 showbreak=⏎\  linebreak

  " Open some files as archives.
  autocmd BufReadCmd *.jar,*.fcstd,*.h5p call zip#Browse(expand("<amatch>"))

  " From Skills.move
  autocmd BufRead /tmp/tmp_www.skillsmove*.txt setlocal filetype=html spell spelllang=en_gb clipboard=unnamedplus shiftwidth=2 expandtab
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Cf. https://this-week-in-neovim.org/2023/Jan/30#tips for an improved
" version.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" tag configuration (look for a tag file recursively in parent dir).
set tags=tags;/

" Key-bindings.
execute "source ".config_dir."/bindings.vim"
