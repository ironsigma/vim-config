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
set modelines=5                     " Set the number of lines to look at
set keywordprg=                     " Set K to internal help

"--------------------------------------------------------------------------
" Vim Only Options
"--------------------------------------------------------------------------
if !&cp
    set mouse=nv                        " Mouse in normal and visual
    set foldcolumn=4                    " Columns for fold display
    syntax on                           " Syntax Highlight on
endif

" set status line
set statusline=%<%F\ %w%r%y[%{&ff}]%m\%=\ %l,%v\ \ %p%%\ %L

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

"--------------------------------------------------------------------------
" Keyboard Mappings
"--------------------------------------------------------------------------
" Easier on the shift.
noremap <space> :

" Next buffer
noremap <tab> :bn!<cr>

" Diable middle mouse click paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Restore selection on shift
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" F1  - NERDTree plugin
nnoremap <silent> <f1> :NERDTreeToggle<cr>

" F2  - MRU plugin
nnoremap <silent> <f2> :MRU<cr>

" F3  -

" F4  - Toggle highlight search
nnoremap <silent> <f4> :nohlsearch<cr>

" F5 -

" F6 -

" F7 -

" F8  - Toggle linewrapping
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
    let MRU_Exclude_Files = '^C:\\Documents and Settings\\juanf\\Local Settings\\Temp\\.*$'

    " Settings for RCSVersions plugin
    let g:rvLeaveRcsUnlocked = 1
    let g:rvSaveDirectoryType   = 1
    if has("win32")
        let g:rvCompareProgram      = 'start C:\Program Files\Beyond Compare 3\BCompare.exe'
        let g:rvExcludeExpression   = '\c\.TMP'
        let g:rvTempDir             = 'C:\\Temp\\'
        let g:rvSaveDirectoryName   = 'W:\\RCSVers\\'
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

endif
"--------------------------------------------------------------------------
" Auto commands
"--------------------------------------------------------------------------
if !&cp
    " Enable file type detection.
    filetype plugin indent on

    " switch to current dir
    autocmd BufEnter * :sil! lcd %:p:h

    " No swap file for network files
    if has("win32")
        autocmd BufReadPre * if strpart(tolower(expand("%:p")),0,2)!="c:" |
        \ setlocal noswapfile | endif
    endif

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
