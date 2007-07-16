if !exists(":Iabbr") || exists("b:did_php_abbr")
   finish
endif
let b:did_php_abbr = 1

" PHP Mappings
"--------------------------------------------------------------------------
Iabbr <buffer> if       <C-R>=MapNoContext("if ",       'if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> else     <C-R>=MapNoContext("else ",     'else {\<cr\>}\<esc\>O')<cr>
Iabbr <buffer> elseif   <C-R>=MapNoContext("elseif ",     'else if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> for      <C-R>=MapNoContext("for ",      'for ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> foreach  <C-R>=MapNoContext("foreach ",  'foreach ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> while    <C-R>=MapNoContext("while ",    'while ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> switch   <C-R>=MapNoContext("switch ",   'switch ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> function <C-R>=MapNoContext("function ", 'function () {\<cr\>}\<esc\>kf(i')<cr>
