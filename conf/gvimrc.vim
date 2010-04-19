"--------------------------------------------------------------------------
" Options for Graphic version of VIM
"--------------------------------------------------------------------------

"--------------------------------------------------------------------------
" Font
"--------------------------------------------------------------------------
if has("win32")
    set guifont=ProggyCleanTT:h12:cANSI
elseif has("mac")
    set nomacatsui
    set antialias
    set guifont=Monaco:h12
else
    set guifont=Droid\ Sans\ Mono\ 8
endif

"--------------------------------------------------------------------------
" Window position and size
"--------------------------------------------------------------------------
if has("win32")
    winpos 368 39
    set lines=70
    set columns=180
elseif has("mac")
    winpos 109 46 " 22+24 for window bar
    set lines=50
    set columns=148
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
if !has("win32")
    set noshowcmd
endif

"--------------------------------------------------------------------------
" Color scheme
"--------------------------------------------------------------------------
colorscheme eclipse

"--- EOF ------------------------------------------------------------------
