if expand("%:e") == "h"
	finish
endif
syn region myFold start="^-" end="^}" transparent fold
syn region myFold start="^+" end="^}" transparent fold
syn sync fromstart
setl foldmethod=syntax
