if !exists(":Cabbr") || exists("b:did_c_abbr")
    finish
endif
let b:did_c_abbr = 1

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

" C Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> if     <C-R>=MapNoContext("if ",     'if ( ) {\<cr\>'.st.et.'\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> else   <C-R>=MapNoContext("else ",   'else {\<cr\>}\<esc\>O')<cr>
Cabbr <buffer> for    <C-R>=MapNoContext("for ",    'for ( ) {\<cr\>'.st.et.'\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> while  <C-R>=MapNoContext("while ",  'while ( ) {\<cr\>'.st.et.'\<cr\>}\<esc\>2kf)i')<cr>
Cabbr <buffer> switch <C-R>=MapNoContext("switch ", 'switch ( ) {\<cr\>'.
            \'case '.st.et.'\<cr\>'.
                \'break;\<cr\>'.
                \'\<cr\>'.
            \'case '.st.et.'\<cr\>'.
                \'break;\<cr\>'.
                \'\<cr\>'.
            \'default:\<cr\>'.
                \st.et.'\<cr\>'.
                \'break;\<cr\>'.
            \'}\<esc\>9kf)i')<cr>

Cabbr <buffer> struct <C-R>=MapNoContext("struct ", 'struct {\<cr\>};\<esc\>k$F{i')<cr>

Cabbr <buffer> head <C-R>=MapNoContext("head ",   '#ifndef !head!_H\<cr\>'.
            \'#define !head!_H\<cr\>\<cr\>#endif // !head!_H\<esc\>:%s/!head!/')<cr>
