if exists('b:current_syntax')
    finish
endif
let b:current_syntax = "csv"

syn match csvFileName       /^[^,]\+/
syn match csvSize           /,\d\+,/ms=s+1,me=e-1
syn match csvChecksum       /,\x\{8},/ms=s+1,me=e-1
syn match csvPath           /,[/\\].\{-1,}[/\\],/ms=s+1,me=e-1
syn match csvComment        /,[^,]\+$/

hi def link csvFileName     Label
hi def link csvSize         Number
hi def link csvChecksum     Constant
hi def link csvPath         PreProc
hi def link csvComment      SpecialKey
