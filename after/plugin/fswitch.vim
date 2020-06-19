" First h then hpp, whereas the default is the inverse.
autocmd BufEnter *.cpp let b:fswitchdst = 'h,hpp'

" `reg:|src/\(.*\)/src|src/\1/include|` for some/path/src/something/{src,include}/package_name.
" `reg:|src/\(.*\)/\([^w]\+\)/src|src/\1/\2/include/\2|` for some/path/src/something/package_name/{src,include/package_name}.
autocmd BufEnter *.cpp let b:fswitchlocs = 'reg:|src/\(.*\)/\([^w]\+\)/src|src/\1/\2/include/\2|,reg:|src|include|,reg:|src|include/*|'

function! s:fs_header_above()
    let ext = expand('%:e')
    if winnr('$') == 1
        " If there is only one window.
        " TODO: detect only the number of horizontal splits.
        if ext == 'h' || ext == 'hpp'
            FSSplitBelow
        else
            FSSplitAbove
        endif
    else
        if ext == 'h' || ext == 'hpp'
            FSBelow
        else
            FSAbove
        endif
    endif
endfunction

command! FSHeaderAbove call s:fs_header_above()
