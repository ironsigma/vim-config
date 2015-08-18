"      Author:  Juan D Frias
"     Version:  2.0.0
" Description:  Use your tab key complete words and file names
"

inoremap <silent> <tab>   <c-r>=<sid>AutoComplete('p')<cr>
inoremap <silent> <s-tab>   <c-r>=<sid>AutoComplete('n')<cr>

function! <sid>AutoComplete(key)
    let l:ch = strpart(getline('.'),col('.')-2,1)
    if (l:ch =~ '/')
        return "\<c-x>\<c-f>"

    elseif (l:ch =~ '^\s\?$')
        return "\<tab>"

    elseif a:key == 'n'
        return "\<c-n>"

    else
        return "\<c-p>"
    endif
endf
