-- Configuration for refactoring-nvim plugin
-- https://github.com/ThePrimeagen/refactoring.nvim.git

local refactoring = require('refactoring')

refactoring.setup({
    prompt_func_return_type = {
        go = false,
        java = false,

        cpp = true,
        c = true,
        h = false,
        hpp = false,
        cxx = false,
    },
    prompt_func_param_type = {
        go = false,
        java = false,

        cpp = true,
        c = true,
        h = false,
        hpp = false,
        cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
})
