" Vim autoload file for viewing text from odt files.
" This version tries to keep the extracted text files if the user wants to
" modify and save them as text.
" Adapted by: Petri Jooste
" http://cedric.bosdonnat.free.fr/wordpress/?p=243
" Last Change: 2009-04-19

" These functions are used by the odt plugin.

" Function to check that executing "cmd [-f]" works.
" The result is cached in s:have_"cmd" for speed.
fun s:check(cmd)
	let name = substitute(a:cmd, '\(\S*\).*', '\1', '')
	if !exists("s:have_" . name)
		let e = executable(name)
		if e < 0
			let r = system(name . " --version")
			let e = (r !~ "not found" && r != "")
		endif
		exe "let s:have_" . name . "=" . e
	endif
	exe "return s:have_" . name
endfun

" After reading odt file: Uncompress and extract text into buffer with "cmd"
fun odt#read(cmd)
	" don't do anything if the cmd is not supported
	if !s:check(a:cmd)
		return
	endif

	" make 'patchmode' empty, we don't want a copy of the written file
	let pm_save = &pm
	set pm=
	" remove 'a' and 'A' from 'cpo' to avoid the alternate file changes
	let cpo_save = &cpo
	set cpo-=a cpo-=A
	" set 'modifiable'
	let ma_save = &ma
	setlocal ma
	" Reset 'foldenable', otherwise line numbers get adjusted.
	if has("folding")
		let fen_save = &fen
		setlocal nofen
	endif

	" when filtering the whole buffer, it will become empty
	let empty = line("'[") == 1 && line("']") == line("$")
	let tmp = tempname()
	let tmpe = tmp . "." . expand("%:e")
	let tmptxt = tmp . ".txt"
	if exists('*fnameescape')
		let tmp_esc = fnameescape(tmp)
		let tmptxt_esc = fnameescape(tmptxt)
		let tmpe_esc = fnameescape(tmpe)
	else
		let tmp_esc = escape(tmp, ' ')
		let tmptxt_esc = escape(tmptxt, ' ')
		let tmpe_esc = escape(tmpe, ' ')
	endif
	" write the just read lines to a temp file "'[,']w tmp.odt"
	"
	" --uncomment to debug -- echoerr "Trying: silent '[,']w " . tmpe_esc
	execute "silent '[,']w " . tmpe_esc
	" uncompress the temp file: call system("gzip -dn tmp.gz")
	"call system(a:cmd . " " . s:escape(tmpe))
	" --uncomment to debug -- echoerr "Trying: " . a:cmd . " " . s:escape(tmpe) . " > " . tmptxt
	call system(a:cmd . " " . s:escape(tmpe) . " > " . tmptxt )
	if !filereadable(tmptxt)
		" uncompress didn't work! Keep the original file then.
		echoerr "Error: Could not extract text from odt file"
		let ok = 0
	else
		let ok = 1
		" delete the compressed lines; remember the line number
		let l = line("'[") - 1
		if exists(":lockmarks")
			lockmarks '[,']d _
		else
			'[,']d _
		endif
		" read in the uncompressed lines "'[-1r tmptxt"
		" Use ++edit if the buffer was empty, keep the 'ff' and 'fenc' options.
		setlocal nobin
		execute "silent r " . tmptxt_esc
		" if buffer became empty, delete trailing blank line
		if empty
			silent $delete _
			1
		endif
		" delete the temp file and the used buffers
		call delete(tmp)
		silent! exe "bwipe " . tmp_esc
		silent! exe "bwipe " . tmpe_esc
	endif

	" Restore saved option values.
	let &pm = pm_save
	let &cpo = cpo_save
	let &l:ma = ma_save
	if has("folding")
		let &l:fen = fen_save
	endif

	" When uncompressed the whole buffer, do autocommands
	if ok && empty
		if exists('*fnameescape')
			let fname = fnameescape(expand("%:r"))
		else
			let fname = escape(expand("%:r"), " \t\n*?[{`$\\%#'\"|!= 8
			"execute "doau BufReadPost " . fname
			execute "silent! doau BufReadPost " . fname
		endif
	endif
endfun

" find a file name for the extracted text file. Use "name" without an
" extension if possible. Otherwise use a weird name to avoid overwriting an
" existing file.
fun s:tempname(name)
	let fn = fnamemodify(a:name, ":r")
	if !filereadable(fn) && !isdirectory(fn)
		return fn
	endif
	return fnamemodify(a:name, ":p:h") . "/X~=@l9q5"
endfun

fun s:escape(name)
	" shellescape() was added by patch 7.0.111 of the gzip.vim plugin
	if exists("*shellescape")
		return shellescape(a:name)
	endif
	return "'" . a:name . "'"
endfun

" Writing the file cannot happen to the original.odt , so a new file named
" original.odt.txt will be created as follows:
" Before writing keep the unmodified file aside by renaming
" After writing rename the written file to original.odt.txt
" and rename the kept file to original.odt
fun odt#prewrite(cmd)
	" cmd is a dummy command - it is not used as such
	let nameorig = expand("%:p")
	let namekeep = nameorig . ".keep"
	" --uncomment to debug -- echoerr "Trying to rename " . nameorig . " -> " . namekeep
	echoerr "Trying to rename " . nameorig . " -> " . namekeep
	call rename(nameorig, namekeep)
endfun

fun odt#postwrite(cmd)
	" cmd is a dummy command - it is not used as such
	let nameorig = expand("%:p")
	let nametxt = nameorig . ".txt"
	let namekeep = nameorig . ".keep"
	" --uncomment to debug -- echoerr "Trying to rename " . nameorig . " -> " . namekeep
	call rename(nameorig, nametxt)
	call rename(namekeep, nameorig)
endfun 
