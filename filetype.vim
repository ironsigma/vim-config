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
    autocmd! BufRead,BufNewFile *.pl         compiler    perl | setlocal complete-=iu
    autocmd! BufRead,BufNewFile *.bix        setfiletype php.html.javascript | compiler php | setl isk-=58 ts=4 noet foldlevel=1
    autocmd! BufRead,BufNewFile *.tex        setfiletype tex | setlocal fmr=(fold),(end) fdm=marker

    " types
    autocmd! FileType python  comp python

    " auto-complete
    autocmd! FileType html setl omnifunc=htmlcomplete#CompleteTags
    autocmd! FileType xml  setl omnifunc=xmlcomplete#CompleteTags
    autocmd! FileType php  setl omnifunc=phpcomplete#CompletePHP
    autocmd! FileType css  setl omnifunc=csscomplete#CompleteCSS
    autocmd! FileType javascript  setl omnifunc=javascriptcomplete#CompleteJS

augroup END

" Read external detect files
runtime! ftdetect/*.vim

" vim:ff=unix:
