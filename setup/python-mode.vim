" Python-mode configuration

" Python-mode completion is incompatible with YouCompleteMe
" Completion is done with YouCompleteMe
let g:pymode_rope_completion = 0

"let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_checkers = []

" Let syntastic do the syntax checking.
let g:pymode_lint_on_write = 0
