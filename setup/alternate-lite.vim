" First h then hpp, whereas the default is the inverse.
let g:fswitchdst = 'h,hpp'

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
