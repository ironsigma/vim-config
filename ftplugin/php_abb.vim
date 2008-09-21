if !exists(":Cabbr") || exists("b:did_php_abbr")
    finish
endif
let b:did_php_abbr = 1

" PHP Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> if       <C-R>=MapNoContext("if ",       'if ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> else     <C-R>=MapNoContext("else ",     'else\<cr\>{\<cr\>}\<esc\>O')<cr>
Cabbr <buffer> elseif   <C-R>=MapNoContext("elseif ",   'else if ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> for      <C-R>=MapNoContext("for ",      'for ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> foreach  <C-R>=MapNoContext("foreach ",  'foreach ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> while    <C-R>=MapNoContext("while ",    'while ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> switch   <C-R>=MapNoContext("switch ",   'switch ( )\<cr\>{\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> function <C-R>=MapNoContext("function ", 'function ()\<cr\>{\<cr\>}\<esc\>2kf(i')<cr>
