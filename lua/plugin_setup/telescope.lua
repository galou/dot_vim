require('telescope').setup({

  defaults = {
    -- path_display = {
    --   shorten = 1,  -- Shorten directory names leaving 1 letter.
    -- },
    path_display = function(opts, path)
      local tail = require('telescope.utils').path_tail(path)
      return string.format("%s (%s)", tail, path)
    end,
  },

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
