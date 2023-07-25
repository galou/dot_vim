-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {noremap=true, silent=true, buffer=bufnr}
  local set = vim.keymap.set
  set('n', '<leader>K', vim.lsp.buf.hover, opts)
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

require('clangd_extensions').setup {
    server = {
        -- options to pass to nvim-lspconfig
        -- i.e. the arguments to require("lspconfig").clangd.setup({})
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        cmd = {
            'clangd',
            '--background-index',
            '--header-insertion=iwyu',  -- Include what you use.
            '--header-insertion-decorators',  -- Add a circle symbol in the completion list.
        },
        flags = {
          debounce_text_changes = 150,
        },
        on_attach = on_attach,
    },
    extensions = {
        -- defaults:
        -- Automatically set inlay hints (type hints)
        autoSetHints = vim.fn.has('nvim-0.10') ~= 1,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
            inline = vim.fn.has('nvim-0.10') == 1,
            -- Options other than `highlight' and `priority' only work
            -- if `inline' is disabled
            -- Only show inlay hints for the current line
            only_current_line = false,
            -- Event which triggers a refersh of the inlay hints.
            -- You can make this 'CursorMoved' or 'CursorMoved,CursorMovedI' but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = 'CursorHold',
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = ' ',
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = '⟹ ',
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
            -- The color of the hints
            highlight = 'Comment',
            -- The highlight group priority for extmark
            priority = 100,
        },
        ast = {
            --[[ These are unicode, should be available in any font
            -- role_icons = {
            --      type = '🄣',
            --      declaration = '🄓',
            --      expression = '🄔',
            --      statement = ';',
            --      specifier = '🄢',
            --      ['template argument'] = '🆃',
            -- },
            -- kind_icons = {
            --     Compound = '🄲',
            --     Recovery = '🅁',
            --     TranslationUnit = '🅄',
            --     PackExpansion = '🄿',
            --     TemplateTypeParm = '🅃',
            --     TemplateTemplateParm = '🅃',
            --     TemplateParamObject = '🅃',
            -- },
            --]]
            -- These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = '',
                declaration = '',
                expression = '',
                specifier = '',
                statement = '',
                ['template argument'] = '',
            },

            kind_icons = {
                Compound = '',
                Recovery = '',
                TranslationUnit = '',
                PackExpansion = '',
                TemplateTypeParm = '',
                TemplateTemplateParm = '',
                TemplateParamObject = '',
            },

            highlights = {
                detail = 'Comment',
            },
        },
        memory_usage = {
            border = 'none',
        },
        symbol_info = {
            border = 'none',
        },
    },
}
