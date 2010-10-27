"--------------------------------------------------------------------------
" Options for Graphic version of VIM
"--------------------------------------------------------------------------

"--------------------------------------------------------------------------
" Font
"--------------------------------------------------------------------------
if has("win32")
    set guifont=Consolas:h9:cANSI
elseif has("mac")
    set nomacatsui
    set antialias
    set guifont=Menlo\ Regular:h12
else
    set guifont=Droid\ Sans\ Mono\ 8
endif

"--------------------------------------------------------------------------
" Window position and size
"--------------------------------------------------------------------------
if has("win32")
    winpos 300 0
    set lines=64
    set columns=180
elseif has("mac")
    winpos 109 46 " 22+24 for window bar
    set lines=62
    set columns=150
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
colorscheme sorceror

"--- EOF ------------------------------------------------------------------
