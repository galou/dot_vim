" Syntastic configuration

let g:syntastic_check_on_open = 1

" Don't run checker before exiting.
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_balloons = 1

let g:syntastic_error_symbol = "\u2717"
let g:syntastic_warning_symbol = "\u26A0"

"let g:syntastic_cpp_compiler_options = ' -std=c++11'

let g:syntastic_yaml_checkers=['yamlxs']

" As of 2018-02-26, pylint or python seems to be buggy and doesn't recognize
" variables passed as function arguments as know.
let g:syntastic_python_checkers = ['pyflakes']

