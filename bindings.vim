" Use CTRL-S for saving, also in Insert mode
nnoremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" Map 'Y' to yank until the end of the line.
nnoremap Y y$

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Select last pasted text with 'gb', cf.
" http://vim.wikia.com/wiki/Selecting_your_pasted_text.
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Search and highlight but not jump.
" TODO: solve the recursive-function issue.
" nnoremap * :keepjumps normal *``<cr>

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

" RepeatChar defined in init.vim.
"nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
"nnoremap <SPACE> i_<ESC>r
nnoremap <SPACE> :<C-U>exec "silent normal i".nr2char(getchar())<CR>
"nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

autocmd BufNewFile,BufRead /tmp/*.txt map <buffer> j gj
autocmd BufNewFile,BufRead /tmp/*.txt map <buffer> k gk

" Telescope
inoremap <C-t> <ESC><cmd>Telescope tele_tabby<CR>
nnoremap <C-t> <cmd>Telescope tele_tabby<CR>
nnoremap <leader>f/ <cmd>Telescope search_history<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope git_file<CR>
nnoremap <Leader>f<S-g> <cmd>Telescope live_grep<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fi <cmd>Telescope jumplist<CR>
nnoremap <leader>fk <cmd>Telescope commands<CR>
nnoremap <leader>f<S-k> <cmd>Telescope command_history<CR>
nnoremap <leader>fm <cmd>Telescope frecency<CR>
nnoremap <leader>fo <cmd>Telescope vim_options<CR>
nnoremap <leader>fp <cmd>Telescope project<CR>
nnoremap <leader>fr <cmd>lua require'telescope'.extensions.ros.packages{cwd=os.getenv("ROS_WORKSPACE") or "."}<CR>
nnoremap <Leader>f<S-r> <cmd>lua require'telescope.builtin'.live_grep({search_dirs={os.getenv('ROS_WORKSPACE'), '/opt/ros', '.'}})<CR>
nnoremap <leader>fs <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>ft <cmd>Telescope tags<CR>

" Use <C-H> to clear the highlighting of :set hlsearch.
if maparg('<C-H>', 'n') ==# ''
	" nnoremap <silent> <C-H> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-H>
	nnoremap <silent> <C-H> :nohlsearch<CR>
endif

" The following command is already in ftplugin/python.vim, cf.
" https://github.com/Shougo/dein.vim/issues/101.
" I use a custom mapping for ipython (cf. ipy.vim).
let g:ipy_perform_mappings = 0

" Start easy-align with ga in normal and visual mode.
" Normally mapped to ga display hex,ascii value of char under cursor.
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

xmap <silent> O :sort u<CR>

" Recommended toggle for localsearch.
nmap <leader>/ <Plug>localsearch_toggle

" Refactoring with clang-rename (save the file before running).
" Provided by the `clang-tools` package on Ubuntu.
noremap <leader>cr :pyf /usr/lib/llvm-6.0/share/clang/clang-rename.py<cr>

" Include fixer with clang-include-fixer.
noremap <leader>cf :pyf /usr/lib/llvm-6.0/share/clang/clang-include-fixer.py<cr>

" Clap.
noremap <C-C> :Clap<cr>

" BufTerm.
" Terminal Toggle
nnoremap <silent> <leader>tt <cmd>BufTermToggle<cr>
tnoremap <silent> <leader>tt <cmd>BufTermToggle<cr>

" LSP
" Bindings for LSP must be done at the same time as servers configuration.
" Cf. plugin/lspconfig.vim.
" Configured bindings:
" <leader>gD
" <leader>gd
" <leader>K
" <leader>gi
" <leader>go
" <leader>wa
" <leader>wr
" <leader>wl
" <leader>gt
" <leader>rn
" <leader>ca
" <leader>gr
" <leader>e
" [d
" ]d
" <leader>q
" <leader>f

" Bindings defined by cmp in `lua/plugin_setup/cmp.lua`, when the completion
" dialog is open.
" <Tab>
" <S-Tab>
" <C-n>
" <C-p>
" <Down>
" <Up>
" <C-Space>
" <CR>
" <C-b>
" <C-f>
" <C-e>
