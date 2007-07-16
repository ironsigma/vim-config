if !exists(":Iabbr") || exists("b:did_perl_abbr")
    finish
endif
let b:did_perl_abbr = 1

" Perl Mappings
"--------------------------------------------------------------------------
Iabbr <buffer> if      <C-R>=MapNoContext("if ",         'if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> ifelse  <C-R>=MapNoContext("ifelse ",     'if ( ) {\<cr\>} else {\<cr\>}\<esc\>2kf)i')<cr>
Iabbr <buffer> else    <C-R>=MapNoContext("else ",       'else {\<cr\>}\<esc\>O')<cr>
Iabbr <buffer> unless  <C-R>=MapNoContext("unless ",     'unless ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> elseif  <C-R>=MapNoContext("elseif ",     'else if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> while   <C-R>=MapNoContext("while ",      'while ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> until   <C-R>=MapNoContext("until ",      'until ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> for     <C-R>=MapNoContext("for ",        'for ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> sub     <C-R>=MapNoContext("sub ",        'sub {\<cr\>}\<esc\>kf{i')<cr>
Iabbr <buffer> foreach <C-R>=MapNoContext("foreach ",    'foreach {\<cr\>}\<esc\>kf{i')<cr>
Iabbr <buffer> dowhile <C-R>=MapNoContext("dowhile ",    'do {\<cr\>} while ( )\<esc\>i')<cr>
Iabbr <buffer> dountil <C-R>=MapNoContext("dountil ",    'do {\<cr\>} until ( )\<esc\>i')<cr>
