"      Author:  Juan D Frias
"     Version:  2.0.0
" Description:  Use your tab key complete words and file names and templates
"

inoremap <silent> <tab>   <c-r>=<sid>AutoComplete('p')<cr>
inoremap <silent> <s-tab> <c-r>=<sid>AutoComplete('n')<cr>

let s:snippets = {}

function! SnippetAC(keyword, snippet)
    let s:snippets[a:keyword] = a:snippet
endfunction

function! s:AutoComplete(key)
    let l:line = getline('.')
    let l:ch = strpart(l:line, col('.') - 2, 1)

    " cursor on space or blank line, add tab
    if l:ch =~ '^\s\?$'
        return "\<tab>"

    " ends with / complete file name
    elseif l:ch =~ '/'
        return "\<c-x>\<c-f>"

    " ends with , expand template
    elseif l:ch =~ ','

        " find location of first white space
        let l:ws_pos = strridx(l:line, ' ')
        let l:tpos = strridx(l:line, "\t")
        if l:ws_pos == -1
            let l:ws_pos = l:tpos
        else
            if l:tpos != -1 && l:tpos > l:ws_pos
                let l:ws_pos = l:tpos
            endif
        endif

        " add one to point to start of keyword
        let l:ws_pos = l:ws_pos + 1

        " extract keyword
        let l:keyword = strpart(l:line, l:ws_pos, col('.') - l:ws_pos - 2)

        " if no snippet found matching keyword, do nothing
        if !has_key(s:snippets, l:keyword)
            return ''
        endif

        " if there was no white space don't move the cursor
        if l:ws_pos == 0
            let l:col_move = ''

        " move the cursor to the start of keyword
        else
            let l:col_move = l:ws_pos .'l'
        endif

        if stridx(s:snippets[l:keyword], '<@>') == -1
            let l:move_cursor = ''
        else
            let l:move_cursor = "\<esc>?<@>\<cr>cf>"
        endif

        return "\<esc>0". l:col_move ."df,a" . s:snippets[l:keyword] . l:move_cursor

    " keyword completion forward
    elseif a:key == 'n'
        return "\<c-n>"

    " keyword completion backwards
    else
        return "\<c-p>"
    endif
endf
