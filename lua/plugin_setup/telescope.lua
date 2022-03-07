require('telescope').setup({

  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },

  extensions = {

    frecency = {
      ignore_patterns = {'*.git/*', '*/tmp/*'},
      workspaces = {
        ['galactic'] = '/opt/ros/galactic',
      },
    },

    tele_tabby = {
      use_highlighter = true,
    },

    lsp_handlers = {
      code_action = {
        telescope = require('telescope.themes').get_dropdown({}),
      },
    },

  },
})
