" unite.vim configuration

call unite#custom#profile('buffer', 'context', {
		\   'start_insert' : 1
		\ })

" Use silversearch-ag instead of grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup --no-numbers'

" Grep options
"let g:unite_source_grep_default_opts = ''
"let g:unite_source_grep_recursive_opt = '-R'
