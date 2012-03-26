" vim compiler file
" Compiler:		mbdyn
" Maintainer:   Gael Ecorchard
" Last Change:  2011-02-21

if exists("current_compiler")
  finish
endif
let current_compiler = "mbdyn"

let s:cpo_save = &cpo
set cpo-=C

setlocal makeprg=mbdyn\ %

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim
