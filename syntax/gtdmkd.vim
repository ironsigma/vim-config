" Vim syntax file
" Language:     Getting Things Done in Markdown
" Maintainer:   Juan D Frias <juandfrias@gmail.com>
" Filetype:     gtdmkd
" Last Change:  2020 Sep 16


if exists('b:current_syntax')
    finish
endif


" Load Markdown
runtime! syntax/markdown.vim
unlet b:current_syntax


" GTD Syntax
syntax case match
syntax match gtdmkdContext /@[a-z0-9_]\+/
syntax match gtdmkdKeyValue /[a-z0-9_]\+:\([^ ]\|$\)\+/
syntax match gtdmkdDurationShort /dur:\d\+[hm]/
syntax match gtdmkdDurationLong /dur:\d\+d/
syntax match gtdmkdDueDate /due:\d\{4}-\d\d-\d\d\(T\d\d:\d\d\)?/
syntax match gtdmkdProjectTag /+[a-z0-9_]\+/
syntax match gtdmkdModeline /^vim: .*$/
syntax match gtdmkdComplete /^x .*$/
syntax match gtdmkdCancelled /^X .*$/
syntax match gtdmkdUrlRef /^\[[^\]]\+\]:\s\+https\?:\/\/.*$/
syntax region gtdmkdMetadata start=/([a-z0-9_]\+:/ end=/)/


" Colors
highlight default link gtdmkdContext Comment
highlight default link gtdmkdDurationShort Label
highlight default link gtdmkdDurationLong PreProc
highlight default link gtdmkdDueDate Tag
highlight default link gtdmkdKeyValue Constant
highlight default link gtdmkdMetadata Constant
highlight default link gtdmkdProjectTag Number
highlight default link gtdmkdModeline Folded
highlight default link gtdmkdComplete htmlStrike
highlight default link gtdmkdUrlRef Comment
highlight gtdmkdCancelled term=bold,strikethrough cterm=strikethrough ctermfg=239 gui=strikethrough guifg=#b0c0c0


" Done
let b:current_syntax = 'gtdmkd'

