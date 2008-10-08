if !exists(":Cabbr") || exists("b:did_php_abbr")
    finish
endif
let b:did_php_abbr = 1

" PHP Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> //*      <C-R>=MapNoContext("//* ",      '/**\<cr\>/\<esc\>O')<cr>
Cabbr <buffer> if       <C-R>=MapNoContext("if ",       'if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> else     <C-R>=MapNoContext("else ",     'else {\<cr\>}\<esc\>O')<cr>
Cabbr <buffer> elseif   <C-R>=MapNoContext("elseif ",   'else if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> for      <C-R>=MapNoContext("for ",      'for ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> foreach  <C-R>=MapNoContext("foreach ",  'foreach ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> while    <C-R>=MapNoContext("while ",    'while ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> switch   <C-R>=MapNoContext("switch ",   'switch ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> function <C-R>=MapNoContext("function ", 'function () {\<cr\>}\<esc\>kf(i')<cr>
