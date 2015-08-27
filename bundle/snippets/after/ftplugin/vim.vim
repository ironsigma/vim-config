" vim: filetype=vim
ParseThisSnippetFile
finish

:snippet class
let s:<@>MyClass = {}

function s:MyClass.new() dict
    let this = copy(self)
    return this
endfunction

:snippet log
echo '['. <@> .']'

:snippet fun
function<@>
endfunction

:snippet if
if <@>
endif

:snippet for
for <@>
endfor
