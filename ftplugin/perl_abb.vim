if !exists(":Cabbr") || exists("b:did_perl_abbr")
    finish
endif
let b:did_perl_abbr = 1

" Perl Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> if      <C-R>=MapNoContext("if ",         'if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> ifelse  <C-R>=MapNoContext("ifelse ",     'if ( ) {\<cr\>} else {\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> else    <C-R>=MapNoContext("else ",       'else {\<cr\>}\<esc\>O')<cr>
Cabbr <buffer> unless  <C-R>=MapNoContext("unless ",     'unless ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> elseif  <C-R>=MapNoContext("elseif ",     'else if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> while   <C-R>=MapNoContext("while ",      'while ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> until   <C-R>=MapNoContext("until ",      'until ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> for     <C-R>=MapNoContext("for ",        'for ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> sub     <C-R>=MapNoContext("sub ",        'sub {\<cr\>}\<esc\>kf{i')<cr>
Cabbr <buffer> foreach <C-R>=MapNoContext("foreach ",    'foreach {\<cr\>}\<esc\>kf{i')<cr>
Cabbr <buffer> dowhile <C-R>=MapNoContext("dowhile ",    'do {\<cr\>} while ( )\<esc\>i')<cr>
Cabbr <buffer> dountil <C-R>=MapNoContext("dountil ",    'do {\<cr\>} until ( )\<esc\>i')<cr>
