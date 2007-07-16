" Vim Compiler File    javac.vim
" Compiler: Sun/IBM JDK: Javac

if exists("current_compiler")
  finish
endif
let current_compiler = "javac"

setlocal makeprg=javac\ -g\ -deprecation\ %<.java
set errorformat=%A%f:%l:\ %m,%C%*[^:],%C%*[^:]

"setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
