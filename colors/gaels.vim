" From iijo.vim.

" This is the adapted default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set background&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

hi Normal cterm=none ctermfg=none ctermbg=none
hi Cursor cterm=none ctermfg=none ctermbg=none
hi CursorLine cterm=underline ctermfg=none ctermbg=none
hi LineNr cterm=none ctermfg=130 ctermbg=none
hi CursorLineNR cterm=none ctermfg=130 ctermbg=none
hi CursorColumn cterm=none ctermfg=none ctermbg=7
hi FoldColumn cterm=none ctermfg=4 ctermbg=248
hi SignColumn cterm=none ctermfg=4 ctermbg=248
hi Folded cterm=none ctermfg=4 ctermbg=248
hi VertSplit cterm=reverse ctermfg=none ctermbg=none
hi ColorColumn cterm=none ctermfg=none ctermbg=224
hi TabLine cterm=underline ctermfg=0 ctermbg=7
hi TabLineFill cterm=reverse ctermfg=none ctermbg=none
hi TabLineSel cterm=bold ctermfg=none ctermbg=none
hi Directory cterm=none ctermfg=4 ctermbg=none
hi Search cterm=none ctermfg=none ctermbg=132
hi IncSearch cterm=reverse ctermfg=none ctermbg=none
hi StatusLine cterm=bold ctermfg=none ctermbg=none
hi StatusLineNC cterm=reverse ctermfg=none ctermbg=none
hi WildMenu cterm=none ctermfg=0 ctermbg=11
hi Question cterm=none ctermfg=2 ctermbg=none
hi Title cterm=none ctermfg=5 ctermbg=none
hi ModeMsg cterm=bold ctermfg=none ctermbg=none
hi MoreMsg cterm=none ctermfg=2 ctermbg=none
hi MatchParen cterm=bold ctermfg=none ctermbg=none
hi Visual cterm=none ctermfg=none ctermbg=7
hi VisualNOS cterm=none ctermfg=none ctermbg=none
hi NonText cterm=none ctermfg=12 ctermbg=none
hi Todo cterm=none ctermfg=0 ctermbg=11
hi Underlined cterm=underline ctermfg=5 ctermbg=none
hi Error cterm=none ctermfg=15 ctermbg=9
hi ErrorMsg cterm=none ctermfg=15 ctermbg=1
hi WarningMsg cterm=none ctermfg=1 ctermbg=none
hi Ignore cterm=none ctermfg=15 ctermbg=none
hi SpecialKey cterm=none ctermfg=4 ctermbg=none
hi Constant cterm=none ctermfg=13 ctermbg=none
hi link String Constant
hi StringDelimiter cterm=none ctermfg=none ctermbg=none
hi link Character Constant
hi link Number Constant
hi link Boolean Constant
hi link Float Constant
hi Identifier cterm=none ctermfg=6 ctermbg=none
hi link Function Identifier
hi Statement cterm=none ctermfg=130 ctermbg=none
hi link Conditional Statement
hi link Repeat Statement
hi link Label Statement
hi link Operator Statement
hi link Keyword Statement
hi link Exception Statement
hi Comment cterm=none ctermfg=4 ctermbg=none
hi Special cterm=none ctermfg=5 ctermbg=none
hi link SpecialChar Special
hi link Tag Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
hi PreProc cterm=none ctermfg=5 ctermbg=none
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi Type cterm=none ctermfg=2 ctermbg=none
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi DiffAdd cterm=bold ctermfg=221 ctermbg=none
hi DiffChange cterm=none ctermfg=none ctermbg=none
hi DiffDelete cterm=none ctermfg=236 ctermbg=none
hi DiffText cterm=bold ctermfg=221 ctermbg=none
hi diffAdded cterm=none ctermfg=none ctermbg=none
hi diffChanged cterm=none ctermfg=none ctermbg=none
hi diffRemoved cterm=none ctermfg=none ctermbg=none
hi diffLine cterm=none ctermfg=none ctermbg=none
hi Pmenu cterm=none ctermfg=0 ctermbg=225
hi PmenuSel cterm=none ctermfg=0 ctermbg=7
hi PmenuSbar cterm=none ctermfg=none ctermbg=248
hi PmenuThumb cterm=none ctermfg=none ctermbg=0
hi SpellBad cterm=none ctermfg=247 ctermbg=none
hi SpellCap cterm=none ctermfg=none ctermbg=81
hi SpellLocal cterm=none ctermfg=none ctermbg=14
hi SpellRare cterm=none ctermfg=none ctermbg=225

let g:colors_name = "gaels"

" vim: sw=2
