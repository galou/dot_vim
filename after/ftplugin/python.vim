setlocal nonumber

" <C-s> is overwritten by ipython plugin.
" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" I use a custom mapping for ipython (cf. ipy.vim).
map <buffer> <silent> <F5> :python run_this_file()<CR>
map <buffer> <silent> <F9> :python run_this_line()<CR>
map <buffer> <silent> <S-F9> :python run_these_lines()<CR>
map <buffer> <silent> <leader>d :py get_doc_buffer()<CR>
map <buffer> <silent> <leader>s :py if update_subchannel_msgs(force=True): echo("vim-ipython shell updated",'Operator')<CR>
map <buffer> <silent> <C-F9> :python toggle_reselect()<CR>
imap <buffer> <F5> <C-O><F5>
imap <buffer> <F9> <C-O><F9>
map <buffer> <silent> <F12> :python run_command("plt.show()")<cr>
imap <buffer> <silent> <F12> :python run_command("plt.show()")<cr>
map <buffer> <silent> <S-F12> :python run_command("plt.close('all')")<cr>
imap <buffer> <silent> <S-F12> :python run_command("plt.close('all')")<cr>

"pi custom
"map <silent> <C-Return> :python run_this_file()<CR>
"map <silent> <C-s> :python run_this_line()<CR>
"imap <silent> <C-s> <C-O>:python run_this_line()<CR>
"map <silent> <M-s> :python dedent_run_this_line()<CR>
"vmap <silent> <C-S> :python run_these_lines()<CR>
"vmap <silent> <M-s> :python dedent_run_these_lines()<CR>
"map <silent> <M-c> I#<ESC>
"vmap <silent> <M-c> I#<ESC>
"map <silent> <M-C> :s/^\([ \t]*\)#/\1/<CR>
"vmap <silent> <M-C> :s/^\([ \t]*\)#/\1/<CR>

