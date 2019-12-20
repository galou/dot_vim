" From iijo.vim.

" This is the adapted default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

hi DiffAdd      cterm=bold    ctermfg=221   ctermbg=none
hi DiffChange   cterm=none    ctermfg=none  ctermbg=none
hi DiffDelete   cterm=none    ctermfg=236   ctermbg=none
hi DiffText     cterm=bold    ctermfg=221   ctermbg=none

hi SpellBad     cterm=none    ctermfg=247   ctermbg=none
"hi MatchParen   cterm=bold    ctermfg=245   ctermbg=none
hi MatchParen   cterm=bold   ctermbg=none

" ctermbg=236 is also not bad.
hi Search ctermbg=132

let g:colors_name = "gaels"

" vim: sw=2
