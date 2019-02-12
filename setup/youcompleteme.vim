" YouCompleteMe configuration

let g:ycm_filepath_completion_use_working_dir = 1

" Instead of <C-Space>.
" let g:ycm_key_invoke_completion = '<C-O>'

let g:ycm_autoclose_preview_window_after_completion = 1

" Whitelisted configuration files.
let g:ycm_extra_conf_globlist = ['/home/gael/ros_indigo_ws/*']

execute "let g:ycm_global_ycm_extra_conf = '".config_dir."/default_ycm_extra_conf.py'"

" Possible symbols:
" error: ✗(\u2717), ✖
" warning: ⚠ (\u26A0),  (\uf071) with Font Awesome.
let g:ycm_error_symbol = "✗"
let g:ycm_warning_symbol = ""
