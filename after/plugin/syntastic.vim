" Syntastic configuration

" Use passive mode.
let g:syntastic_mode_map = {"mode": "passive"}

let g:syntastic_check_on_open = 0

" Don't run checker before exiting.
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_balloons = 1

" error: ✗(\u2717), ✖
" warning: ⚠ (\u26A0),  (\uf071) with Font Awesome.
" style:  (\uf5ad) with Font Awesome. Default: 'S>'
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = ""
let g:syntastic_style_warning_symbol = ""
let g:syntastic_style_error_symbol = ""

"let g:syntastic_cpp_compiler_options = ' -std=c++11'

let g:syntastic_yaml_checkers=['yamlxs']

" Force Python 3.
" Cf.  https://stackoverflow.com/questions/23177561/switch-python-version-for-vim-syntastic
" for further options.
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_exe = 'python3 -m flake8'
let g:syntastic_python_checkers = ['flake8']
