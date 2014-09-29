setlocal linebreak
setlocal showbreak=⏎\ 
setlocal spell
map <buffer> j gj
map <buffer> k gk
imap <buffer> OB <ESC>gjli
imap <buffer> OA <ESC>gkli

" atp configuration
let b:atp_Viewer = 'evince'

" Reactivate Powerline statusline
set statusline=%!pyeval('powerline.statusline(4)')
