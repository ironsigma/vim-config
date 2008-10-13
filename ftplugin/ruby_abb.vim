if !exists(":Cabbr") || exists("b:did_ruby_abbr")
    finish
endif
let b:did_ruby_abbr = 1

" PHP Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> if    <C-R>=MapNoContext('if ',    'if \<cr\>end\<esc\>kA')<cr>
Cabbr <buffer> class <C-R>=MapNoContext('class ', 'class \<cr\>end\<esc\>kA')<cr>
Cabbr <buffer> while <C-R>=MapNoContext('while ', 'while \<cr\>end\<esc\>kfA')<cr>
Cabbr <buffer> def   <C-R>=MapNoContext('def ',   'def \<cr\>end\<esc\>kA')<cr>
