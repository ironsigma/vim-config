" Vim syntax file
"
if exists("b:current_syntax")
  finish
endif

syn case ignore

" Flags
syn keyword bc2keyword attrib beep collapse compare copy copyto criteria delete
syn keyword bc2keyword file-report filter folder-report load log move option
syn keyword bc2keyword select snapshot sync touch expand rename
syn keyword bc2dep     report


" Region Matching
syn region fscString            start="\"" end="\""


" Color it!
hi def link bc2keyword      Label
hi def link bc2dep          Error
hi def link fscString              String

let b:current_syntax = "BC2"
