if !exists(":Cabbr") || exists("b:did_java_abbr")
    finish
endif
let b:did_java_abbr = 1

" Java Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> if     <C-R>=MapNoContext("if ",         'if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> else   <C-R>=MapNoContext("else ",       'else {\<cr\>}\<esc\>O')<cr>
Cabbr <buffer> elseif <C-R>=MapNoContext("elseif ",     'else if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> try    <C-R>=MapNoContext("try ",        'try {\<cr\>}\<esc\>O')<cr>
Cabbr <buffer> catch  <C-R>=MapNoContext("catch ",      'catch ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> for    <C-R>=MapNoContext("for ",        'for ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> while  <C-R>=MapNoContext("while ",      'while ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> switch <C-R>=MapNoContext("switch ",     'switch ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> class  <C-R>=MapNoContext("class ",      'class  {\<cr\>}\<esc\>kf{hi')<cr>
Cabbr <buffer> sysout <C-R>=MapNoContext("sysout ",     'System.out.println();\<esc\>Fa')<cr>
Cabbr <buffer> {      <C-R>=MapNoContext("{",           '{\<cr\>}\<esc\>kA')<cr>
