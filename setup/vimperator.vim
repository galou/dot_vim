" Enable 'HUMAN' mapping.
" Key 	Function                                             	    API
" F5 	When debugging, continue. Otherwise start debugging. 	    vimspector#Continue()
" F3 	Stop debugging. 	                                        vimspector#Stop()
" F4 	Restart debugging with the same configuration. 	            vimspector#Restart()
" F6 	Pause debugee. 	                                            vimspector#Pause()
" F9 	Toggle line breakpoint on the current line. 	            vimspector#ToggleBreakpoint()
" F8 	Add a function breakpoint for the expression under cursor 	vimspector#AddFunctionBreakpoint( '<cexpr>' )
" F10 	Step Over 	                                                vimspector#StepOver()
" F11 	Step Into 	                                                vimspector#StepInto()
" F12 	Step out of current function scope 	                        vimspector#StepOut()
let g:vimspector_enable_mappings = 'HUMAN'
