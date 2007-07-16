" Load script once
"------------------------------------------------------------------------------
if exists("loaded_xml_util")
    finish
endif
let loaded_xml_util = 1

function! s:stack_push(stack, item) "{{{
    if strlen(a:stack) == 0
        return a:item
    endif
    return a:stack."|".a:item
endfunction "}}}
function! s:stack_pop(stack) "{{{
    if strlen(a:stack) == 0
        return ''
    endif
    let pos = strridx(a:stack, '|')
    if pos == -1
        return ''
    endif
    return strpart(a:stack,0,pos)
endfunction "}}}
function! s:stack_peek(stack) "{{{
    if strlen(a:stack) == 0
        return ''
    endif
    let pos = strridx(a:stack, '|')
    if pos == -1
        return a:stack
    endif
    return strpart(a:stack,pos+1)
endfunction "}}}
function! s:stack_size(stack) "{{{
    if strlen(a:stack) == 0
        return 0
    endif
    return strlen(substitute(a:stack, '[^|]', '', 'g'))+1
endfunction "}}}

function! s:getXPath() "{{{

    " save cursor and window position {{{
    let column = col('.')
    let line = line('.')
    normal H
    let scroll = line('.')
    exec 'normal '.line.'G'.column.'|'
    "}}}

    " init the variables {{{
    let is_first = 1
    let path = ''
    let stack = ''
    "}}}

    while 1

        " if no more tags, break out {{{
        if search('<[^>]\+>', 'bW') == 0
            break
        endif
        "}}}

        " get the entire tag (include braces) {{{
        let token = strpart(getline('.'), col('.') - 1)
        let token = strpart(token, 0, stridx(token, '>') + 1)
        "}}}

        " if it is an auto closing tag skip it (unless it is the first tag) {{{
        if !is_first && substitute(token, '/\s*>$', '', '') != token
            continue
        endif
        let is_first = 0
        "}}}

        " if it is a closing tag add to stack {{{
        let tag_name = substitute(token, '<\s*/\([^[:space:]>]\+\).*$', '\1', '')
        if tag_name != token
            let stack = s:stack_push(stack, tag_name)
            continue
        endif
        "}}}

        " it is an open tag, get the name {{{
        let tag_name = substitute(token, '<\s*\([^[:space:]>]\+\).*$', '\1', '')
        "}}}

        " if it is pending on the stack pop it {{{
        if tag_name == s:stack_peek(stack)
            let stack = s:stack_pop(stack)
            continue
        endif
        "}}}

        " if there is no tags on the stack then append to path {{{
        if s:stack_size(stack) == 0
            let path = '/'.tag_name . path
        endif
        "}}}

    endwhile

    " restore cursor and window position {{{
    exec 'normal '.scroll.'Gzt'.line.'G'.column.'|'
    " }}}

    echo path
    let @+ = path

endfunction "}}}

nnoremap <buffer><leader>x :call <sid>getXPath()<cr>

" vim:fdm=marker:
