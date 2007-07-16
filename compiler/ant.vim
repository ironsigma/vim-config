" Vim Compiler File ant.vim
" Compiler: Apache ant

if exists("current_compiler")
    finish
endif

let current_compiler = "ant"
setlocal makeprg=ant\ -e\ -s\ build.xml\ -nice\ 10
