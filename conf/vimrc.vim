" vim:ff=unix:
"--------------------------------------------------------------------------
" Vim Configuration
"--------------------------------------------------------------------------

"--------------------------------------------------------------------------
" Common Settings
"--------------------------------------------------------------------------
set nocompatible                        " Use vim addvance settings
set autoindent                          " Auto-indent on
set shiftwidth=4                        " 4 spaces for autoindent
set softtabstop=4                       " Use soft tabs
set expandtab                           " Use spaces instead of tabs
set incsearch                           " Incremental search
set hlsearch                            " Highlight search hits
set showcmd                             " Show panding commands
set laststatus=2                        " Always show status line
set backspace=indent,eol,start          " Backspace over everyting
set history=100                         " Save at most XX commands
set showmatch                           " Display matching paren
set matchtime=2                         " Be breif when displaying the match
set visualbell                          " Use visual bell
set viminfo='100,f1,r/tmp,:100,/100     " Vim info options
set lazyredraw                          " Don't redraw on macro execute
set autoread                            " Re-read if modified
set diffopt=vertical,filler,context:3   " Diff options
set nostartofline                       " Keep cursor column when moving
set pastetoggle=<F10>                   " Toggle paste
set fileformats=unix,dos                " File formats
set fileformat=unix                     " Default to new unix format files
set keywordprg=                         " Set K to internal help
set report=0                            " Report all line changes
set shortmess=aO                        " Short messages
set formatoptions+=j                    " Remove comment when joining lines
set sessionoptions-=options             " Pathogen runtime fix
set cursorline                          " Show cursor line
set number                              " Show line numbers

"--------------------------------------------------------------------------
" Vim Only Options
"--------------------------------------------------------------------------
set mouse=nv                        " Mouse in normal and visual
set foldcolumn=4                    " Columns for fold display
syntax on                           " Syntax Highlight on

" Set invisible chars and display them
set list
if has('win32')
    set listchars=tab:·,trail:×,nbsp:␣,extends:→,precedes:←
else
    set listchars=tab:⇒·,trail:◇,nbsp:␣,extends:→,precedes:←
endif

" Used for redirection
set shellpipe=2>&1\ >

" Better grep
set grepprg=ack-grep

if !has('gui_running')
    set t_Co=256
    set background=dark
endif

" Term color scheme
colorscheme xoria_rails256
hi CursorLine cterm=None ctermbg=235

" Disable bell
if !has('gui_running')
    set vb
    set t_vb=
endif

" Swap file location
if has('win32')
    set dir^=c:\\rcsvers
else
    set dir^=$HOME/tmp
endif

"--------------------------------------------------------------------------
" Keyboard Mappings
"--------------------------------------------------------------------------
" Easier on the shift.
noremap <space> :

" Next buffer
nnoremap <silent> <tab> :bn!<cr>

" Diable middle mouse click paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Navigate by visual lines
noremap k gk
noremap j gj

" F1 - Package Explorer
nnoremap <silent> <f1> :PackageExplorerToggle<cr>

" F2 - MRU plugin
nnoremap <silent> <f2> :MRU<cr>

" F3 - Toggle Tagbar
nnoremap <silent> <f3> :TagbarToggle<cr>

" F4 - Toggle highlight search
nnoremap <silent> <f4> :nohlsearch<cr>

" F5 - Sync syntax highlight
nnoremap <silent> <f5> :syntax sync fromstart<cr>

" F6 -

" F7 - Toggle line numbering
nnoremap <silent> <f7> :let &number = !&number<cr>

" F8 - Toggle line wrapping
nnoremap <silent> <f8> :let &wrap = !&wrap<cr>

" F9  - Run external make command
nnoremap <silent> <f9> :echo "Running make..."<cr>:sil! make<cr>:cw<cr>:redraw!<cr>:echo "Make complete."<cr>

" F10 - Paste Toggle
" see pastetoggle above

"--------------------------------------------------------------------------
" Plugin options
"--------------------------------------------------------------------------
" Load bundles
execute pathogen#infect()

" Markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_folding_style_pythonic = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:AutoPairsFlyMode = 1

" Python folding
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='papercolor'

" NERDTree Filters
let g:NERDTreeIgnore = ['\~$', '\.pyc$', '^__pycache__$']

" Don't load matchparen
let g:loaded_matchparen = 1

" Settings for MRU plugin
let MRU_Max_Entries = 50
let MRU_Window_Height = 25
if has('win32')
    let MRU_Exclude_Files = '^\(C:\\Documents and Settings\\[^\\]\+\\Local Settings\\Temp\\.*\)\|\(C:\\Users\\[^\\]\+\\AppData\\Local\\Temp\\.*\)$'
endif

" Settings for RCSVersions plugin
let $TZ = 'PST8PDT'
let g:rvRcsOptions = ''
let g:rvLeaveRcsUnlocked = 1
let g:rvSaveDirectoryType = 1
if has('win32')
    let g:rvDirSeparator = "\/"
    let g:rvCompareProgram      = 'start C:\Program Files\Beyond Compare 3\BCompare.exe'
    let g:rvExcludeExpression   = '\c\.TMP'
    let g:rvTempDir             = 'C:/Temp/'
    let g:rvSaveDirectoryName   = 'C:/RCSVers/'
else
    let g:rvExcludeExpression    = '^/tmp/'
    let g:rvSaveDirectoryName   = "$HOME/.rcs/"
endif

" PHP highlighting
let php_sql_query = 1
let php_html_in_strings = 1
let php_no_shorttags = 1

" Python highlighting
let python_highlight_all = 1
let python_print_as_function = 1

"--------------------------------------------------------------------------
" Auto commands
"--------------------------------------------------------------------------
" Enable file type detection.
filetype plugin indent on

autocmd BufRead *
\ if search('^\t', 'cnw', 0, 200) != 0 |
\  execute "setl ts=4 noexpandtab" |
\ endif

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
"--- EOF ------------------------------------------------------------------
