if !exists(":Cabbr") || exists("b:did_php_abbr")
    finish
endif
let b:did_php_abbr = 1

let st = g:snip_start_tag
let et = g:snip_end_tag

" PHP Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> if       <C-R>=MapNoContext("if ",       'if ( ) {\<cr\>'.st.et.'\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> else     <C-R>=MapNoContext("else ",     'else {\<cr\>}\<esc\>O')<cr>
Cabbr <buffer> elseif   <C-R>=MapNoContext("elseif ",     'else if ( ) {'.st.et.'\<cr\>\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> for      <C-R>=MapNoContext("for ",      'for ( ) {\<cr\>'.st.et.'\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> foreach  <C-R>=MapNoContext("foreach ",  'foreach ( ) {\<cr\>'.st.et.'\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> while    <C-R>=MapNoContext("while ",    'while ( ) {\<cr\>'.st.et.'\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> switch   <C-R>=MapNoContext("switch ",   'switch ( ) {\<cr\>'.st.et.'\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> function <C-R>=MapNoContext("function ", 'function () {\<cr\>'.st.et.'\<cr\>}\<esc\>2kf(i')<cr>
Cabbr <buffer> php      <C-R>=MapNoContext("php ",      '<?php  ?>\<esc\>2hi')<cr>
Cabbr <buffer> echo     <C-R>=MapNoContext("echo ",     '<?php echo  ?>\<esc\>2hi')<cr>
Cabbr <buffer> doc      <C-R>=MapNoContext('doc ',      '/**\<cr\>'.
                                                        \'\<cr\>'.
                                                        \'\<cr\>'.
                                                        \'@author Juan Frias <juandfrias@gmail.com>\<cr\>'.
                                                        \'@package '.st.et.'\<cr\>'.
                                                        \'/\<esc\>4kA')<cr>
