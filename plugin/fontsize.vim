" File: fontsize.vim
" Author: Juan D Frias <juandfrias@gmail.cOm>
" Version: 1.0.0
" Copyright: Copyright (C) 2019 Juan D Frias
" License: MIT License
"
if exists('g:loaded_fontsize')
    finish
endif
let g:loaded_fontsize=1

" Change the font size.
" Positive or negative increment or
" zero to reset to original size
function! ChangeFontSize(inc)
    let curr_font = substitute(&guifont, '\d\+$', '', '')
    let size = str2nr(&guifont[strlen(curr_font):])

    if !exists('g:fontsize_orig')
        let g:fontsize_orig = size
    endif

    if a:inc == 0
        let size = g:fontsize_orig
    else
        let size += a:inc
    endif

    exec 'set guifont=' . substitute(curr_font . size, ' ', '\\ ', 'g')
    redraw
    echomsg curr_font . size
endfunction
