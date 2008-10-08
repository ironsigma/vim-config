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
    autocmd! BufRead,BufNewFile *.pl         compiler    perl | setlocal complete-=i
    autocmd! BufRead,BufNewFile *.ion        setfiletype ion
    autocmd! BufRead,BufNewFile *.html,*.tpl runtime     ftplugin/xml.vim
    autocmd! BufRead,BufNewFile *.rb         runtime     ftplugin/xml.vim | setlocal sts=2 sw=2
    autocmd! BufRead,BufNewFile *.erb        runtime     ftplugin/xml.vim | setfiletype eruby | setlocal sts=2 sw=2

    " auto-complete
    autocmd! FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd! FileType xml  set omnifunc=xmlcomplete#CompleteTags

augroup END

" Read external detect files
runtime! ftdetect/*.vim

" vim:ff=unix:
