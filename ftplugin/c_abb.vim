if !exists(":Cabbr") || exists("b:did_c_abbr")
    finish
endif
let b:did_c_abbr = 1

" C Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> if     <C-R>=MapNoContext("if ",     'if ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> else   <C-R>=MapNoContext("else ",   'else {\<cr\>}\<esc\>O')<cr>
Cabbr <buffer> for    <C-R>=MapNoContext("for ",    'for ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> while  <C-R>=MapNoContext("while ",  'while ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> switch <C-R>=MapNoContext("switch ", 'switch ( ) {\<cr\>}\<esc\>kf)i')<cr>
Cabbr <buffer> struct <C-R>=MapNoContext("struct ", 'struct {\<cr\>};\<esc\>k$F{i')<cr>
Cabbr <buffer> head   <C-R>=MapNoContext("head ",   '#ifndef !head!_H\<cr\>'.
            \'#define !head!_H\<cr\>\<cr\>#endif // !head!_H\<esc\>:%s/!head!/')<cr>
