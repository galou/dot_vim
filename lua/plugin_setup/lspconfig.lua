-- Configuration for https://github.com/neovim/nvim-lspconfig
--
-- :LspInstall bashls biome cmake ccsls dockerls jsonls lemminx ltex lua_ls pylsp ruff spectral texlab

local lspconfig = require('lspconfig')
-- local configs = require('lspconfig.configs')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {noremap=true, silent=true, buffer=bufnr}
  local set = vim.keymap.set
  set('n', '<leader>gh', vim.lsp.buf.hover, opts)
  set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  set('n', '<leader>e', vim.diagnostic.open_float, opts)
  set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
  set('n', '<leader>gd', vim.lsp.buf.definition, opts)
  set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
  set('n', '<leader>go', vim.lsp.buf.signature_help, opts)
  set('n', '<leader>gr', vim.lsp.buf.references, opts)
  set('n', '<leader>gt', vim.lsp.buf.type_definition, opts)
  set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  set('n', '[d', vim.diagnostic.goto_prev, opts)
  set('n', ']d', vim.diagnostic.goto_next, opts)

end

-- nvim-cmp integration.
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "bashls",  -- bash (`:LspInstall bashls` or `npm i -g bash-language-server`)
  "biome",  -- Javascript, Typescript (`:LspInstall biome`)
  -- "clangd",  -- C,C++ (:LspInstall), configured in clangd_extensions.lua.
  "cmake",  -- cmake (`LspInstall cmake` or `pip3 install cmake-language-server`)
  "cssls",  -- CSS (LspInstall cssls)
  "dockerls", -- dockerfile (`LspInstall dockerls` or `npm install -g dockerfile-language-server-nodejs`)
  "dotls", -- Graphviz dot (https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally, then `npm i -g dot-language-server`)
  "gopls", -- Go (GO111MODULE=on go get golang.org/x/tools/gopls@latest) or sudo snap install gopls
  "jsonls", -- :LspInstall jsonls.
  "lemminx", -- xml, (https://github.com/eclipse/lemminx.git, :LspInstall lemminx).
  "ltex",  -- LaTeX, Markdown, and others (:LspInstall ltex)
  "lua_ls",  -- Lua, installed by mason.
  "mojo",  -- Mojo (modular install mojo).
  "ruff", -- Python (https://docs.astral.sh/ruff/, :LspInstall ruff)
  "rust_analyzer", -- Rust (rustup +nightly component add rust-analyzer-preview)
  "spectral", -- yaml (:LspInstall spectral)
  "texlab", -- LaTeX, (lua/lspinstall/servers/latex.lua from https://github.com/kabouzeid/nvim-lspinstall.git, :LspInstall texlab)
  -- "yamlls" -- yaml (npm i -g yaml-language-server)
  }
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = cmp_capabilities
  }
end

-- Special cases.

-- black, Python (`:LspInstall black`)
-- not in `server_configurations.md` from nvim-lspconfig.
-- Check if the config is already defined (useful when reloading this file)
-- if not configs.black then
--  configs.black = {
--    default_config = {
--      cmd = {'black'},
--      filetypes = {'python'},
--      root_dir = function(fname)
--        return lspconfig.util.find_git_ancestor(fname)
--      end,
--      settings = {},
--    },
--  }
-- end
-- call `setup()` to enable the FileType autocmd.
-- lspconfig.black.setup{}

-- pylsp, Python (https://github.com/python-lsp/python-lsp-server, `pip3 install python-lsp-server` or `LspInstall pylsp`)
lspconfig.pylsp.setup({
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        autopep8 = { enabled = false },
	black = { enabled = false },
        flake8 = { enabled = false },
	isort = { enabled = false, profile = 'black' },
        jedi_completion = { enabled = true },
        mccabe = { enabled = false },
        pycodestyle = { enabled = false },
        pylint = { enabled = false },
        pylsp_mypy = {
          -- https://github.com/python-lsp/pylsp-mypy#configuration
          enabled = false,
          report_progress = true,
          live_mode = true,
        },
        rope = { enabled = false },
        rope_autoimport = { enabled = true },  -- induces rope_autoimport.completions.enabled and rope_autoimport.code_actions.enabled
        yapf = { enabled = false },
      },
    },
  },
  capabilities = cmp_capabilities,
})

-- Cf. https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls.
lspconfig.jsonls.setup {
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
  },
  capabilities = cmp_capabilities,
} -- json (npm i -g vscode-langservers-extracted).

-- Special configuration for html (activation of snippet support).
-- Cf. https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html.
local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = html_capabilities,
}

-- Alternative installation for lemminx (for xml).
-- Can be normally installed with the mason.nvim plugin (:LspInstall).
-- lemminx requires setting `cmd`.
-- Installation script:
--   cd /tmp
--   git clone --recursive https://github.com/eclipse/lemminx.git
--   cd lemminx
--   ./mvnw clean package
--   mkdir ~/.local/share/lemminx
--   cp /tmp/lemminx/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar ~/.local/share/lemminx
--   cat << EOF > ~/.local/bin/xml-language-server-lemminx
--   #!/bin/bash
--
--   java -jar ~/.local/share/lemminx/org.eclipse.lemminx-uber.jar
--   EOF
--   chmod ug+x ~/.local/bin/xml-language-server-lemminx
-- lspconfig.lemminx.setup {
--   cmd = {"xml-language-server-lemminx"},
-- }

-- Servers without autostart.
-- pyright: Python, requires node >= 14 (npm i -g pyright)
lspconfig.pyright.setup {
  autostart = false,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = cmp_capabilities,
}
-- Python, alternative to pyright
lspconfig.jedi_language_server.setup {
  autostart = false,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = cmp_capabilities,
}


-- Change diagnostic symbols in the gutter.
-- Possible symbols (the first is the default vim sign):
-- error:  , ✗(\u2717), ✖
-- warning:  ,⚠ (\u26A0),  (\uf071),  (\uf529),  with Font Awesome.
-- Information: 
-- Hint: 
-- local signs = { Error = "✗ ", Warning = " ", Hint = " ", Information = " " }
-- for type, sign in pairs(signs) do
--   local hl = "LspDiagnosticsSign" .. type
--   vim.fn.sign_define(hl, { text = sign, texthl = hl, numhl = "" })
-- end

-- Show only the worst sign in the gutter.
-- From :help diagnostic-handlers-example.
local ns = vim.api.nvim_create_namespace("severe-diagnostics")

-- Get a reference to the original signs handler
local orig_signs_handler = vim.diagnostic.handlers.signs

-- Configure virtual text to show only error messages.
vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.ERROR,
    },
  },
  severity_sort = true,
})

-- Configure underline's min level.
-- vim.diagnostic.config({
--   underline = {
--     severity = {
--       min = vim.diagnostic.severity.ERROR,
--     },
--   },
-- })

-- Override the built-in signs handler
vim.diagnostic.handlers.signs = {
  show = function(_, bufnr, _, opts)
    -- Get all diagnostics from the whole buffer rather than just the
    -- diagnostics passed to the handler
    local diagnostics = vim.diagnostic.get(bufnr)

    -- Find the "worst" diagnostic per line
    local max_severity_per_line = {}
    for _, d in pairs(diagnostics) do
      local m = max_severity_per_line[d.lnum]
      if not m or d.severity < m.severity then
        max_severity_per_line[d.lnum] = d
      end
    end

    -- Pass the filtered diagnostics (with our custom namespace) to
    -- the original handler
    local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
    orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
  end,
  hide = function(_, bufnr)
    orig_signs_handler.hide(ns, bufnr)
  end,
}

-- Print diagnostics in the message area.
-- Cf. https://github.com/casonadams/simple-diagnostics.nvim for an alternative.
function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  opts = opts or {}

  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)

  local line_diagnostics = vim.diagnostic.get(0, { lnum = line_nr })
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
local icons = require "lspconfig_icons"
icons.setup()

