if !exists(":Cabbr") || exists("b:did_cs_abbr")
    finish
endif
let b:did_cs_abbr = 1

" C Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> if      <C-R>=MapNoContext("if ",      'if ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> else    <C-R>=MapNoContext("else ",    'else\<cr\>{\<cr\>}\<esc\>O')<cr>
Cabbr <buffer> for     <C-R>=MapNoContext("for ",     'for ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> foreach <C-R>=MapNoContext("foreach ", 'foreach ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> while   <C-R>=MapNoContext("while ",   'while ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> switch  <C-R>=MapNoContext("switch ",  'switch ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> class   <C-R>=MapNoContext("class ",   'class \<cr\>{\<cr\>}\<esc\>2kA')<cr>
