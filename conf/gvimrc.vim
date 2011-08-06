"--------------------------------------------------------------------------
" Options for Graphic version of VIM
"--------------------------------------------------------------------------

"--------------------------------------------------------------------------
" Font
"--------------------------------------------------------------------------
if has("mac")
    set guifont=Menlo:h14
elseif has("win32")
    set guifont=Consolas:h9:cANSI
endif

"--------------------------------------------------------------------------
" Window position and size
"--------------------------------------------------------------------------
set lines=999
if has("win32")
    winpos 300 0
    set columns=180
elseif has("mac")
    if $HOSTNAME == 'a4142197.federated.fds'
        winpos 210 1058
        set columns=160
    endif
else
    winpos 280 80
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
