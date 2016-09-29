" unite.vim configuration

" Automatically start insert mode (i.e. filter mode) with Unite buffer.
" Doesn't actually work as of 2015-09-14.
call unite#custom#profile('buffer', 'context', {
			\   'start_insert' : 1
			\ })

" Use silversearch-ag instead of grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
			\ '--line-numbers --nocolor --nogroup --ignore ' .
			\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
" ag is recursive by default.
let g:unite_source_grep_recursive_opt = ''

" Grep options
"These options were deactivated because they caused problem when jumping.
"let g:unite_source_grep_default_opts = ''
"let g:unite_source_grep_recursive_opt = '-R'

" Let the Unite window open on grep.
" cf. https://github.com/Shougo/unite.vim/issues/426.
call unite#custom#profile('source/grep,source/gtags', 'context', {
			\'no_quit' : 1
			\ })
