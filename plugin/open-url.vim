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

function! s:mkd_url_under_cur()
    " save orig pos and find start of URL reference
    let origcol = col('.')
    if  search('][', 'b', line('.')) == 0 && search('][', '', line('.')) == 0
        return ''
    endif

    " save start and find end of URL reference
    let start = col('.') + 1
    if search(']', 'z', line('.')) == 0

        " no luck, return cursor to orig pos
        exec ':normal ' .. origcol .. '|'
        return ''
    endif

    " extract url reference
    let end = col('.') - 2
    let urlref = getline('.')[start:end]

    " find real URL from URL ref
    let origline = line('.')
    let search_regex = '\[' .. urlref .. '\]:\s\+<\?.\{-1,}\%\([ >' .. "'" .. '"(]\|$\)'
    if search(search_regex, 'W') == 0
        exec ':normal ' .. origcol .. '|'
        echom 'URL ref: [' .. urlref .. '] not found'
        return ''
    endif

    " Look for start of URL
    if  search('https\?://', 'c', line('.')) == 0
        " no URL reset position
        exec ':normal ' .. origline .. 'G' .. origcol .. '|'
        echom 'No URL in reference [' .. urlref .. '] found'
        return ''
    endif

    " save start and find end
    let start = col('.') - 1
    call search('[^-A-Za-z0-9''._~:/?#\[\]@!$&()*+,;%=]\|$', 'z', line('.'))
    let end = col('.') - 1

    " extract url and reset position
    let url = getline('.')[start:end]
    exec ':normal ' .. origline .. 'G' .. origcol .. '|'

    return url
endfunction

function! s:open_url_under_cur()
    let url = <sid>url_under_cur()
    if url == ''
        let url = <sid>mkd_url_under_cur()
    endif

    if url == ''
        echom 'No URL found'
        return
    endif

    echom 'Opening: ' .. url
    execute ':silent !xdg-open "' .. url .. '"'
endfunction

nnoremap <Leader>o :call <sid>open_url_under_cur()<cr>

