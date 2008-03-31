" My filetype file
if exists("did_load_filetypes")
    finish
endif

fun! ObjeCHeaderDetect()
    let l = line('.')
    let c = col('.')
    if search('^\s*@\(interface\|protocol\)\>', 'w')
        set filetype=objc
        compiler xcode
    endif
    sil exec 'normal! '.l.'G'
    sil exec 'normal! '.c.'|'
endfun

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

    " Objective-C
    autocmd! BufRead,BufNewFile *.m          setfiletype     objc    | compiler xcode
    autocmd! BufRead,BufNewFile *.mm         setfiletype     objc    | compiler xcode
    autocmd! BufRead,BufNewFile *.h          call ObjeCHeaderDetect()

    " auto-complete
    autocmd! FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd! FileType xml  set omnifunc=xmlcomplete#CompleteTags

augroup END
