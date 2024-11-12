local api = vim.api

-- Close some windows with "q".
local close_with_q = api.nvim_create_augroup('close_with_q', { clear = true })
api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'help', 'startuptime', 'qf', 'fugitive', 'fugitiveblame'},
    command = [[nnoremap <buffer><silent> q :close<CR>]],
    group = close_with_q,
  }
)
api.nvim_create_autocmd(
  'FileType',
  {
    pattern = 'man',
    command = [[nnoremap <buffer><silent> q :quit<CR>]],
    group = close_with_q,
  }
)

-- Activate Copilot suggestion.
local copilot_suggestion = api.nvim_create_augroup('copilot_suggestion', {clear = true})
api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'cpp', 'gitcommit', 'lua', 'python', 'rust'},
    command = 'Copilot suggestion',
    group = copilot_suggestion,
  }
)

-- No line number and other "disturbances" in the special buffers.
local special_buffer_config = api.nvim_create_augroup('special_buffer_config', {clear = true})
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'fugitive'},
    group = special_buffer_config,
    callback = function()
      print('fugitive://.*')
      vim.wo.number = false
      vim.wo.relativenumber = false
      vim.wo.signcolumn = 'no'
      vim.wo.foldcolumn = '0'
      vim.wo.colorcolumn = ''
      vim.wo.cursorline = true
      vim.wo.cursorcolumn = false
      vim.wo.list = false
      vim.wo.spell = false
      vim.wo.wrap = false
      vim.wo.linebreak = false
      vim.wo.breakindent = false
    end,
  }
)

local no_mini_cursorword = api.nvim_create_augroup('no_mini_cursorword', {clear = true})
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'markdown', 'rst', 'txt'},
    group = no_mini_cursorword,
    callback = function()
      vim.b.minicursorword_disable = true
    end,
  }
)
