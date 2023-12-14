-- Configuration for https://github.com/nvim-neotest/neotest.
--
-- Neovim setup for init.lua and plugin development with full signature
-- help, docs and completion for the nvim lua API.

require('neodev').setup({
  library = {
    plugins = {
      'neotest',
      'nvim-dap-ui' ,
    },
    types = true,
  },
})
