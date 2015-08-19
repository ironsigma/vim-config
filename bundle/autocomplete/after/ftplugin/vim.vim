" vim filetype=vim

call ParseSnippetFile(expand('<sfile>:p'))
finish

:snippet function
function<@>
endfunction

:snippet if
if <@>
endif

:snippet for
for <@> in
endfor
