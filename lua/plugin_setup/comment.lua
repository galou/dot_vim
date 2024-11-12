-- Configuration for https://github.com/numToStr/Comment.nvim.git.

require('Comment').setup({
    -- Add a space b/w comment and the line
    ---@type boolean
    padding = true,

    -- Line which should be ignored while comment/uncomment
    -- Example: Use '^$' to ignore empty lines
    ---@type string Lua regex
    ignore = nil,

    -- Whether to create basic (operator-pending) and extra mappings for NORMAL/VISUAL mode
    ---@type table
    mappings = {
        ---operator-pending mapping
        ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
        basic = true,
        ---extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extra = true,
    },

    -- Toggle mappings in NORMAL mode
    ---@type table
    toggler = {
        ---line-comment toggle
        line = 'gcc',
        ---block-comment toggle
        block = 'gbc',
    },

    -- Operator-pending mappings in NORMAL and VISUAL mode
    ---@type table
    opleader = {
        ---line-comment opfunc mapping
        line = 'gc',
        ---block-comment opfunc mapping
        block = 'gb',
    },

    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },

    ---Pre-hook, called before commenting the line
    ---@type function|nil
    pre_hook = nil,

    ---Post-hook, called after commenting is done
    ---@type function|nil
    post_hook = nil,
})
