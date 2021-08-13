
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
  "bashls",  -- bash (npm i -g bash-language-server)
  -- "clangd",  -- C,C++ (apt install ccls)
  "clangd",  -- C,C++ (apt install clangd)
  "cmake",  -- cmake (pip3 install cmake-language-server)
  "dockerls", -- dockerfile (npm install -g dockerfile-language-server-nodejs)
  "dotls", -- Graphviz dot (npm i -g dot-language-server)
  "gopls", -- Go (GO111MODULE=on go get golang.org/x/tools/gopls@latest)
  -- "jedi_language_server", -- Python, alternative to pyright
  -- "pylsp", -- Python
  "pyright", -- Python, requires node >= 14 (npm i -g pyright)
  "rust_analyzer", -- Rust (rustup +nightly component add rust-analyzer-preview)
  "texlab", -- LaTeX, cf. lua/lspinstall/servers/latex.lua from https://github.com/kabouzeid/nvim-lspinstall.git.
  "yamlls" -- yaml (npm i -g yaml-language-server)
  }
for _, server in ipairs(servers) do
  nvim_lsp[server].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Special cases.

-- Cf. https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls.
require'lspconfig'.jsonls.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
    },
  commands = {
    Format = {
      function()
	vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
      }
    }
} -- json (npm i -g vscode-langservers-extracted).

-- Special configuration for html (activation of snippet support).
-- Cf. https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
    },
  capabilities = capabilities,
}

-- Change diagnostic symbols in the gutter.
-- Possible symbols:
-- error: ✗(\u2717), ✖
-- warning: ⚠ (\u26A0),  (\uf071),  (\uf529),  with Font Awesome.
local signs = { Error = "✗ ", Warning = " ", Hint = " ", Information = " " }
for type, sign in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = sign, texthl = hl, numhl = "" })
end

-- Show only the worst sign in the gutter.
-- Cf. https://www.reddit.com/r/neovim/comments/mvhfw7/can_built_in_lsp_diagnostics_be_limited_to_show_a/gvd8rb9?utm_source=share&utm_medium=web2x&context=3
-- Capture real implementation of function that sets signs
local orig_set_signs = vim.lsp.diagnostic.set_signs
local set_signs_limited = function(diagnostics, bufnr, client_id, sign_ns, opts)

  -- original func runs some checks, which I think is worth doing
  -- but maybe overkill
  if not diagnostics then
    diagnostics = diagnostic_cache[bufnr][client_id]
  end

  -- early escape
  if not diagnostics then
    return
  end

  -- Work out max severity diagnostic per line
  local max_severity_per_line = {}
  for _, d in pairs(diagnostics) do
    if max_severity_per_line[d.range.start.line] then
      local current_d = max_severity_per_line[d.range.start.line]
      if d.severity < current_d.severity then
        max_severity_per_line[d.range.start.line] = d
      end
    else
      max_severity_per_line[d.range.start.line] = d
    end
  end

  -- map to list
  local filtered_diagnostics = {}
  for _, v in pairs(max_severity_per_line) do
    table.insert(filtered_diagnostics, v)
  end

  -- call original function
  orig_set_signs(filtered_diagnostics, bufnr, client_id, sign_ns, opts)
end
vim.lsp.diagnostic.set_signs = set_signs_limited

-- Print diagnostics in the message area.
function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  opts = opts or {}

  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)

  local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
  if vim.tbl_isempty(line_diagnostics) then
    return
  end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  print(diagnostic_message)
end

vim.cmd [[ autocmd CursorMoved * lua PrintDiagnostics() ]]

-- Customize text for completion types.
local icons = require "plugin/lspconfig"
icons.setup()

EOF
