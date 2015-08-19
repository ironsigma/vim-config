"      Author:  Juan D Frias
"     Version:  3.0.1
" Description:  Use ctrl-space to expand templates
"

inoremap <c-space> <c-r>=<sid>ExpandTemplate()<cr>
inoremap <c-@> <c-r>=<sid>ExpandTemplate()<cr>

command! -nargs=0 -bang ListSnippets call <sid>ListSnippets('<bang>')
command! -nargs=0 -complete=file ParseThisSnippetFile call <sid>ParseSnippetFile(expand('<sfile>:p'))

let s:SNIP_TOKEN = ':snippet'
let s:SNIP_KEYWORD_START = strlen(s:SNIP_TOKEN) + 1

let s:snippet_list = {}
let s:snippet_files = {}

function! s:ListSnippets(expand)
    for l:key in keys(s:snippet_list)
        if a:expand == '!'
            echo l:key . ' ' . s:snippet_list[key][0] . "\n" . s:snippet_list[key][1] . "\n\n"
        else
            echo l:key . ' ' . s:snippet_list[key][0]
        endif
    endfor
endfunction

function! s:ExpandTemplate()
    let l:line = getline('.')

    " find location of first non-word char
    let l:start_pos = col('.') - 1
    while l:start_pos > 0 && l:line[l:start_pos - 1] =~ '\w'
        let l:start_pos -= 1
    endwhile

    " extract keyword
    let l:keyword = strpart(l:line, l:start_pos, col('.') - l:start_pos)
    echom 'keyword ['. l:keyword .']'

    " try to find snippet by trimming keyword until empty
    while !has_key(s:snippet_list, l:keyword)
        let l:keyword = strpart(l:keyword, 0, strlen(l:keyword) - 1)
        if l:keyword == ''
            return ''
        endif
    endwhile

    " if there was no white space don't move the cursor
    if l:start_pos == 0
        let l:col_move = ''
    else
        let l:col_move = l:start_pos .'l'
    endif

    " if at end of line, append, otherwise insert the text
    if strlen(l:line) == l:start_pos + strlen(keyword) + 1
        let l:insert = 'a'
    else
        let l:insert = 'i'
    endif

    " if there a cursor token, move back to it
    if stridx(s:snippet_list[l:keyword][1], '<@>') == -1
        let l:move_cursor = ''
    else
        let l:move_cursor = "\<esc>?<@>\<cr>cf>"
    endif

    return "\<esc>0". l:col_move .'d'. strlen(keyword) .'l'.
            \ l:insert . s:snippet_list[l:keyword][1] . l:move_cursor
endf

function! s:ParseSnippetFile(file)
    if has_key(s:snippet_files, a:file)
        return
    endif

    let s:snippet_files[a:file] = 1
    let l:in_snippet = 0
    let l:is_empty_line = 0

    for line in readfile(a:file)

        " Matches snippet start token
        if match(line, '^'. s:SNIP_TOKEN) != -1

            " Save previous snippet
            if l:in_snippet
                let s:snippet_list[l:keyword] = [l:description, l:snippet]
            endif

            " Capture keyword and description
            let l:pos = stridx(line, ' ', s:SNIP_KEYWORD_START)
            if l:pos != -1
                let l:keyword = strpart(line, s:SNIP_KEYWORD_START, l:pos - s:SNIP_KEYWORD_START)
                let l:description = strpart(line, s:SNIP_KEYWORD_START + strlen(l:keyword) + 1)
            else
                let l:keyword = strpart(line, s:SNIP_KEYWORD_START)
                let l:description = ''
            endif

            " Reset vars
            let l:is_empty_line = 0
            let l:in_snippet = 1
            let l:snippet = ''
            continue
        endif

        if l:in_snippet
            " Previous line empty, append
            if l:is_empty_line
                let l:snippet = l:snippet . "\n"
            endif

            " This line is empty flag it
            if match(line, '^\s*$') != -1
                let l:is_empty_line = 1

            " Non empty line
            else
                if l:snippet != ''
                    let l:snippet = l:snippet . "\n"
                endif

                let l:snippet = l:snippet . line
                let l:is_empty_line = 0
            endif
        endif
    endfor

    " If snippet pending
    if l:in_snippet
        " Append previous empty line
        if l:is_empty_line
            let l:snippet = l:snippet . "\n"
        endif

        " Save
        let s:snippet_list[l:keyword] = [l:description, l:snippet]
    endif
endfunction
