"      Author:  Juan D Frias
"     Version:  3.0.2
" Description:  Use ctrl-space to expand templates
"

inoremap <c-space> <c-r>=<sid>ExpandTemplate()<cr>
inoremap <c-@> <c-r>=<sid>ExpandTemplate()<cr>

command! -nargs=0 ParseThisSnippetFile call <sid>ParseSnippetFile(expand('<sfile>:p'))

let s:SNIP_TOKEN = ':snippet'
let s:SNIP_ALIAS_TOKEN = ':alias'

let s:snippet_templates = {}
let s:snippet_aliases = {}
let s:snippet_files = {}

function! s:ExpandTemplate() " {{{1
    let l:line = getline('.')

    " find location of first non-word char
    let l:start_pos = col('.') - 1
    while l:start_pos > 0 && l:line[l:start_pos - 1] =~ '\w'
        let l:start_pos -= 1
    endwhile

    " extract keyword
    let l:keyword = strpart(l:line, l:start_pos, col('.') - l:start_pos)

    " no keyword found display candidates
    if l:keyword == ''
        let l:keywords = []
        " add keywords
        for l:key in keys(s:snippet_templates)
            call add(l:keywords, {'word': l:key,
                \'menu': s:snippet_templates[l:key][0]})
        endfor
        " add aliases
        for l:key in keys(s:snippet_aliases)
            call add(l:keywords, {'word': l:key,
                \'menu': s:snippet_templates[s:snippet_aliases[l:key]][0],
                \'kind': 'v'})
        endfor
        call sort(l:keywords, "<sid>SortKeywords")
        call complete(col('.'), l:keywords)
        return ''
    endif

    " try to find snippet by trimming keyword until empty
    while !has_key(s:snippet_templates, l:keyword)
        " is it an alias?
        if has_key(s:snippet_aliases, l:keyword)
            let l:keyword = s:snippet_aliases[l:keyword]
            break
        endif
        " trim it
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
    if strlen(l:line) == l:start_pos + strlen(keyword)
        let l:insert = 'a'
    else
        let l:insert = 'i'
    endif

    " if there a cursor token, move back to it
    if stridx(s:snippet_templates[l:keyword][1], '<@>') == -1
        let l:move_cursor = ''
    else
        let l:move_cursor = "\<esc>?<@>\<cr>cf>"
    endif

    return "\<esc>0". l:col_move .'d'. strlen(keyword) .'l'.
            \ l:insert . s:snippet_templates[l:keyword][1] . l:move_cursor
endf

function! s:SortKeywords(a, b) " {{{1
    return a:a['word'] == a:b['word'] ? 0 : a:a['word'] > a:b['word'] ? 1 : -1
endfunction

function! s:ParseSnippetFile(file) " {{{1
    let mtime = getftime(a:file)
    if has_key(s:snippet_files, a:file) && s:snippet_files[a:file] == mtime
        return
    endif

    let s:snippet_files[a:file] = mtime
    let l:in_snippet = 0
    let l:is_empty_line = 0

    for line in readfile(a:file)

        " Matches alias line
        if match(l:line, '^'. s:SNIP_ALIAS_TOKEN) != -1
            let l:aliases = split(strpart(l:line, strlen(s:SNIP_ALIAS_TOKEN) + 1))
            let l:target = remove(l:aliases, -1)
            for l:alias in l:aliases
                let s:snippet_aliases[l:alias] = l:target
            endfor
            continue
        endif

        " Matches snippet start token
        if match(l:line, '^'. s:SNIP_TOKEN) != -1

            " Save previous snippet
            if l:in_snippet
                let s:snippet_templates[l:keyword] = [l:description, l:snippet]
            endif

            " Capture keyword and description
            let l:keyword_start = strlen(s:SNIP_TOKEN) + 1
            let l:pos = stridx(line, ' ', l:keyword_start)
            if l:pos != -1
                let l:keyword = strpart(line, l:keyword_start, l:pos - l:keyword_start)
                let l:description = strpart(line, l:keyword_start + strlen(l:keyword) + 1)
            else
                let l:keyword = strpart(line, l:keyword_start)
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
        let s:snippet_templates[l:keyword] = [l:description, l:snippet]
    endif
endfunction
" }}}

" vim: fdm=marker
