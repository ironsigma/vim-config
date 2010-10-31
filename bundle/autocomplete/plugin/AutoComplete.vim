"      Author:  Juan Frias
"     Version:  1.0.0
" Description:  Use your tab key complete words
"
"     History:  1.0.0  First implementation
"

inoremap <silent> <tab>   <c-r>=<sid>AutoComplete('p')<cr>
inoremap <silent> <s-tab>   <c-r>=<sid>AutoComplete('n')<cr>

function! <sid>AutoComplete(key)
    if (strpart(getline('.'),col('.')-2,1)=~'^\s\?$')
        return "\<tab>"
    endif
    if a:key == 'n'
        return "\<c-n>"
    else
        return "\<c-p>"
    endif
endf
