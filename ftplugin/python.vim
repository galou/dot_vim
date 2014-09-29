" Python specific settings.

" tabstop as 4 spaces
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

setlocal formatoptions-=at
setlocal formatoptions+=croql
setlocal textwidth=79
setlocal foldlevel=0
setlocal autoindent
setlocal smarttab

" I use a custom mapping for ipython (cf. ipy.vim).
let g:ipy_perform_mappings = 0

" python-mode options
let g:pymode_options_other=0
let g:pymode_lint_checker="pyflakes"

