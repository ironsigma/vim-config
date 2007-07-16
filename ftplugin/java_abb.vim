if !exists(":Iabbr") || exists("b:did_java_abbr")
    finish
endif
let b:did_java_abbr = 1

" Java Mappings
"--------------------------------------------------------------------------
Iabbr <buffer> if     <C-R>=MapNoContext("if ",         'if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> else   <C-R>=MapNoContext("else ",       'else {\<cr\>}\<esc\>O')<cr>
Iabbr <buffer> elseif <C-R>=MapNoContext("elseif ",     'else if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> try    <C-R>=MapNoContext("try ",        'try {\<cr\>}\<esc\>O')<cr>
Iabbr <buffer> catch  <C-R>=MapNoContext("catch ",      'catch ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> for    <C-R>=MapNoContext("for ",        'for ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> while  <C-R>=MapNoContext("while ",      'while ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> switch <C-R>=MapNoContext("switch ",     'switch ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> class  <C-R>=MapNoContext("class ",      'class  {\<cr\>}\<esc\>kf{hi')<cr>
Iabbr <buffer> sysout <C-R>=MapNoContext("sysout ",     'System.out.println();\<esc\>Fa')<cr>
Iabbr <buffer> {      <C-R>=MapNoContext("{",           '{\<cr\>}\<esc\>kA')<cr>
