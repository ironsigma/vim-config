
" Eat character {{{1
"--------------------------------------------------------------------------
function! EatChar(pat)
  let c = nr2char(getchar())
  return (c =~ a:pat) ? '' : c
endfunction

" Map key sequence with context {{{1
"--------------------------------------------------------------------------
function! MapNoContext(key, seq) "
  let syn = synIDattr(synID(line('.'),col('.')-1,1),'name')
  if syn =~? 'comment\|string\|character\|doxygen' || substitute(getline('.'), '\s\+', '', '') != ''
    return a:key
  else
    exe 'return "'.substitute(a:seq,'\\<\(.\{-}\)\\>','"."\\<\1>"."','g' ).'"'
  endif
endfunction
" 1}}}

command! -narg=+ Iabbr execute "iabbr " <q-args>."<C-R>=EatChar('\\s')<CR>"

" vim:fdm=marker:nowrap:
