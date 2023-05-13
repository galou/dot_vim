local api = vim.api

-- Close some windows with "q".
local close_with_q = api.nvim_create_augroup('close_with_q', { clear = true })
api.nvim_create_autocmd(
  'FileType',
  {
    pattern = { 'help', 'startuptime', 'qf' },
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
local copilot_suggestion = api.nvim_create_augroup('copilot_suggestion', { clear = true })
api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'cpp', 'lua', 'python'},
    command = 'Copilot suggestion',
    group = copilot_suggestion,
  }
)
