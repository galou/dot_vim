" According to
" https://www.reddit.com/r/neovim/comments/ol6fqq/050_language_server_client_qa_w_mjlbach_me/,
" setup{} should be called only once and this is done in ../bindings.vim.
finish

lua << EOF
require'lspconfig'.bashls.setup{}  -- bash (npm i -g bash-language-server)
-- require'lspconfig'.ccls.setup{}  -- C,C++ (apt install ccls)
require'lspconfig'.clangd.setup{}  -- C,C++ (apt install clangd)
require'lspconfig'.cmake.setup{}  -- cmake (pip3 install cmake-language-server)
require'lspconfig'.dockerls.setup{} -- dockerfile (npm install -g dockerfile-language-server-nodejs)
require'lspconfig'.dotls.setup{} -- Graphviz dot (npm i -g dot-language-server)
require'lspconfig'.gopls.setup{} -- Go (GO111MODULE=on go get golang.org/x/tools/gopls@latest)
-- require'lspconfig'.jedi_language_server.setup{} -- Python, alternative to pyright
require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
} -- json, cf. https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls (npm i -g vscode-langservers-extracted).
-- require'lspconfig'.pylsp.setup{} -- Python
require'lspconfig'.pyright.setup{} -- Python (npm i -g pyright)
require'lspconfig'.rust_analyzer.setup{} -- Rust (rustup +nightly component add rust-analyzer-preview)
require'lspconfig'.texlab.setup{} -- LaTeX, cf. lua/lspinstall/servers/latex.lua from https://github.com/kabouzeid/nvim-lspinstall.git.
require'lspconfig'.yamlls.setup{} -- yaml (npm i -g yaml-language-server) 
EOF

" Special configuration for html (activation of snippet support).
" Cf. https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html.
lua << EOF
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
} -- HTML (npm i -g vscode-langservers-extracted)
EOF
