" Abbreviations
iabbr <buffer> dt <C-R>=strftime("%Y-%m-%d")<cr>
iabbr <buffer> tm <C-R>=strftime("%H:%M")<cr>

" Action mappings
nnoremap <buffer> <Leader>s :exe ".s/\s*$/ start:" . strftime("%Y-%m-%dT%H:%M") . "/"<cr>:nohlsearch<cr><c-o>
nnoremap <buffer> <Leader>x :exe "normal! ^rx"<cr>:exe ".s/\s*$/ done:" . strftime("%Y-%m-%dT%H:%M") . "/"<cr>:exec "normal! dd"<cr>:call search('^$')<cr>:exec "normal! P"<cr>:nohlsearch<cr><c-o>

" Sorting mappings
vnoremap <buffer> <Leader>p :sort  r  /+[a-z0-9_]\+/<cr>
vnoremap <buffer> <Leader>c :sort  r  /@[a-z0-9_]\+/<cr>
vnoremap <buffer> <Leader>d :sort  r  /due:\zs\d\{4}-\d\d-\d\d/<cr>
vnoremap <buffer> <Leader>r :sort! r  /dur:\d\+\zs[hmd]/<cr>
vnoremap <buffer> <Leader>t :sort  rn /dur:\zs\d\+/<cr>
