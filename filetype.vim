" My filetype file
if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect

    " specific files
    autocmd! BufRead,BufNewFile access_log   setfiletype httpclog

    " extensions
    autocmd! BufRead,BufNewFile *.mkd        setfiletype markdown
    autocmd! BufRead,BufNewFile *.md         setfiletype markdown

    autocmd! BufRead,BufNewFile *.twig       setfiletype twig
    autocmd! BufRead,BufNewFile *.php        setfiletype php.html.javascript

    " types
    autocmd! FileType yaml      setlocal sts=4 sw=4
    autocmd! FileType php       setlocal isk-=58 foldlevel=1
    autocmd! FileType java      setlocal fdm=syntax
    autocmd! FileType markdown  setlocal tw=80

augroup END

" Read external detect files
runtime! ftdetect/*.vim

" vim:ff=unix:
