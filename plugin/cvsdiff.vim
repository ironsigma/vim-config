if exists("loaded_cvsdiff") || &compatible
    finish
endif
let loaded_cvsdiff = 1

command! -nargs=? CVSDiff :call s:Cvsdiff(<f-args>)

function! s:Cvsdiff(...)
    if a:0 > 1
        let rev = '-r '.a:1
    else
        let rev = ''
    endif

    let ftype = &filetype

    " Create a temp buffer to read in the path
    new
    exec "read " . expand("%:p") . "CVS/Repository"
    let path = getline('.') . "/"
    bdelete!

    " Check out the revision to a temp file
    let tmpfile = tempname()
    let cmd = "cvs co -p " . rev . " " . path . bufname("%") . " > " . tmpfile
    let cmd_output = system(cmd)
    if v:shell_error && cmd_output != ""
        echohl WarningMsg | echon cmd_output
        return
    endif

    " Begin diff
    exe "vert diffsplit" . tmpfile
    exe "set filetype=" . ftype
    set foldmethod=diff
    wincmd l

endfunction
