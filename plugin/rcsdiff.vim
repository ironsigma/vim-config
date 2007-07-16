if exists("loaded_rcsdiff") || &compatible
    finish
endif
let loaded_rcsdiff = 1

command! -nargs=? RCSDiff :call s:Rcsdiff(<f-args>)

function! s:Rcsdiff(...)
    if a:0 > 1
        let rev = '-r '.a:1
    else
        let rev = ''
    endif

    let ftype = &filetype

    " Check out the revision to a temp file
    let tmpfile = tempname()
    let cmd = "co -p " . rev . " " . bufname("%")
    let cmd_output = system(cmd)
    if v:shell_error && cmd_output != ""
        echohl WarningMsg | echon cmd_output
        return
    endif

    " Begin diff
    exe "vert diffsplit " . tmpfile
    set noai
    exec "normal! gi".cmd_output
    normal! gg2dd
    diffupdate
    exe "set filetype=" . ftype
    set foldmethod=diff
    set nomod
    wincmd l

endfunction
