"=============================================================================
" File:         ftplugin/python/python_snippets.vim               {{{1
" Author:       Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
"               <URL:http://github.com/LucHermitte>
" License:      GPLv3 with exceptions
"               <URL:http://github.com/LucHermitte/lh-brackets/License.md>
" Version:	2.2.3
let s:k_version = '2.2.3'
" Created:      21st Jan 2015
"------------------------------------------------------------------------
" Description:
"       Snippets of python Control Statements
"
"------------------------------------------------------------------------
" }}}1
"=============================================================================

" Buffer-local Definitions {{{1
" Avoid local reinclusion {{{2
if &cp || (exists("b:loaded_ftplug_python_snippets")
      \ && (b:loaded_ftplug_python_snippets >= s:k_version)
      \ && !exists('g:force_reload_ftplug_python_snippets'))
  finish
endif
let b:loaded_ftplug_python_snippets = s:k_version
let s:cpo_save=&cpo
set cpo&vim
" Avoid local reinclusion }}}2

" This must be loaded before continuing
"runtime! ftplugin/c/c_localleader.vim

"------------------------------------------------------------------------
" Local mappings {{{2

" Control statements {{{3
" Global Definitions {{{1
" Avoid global reinclusion {{{2
if &cp || (exists("g:loaded_ftplug_python_snippets")
      \ && (g:loaded_ftplug_python_snippets >= s:k_version)
      \ && !exists('g:force_reload_ftplug_python_snippets'))
  let &cpo=s:cpo_save
  finish
endif
let g:loaded_ftplug_python_snippets = s:k_version
" Avoid global reinclusion }}}2
"------------------------------------------------------------------------
" Functions {{{2
" Note: most filetype-global functions are best placed into
" autoload/«your-initials»/python/«python_snippets».vim
" Keep here only the functions are are required when the ftplugin is
" loaded, like functions that help building a vim-menu for this
" ftplugin.
" Functions }}}2
"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
