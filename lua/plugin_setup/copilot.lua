-- Configuration for zbirenbaum/copilot.lua.

require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,  -- Disable if interferes with copilot-cmp.
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = "<M-w>",
      accept_line = "<M-e>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    cpp = true,
    cvs = false,
    gitcommit = true,
    gitrebase = false,
    help = false,
    hgcommit = false,
    lua = true,
    markdown = true,
    rust = true,
    svn = false,
    yaml = true,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
