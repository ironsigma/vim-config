" === Vim Configuration v20210820
set nocompatible


" === Plugin manager
call plug#begin('~/.vim/vendor')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
call plug#end()


" === Settings
set autoindent
set autoread
set autowriteall
set backspace=indent,eol,start
set cursorline
set diffopt=vertical,filler,context:3,internal,algorithm:patience,indent-heuristic
set dir^=$HOME/tmp
set encoding=utf-8
set expandtab
set fileformats=unix,dos
set fileformat=unix
set foldcolumn=4
set formatoptions+=j
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set keywordprg=
set laststatus=2
set lazyredraw
set list
set listchars=tab:»·,trail:×,nbsp:␣,extends:→,precedes:←
set matchtime=2
set mouse=nv
set nostartofline
set noswapfile
set nowrap
set number
set pastetoggle=<F10>
set report=0
set ruler
set sessionoptions+=resize,winpos
set shiftwidth=4
set shortmess=aO
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=8
set t_vb=
set viminfo+=!,f1,r/tmp,:100,/100,n~/.vim/viminfo
set visualbell


" === Window and Coloring
syntax on
if has('gui_running')
    set background=dark
    colorscheme OceanicNext

    set guicursor=a:blinkon0
    " set guifont=Fira\ Code\ weight=450\ 10
    set guifont=Source\ Code\ Pro\ Medium\ 10.5
    set guioptions-=L
    set guioptions-=m
    set guioptions-=r
    set guioptions-=T

    set lines=55
    set columns=125

else
    set t_Co=256
    set background=dark
    colorscheme xoria_rails256
    " hi CursorLine cterm=None ctermbg=236
endif


" === Function Keys

" F1 - Ctrl-P
nnoremap <silent> <f1> :CtrlP<cr>

" S-F1 - Package Explorer
nnoremap <silent> <s-f1> :PackageExplorerToggle<cr>

" F2 - MRU plugin
nnoremap <silent> <f2> :CtrlPMRUFiles<cr>

" F3 - CD to current file path
nnoremap <silent> <f3> :exec 'lcd ' . expand('%:p:h')<cr>:pwd<cr>

" F4 - Toggle highlight search
nnoremap <silent> <f4> :nohlsearch<cr>

" F8 - Toggle line wrapping
nnoremap <silent> <f8> :setlocal wrap!<cr>

" F9 - Toggle read-only
nnoremap <silent> <f9> :setlocal readonly!<cr>

" F10 - Paste Toggle


" === Keyboard mappings
nnoremap <space> :
nnoremap <silent> <tab> :bnext!<cr>
nnoremap <silent> <c-f1> :call ChangeFontSize(0)<cr>
nnoremap <silent> <c-f2> :call ChangeFontSize(-1)<cr>
nnoremap <silent> <c-f3> :call ChangeFontSize(1)<cr>


" === CtrlP
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'order:ttb'
if executable('fd')
    let g:ctrlp_user_command = 'fd . %s -t f -c never'
else
    let g:ctrlp_user_command = 'find %s -type f'
endif


" === Disable match parent hilighting
let g:loaded_matchparen = 1


" === UltiSnips
let g:UltiSnipsExpandTrigger = '<C-S-x>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:UltiSnipsEditSplit = 'horizontal'


" === RCS Backups
let g:rcsbackup_dir = '~/.local/share/vim/backups/'


" === Enable file type detection.
filetype plugin indent on


" === Auto-save if inside a git repo
autocmd BufRead *
    \ if finddir('.git', escape(expand('%:p:h'), ' ')..';') != "" |
    \   setlocal autowriteall |
    \   exe ":autocmd FocusLost,BufHidden" expand("%") ":update" |
    \ endif


" === Switch to tabs if they are in the file
autocmd BufRead *
    \ if search('^\t', 'cnw', 0, 200) != 0 |
    \  execute "setl ts=4 noexpandtab" |
    \ endif


" === Jump back where we left off
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute "normal g`\"zz" |
    \ else |
    \   execute "normal G$zz" |
    \ endif


" === Two space indent
autocmd BufRead,BufNewFile
    \ *.yml,*.yaml,*.js
    \ setl tabstop=2


" === Switch directoy on first file
autocmd BufRead,BufNewFile *
    \ if !exists('g:OnStartup_change_dir') |
    \   let g:OnStartup_change_dir = 1 |
    \   execute 'cd ' . expand('%:p:h') |
    \ endif


" === Hide terminals from next buffer
autocmd TerminalWinOpen * setlocal nobuflisted


" === File types
autocmd BufRead,BufNewFile [Dd]ockerfile* set ft=Dockerfile
autocmd BufRead,BufNewFile docker-compose*.{yaml,yml} set ft=yaml.docker-compose


" vim:ff=unix:

