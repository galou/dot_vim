-- treesitter-context shows the context (e.g. name of the function we are
-- currently in) at the top of the screen.

require('treesitter-context').setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    min_window_height = 20, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
}
