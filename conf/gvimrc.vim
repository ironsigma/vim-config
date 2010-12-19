"--------------------------------------------------------------------------
" Options for Graphic version of VIM
"--------------------------------------------------------------------------

"--------------------------------------------------------------------------
" Font
"--------------------------------------------------------------------------
if has("mac")
    set guifont=Droid_Sans_Mono:h13
elseif has("win32")
    set guifont=Consolas:h9:cANSI
endif

"--------------------------------------------------------------------------
" Window position and size
"--------------------------------------------------------------------------
if has("win32")
    winpos 300 0
    set lines=64
    set columns=180
elseif has("mac")
    winpos 360 1058
    set lines=68
    set columns=150
    "winpos 109 46 " 22+24 for window bar
    "set lines=46
    "set columns=150
else
    winpos 280 80
    set lines=60
    set columns=150
endif

"--------------------------------------------------------------------------
" Preferences
"--------------------------------------------------------------------------
set guioptions-=T           " No Toolbar
set guicursor=a:blinkon0    " No blinking cursor
set guioptions-=L           " No left hand scrollbars
set guioptions-=m           " No menu bar
set t_vb=                   " Turn off bell flashes

"--------------------------------------------------------------------------
" Color scheme
"--------------------------------------------------------------------------
colorscheme eclipse

"--- EOF ------------------------------------------------------------------
