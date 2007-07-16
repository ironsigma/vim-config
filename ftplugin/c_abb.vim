if !exists(":Iabbr") || exists("b:did_c_abbr")
    finish
endif
let b:did_c_abbr = 1

" C Mappings
"--------------------------------------------------------------------------
Iabbr <buffer> if     <C-R>=MapNoContext("if ",     'if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> else   <C-R>=MapNoContext("else ",   'else {\<cr\>}\<esc\>O')<cr>
Iabbr <buffer> for    <C-R>=MapNoContext("for ",    'for ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> while  <C-R>=MapNoContext("while ",  'while ( ) {\<cr\>}\<esc\>kf)i')<cr>
Iabbr <buffer> switch <C-R>=MapNoContext("switch ", 'switch ( ) {\<cr\>case 1:\<cr\>break;'.
            \'\<cr\>\<cr\>default:\<cr\>break;\<cr\>}\<esc\>6kf)i')<cr>

Iabbr <buffer> struct <C-R>=MapNoContext("struct ", 'struct {\<cr\>};\<esc\>k$F{i')<cr>

Iabbr <buffer> head <C-R>=MapNoContext("head ",   '#ifndef !head!_H\<cr\>'.
            \'#define !head!_H\<cr\>\<cr\>#endif // !head!_H\<esc\>:%s/!head!/')<cr>

" vim:nowrap:
