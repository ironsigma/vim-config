if exists("loaded_winzoomtoggle") || &compatible
    finish
endif
let loaded_winzoomtoggle = 1

function s:WinZoomToggle()
    " global var
    let zoomed_win = 'g:zw_zoomed'

    " if zoom var exists and it's this window, equalize all
    if exists(zoomed_win) && g:zw_zoomed == winnr()
        wincmd =
        unlet g:zw_zoomed
        return
    endif

    " Otherwise expand current window
    wincmd _
    wincmd |
    exec 'let '.zoomed_win.'='.winnr()
endfunction

command! -nargs=0 WinZoomToggle :call s:WinZoomToggle()
