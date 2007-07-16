if expand("%:e") == "h"
	finish
endif

function! ObjCFileFold(lnum)
    let line = getline(a:lnum)
    if line =~ '^}\s*$'
        return 's1'
    endif
    if line =~ '^[-+]\s*('
        return 1
    endif
    return '='
endfunction

setl foldexpr=ObjCFileFold(v:lnum)
setl foldmethod=expr
