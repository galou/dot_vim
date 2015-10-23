" UltiSnips configuration

" UltiSnips compatibility with YouCompleteMe
" Does not work!
let g:UltiSnipsExpandTrigger="<C-E>"
" let g:UltiSnipsJumpForwardTrigger="<C-J>"
" let g:UltiSnipsJumpBackwardTriggER="<C-K>"

" According to
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-15451411
" this is supposed to help with the incompatilibity with YouCompleteMe.
" Does not work!
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-p>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
" This could be activated with this:
"exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<CR>"
"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<CR>"
"inoremap <C-O> <C-R>=g:UltiSnips_Complete()<CR>

let g:ultisnips_python_quoting_style = "single"
let g:ultisnips_python_triple_quoting_style = "double"
