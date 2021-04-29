
" Get the URL under the cursor, or return blank
function! s:url_under_cur()
    " save orig pos and find start of URL
    let orig = col('.')
    if  search('https\?://', 'bc', line('.')) == 0
        return ''
    endif

    " save start and find end of URL
    let start = col('.') - 1
    call search('[^-A-Za-z0-9''._~:/?#\[\]@!$&()*+,;%=]\|$', 'z', line('.'))
    let end = col('.') - 2

    " return cursor to orig pos
    exec ':normal ' .. orig .. '|'

    " if only prefix found, or cursor was not under URL, return
    if end - start <= 7 || orig > end + 2
        return ''
    endif

    " return url
    let url = getline('.')
    return url[start:end]
endfunction

function! s:open_url_under_cur()
    let url = <sid>url_under_cur()
    if url == ''
        echom 'No URL found'
    else
        echom 'Opening: ' .. url
        execute ':silent !xdg-open "' .. url .. '"'
    endif
endfunction

nnoremap <Leader>o :call <sid>open_url_under_cur()<cr>

