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
    autocmd! BufRead,BufNewFile *.php        setfiletype php.html.javascript | compiler php  | setl isk-=58 foldlevel=1
    autocmd! BufRead,BufNewFile *.yml        setlocal    sts=2 sw=2
    autocmd! BufRead,BufNewFile *.pl         compiler    perl | setlocal complete-=iu
    autocmd! BufRead,BufNewFile *.ion        setfiletype ion
    autocmd! BufRead,BufNewFile *.html,*.tpl runtime     ftplugin/xml.vim
    autocmd! BufRead,BufNewFile *.bix        setfiletype php.html.javascript | compiler php | setl isk-=58 ts=4 noet foldlevel=1

    " types
    autocmd! FileType python  comp python
    autocmd! FileType html    runtime ftplugin/xml.vim

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
