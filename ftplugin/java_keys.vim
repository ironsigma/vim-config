function! s:AntCompiler(args)
    echohl ErrorMsg
    echo "Runningn ant..."
    echohl None
    exec "sil! make ".a:args
    cwindow
    redraw!
endfunction

nnoremap <buffer> <silent> <f9> :call <sid>AntCompiler("-q")<cr>
nnoremap <buffer> <silent> <f10> :call <sid>AntCompiler("run")<cr>

" Folding token
iabbrev //{ <esc>hvF*lly/{<cr>%A // }}} <esc>p^%?\/\*\*<cr>A{{{<esc>:nohlsearch<cr>A

syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend
set foldmethod=syntax
set foldnestmax=3
