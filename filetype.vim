" My filetype file
if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect

    " specific files
    autocmd! BufRead,BufNewFile access_log   setfiletype    httpclog
    autocmd! BufRead,BufNewFile build.xml    compiler       ant

    " extensions
    autocmd! BufRead,BufNewFile *.jad        setfiletype    java
    autocmd! BufRead,BufNewFile *.java       compiler       ant
    autocmd! BufRead,BufNewFile *.php        compiler       php
    autocmd! BufRead,BufNewFile *.pl         compiler       perl | setlocal complete-=i
    autocmd! BufRead,BufNewFile *.ion        setfiletype    ion
    autocmd! BufRead,BufNewFile *.html       runtime        ftplugin/xml.vim
    autocmd! BufRead,BufNewFile *.tpl        runtime        ftplugin/xml.vim

    " auto-complete
    autocmd! FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd! FileType xml  set omnifunc=xmlcomplete#CompleteTags

augroup END

" Read external detect files
runtime! ftdetect/*.vim

" vim:ff=unix:
