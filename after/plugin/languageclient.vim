let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'latex': ['texlab'],
    \ 'python': ['~/.local/bin/pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }

let g:LanguageClient_useVirtualText = 'No'

" YouCompleteMe is better because it handles better unsaved buffers.
let g:LanguageClient_autoStart = 0
