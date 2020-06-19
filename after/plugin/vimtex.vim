" Use neovim-remote https://github.com/lervag/vimtex/wiki/introduction#neovim
" Use `nvr --remote-silent %f -c %l` in the viewer application for backward
" search.
if has("nvim")
    let g:vimtex_compiler_progname = 'nvr'
endif

" Use zathura for its support for backward search.
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
