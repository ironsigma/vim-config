if exists("loaded_winzoomtoggle") || &compatible
    finish
endif
let loaded_winzoomtoggle = 1

function s:WinZoomToggle()
    let height_var = 'b:zw_height_'.winnr()
    let width_var = 'b:zw_width_'.winnr()
    if !exists(height_var)
        exec 'let '.height_var.'='.winheight(0)
        exec 'let '.width_var.'='.winwidth(0)
        wincmd _
        wincmd |
    else
        exec 'let l:height='.height_var
        exec 'let l:width='.width_var
        exec l:height.' wincmd _'
        exec l:width.' wincmd |'
        exec 'unlet '.height_var
        exec 'unlet '.width_var
    endif
endfunction

command! -nargs=0 WinZoomToggle :call s:WinZoomToggle()
