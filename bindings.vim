" Use CTRL-S for saving, also in Insert mode
nnoremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" Map '*' to stay on the current word.
" TODO: jumps backward in history when there is only one match.
" nnoremap * *<C-O>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Select last pasted text with 'gV', cf.
" http://vim.wikia.com/wiki/Selecting_your_pasted_text.
nnoremap <expr> gV '`[' . strpart(getregtype(), 0, 1) . '`]'

" Search and highlight but not jump.
" TODO: solve the recursive-function issue.
" nnoremap * :keepjumps normal *``<cr>

" TODO
" :'a,'by* -- Yank range into paste -- yank to paste buffer (ex mode)

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
nnoremap <silent> <SPACE> :<C-U>exec "silent normal i".nr2char(getchar())<CR>
"nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

autocmd FileType text map <buffer> j gj
autocmd FileType text map <buffer> k gk

" Telescope
inoremap <C-t> <ESC><cmd>Telescope tele_tabby<CR>
nnoremap <C-t> <cmd>Telescope tele_tabby list<CR>
nnoremap <leader>f" <cmd>Telescope registers<CR>
" nnoremap <leader>f/ <cmd>Telescope search_history<CR>  " Doesn't bring much
nnoremap <leader>f/ :vimgrep /<C-r>// %<CR><cmd>Telescope quickfix<CR>  " Search with vimgrep (to quickfix) and Telescope quickfix
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope git_files<CR>
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
" nnoremap <leader>ft <cmd>Telescope current_buffer_tags<CR> " Slow
nnoremap <leader>ft <cmd>lua require('telescope').extensions.aerial.aerial()<CR>

" Use <C-H> to clear the highlighting of :set hlsearch.
if maparg('<C-H>', 'n') ==# ''
	" nnoremap <silent> <C-H> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-H>
	nnoremap <silent> <C-H> :nohlsearch<CR>
endif

" The following command is already in ftplugin/python.vim, cf.
" https://github.com/Shougo/dein.vim/issues/101.
" I use a custom mapping for ipython (cf. ipy.vim).
let g:ipy_perform_mappings = 0

xmap <silent> O :sort u<CR>

" Recommended toggle for localsearch.
nmap <leader>/ <Plug>localsearch_toggle

" Refactoring with clang-rename (save the file before running).
" Provided by the `clang-tools` package on Ubuntu.
noremap <leader>cr :pyf /usr/lib/llvm-6.0/share/clang/clang-rename.py<cr>

" Include fixer with clang-include-fixer.
noremap <leader>cf :pyf /usr/lib/llvm-6.0/share/clang/clang-include-fixer.py<cr>

" BufTerm.
" Terminal Toggle
nnoremap <silent> <leader>tt <cmd>BufTermToggle<cr>
tnoremap <silent> <leader>tt <cmd>BufTermToggle<cr>

nnoremap <C-n> :Neotree<CR>
" nnoremap <leader>n :NeoTreeFocus<CR>

" LSP
" Bindings for LSP must be done at the same time as servers configuration.
" Cf. lua/plugin_setup/lspconfig.lua.
" Configured bindings:
" <leader>K
" <leader>ca
" <leader>e
" <leader>gD
" <leader>gd
" <leader>gi
" <leader>go
" <leader>gr
" <leader>gt
" <leader>q
" <leader>rn
" <leader>wa
" <leader>wl
" <leader>wr
" [d
" ]d

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

" barbar
" inoremap <C-t> <ESC><cmd>BufferPick<CR>
" nnoremap <C-t> <cmd>BufferPick<CR>
" inoremap <C-<PageUp>> <ESC><cmd>BufferPrevious<CR>
" nnoremap <C-<PageUp>> <cmd>BufferPrevious<CR>
" inoremap <C-<PageDown>> <ESC><cmd>BufferNext<CR>
" nnoremap <C-<PageDown>> <cmd>BufferNext<CR>

" Gitsigns bindings defined in lua/plugin_setup/gitsigns.lua.
" <leader>hs  ':Gitsigns stage_hunk<CR>')
" <leader>hr  ':Gitsigns reset_hunk<CR>')
" <leader>hS  gs.stage_buffer)
" <leader>hu  gs.undo_stage_hunk)
" <leader>hR  gs.reset_buffer)
" <leader>hp  gs.preview_hunk)
" <leader>hb  function() gs.blame_line{full=true} end)
" <leader>tb  gs.toggle_current_line_blame)
" <leader>hd  gs.diffthis)
" <leader>hD  function() gs.diffthis('~') end)
" <leader>td  gs.toggle_deleted)
"ih  ':<C-U>Gitsigns select_hunk<CR>')

" mini.Align mapping (lua/plugin_setup/mini.lua).
" ga start align.
" gA start align with preview.

" Bindings configuration in lua.
if has('nvim')
	lua require('bindings') -- file `lua/bindings.lua`.
endif

