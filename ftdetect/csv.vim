" CSV file type autodetect

fun! CsvFileDetect()
    let l = line('.')
    let c = col('.')
    if search('^[^,]\+', 'w') && search(',\d\+,', 'w') && search(',\x\{8},', 'w') && search(',[/\\].\{-1,}[/\\],', 'w') && search(',[^,]*$', 'w')
        set filetype=csv
    endif
    sil exec 'normal! '.l.'G'
    sil exec 'normal! '.c.'|'
endfun

augroup csv_detect
    autocmd! BufRead,BufNewFile *.csv   call CsvFileDetect()
augroup END
