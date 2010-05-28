"      Author:  Juan D Frias <jfrias@boxfi.com>
"     Version:  1.1
" Description:  SuperTab emulator
"
"     History:  1.0  First implementation
"               1.1 Changed from AutoComplete to SuperTab to work with snippetsEmu

function! <sid>SuperTab(command)
    if (strpart(getline('.'),col('.')-2,1)=~'^\s\?$')
        return "\<tab>"
    endif
    if a:command == 'n'
        return "\<c-n>"
    else
        return "\<c-p>"
    endif
endf
