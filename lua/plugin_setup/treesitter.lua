-- Configuration for https://github.com/nvim-treesitter/nvim-treesitter.

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    'bash',
    'bibtex',
    'c',
    'cmake',
    'cpp',
    'dockerfile',
    'dot',
    'dtd',
    'go',
    'html',
    'json',
    'json5',
    'julia',
    'latex',
    'lua',
    'make',
    'markdown',
    'ninja',
    'python',
    'regex',
    'rst',
    'rust',
    'toml',
    'vim',
    'vimdoc',
    'yaml',
    'xml',
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = false,  -- Doesn't work well.
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_decremental = 'grm',
      node_incremental = 'grn',
      scope_incremental = 'grc',
    },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },

  nt_cpp_tools = {
    enable = true,
    preview = {
      quit = 'q', -- optional keymapping for quit preview
      accept = '<tab>' -- optional keymapping for accept preview
    },
  },

}

-- Use the html parser for xml files.
-- vim.treesitter.language.register('html', 'xml')

-- Add support for the XML syntax.
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.xml = {
  install_info = {
    url = '~/04-sources/tree-sitter/tree-sitter-xml/tree-sitter-xml', -- local path or git repo
    files = {'src/parser.c', 'src/scanner.c'}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "master", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  -- filetype = "xml", -- if filetype does not match the parser name
}
