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
nnoremap <C-t> <ESC>:Unite tab<CR>i
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
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>go', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "bashls",
  "clangd",
  "cmake",
  "dockerls",
  "dotls",
  "gopls",
  "html",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "texlab",
  "yamlls"
  }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Compe bindings
" Bindings <Tab> and <S-Tab> defined in plugin/compe.vim.
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

