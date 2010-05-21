"------------------------------------------------------------------------------
" Name Of File: filter_file_explorer.vim
"
"  Description: Vim plugin to do file browsing using incremental filtering.
"
"       Author: Juan D Frias (juandfrias at gmail.com)
"
"  Last Change: 2010 Apr 29 TODO: update
"      Version: 1.0
"
"    Copyright: Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this header
"               is included with it.
"
"               This script is to be distributed freely in the hope that it
"               will be useful, but is provided 'as is' and without warranties
"               as to performance of merchantability or any other warranties
"               whether expressed or implied. Because of the various hardware
"               and software environments into which this script may be put,
"               no warranty of fitness for a particular purpose is offered.
"
"               GOOD DATA PROCESSING PROCEDURE DICTATES THAT ANY SCRIPT BE
"               THOROUGHLY TESTED WITH NON-CRITICAL DATA BEFORE RELYING ON IT.
"
"               THE USER MUST ASSUME THE ENTIRE RISK OF USING THE SCRIPT.
"
"               The author and maintainer do not retain any liability on any
"               damage caused through the use of this script.
"
"      Install: 1. Read the section titled 'User Options'
"               2. Setup any variables you need in your vimrc file
"               3. Copy 'filter_file_explorer.vim' to your plugin directory.
"
"  Mapped Keys: <leader>e
"                   Default mapping to <Plug>FilterFileExplorer, to overwrite
"                   add this to your vimrc file:
"
"                       nmap <silent> [your key] <Plug>FilterFileExplorer
"
" Keys In Explorer:
"
"               [printable characters], <bs>
"                   When you start typing the files will be filtered according
"                   to the filter pattern you are building. You can use
"                   regular expressions to build your filter.
"
"               <esc>
"                   Close the explorer window.
"
"               <cr>, <ctrl-o>
"                   Open the selected file in the current window. Or new
"                   window if the current file is moddifed. When <ctrl-o> is
"                   used it will keep the explorer window open.
"
"               <shift-cr>, <ctrl-w>
"                   Open the selected file in a new window. When <ctrl-w> is used
"                   it will keep the explorer window open
"
"               <tab>, <shift-tab>
"                   Select the next/previous file in the list.
"
"               <ctrl-h>
"                   Show hidden files.
"
"               <ctrl-r>
"                   Show all the files in this directory and recurse into
"                   sub-directories.
"
"               <ctrl-p>
"                   Toggle displaying current path.
"
"               <ctrl-n>
"                   Toggle displaying current filter.
"
"               <ctrl-u>
"                   Go up one directory.
"
"               <ctrl-l>
"                   Clear the filter.
"
"               <ctrl-f>
"                   Refresh directory listing
"
"               <ctrl-a>
"                   Open all files in directory
"
"               <ctrl-v>
"                   Open all files in directory in different windows
"
"               <ctrl-e>
"                   Edit file list. This will exit the plugin but keep the
"                   file window open for you to edit.
"
"------------------------------------------------------------------------------
" Please send me any bugs you find, so I can keep the script up to date.
"------------------------------------------------------------------------------
"
"" GetLatestVimScripts: XXX 1 rcsvers.vim TODO: change

" History: {{{1
"------------------------------------------------------------------------------
" 1.0   (2010-XX-XX) Initial upload. TODO: change date
" 0.1   (2010-04-28) Initial version.
"
" User Options: {{{1
"------------------------------------------------------------------------------
"
" g:ffeAlwaysOpenNewWindow
"       New window is only oppend when the key map states it or the current
"       file is modified. NOTE: If a selected file is already oppend in
"       another window a new window will NOT open even if this is set to 1.
"       To override use:
"           let g:ffeAlwaysOpenNewWindow = 1
"       in your vimrc file.
"
" g:ffeCaseSensitive
"       Filtering is done using ignorecase current setting. (see :help ic)
"       To override use:
"           let g:ffeCaseSensitive = <option>
"       in your vimrc file. Where <option> is one fo the following:
"           'system'      = use ignorecase system setting (default)
"           'sensitive'   = use case-sensitive searching
"           'insensitive' = use case-insensitive searching
"
" g:ffeShowDotFiles
"       Explorer does not show dot files.
"       To override use:
"           let g:ffeShowDotFiles = 1
"       in your vimrc file.
"
" g:ffeExplorerOnTop
"       Explorer window is oppened on the bottom.
"       To override use:
"           let g:ffeExplorerOnTop = 1
"       in your vimrc file.
"
" g:ffeDirSeparator
"       Separator to use between paths, the script will try to auto detect
"       this but to override use:
"           let g:ffeDirSeparator = <separator>
"       in your vimrc file.
"
" g:ffeDisplayPath
"       Explorer does not show the current path to save window space.
"       To override use:
"           let g:ffeDisplayPath = 1
"       in your vimrc file.
"
" g:ffeKeepExplorerWindowOpen
"       The window closes once a file is selected for editing. Except when
"       using the keys map states it.
"       To override use:
"           let g:ffeKeepExplorerWindowOpen = 1
"       in your vimrc file.
"
" g:ffeWildIgnoreFile
"       Explorer uses this wildcard pattern to prevent from display the files
"       AND directories matching it. By default it shows all files except dot
"       files (see g:ffeShowDotFiles)
"       To override use:
"           let g:ffeWildIgnoreFile = <pattern>
"       in your vimrc file. For example to ignore .obj, .o and backup files:
"           let g:ffeWildIgnoreFile = '*.obj,*.o,*~'
"       see :help wildignore for details.
"
" g:ffeIgnoreFileRexExPattern
"       Explorer uses this regular expression pattern to prevent from display
"       the files matching the expression. By default it shows all files
"       except dot files (see g:ffeShowDotFiles) NOTE: Does not match against
"       directory names
"       To override use:
"           let g:ffeIgnoreFileRexExPattern = <pattern>
"       in your vimrc file. For example to ignore .obj, .o and backup files:
"           let g:ffeIgnoreFileRexExPattern = '\.obj\|\.o$\|\~$'
"       see :help regexp for details.
"
" g:ffeShowFilter
"       Explorer shows a line with the filter when it is not empty.
"       To override use:
"           let g:ShowFilter = <option>
"       in your vimrc file. Where <option> is one of:
"           'never'  = never show
"           'auto'   = display only when the filter is not empty (default)
"           'always' = always display

" Load script once {{{1
"------------------------------------------------------------------------------
if exists("loaded_filter_file_explorer") || &cp
    finish
endif
"...let loaded_filter_file_explorer = 1 TODO: remove

" Check for functionality {{{1
"------------------------------------------------------------------------------
if version < 700
    echohl ErrorMsg
    echon "WARNING: FilterFileExplorer requires Vim version 7+, plugin not loaded."
    echohl none
    finish
endif
"}}}

function! s:SetDefault(var, value) "{{{1
    if !exists(a:var)
        let value = a:value
        if type(a:value) == type("")
            let value = "'".value."'"
        endif
        exec 'let '.a:var.'='.value
    endif
endfunction
function! s:CloseExplorerWindow() "{{{1
    call s:RestoreVimOptions()
    close!
    let s:explorer_open = 0
    syntax clear FilterFileExplorerMatch
    syntax clear FilterFileExplorerDirectory
    syntax clear FilterFileExplorerSelected
endfunction
function! s:EditFile(fname, open_window) "{{{1
    if s:explorer_open || g:ffeKeepExplorerWindowOpen
        exec s:orig_win.' wincmd w'
    endif

    let fname = a:fname

    if has("unix")
        let fname = substitute(fname, ' ', '\\ ', 'g')
    endif

    " if the file is alredy in another window, switch to it
    let winnum = bufwinnr(fname)
    if winnum != -1
        if winnum != winnr()
            exe winnum . ' wincmd w'
        endif
    else
        " if the buffer is in the ring switch to it
        let bno = bufnr(fname)
        if bno != -1
            if g:ffeAlwaysOpenNewWindow || a:open_window || &modified
                exe 'sbuffer ' . bno
            else
                exe 'buffer ' . bno
            endif
        " start editing the file
        else
            if g:ffeAlwaysOpenNewWindow || a:open_window || &modified
                exe 'sp ' . fname
            else
                exe 'edit ' . fname
            endif
        endif
    endif

    let new_win = winnr()
    if s:explorer_open || g:ffeKeepExplorerWindowOpen
        let exp_win = bufwinnr(s:explorer_buffnr)
        exec exp_win .' wincmd w'
    endif
    return new_win
endfunction
function! s:LockExplorerBuffer() "{{{1
    let line = ''
    let len = strlen(getline('.'))
    while len < winwidth(0)
        let line .= ' '
        let len += 1
    endwhile
    exec 'normal! A'.line
    normal! g$ze
    setl nomodified
    setl nomodifiable
endfunction
function! s:DisplayList(list) "{{{1
    setl modifiable
    exec 'normal! gg"_dG'

    let num_items = len(a:list)

    if s:show_path
        exec 'normal! Alisting of '.s:path."\<cr>"
    endif

    let showing_filter = 0
    if s:show_filter != 'never'
        if s:show_filter == 'always' || strlen(s:filter) != 0
            exec 'normal! A'.num_items.' items matching "'.s:filter."\"\<cr>"
            let showing_filter = 1
        endif
    endif

    if num_items == 0
        normal! gg0
        call s:LockExplorerBuffer()
        return
    endif

    let max_length = 0
    for item in a:list
        let len = strlen(item) + 2
        if max_length < len
            let max_length = len
        endif
    endfor

    let num_cols = (winwidth(0) - 1) / max_length
    let height = (num_items / num_cols)
    if num_items % num_cols != 0
        let height += 1
    endif
    if showing_filter
        let height += 1
    endif
    if s:show_path
        let height += 1
    endif

    if height > 10
        let height = 10
    endif
    exec 'resize '.height

    let col = 1
    let last_item = num_items - 1
    let current = 0
    let selected_line = -1
    for item in a:list
        let entry = ''
        if s:selected == current
            let selected_line = line('.')
            let entry .= '['
        else
            let entry .= ' '
        endif
        let entry .= item
        if s:selected == current
            let entry .= ']'
        else
            if col != num_cols && current != last_item
                let entry .= ' '
            endif
        endif
        let len = strlen(item) + 2
        if col != num_cols && current != last_item
            while len < max_length
                let entry .= ' '
                let len += 1
            endwhile
        endif
        exec 'normal! A'.entry
        let current += 1
        let col += 1
        if col > num_cols
            let col = 1
            normal! o
        endif
    endfor

    if selected_line == -1
        normal! ggL
    else
        exec 'normal! '.selected_line.'Gz-L'
    endif
    call s:LockExplorerBuffer()
endfunction
function! s:FilterList() "{{{1
    let s:selected = -1
    if s:filter == ''
        let s:filter_list = s:file_list
        return
    endif

    if g:ffeCaseSensitive == 'sensitive'
        let case = '\C'
    elseif g:ffeCaseSensitive == 'insensitive'
        let case = '\c'
    else
        let case = ''
    endif

    let s:filter_list = []
    for item in s:file_list
        if match(item, case.s:filter) != -1
            call add(s:filter_list, item)
        endif
    endfor
    if len(s:filter_list) == 1
        let s:selected = 0
    endif
endfunction
function! s:UpdateFileList() "{{{1
    let s:filter = ''
    let s:selected = -1
    let dir_list = []
    let file_list = []
    let start = strlen(s:path)
    let glob_pattern = '*'

    if s:recursive
        let glob_pattern .= '*'
    else
        call add(dir_list, '..'.g:ffeDirSeparator)
    endif

    let old_wild = &wildignore
    exec 'set wildignore='.g:ffeWildIgnoreFile

    if s:show_hidden || g:ffeShowDotFiles
        let item_list = split(glob(s:path.'.'.glob_pattern), "\n")
        for full_path in item_list
            let file_name = strpart(full_path, start)
            if file_name == '.' || file_name == '..'
                continue
            endif
            if isdirectory(full_path)
                if !s:recursive
                    call add(dir_list, file_name.g:ffeDirSeparator)
                endif
            else
                if strlen(g:ffeIgnoreFileRexExPattern) != 0 && match(file_name, g:ffeIgnoreFileRexExPattern) != -1
                    continue
                endif
                call add(file_list, file_name)
            endif
        endfor
    endif

    let item_list = split(glob(s:path.glob_pattern), "\n")
    for full_path in item_list
        let file_name = strpart(full_path, start)
        if isdirectory(full_path)
            if !s:recursive
                call add(dir_list, file_name.g:ffeDirSeparator)
            endif
        else
            if strlen(g:ffeIgnoreFileRexExPattern) != 0 && match(file_name, g:ffeIgnoreFileRexExPattern) != -1
                continue
            endif
            call add(file_list, file_name)
        endif
    endfor

    exec 'set wildignore='.old_wild

    let s:file_list = dir_list + file_list
    let s:filter_list = s:file_list
endfunction
function! s:UpdateHighlighting() "{{{1
    syntax clear FilterFileExplorerMatch
    if len(s:filter) != 0
        exec 'syntax match FilterFileExplorerMatch /'.escape(s:filter, '\/').'/'
    endif
endfunction
function! s:UpdateFilter(ch) "{{{1
    let s:filter .= nr2char(a:ch)
    call s:FilterList()
    call s:DisplayList(s:filter_list)
    call s:UpdateHighlighting()
endfunction
function! s:ExecuteCommand(op) "{{{1
    if a:op == 'exit' "{{{2
        call s:CloseExplorerWindow()
        return

    elseif a:op == 'open' "{{{2
        if s:selected == -1
            return
        endif
        let item = s:filter_list[s:selected]
        if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
            let s:path = resolve(s:path.item)
            call s:UpdateFileList()
        else
            call s:CloseExplorerWindow()
            call s:EditFile(s:path.item, 0)
            return
        endif
    elseif a:op == 'open_noexit' "{{{2
        if s:selected == -1
            return
        endif
        let item = s:filter_list[s:selected]
        if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
            return
        endif
        let s:orig_win = s:EditFile(s:path.item, 0)

    elseif a:op == 'open_win' "{{{2
        if s:selected == -1
            return
        endif
        let item = s:filter_list[s:selected]
        if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
            return
        endif
        call s:CloseExplorerWindow()
        call s:EditFile(s:path.item, 1)
        return
    elseif a:op == 'open_win_noexit' "{{{2
        if s:selected == -1
            return
        endif
        let item = s:filter_list[s:selected]
        if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
            return
        endif
        let s:orig_win = s:EditFile(s:path.item, 1)
    elseif a:op == 'open_all' "{{{2
        call s:CloseExplorerWindow()
        for item in s:filter_list
            if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
                continue
            endif
            call s:EditFile(s:path.item, 0)
        endfor
        return
    elseif a:op == 'open_all_win' "{{{2
        call s:CloseExplorerWindow()
        for item in s:filter_list
            if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
                continue
            endif
            call s:EditFile(s:path.item, 1)
        endfor
        return
    elseif a:op == 'delchar' "{{{2
        let len = strlen(s:filter)
        if len == 0
            return
        endif
        let s:filter = strpart(s:filter, 0, len - 1)
        call s:FilterList()
    elseif a:op == 'clear_filter' "{{{2
        let s:filter = ''
        call s:FilterList()
    elseif a:op == 'refresh' "{{{2
        call s:UpdateFileList()
        call s:FilterList()
    elseif a:op == 'select_next' "{{{2
        if len(s:filter_list) == 0
            return
        endif
        let s:selected += 1
        if s:selected >= len(s:filter_list)
            let s:selected = 0
        endif
    elseif a:op == 'select_prev' "{{{2
        if len(s:filter_list) == 0
            return
        endif
        let s:selected -= 1
        if s:selected < 0
            let s:selected = len(s:filter_list) - 1
        endif
    elseif a:op == 'show_hidden' "{{{2
        let s:show_hidden = !s:show_hidden
        call s:UpdateFileList()
    elseif a:op == 'recursive' "{{{2
        let s:recursive = !s:recursive
        call s:UpdateFileList()
    elseif a:op == 'show_path' "{{{2
        let s:show_path = !s:show_path
    elseif a:op == 'show_filter' "{{{2
        if s:show_filter == 'never'
            let s:show_filter = 'always'
        elseif s:show_filter == 'auto'
            if strlen(s:filter) == 0
                let s:show_filter = 'always'
            else
                let s:show_filter = 'never'
            endif
        elseif s:show_filter == 'always'
            let s:show_filter = 'never'
        endif
    elseif a:op == 'up_dir' "{{{2
        let s:path = resolve(s:path.'..'.g:ffeDirSeparator)
        call s:UpdateFileList()
    elseif a:op == 'edit_file_list' "{{{2
        call s:CloseExplorerWindow()
        if g:ffeExplorerOnTop
            topleft new
        else
            botright new
        endif
        call s:DisplayList(s:file_list)
        return
    endif "}}}

    call s:DisplayList(s:filter_list)
    call s:UpdateHighlighting()
endfunction
function! s:AddControlMappings() "{{{1
    " remove all mappings
    mapclear <buffer>

    let chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.
              \ '`-=~!@#$%^&*()_+[]{},./<>?";:|" , '."\\'"

    " map printable characters
    for ch in split(chars, '.\@=')
        exec "noremap <silent> <buffer> <char-". char2nr(ch)."> :call <sid>UpdateFilter(".char2nr(ch).")<cr>"
    endfor

    " extended ascii
    let ch = 128
    while ch <= 255
        exec "noremap <silent> <buffer> <char-".ch."> :call <sid>UpdateFilter(".ch.")<cr>"
        let ch += 1
    endwhile

    " map commands
    noremap <silent> <buffer> <esc>   :call <sid>ExecuteCommand('exit')<cr>
    noremap <silent> <buffer> <bs>    :call <sid>ExecuteCommand('delchar')<cr>
    noremap <silent> <buffer> <cr>    :call <sid>ExecuteCommand('open')<cr>
    noremap <silent> <buffer> <s-cr>  :call <sid>ExecuteCommand('open_win')<cr>
    noremap <silent> <buffer> <c-w>   :call <sid>ExecuteCommand('open_win_noexit')<cr>
    noremap <silent> <buffer> <tab>   :call <sid>ExecuteCommand('select_next')<cr>
    noremap <silent> <buffer> <s-tab> :call <sid>ExecuteCommand('select_prev')<cr>
    noremap <silent> <buffer> <c-o>   :call <sid>ExecuteCommand('open_noexit')<cr>
    noremap <silent> <buffer> <c-h>   :call <sid>ExecuteCommand('show_hidden')<cr>
    noremap <silent> <buffer> <c-r>   :call <sid>ExecuteCommand('recursive')<cr>
    noremap <silent> <buffer> <c-p>   :call <sid>ExecuteCommand('show_path')<cr>
    noremap <silent> <buffer> <c-n>   :call <sid>ExecuteCommand('show_filter')<cr>
    noremap <silent> <buffer> <c-u>   :call <sid>ExecuteCommand('up_dir')<cr>
    noremap <silent> <buffer> <c-l>   :call <sid>ExecuteCommand('clear_filter')<cr>
    noremap <silent> <buffer> <c-f>   :call <sid>ExecuteCommand('refresh')<cr>
    noremap <silent> <buffer> <c-a>   :call <sid>ExecuteCommand('open_all')<cr>
    noremap <silent> <buffer> <c-v>   :call <sid>ExecuteCommand('open_all_win')<cr>
    noremap <silent> <buffer> <c-e>   :call <sid>ExecuteCommand('edit_file_list')<cr>
endfunction
function! s:SetVimOption(option, value) "{{{1
    if type(a:value) == type("") && a:value == 'no'
        exec 'let s:vim_options["&'.a:option.'"]=&'.a:option
        exec 'set no'.a:option
    elseif type(a:value) == type("") && a:value == 'yes'
        exec 'let s:vim_options["&'.a:option.'"]=&'.a:option
        exec 'set '.a:option
    else
        exec 'let s:vim_options["'.a:option.'"]=&'.a:option
        exec 'set '.a:option.'='.a:value
    endif
endfunction
function! s:RestoreVimOptions() "{{{1
    for [option, value] in items(s:vim_options)
        if strpart(option, 0, 1) == '&'
            let option = strpart(option, 1)
            if value
                exec 'set '.option
            else
                exec 'set no'.option
            endif
        else
            exec 'set '.option.'='.value
        endif
    endfor
endfunction
function! s:FilterFileExplorer(...) "{{{1

    if a:0 == 0
        let path = getcwd()
    else
        let path = a:1
    endif

    if exists('s:explorer_open') && s:explorer_open
        let winnr = bufwinnr(s:explorer_buffnr)
        if winnr != -1
            exec winnr. ' wincmd w'
            return
        endif
    endif

    " init vars
    let s:path          = resolve(path.g:ffeDirSeparator)
    let s:filter        = ''
    let s:selected      = -1
    let s:show_hidden   = 0
    let s:recursive     = 0
    let s:file_list     = []
    let s:filter_list   = []
    let s:vim_options   = {}
    let s:orig_win      = winnr()
    let s:show_path     = g:ffeDisplayPath
    let s:show_filter   = g:ffeShowFilter

    " create window
    let win_title = '-- Filter File Explorer --'
    if g:ffeExplorerOnTop
        topleft new win_title
    else
        botright new win_title
    endif

    setl buftype=nofile
    setl noswapfile
    setl nobuflisted
    setl bufhidden=wipe
    setl nowrap
    setl foldcolumn=0
    setl nocursorline
    setl nospell
    setl textwidth=0
    setl noreadonly
    setl nomodifiable

    call s:SetVimOption('timeoutlen', 0)
    call s:SetVimOption('insertmode', 'no')
    call s:SetVimOption('showcmd', 'no')
    call s:SetVimOption('list', 'no')
    call s:SetVimOption('report', 9999)
    call s:SetVimOption('sidescroll', 0)
    call s:SetVimOption('sidescrolloff', 0)
    call s:SetVimOption('hlsearch', 'no')
    call s:SetVimOption('insertmode', 'no')

    let s:explorer_open = 1
    let s:explorer_buffnr = bufnr('%')

    " highlighting
    exec 'syntax match FilterFileExplorerDirectory #^[ \[][^'.escape(g:ffeDirSeparator, '\').']\+'.
        \ escape(g:ffeDirSeparator, '\').']\?# contains=FilterFileExplorerSelected,FilterFileExplorerMatch'

    exec 'syntax match FilterFileExplorerDirectory # [ \[][^'.escape(g:ffeDirSeparator, '\').']\+'.
        \escape(g:ffeDirSeparator, '\').']\?# contains=FilterFileExplorerSelected,FilterFileExplorerMatch'

    syntax match FilterFileExplorerSelected /\[[^\]]\+\]/ contains=FilterFileExplorerMatch
    highlight def link FilterFileExplorerSelected Search
    highlight def link FilterFileExplorerMatch IncSearch
    highlight def link FilterFileExplorerDirectory Directory

    call s:AddControlMappings()
    call s:UpdateFileList()
    call s:DisplayList(s:file_list)
endfunction
"}}}

" Set Defaults {{{1
"------------------------------------------------------------------------------
call s:SetDefault('g:ffeAlwaysOpenNewWindow', 0)
call s:SetDefault('g:ffeCaseSensitive', 'system')
call s:SetDefault('g:ffeShowDotFiles', 0)
call s:SetDefault('g:ffeExplorerOnTop', 0)
call s:SetDefault('g:ffeDisplayPath', 0)
call s:SetDefault('g:ffeShowFilter', 'auto')
call s:SetDefault('g:ffeKeepExplorerWindowOpen', 0)
call s:SetDefault('g:ffeIgnoreFileRexExPattern', '')
call s:SetDefault('g:ffeWildIgnoreFile', '')

" Set the directory separator {{{1
"------------------------------------------------------------------------------
if !exists('g:ffeDirSeparator')
    if has("win32") || has("win16") || has("dos32") || has("dos16") || has("os2")
        let g:ffeDirSeparator = "\\"

    elseif has("macunix")
        let g:ffeDirSeparator = "\/"

    elseif has("mac")
        let g:ffeDirSeparator = ":"

    else " *nix systems
        let g:ffeDirSeparator = "\/"
    endif
endif

" Create Command {{{1
"------------------------------------------------------------------------------
command! -nargs=? -complete=dir FilterFileExplorer call s:FilterFileExplorer('<args>')

" Plug map to Command {{{1
"------------------------------------------------------------------------------
nnoremap <script> <Plug>FilterFileExplorer :call <SID>FilterFileExplorer(getcwd())<CR>

" Default key map {{{1
"------------------------------------------------------------------------------
if !hasmapto('<Plug>FilterFileExplorer')
    nmap <silent> <Leader>e <Plug>FilterFileExplorer
endif
"}}}

" vim:fdm=marker:
