"      Author:  Juan D Frias
"     Version:  2.3.0
" Description:  Use your tab key complete words and file names
"

if exists('g:loaded_AutoComplete')
    finish
endif

let g:loaded_AutoComplete=1
let s:type = 'none'

function! s:AutoComplete(key)
    " if already completing word just repeat it
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

function! s:UltiSnipsExpandSnippet()
    if !exists("*UltiSnips#ExpandSnippet")
        return 0
    endif
    call UltiSnips#ExpandSnippet()
    return g:ulti_expand_res
endf

inoremap <silent> <tab> <C-R>=(<sid>UltiSnipsExpandSnippet()>0)?'':<sid>AutoComplete('p')<CR>
inoremap <expr> <silent> <s-tab> <sid>AutoComplete('n')

