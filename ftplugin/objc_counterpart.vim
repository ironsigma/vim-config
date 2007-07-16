if !exists("*<sid>OpenCounterPart")
function! s:OpenCounterPart()
    let root = expand("%:p:r")
    let ext = expand("%:e")

    if ext == "h"
        if filereadable(root.".mm")
            let co = ".mm"
        else
            let co = ".m"
        endif
    else
        let co = ".h"
    endif

    if getbufvar("%", "&mod") && &bufhidden != "hide"
        let cmd= "sp "
    else
        let cmd="e "
    endif

    exec cmd . root . co
    if !filereadable(root.co)
        set ft=objc
    endif
endfunction
endif

nmap <buffer> <leader>cp :call <sid>OpenCounterPart()<cr>
