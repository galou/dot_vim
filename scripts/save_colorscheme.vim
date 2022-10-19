" Save the current highlights, either all of them or only the ones in s:names.
" Cf. https://stackoverflow.com/a/59732573/1749379.

" If g:save_all_highlights is 1, save all highlight colors known by vim,
" otherwise save the one listed in s:names below.
if exists('g:save_all_highlights')
  let s:save_all_highlights = g:save_all_highlights
else
  let s:save_all_highlights = 0
endif

" List of hightlights from
" https://github.com/ggalindezb/vim_colorscheme_template/blob/master/template.vim
" plus highlights for diff files
" https://github.com/ggalindezb/vim_colorscheme_template/issues/1.
let s:names = [
      \ 'Normal',
      \ 'Cursor',
      \ 'CursorLine',
      \ 'LineNr',
      \ 'CursorLineNR',
      \ 'CursorColumn',
      \ 'FoldColumn',
      \ 'SignColumn',
      \ 'Folded',
      \ 'VertSplit',
      \ 'ColorColumn',
      \ 'TabLine',
      \ 'TabLineFill',
      \ 'TabLineSel',
      \ 'Directory',
      \ 'Search',
      \ 'IncSearch',
      \ 'StatusLine',
      \ 'StatusLineNC',
      \ 'WildMenu',
      \ 'Question',
      \ 'Title',
      \ 'ModeMsg',
      \ 'MoreMsg',
      \ 'MatchParen',
      \ 'Visual',
      \ 'VisualNOS',
      \ 'NonText',
      \ 'Todo',
      \ 'Underlined',
      \ 'Error',
      \ 'ErrorMsg',
      \ 'WarningMsg',
      \ 'Ignore',
      \ 'SpecialKey',
      \ 'Constant',
      \ 'String',
      \ 'StringDelimiter',
      \ 'Character',
      \ 'Number',
      \ 'Boolean',
      \ 'Float',
      \ 'Identifier',
      \ 'Function',
      \ 'Statement',
      \ 'Conditional',
      \ 'Repeat',
      \ 'Label',
      \ 'Operator',
      \ 'Keyword',
      \ 'Exception',
      \ 'Comment',
      \ 'Special',
      \ 'SpecialChar',
      \ 'Tag',
      \ 'Delimiter',
      \ 'SpecialComment',
      \ 'Debug',
      \ 'PreProc',
      \ 'Include',
      \ 'Define',
      \ 'Macro',
      \ 'PreCondit',
      \ 'Type',
      \ 'StorageClass',
      \ 'Structure',
      \ 'Typedef',
      \ 'DiffAdd',
      \ 'DiffChange',
      \ 'DiffDelete',
      \ 'DiffText',
      \ 'diffAdded',
      \ 'diffChanged',
      \ 'diffRemoved',
      \ 'diffLine',
      \ 'Pmenu',
      \ 'PmenuSel',
      \ 'PmenuSbar',
      \ 'PmenuThumb',
      \ 'SpellBad',
      \ 'SpellCap',
      \ 'SpellLocal',
      \ 'SpellRare',
      \]

" Preamble.
call append('$', printf('" Set ''background'' back to the default.  The value can''t always be estimated'))
call append('$', printf('" and is then guessed.'))
call append('$', printf('hi clear Normal'))
call append('$', printf('set background&'))
call append('$', printf(''))
call append('$', printf('" Remove all existing highlighting and set the defaults.'))
call append('$', printf('hi clear'))
call append('$', printf(''))
call append('$', printf('" Load the syntax highlighting defaults, if it''s enabled.'))
call append('$', printf('if exists("syntax_on")'))
call append('$', printf('  syntax reset'))
call append('$', printf('endif'))
call append('$', printf(''))

if (s:save_all_highlights == 1)
  let s:names = getcompletion('', 'highlight')
endif

for s:name in s:names
  let s:id = hlID(s:name)
  let s:tid = synIDtrans(s:id)

  if (s:id != s:tid)
    call append('$', printf('hi link %s %s', s:name, synIDattr(s:tid, 'name')))
  else
    let s:cterm = 'none'
    if (synIDattr(s:id, 'bold', 'cterm') == '1')
      let s:cterm = 'bold'
    elseif (synIDattr(s:id, 'italic', 'cterm') == '1')
      let s:cterm = 'italic'
    elseif (synIDattr(s:id, 'reverse', 'cterm') == '1')
      let s:cterm = 'reverse'
    elseif (synIDattr(s:id, 'inverse', 'cterm') == '1')
      let s:cterm = 'reverse'
    elseif (synIDattr(s:id, 'standout', 'cterm') == '1')
      let s:cterm = 'standout'
    elseif (synIDattr(s:id, 'underline', 'cterm') == '1')
      let s:cterm = 'underline'
    elseif (synIDattr(s:id, 'undercurl', 'cterm') == '1')
      let s:cterm = 'undercurl'
    elseif (synIDattr(s:id, 'strikethrough', 'cterm') == '1')
      let s:cterm = 'strikethrough'
    endif
    if (synIDattr(s:id, 'fg', 'cterm') != '')
      let s:ctermfg = synIDattr(s:id, 'fg', 'cterm')
    else
      let s:ctermfg = 'none'
    endif
    if (synIDattr(s:id, 'bg', 'cterm') != '')
      let s:ctermbg = synIDattr(s:id, 'bg', 'cterm')
    else
      let s:ctermbg = 'none'
    endif
    call append('$', printf('hi %s cterm=%s ctermfg=%s ctermbg=%s', s:name, s:cterm, s:ctermfg, s:ctermbg))
  endif
endfor

call append('$', printf(''))
call append('$', 'let g:colors_name = ''autosaved''')

