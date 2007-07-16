if exists("current_compiler")
    finish
endif

let current_compiler = "perl"

if has("win32")
    set makeprg=perl\ c:/vim/vimfiles/compiler/vimparse.pl\ -c\ %\ $*
else
    set makeprg=$HOME/.vim/compiler/vimparse.pl\ -c\ %\ $*
endif

set errorformat=%f:%l:%m
