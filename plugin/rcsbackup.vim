" Automatically backup files using RCS
"
"  Author: Juan D Frias
"   Email: juandfrias@gmail.com
" Created: Feb 21, 2018
" Updated: Oct 23, 2020
" Version: 2.4.4
"
" You will need RCS installed on your machine in order for this script to
" work, all saves will be automatically stored to the directory specified.
"
" If you would like to see the revision list use <leader>rlog. Inside the list
" you can use <cr> to run a diff between your current version and the revision
" selected. Note: your file need not be saved, so you can run a diff with the
" last revision and your working changes.
"

" Load once
if exists('g:loaded_rcsbackup')
    finish
endif

let g:loaded_rcsbackup=1

" Path where files are saved
if !exists('g:rcsbackup_dir')
    let g:rcsbackup_dir = '~/.rcs/'
endif

" Calculate file name, suffix, RCS file and log list. {{{1
function! s:InitVariables()
    let s:file = expand('%:p')
    let s:suffix = ',' .. substitute(expand('%:p:h'), '[[:blank:]/]', '_', 'g')
    let s:rcsfile = expand(g:rcsbackup_dir) .. expand('%:t') .. s:suffix
    let s:loglist = s:file .. '.rcsbackup'
endfunction

" Save revision to RCS file {{{1
function! s:Save()
    call s:InitVariables()

    " Wipeout the log list to force a regeneration
    if bufexists(s:loglist)
        exec 'bwipeout!' .. s:loglist
    endif

    " Create empty RCS file
    if !filereadable(s:rcsfile)
        let l:cmd = 'rcs -i -q -kb -U ''-t-Vim auto-backup file'' -x' ..
                \ s:suffix .. ' ' .. shellescape(s:rcsfile) .. ' ' .. shellescape(s:file)

        silent let l:output = system(l:cmd)

        if v:shell_error
            echoerr 'Error creating RCS file'
            echom 'cmd {' .. l:cmd .. '}'
            echom 'out {' .. l:output .. '}'
            return
        endif

    endif

    " Save changes
    let l:cmd = 'ci -q -u ''-mVim auto-backup revision'' -x' ..
                \ s:suffix .. ' ' .. shellescape(s:rcsfile) .. ' ' .. shellescape(s:file)

    silent let l:output = system(l:cmd)
    "... echom 'cmd {' .. l:cmd .. '}'
    "... echom 'out {' .. l:output .. '}'
endfunction

" Diff the existing file to the revision selected. {{{1
function! s:Diff()
    " Get the selected revision
    let l:rev = substitute(getline('.'), '^\([0-9.]\+\) .*$', '\1', '')
    close!

    " Get the revision content
    echom 'Reading revision ' .. l:rev .. '...'
    call s:InitVariables()
    silent let l:content = systemlist('co -q -p' .. l:rev .. ' -x' ..
    	    \ s:suffix .. ' ' .. shellescape(s:rcsfile) .. ' ' .. shellescape(s:file))

    " Save the current file type and activate diff
    let l:ft = &ft
    diffthis

    " Create new buffer with same file type
    vertical new
    exec 'setlocal ft=' .l:ft
    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nobuflisted

    " Append content, delete trailing last line and diff this.
    call append(0, l:content)
    exec 'normal! ddgg'
    diffthis

    " Map rlog to get rid of this file before calling log
    nnoremap <buffer> <silent> <leader>rlog :bdelete!<cr>:call <sid>Log()<cr>
endfunction

" Print the revision list for the existing file {{{1
function! s:Log()
    call s:InitVariables()

    " If we already have a log list just show it.
    if bufexists(s:loglist)
        exec '30 vsplit ' .. s:loglist
        return
    endif

    " Get the list of revisions
    echom 'Building log list...'
    silent let l:log = systemlist('rlog -zLT -x' .. s:suffix .. ' ' ..
            \ shellescape(s:rcsfile) .. ' ' .. shellescape(s:file))

    " Error or empty list, exit
    if v:shell_error || empty(l:log)
        echom 'No revisions found for this file.'
        return
    endif

    " Create new buffer for log list
    exec 'vertical 30 new ' .. s:loglist
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal nobuflisted
    setlocal nonumber
    setlocal foldcolumn=0

    " Add content and format
    call append(0, l:log)
    silent exec '%g!/^\(revision\|date:\)/d'
    silent exec '%s/^revision \([0-9.]\+\).*\ndate: \([-0-9]\+\) \([-+0-9 :]\+\).*/\1 \3 \2'
    silent exec 'normal! gg'

    " Create mappings
    nnoremap <buffer> <silent> <leader>rlog :close!<cr>
    nnoremap <buffer> <silent> q :close!<cr>
    nnoremap <buffer> <silent> <cr> :call <sid>Diff()<cr>
endfunction

" Hook the save function after any writes {{{1
augroup rcsbackup
    autocmd!
    autocmd BufWritePost,FileWritePost,FileAppendPost * call s:Save()
augroup END
" }}}1

" Add mapping to load revision log
nnoremap <silent> <leader>rlog :call <sid>Log()<cr>

" vim:fdm=marker:fdc=2:
