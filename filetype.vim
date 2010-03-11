" My filetype file
if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect

    " specific files
    autocmd! BufRead,BufNewFile access_log   setfiletype httpclog
    autocmd! BufRead,BufNewFile build.xml    compiler    ant

    " extensions
    autocmd! BufRead,BufNewFile *.jad        setfiletype java
    autocmd! BufRead,BufNewFile *.java       compiler    ant
    autocmd! BufRead,BufNewFile *.php        runtime     ftplugin/xml.vim | compiler php  | setlocal sts=2 sw=2 foldlevel=1
    autocmd! BufRead,BufNewFile *.yml        setlocal    sts=2 sw=2
    autocmd! BufRead,BufNewFile *.pl         compiler    perl | setlocal complete-=i
    autocmd! BufRead,BufNewFile *.ion        setfiletype ion
    autocmd! BufRead,BufNewFile *.html,*.tpl runtime     ftplugin/xml.vim
    autocmd! BufRead,BufNewFile *.bi,*.bix   setlocal    ts=4 noet ft=php

    " types
    autocmd! FileType python  comp python
    autocmd! FileType html    runtime ftplugin/xml.vim

    " auto-complete
    autocmd! FileType html setl omnifunc=htmlcomplete#CompleteTags
    autocmd! FileType xml  setl omnifunc=xmlcomplete#CompleteTags

augroup END

" Read external detect files
runtime! ftdetect/*.vim

" vim:ff=unix:
