if has("autocmd")
  au BufRead,BufNewFile *.dgibi  setlocal filetype=gibiane
  au BufRead,BufNewFile *.dgibi  compiler castem
  au BufRead,BufNewFile *.proc   setlocal filetype=gibiane
endif
