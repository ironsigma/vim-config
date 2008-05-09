if exists("current_compiler")
    finish
endif

let current_compiler = "perl"

if has("win32")
    set makeprg=perl\ $HOME\\vimfiles\\script\\vim_perl_parse.pl\ -c\ %\ $*
else
    set makeprg=$HOME/.vim/script/vim_perl_parse.pl\ -c\ %\ $*
endif

set errorformat=%f:%l:%m
