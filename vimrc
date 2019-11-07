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
" To disable Python 2 support:
"let g:loaded_python_provider = 1

" Plugin configuration
execute "source ".config_dir."/setup/dein.vim"

" execute "source ".config_dir."/setup/ProjectBrowse.vim"
" execute "source ".config_dir."/setup/lh-brackets.vim"
" execute "source ".config_dir."/setup/project.tar.gz.vim"
" execute "source ".config_dir."/setup/syntastic.vim"
" execute "source ".config_dir."/setup/vim-signify.vim"
execute "source ".config_dir."/setup/UltiSnips.vim"
execute "source ".config_dir."/setup/airline.vim"
execute "source ".config_dir."/setup/alternate-lite.vim"
execute "source ".config_dir."/setup/gutentags.vim"
execute "source ".config_dir."/setup/python-mode.vim"
execute "source ".config_dir."/setup/unite.vim"
execute "source ".config_dir."/setup/vim-fugitive.vim"
execute "source ".config_dir."/setup/vim-ros.vim"
execute "source ".config_dir."/setup/vimtex.vim"
execute "source ".config_dir."/setup/vimtips-fortune.vim"
execute "source ".config_dir."/setup/youcompleteme.vim"

" Use 'user-system-wide' or 'system-wide' powerline installation.
if has('nvim')
	" No support for powerline in NeoVim
	" set runtimepath+=/usr/lib/python2.7/dist-packages/powerline/bindings/vim
	" set runtimepath+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim
else
	set runtimepath+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
endif

" General configuration
filetype plugin indent on
syntax on

if has('nvim')
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
set completeopt+=longest
set tabstop=4
set shiftwidth=4
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=1000		" keep that many lines of command line history
" viminfo option
" :500  :  up to 500 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
set viminfo+=:500
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch
set noshowmode " Mode is shown by the powerline plugin
set nobackup
"How to show whitespace in list mode.
set listchars=eol:$,tab:↦‧
set smarttab
" Automatically reloads the file if externally modified and unchanged in vim.
set autoread

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j  " Delete comment character when joining commented lines
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
"nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
"nnoremap <SPACE> i_<ESC>r
nnoremap <SPACE> :<C-U>exec "silent normal i".nr2char(getchar())<CR>
"nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" autocommands
if has("autocmd")
    au BufNewFile,BufRead *.FCMacro setlocal filetype=python
    au BufNewFile,BufRead *.fcmacro setlocal filetype=python
    au BufNewFile,BufRead *.nc setlocal filetype=cpp
    au BufNewFile,BufRead *.ops setlocal filetype=cpp foldmethod=syntax
    au BufNewFile,BufRead *.md setlocal filetype=markdown
    au BufNewFile,BufRead *.ino setlocal filetype=cpp
    au BufNewFile,BufRead *.tikz setlocal filetype=tex
    au BufNewFile,BufRead *.nxc setlocal filetype=nxc

    " load a template when creating a new file
    execute "au BufNewFile *.py silent! 0r ".config_dir."/template/template.%:e"
    execute "au BufNewFile *.tex silent! 0r ".config_dir."/template/template.%:e"
    execute "au BufNewFile *.FCMacro silent! 0r ".config_dir."/template/template.%:e"
    execute "au BufNewFile *.fcmacro silent! 0r ".config_dir."/template/template.%:e"
    execute "au BufNewFile *.h silent! 0r ".config_dir."/template/template.%:e"
    " load a template for all file types when creating a new file
    "execute "au BufNewFile * silent! 0r ".config_dir."/template/template.%:e"

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

" Select last pasted text with 'gb', cf.
" http://vim.wikia.com/wiki/Selecting_your_pasted_text.
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Write the directory for the current file.
nmap <Leader>md :!mkdir -p %:p:h<cr>

" YouCompleteMe
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>go :YcmCompleter GetDoc<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>i :YcmCompleter FixIt<CR>

" LanguageClient-neovim (for supported and configured languages).
function! LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    "nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr> " already defined
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()

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
nnoremap <Leader>u<S-b> :tabedit <bar> Unite buffer<CR>
nnoremap <leader>uf :Unite file_rec<CR>
nnoremap <Leader>u<S-f> :tabedit <bar> Unite file_rec<CR>
nnoremap <leader>ug :Unite file_rec/git<CR>
nnoremap <Leader>u<S-g> :tabedit <bar> Unite file_rec/git<CR>
nnoremap <leader>uk :Unite bookmark<CR>
"nnoremap <leader>uh :Unite help<CR>
nnoremap <leader>ul :Unite line<CR>
"nnoremap <leader>ut :Unite tag<CR>
nnoremap <leader>um :Unite file_mru<CR>
nnoremap <Leader>u<S-m> :tabedit <bar> Unite file_mru<CR>
nnoremap <C-t> <ESC>:Unite tab<CR>
if !empty($ROS_WORKSPACE)
  " Generic solution.
  nnoremap <leader>ur :Unite grep:$ROS_WORKSPACE/src<CR>
  nnoremap <Leader>u<S-r> :tabedit <bar> Unite grep:$ROS_WORKSPACE/src<CR>
elseif $HOST == "pcgael3"
  " Ubuntu 18.04.
  nnoremap <leader>ur :Unite grep:$HOME/ros_melodic_ws/src<CR>
  nnoremap <Leader>u<S-r> :tabedit <bar> Unite grep:$HOME/ros_melodic_ws/src<CR>
elseif $HOST == "pcagel2"
  " Ubuntu 16.04.
  nnoremap <leader>ur :Unite grep:$HOME/ros_kinetic_ws/src<CR>
  nnoremap <Leader>u<S-r> :tabedit <bar> Unite grep:$HOME/ros_kinetic_ws/src<CR>
elseif $HOST == "pcgael"
  " Ubuntu 14.04.
  nnoremap <leader>ur :Unite grep:$HOME/ros_indigo_ws/src<CR>
  nnoremap <Leader>u<S-r> :tabedit <bar> Unite grep:$HOME/ros_indigo_ws/src<CR>
endif
nnoremap <leader>ut :Unite tag<CR>
nnoremap <Leader>u<S-t> :tabedit <bar> Unite tag<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" The following command is already in ftplugin/python.vim, cf.
" https://github.com/Shougo/dein.vim/issues/101.
" I use a custom mapping for ipython (cf. ipy.vim).
let g:ipy_perform_mappings = 0

" FSHeaderAbove is defined in setup/alternate-lite.vim.
command! A FSHeaderAbove
