"------------------------------------------------------------------------------
" Name Of File: winresize.vim
"
"  Description: Vim plugin to resize a window interactibly
"
"       Author: Juan Frias (juandfrias at gmail.com)
"
"  Last Change: 2007 Dec 28
"      Version: 1.00
"
"    Copyright: Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this header
"               is included with it.
"
"               This script is to be distributed freely in the hope that it
"               will be useful, but is provided 'as is' and without warranties
"               as to performance of merchantability or any other warranties
"               whether expressed or implied. Because of the various hardware
"               and software environments into which this script may be put,
"               no warranty of fitness for a particular purpose is offered.
"
"               GOOD DATA PROCESSING PROCEDURE DICTATES THAT ANY SCRIPT BE
"               THOROUGHLY TESTED WITH NON-CRITICAL DATA BEFORE RELYING ON IT.
"
"               THE USER MUST ASSUME THE ENTIRE RISK OF USING THE SCRIPT.
"
"               The author does not retain any liability on any damage caused
"               through the use of this script.
"
"      Install: Copy 'winresize.vim' to your plugin directory.
"
"  Mapped Keys: <Leader>res   Begin window resize
"
"------------------------------------------------------------------------------
" Please send me any bugs you find, so I can keep the script up to date.
"------------------------------------------------------------------------------
"
" User Options: {{{1
"------------------------------------------------------------------------------
"
" <Leader>res
"       This is the default key map to start the resize. Search for 'key' to
"       overwrite this key.
"

" Global variables: {{{1
"------------------------------------------------------------------------------

" Load script once
"------------------------------------------------------------------------------
if exists("loaded_winresize") || &cp
    finish
endif
let loaded_winresize = 1

" Function: main - Driver function. {{{1
"--------------------------------------------------------------------------
function! s:Resize()

    " Display status line
    echohl Search
    echo "<cr>-Quit, q-Quit, jk/JK-height +5/+1, hl/HL-width +5/+1"
    echohl NONE

    " Process keystrokes {{{
    while 1
        let l:op = getchar()

        if  nr2char(l:op) == 'q' || l:op == char2nr("\<cr>")
            break
        endif

        if nr2char(l:op) == 'j'
            resize +5
        endif

        if nr2char(l:op) == 'k'
            resize -5
        endif

        if nr2char(l:op) == 'J'
            resize +1
        endif

        if nr2char(l:op) == 'K'
            resize -1
        endif

        if nr2char(l:op) == 'l'
            vertical resize +5
        endif

        if nr2char(l:op) == 'h'
            vertical resize -5
        endif

        if nr2char(l:op) == 'L'
            vertical resize +1
        endif

        if nr2char(l:op) == 'H'
            vertical resize -1
        endif

        redraw
    endwhile
    " end Process keystrokes }}}

endfunction
"}}}1

" Default key mapping
"------------------------------------------------------------------------------
nnoremap <silent> <Leader>res :call <sid>Resize()<cr>

" vim:fdm=marker:
