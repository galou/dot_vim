" Name of the project config file.
" Avoid '.nvimrc' or '.exrc' to prevent calling the script twice (once by
" NeoVim, the second time by the local_vimrc plugin.
" Note that lh-vim-lib can also use a .editorconfig file.
let g:local_vimrc = ['.vimrc_local.vim', '_vimrc_local.vim']
