" Vim plugin for viewing odt files.
" Adapted by: Petri Jooste
" http://cedric.bosdonnat.free.fr/wordpress/?p=243
" Last Change: 2009-04-19
"
"
" Exit quickly when:
" - this plugin was already loaded
" - when 'compatible' is set
" - some autocommands are already taking care of compressed files

if exists("loaded_odt") || &cp || exists("#BufReadPre#*.odt")
	finish
endif
let loaded_odt = 1

augroup odt
	" Remove all odt autocommands
	au!

	" Enable viewing odt files.
	" The functions are defined in autoload/odt.vim.
	"
	" Set binary mode before reading the file.
	autocmd BufReadPre,FileReadPre *.odt,*.ods setlocal bin
	autocmd BufReadPost,FileReadPost *.odt call odt#read("odt2txt")
	autocmd BufWritePre,FileWritePre *.odt call odt#prewrite("writetxt")
	autocmd BufWritePost,FileWritePost *.odt call odt#postwrite("writetxt")
	autocmd FileAppendPre *.odt call odt#prewrite("writetxt")
	autocmd FileAppendPost *.odt call odt#postwrite("writetxt")
augroup END
