" vim compiler file
" Compiler:		castem
" Maintainer:   Gael Ecorchard
" Last Change:  2010-10-08

if exists("current_compiler")
  finish
endif
let current_compiler = "castem"

let s:cpo_save = &cpo
set cpo-=C

setlocal makeprg=castem10\ %

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim
