"      Author:  Juan D Frias
"     Version:  2.2.3
" Description:  Use your tab key complete words and file names
"

inoremap <expr> <silent> <tab>   <sid>AutoComplete('p')
inoremap <expr> <silent> <s-tab> <sid>AutoComplete('n')

let s:type = 'none'

function! s:AutoComplete(key)
    if pumvisible()
        if s:type == 'word'
            return a:key == 'n' ? "\<c-n>" : "\<c-p>"
        else
            return a:key == 'n' ? "\<c-p>" : "\<c-n>"
        endif
    endif

    let l:ch = strpart(getline('.'), col('.') - 2, 1)
    let s:type = 'none'

    " cursor on space or blank line, add tab
    if l:ch =~ '^\s\?$'
        return "\<tab>"

    " ends with / complete file name
    elseif l:ch == '/'
        return "\<c-x>\<c-f>"

    " word completion
    else
        let s:type = 'word'
        return a:key == 'n' ? "\<c-n>" : "\<c-p>"
    endif
endf
