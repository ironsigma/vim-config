" Vim Compiler File    php.vim
" Compiler: PHP Syntax check

if exists("current_compiler")
  finish
endif
let current_compiler = "php"

setlocal makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
