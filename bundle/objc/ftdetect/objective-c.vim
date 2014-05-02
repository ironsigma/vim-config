" Objective-C file type autodetect

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

augroup objcdetect
    autocmd! BufRead,BufNewFile *.m          setfiletype     objc    | compiler xcode
    autocmd! BufRead,BufNewFile *.mm         setfiletype     objc    | compiler xcode
    autocmd! BufRead,BufNewFile *.h          call ObjeCHeaderDetect()
augroup END
