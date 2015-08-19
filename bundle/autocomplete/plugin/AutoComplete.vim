"      Author:  Juan D Frias
"     Version:  2.2.1
" Description:  Use your tab key complete words and file names
"

inoremap <silent> <tab>   <c-r>=<sid>AutoComplete('p')<cr>
inoremap <silent> <s-tab> <c-r>=<sid>AutoComplete('n')<cr>

function! s:AutoComplete(key)
    let l:ch = strpart(getline('.'), col('.') - 2, 1)

    " cursor on space or blank line, add tab
    if l:ch =~ '^\s\?$'
        return "\<tab>"

    " ends with / complete file name
    elseif l:ch == '/'
        return "\<c-x>\<c-f>"

    " word completion forward
    elseif a:key == 'n'
        return "\<c-n>"

    " word completion backwards
    else
        return "\<c-p>"
    endif
endf
