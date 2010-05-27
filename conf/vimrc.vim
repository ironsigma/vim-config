" vim:ff=unix:
"--------------------------------------------------------------------------
" Vim Configuration
"--------------------------------------------------------------------------

"--------------------------------------------------------------------------
" Common Settings
"--------------------------------------------------------------------------
set nocompatible                    " Use vim addvance settings
set autoindent                      " Auto-indent on
set tabstop=8                       " Use 8 spaces for tabs
set shiftwidth=4                    " 4 spaces for autoindent
set softtabstop=4                   " Use soft tabs
set expandtab                       " Use spaces instead of tabs
set incsearch                       " Incremental search
set hlsearch                        " Highlight search hits
set showcmd                         " Show panding commands
set cmdheight=1                     " lines for command window
set laststatus=2                    " Always show status line
set backspace=indent,eol,start      " Backspace over everyting
set history=100                     " Save at most XX commands
set ruler                           " show ruler
set showmatch                       " Display matching paren
set matchtime=2                     " Be breif when displaying the match
set nobackup                        " No backups
set visualbell                      " Use visual bell
set viminfo=@200,'100,f1,rb:,:100,/100   " Vim info options
set lazyredraw                      " Don't redraw on macro execute
set noerrorbells                    " Don't make noise
set autoread                        " Re-read if modified
set backupcopy=yes                  " Save resources
set diffopt=filler,context:3        " Diff options
set nostartofline                   " Keep cursor column when moving
set scrolloff=0                     " Keep context lines
set pastetoggle=<F10>               " Toggle paste
set fileformats=unix,dos            " File formats
set fileformat=unix                 " Default to new unix format files
set modelines=5                     " Set the number of lines to look at
set keywordprg=                     " Set K to internal help
set report=0                        " Report all line changes
set shortmess=aO                    " Short messages

"--------------------------------------------------------------------------
" Vim Only Options
"--------------------------------------------------------------------------
if !&cp
    set mouse=nv                        " Mouse in normal and visual
    set foldcolumn=4                    " Columns for fold display
    syntax on                           " Syntax Highlight on
endif

" set status line
set statusline=%<%F\ %w%r%y[%{&ff}][%{&enc}]%m\%=\ %l,%v\ \ %p%%\ %L

" Set invisible chars and display them
set list
set listchars=tab:>.,trail:.

" Used for redirection
set shellpipe=2>&1\|tee

" Term color scheme
if has("win32unix")
    colorscheme eclipse
else
    set t_Co=256
    colorscheme xoria_rails256
endif

" Color scheme overlay
hi SpecialKey ctermfg=237

" Disable bell
if !has("gui_running")
    set vb
    set t_vb=
endif

" Swap file location
if has("win32")
    set dir=C:\\RCSVers\\\\
endif

"--------------------------------------------------------------------------
" Keyboard Mappings
"--------------------------------------------------------------------------
" Easier on the shift.
nnoremap <space> :

" Next buffer
nnoremap <tab> :bn!<cr>

" Open files in new window
nnoremap <silent> gf <c-w><c-f>

" Diable middle mouse click paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Restore selection on shift
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" F1 - Filter File Explorer
nmap <silent> <f1> <Plug>FilterFileExplorer

" F2 - MRU plugin
nnoremap <silent> <f2> :MRU<cr>

" F3 - Toggle Project
nnoremap <silent> <f3> <Plug>ToggleProject

" F4 - Toggle highlight search
nnoremap <silent> <f4> :nohlsearch<cr>

" F5 - Toggle zoom window
nnoremap <silent> <f5> :WinZoomToggle<cr>

" F6 - NERDTree
nnoremap <silent> <f6> :NERDTreeToggle<cr>

" F7 -

" F8 - Toggle linewrapping
nnoremap <silent> <f8> :let &wrap = !&wrap<cr>

" F9  - Run external make command
nnoremap <silent> <f9> :echo "Running make..."<cr>:sil! make<cr>:cw<cr>:redraw!<cr>:echo "Make complete."<cr>

"--------------------------------------------------------------------------
" External Macro options
"--------------------------------------------------------------------------
if !&cp

    " Don't load matchparen
    let g:loaded_matchparen = 1

    " Settings for MRU plugin
    let MRU_Max_Entries = 50
    let MRU_Window_Height = 25
    let MRU_Exclude_Files = '^\(C:\\Documents and Settings\\[^\\]\+\\Local Settings\\Temp\\.*\)\|\(C:\\Users\\[^\\]\+\\AppData\\Local\\Temp\\.*\)$'

    " Settings for RCSVersions plugin
    let $TZ = 'PST8PDT'
    let g:rvRcsOptions = ""
    let g:rvLeaveRcsUnlocked = 1
    let g:rvSaveDirectoryType = 1
    if has("win32")
        let g:rvCompareProgram      = 'start C:\Program Files\Beyond Compare 3\BCompare.exe'
        let g:rvExcludeExpression   = '\c\.TMP'
        let g:rvTempDir             = 'C:\\Temp\\'
        let g:rvSaveDirectoryName   = 'C:\\RCSVers\\'
    else
        let g:rvExcludeExpression    = '^/tmp/'
        let g:rvSaveDirectoryName   = "$HOME/.rcs/"
    endif

    " html edit
    let g:xml_use_xhtml = 1

    " PHP highlighting
    let php_sql_query = 1
    let php_htmlInString = 1
    let php_noShortTags = 1
    let php_folding = 1

    " Ruby
    let ruby_operators = 1
    let ruby_space_errors = 1
    let ruby_fold = 1

    " Python highlighting
    let python_highlight_all = 1
    let python_print_as_function = 1

    " Project
    let g:proj_flags = 'ist'

    " Surround
    xmap  <Leader>s    <Plug>Vsurround

endif
"--------------------------------------------------------------------------
" Auto commands
"--------------------------------------------------------------------------
if !&cp
    " Enable file type detection.
    filetype plugin indent on

    " switch to current dir
    autocmd BufEnter * :sil! lcd %:p:h

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute "normal g`\"zz" |
    \ else |
    \   execute "normal G$zz"|
    \ endif
endif
"--- EOF ------------------------------------------------------------------
