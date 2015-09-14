if !exists('g:ctagrefreshCtagsBinary')
    let g:ctagrefreshCtagsBinary = 'ctags'
endif

if !exists('g:ctagrefreshTagFilename')
    let g:ctagrefreshTagFilename = '.tags'
endif

" Update the specified tag file
function! s:update_ctags(tag_file, file, recursive)
    call system(g:ctagrefreshCtagsBinary .' '. a:recursive .' -a -f '.
        \ a:tag_file .' '. shellescape(a:file))
endfunction

" Find the closest tag file and update it
function! s:auto_refresh_ctags(file)
    let tag_file = findfile(g:ctagrefreshTagFilename,
        \ fnamemodify(a:file, ':h') .';')
    if !empty(tag_file)
        call s:update_ctags(tag_file, a:file, '')
    endif
endfunction

" Generate tags at the specified directory
function! s:generate_ctags(...)
    if a:0 == 0 || a:0 > 2
        echo 'usage: [-R] <path>'
        return
    endif

    " Parse params
    let recursive = 0
    if a:1 == '-R' || a:1 == '-r'
        let recursive = 1
        let path = a:2
    elseif a:2 == '-R' || a:2 == '-r'
        let recursive = 1
        let path = a:1
    else
        echo 'usage: [-R] <path>'
        return
    endif

    " append slash
    if path[strlen(path) - 1] != '/'
        let path .= '/'
    endif

    " update tags
    if recursive
        call s:update_ctags(simplify(path .
            \ g:ctagrefreshTagFilename), path, '-R')
    else
        call s:update_ctags(simplify(path .
            \ g:ctagrefreshTagFilename), expand('%:p'))
    endif
endfunction

if executable(g:ctagrefreshCtagsBinary) == 1
    " Generate/Update tag file
    command! -nargs=+ -complete=dir Ctags call <sid>generate_ctags(<f-args>)

    " Auto-command to refresh tags
    augroup ctags_refresh
       autocmd!
       autocmd BufWritePost,FileWritePost,FileAppendPost
           \ * call s:auto_refresh_ctags(expand('<afile>:p'))
    augroup END
endif
