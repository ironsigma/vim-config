" Vim syntax file
" Language:	ETL daily csv

"...if exists("b:current_syntax")
"...  finish
"...endif

" Comments
syn region etlComment  start="^\s*#[^.]"    end="$"
syn region etlInactive start="^\s*#\.\.\."  end="$"
syn region etlSection  start="^\s*\["       end="\]"
syn region etlKey      start="^\s*[^#[][^=]\+"   end="="

"highlighting for Markdown groups
hi def link etlComment    Comment
hi def link etlInactive   SpecialKey
hi def link etlSection    Type
hi def link etlKey        Keyword

let b:current_syntax = "etl"

" vim: ts=8
