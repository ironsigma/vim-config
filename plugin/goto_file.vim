function! s:open_core_class_file(class)
    let file = '../CORE/CLASSES/i_'. a:class .'.bix'
    if filereadable(file)
        exec 'split '.file
        return 1
    endif
    return 0
endfunction

function! s:open_file()
    let cfile = expand('<cfile>')

    if filereadable(cfile)
        exec 'split '.cfile
        return
    endif

    let cfile = substitute(cfile, '::.*$', '', 'g')
    if s:open_core_class_file(cfile)
        return
    endif

    let cfile = 'bi'.substitute(cfile, '[A-Z]', "_\\L\\0", 'g')
    if s:open_core_class_file(cfile)
        return
    endif
endfunction

" Default key map
nnoremap <silent> gf :call <SID>open_file()<CR>
vnoremap <silent> gf :call <SID>open_file()<CR>
