lua << EOF
require'lspconfig'.bashls.setup{}  -- bash
-- require'lspconfig'.ccls.setup{}  -- C,C++
require'lspconfig'.clangd.setup{}  -- C,C++
require'lspconfig'.cmake.setup{}  -- cmake
require'lspconfig'.dockerls.setup{} -- dockerfile
require'lspconfig'.dotls.setup{} -- Graphviz dot
require'lspconfig'.gopls.setup{} -- Go
-- require'lspconfig'.jedi_language_server.setup{} -- Python, alternative to pyright
require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
} -- json, cf. https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls.
-- require'lspconfig'.pylsp.setup{} -- Python
require'lspconfig'.pyright.setup{} -- Python
require'lspconfig'.rust_analyzer.setup{} -- Rust
require'lspconfig'.texlab.setup{} -- LaTeX
require'lspconfig'.yamlls.setup{} -- yaml
EOF

" Special configuration for html (activation of snippet support).
" Cf. https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html.
lua << EOF
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}
EOF
