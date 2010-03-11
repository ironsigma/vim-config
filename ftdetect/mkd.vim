
" markdown filetype file
au BufRead,BufNewFile *.mkd setlocal filetype=mkd
au BufRead *.mkd  setlocal ai formatoptions=tcroqn2 comments=n:&gt;
