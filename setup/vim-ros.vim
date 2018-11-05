" vim-ros configuration

let g:ros_make='current'
let g:ros_build_system='catkin-tools'

" vim-ros provides semantic completion for ROS filetypes via omni-complete
" functions. YouCompleteMe will automatically use them, however if you want
" the completion to be magically triggered as you type, you have to associate
" proper triggers with ROS filetypes in your .vimrc:
let g:ycm_semantic_triggers = {
            \   'roslaunch' : ['="', '$(', '/'],
            \   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
            \ }

" Show the Python2 warning on Fridays.
let g:vimros_disable_python2_warning = 1
let weekday=system("echo -n $(LANG=EN_us date +%A)")
if weekday == "Friday"
    let g:vimros_disable_python2_warning = 0
endif
