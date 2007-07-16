function! MakeAccesor()
    " save pos
    let cline = line('.')
    let ccol  = col('.')

    " get line and set expression
    let line = getline('.')
    let exp  = '^\s*\([a-zA-Z0-9_]\+\)\s*\(\**\)\s*\([^;]\+\).*$'

    " get type
    let type = substitute(line, exp, '\1 \2', '')
    let type = substitute(type, '\s\+$', '', '')

    " get name
    let name = substitute(line, exp, '\3', '')
    let uname = toupper(strpart(name,0,1)).strpart(name,1)

    " prefix
    if type == 'BOOL'
        let accessor = 'is'.uname
    else
        let accessor = name
    endif

    " write interface
    call search("^\s*@end\s*")
    exec "normal! O- (".type.")".accessor.";\<cr>".
                 \"- (void)set".uname.":(".type.")the".uname.";\<cr>"

    " write implementation
    call search("^\s*@end\s*")
    exec "normal! o\<cr>- (".type.")".accessor."\<cr>{\<cr>return ".name.";\<cr>}"
    if type == 'BOOL'
        exec "normal! o- (void)set".uname.":(".type.")the".uname."\<cr>{\<cr>".
                    \name." = the".uname.";\<cr>}"
    else
        exec "normal! o- (void)set".uname.":(".type.")the".uname."\<cr>{\<cr>".
                    \"[the".uname." retain];\<cr>".
                    \"[".name." release];\<cr>".
                    \name." = the".uname.";\<cr>}"
    endif

    " load pos
    exec "normal! ".cline."G".ccol."|"
endfunction
