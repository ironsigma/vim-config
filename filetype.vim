" My filetype file
if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect

    " specific files
    autocmd! BufRead,BufNewFile access_log   setfiletype httpclog
    autocmd! BufRead,BufNewFile build.xml    compiler    ant

    " extensions
    autocmd! BufRead,BufNewFile *.mkd        setfiletype markdown | setl tw=80
    autocmd! BufRead,BufNewFile *.twig       setfiletype twig
    autocmd! BufRead,BufNewFile *.jad        setfiletype java
    autocmd! BufRead,BufNewFile *.java       compiler    ant | set fdm=syntax
    autocmd! BufRead,BufNewFile *.php        setfiletype php.html.javascript | compiler php  | setl isk-=58 foldlevel=1
    autocmd! BufRead,BufNewFile *.yml        setlocal    sts=4 sw=4
    autocmd! BufRead,BufNewFile *.pl         compiler    perl

    " types
    autocmd! FileType python  comp python

augroup END

" Read external detect files
runtime! ftdetect/*.vim

" vim:ff=unix:
