"------------------------------------------------------------------------------
" Name Of File: filter_file_explorer.vim
"
"  Description: Vim plugin to do file browsing using incremental filtering.
"
"       Author: Juan D Frias (juandfrias at gmail.com)
"
"  Last Change: 2010 Apr 28 TODO: update
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
"                   to the pattern you are building. You can use regular
"                   expressions to build your pattern.
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
"                   Toggle displaying current pattern.
"
"               <ctrl-u>
"                   Go up one directory.
"
"               <ctrl-l>
"                   Clear pattern.
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
"           0 = use ignorecase setting (default)
"           1 = use case-sensitive searching
"           2 = use case-insensitive searching
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
" g:ffeShowPattern
"       Explorer shows a line with the pattern when it is not empty.
"       To override use:
"           let g:ShowPattern = <option>
"       in your vimrc file. Where <option> is one of:
"           0 = always hide
"           1 = display only when the pattern is not empty (default)
"           2 = always display

" Load script once {{{1
"------------------------------------------------------------------------------
if exists("loaded_filter_file_explorer") || &cp
    finish
endif
"...let loaded_filter_file_explorer = 1 TODO: remove

" Functions {{{1
"------------------------------------------------------------------------------
function! s:SetDefault(var, value) "{{{2
    if !exists(a:var)
        exec 'let '.a:var.'='.a:value
    endif
endfunction
function! s:CloseExplorerWindow() "{{{2
    let nr = bufnr('%')
    close!
    exec nr.' bwipeout!'
endfunction
function! s:EditFile(fname, open_window, orig_win, explorer_open) "{{{2
    if a:explorer_open || g:ffeKeepExplorerWindowOpen
        exec a:orig_win.' wincmd w'
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
    if a:explorer_open || g:ffeKeepExplorerWindowOpen
        let exp_win = bufwinnr('-- Filter File Explorer --')
        exec exp_win .' wincmd w'
    endif
    return new_win
endfunction
function! s:DisplayItems(list, filter, selected, path, show_path, show_pattern) "{{{2
    exec 'normal gg"_dG'

    let num_items = len(a:list)

    if a:show_path
        exec 'normal Alisting of '.a:path."\<cr>"
    endif

    let show_pattern = 0
    if a:show_pattern != 0 
        if a:show_pattern == 2 || strlen(a:filter) != 0
            exec 'normal A'.num_items.' items matching "'.a:filter."\"\<cr>"
            let show_pattern = 1
        endif
    endif

    if num_items == 0
        setl nomod
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
    if show_pattern
        let height += 1
    endif
    if a:show_path
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
        if a:selected == current
            let selected_line = line('.')
            let entry .= '['
        else
            let entry .= ' '
        endif
        let entry .= item
        if a:selected == current
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
        normal! gg
    else
        exec 'normal! '.selected_line.'Gz-'
    endif
    setl nomod
endfunction
function! s:FilterItems(list, filter) "{{{2
    if a:filter == ''
        return a:list
    endif

    if g:ffeCaseSensitive == 1
        let case = '\C'
    elseif g:ffeCaseSensitive == 2
        let case = '\c'
    else
        let case = ''
    endif

    let filter_list = []
    for item in a:list
        if match(item, case.a:filter) != -1
            call add(filter_list, item)
        endif
    endfor
    return filter_list
endfunction
function! s:GetFileList(path, show_hidden, recursive) "{{{2
    let dir_list = []
    let file_list = []
    let start = strlen(a:path)
    let pattern = '*'

    if a:recursive
        let pattern .= '*'
    else
        call add(dir_list, '..'.g:ffeDirSeparator)
    endif

    let old_wild = &wildignore
    exec 'set wildignore='.g:ffeWildIgnoreFile

    if a:show_hidden || g:ffeShowDotFiles
        let item_list = split(glob(a:path.'.'.pattern), "\n")
        for full_path in item_list
            let file_name = strpart(full_path, start)
            if file_name == '.' || file_name == '..'
                continue
            endif
            if isdirectory(full_path)
                if !a:recursive
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

    let item_list = split(glob(a:path.pattern), "\n")
    for full_path in item_list
        let file_name = strpart(full_path, start)
        if isdirectory(full_path)
            if !a:recursive
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

    return dir_list + file_list
endfunction
function! s:FilterFileExplorer(path) "{{{2
    let path = resolve(a:path.g:ffeDirSeparator)
    let show_hidden = 0
    let recursive = 0
    let orig_win = winnr()
    let show_path = g:ffeDisplayPath
    let show_pattern = g:ffeShowPattern
    let file_list = s:GetFileList(path, show_hidden, recursive)
    let item_list = file_list

    " open window
    if g:ffeExplorerOnTop
        topleft new '-- Filter File Explorer --'
    else
        botright new '-- Filter File Explorer --'
    endif

    setl nobuflisted
    call s:DisplayItems(file_list, '', -1, path, show_path, show_pattern)

    syntax match fileFindSelected /\[[^\]]\+\]/
    highlight def link fileFindSelected Search
    highlight def link fileFindMatch IncSearch

    " Process keystrokes
    let filter = ''
    let selected = -1
    while 1
        redraw
        let c = getchar()

        if c == char2nr("\<esc>") "{{{3
            call s:CloseExplorerWindow()
            return

        elseif c == "\<s-o>" "{{{3
            if selected == -1
                continue
            endif
            let item = item_list[selected]

            " if directory
            if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
                continue
            endif

            call s:CloseExplorerWindow()
            call s:EditFile(path.item, 1, orig_win, 0)
            return

        elseif c == "\<c-w>" "{{{3
            if selected == -1
                continue
            endif
            let item = item_list[selected]

            " if directory
            if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
                continue
            endif
            let orig_win = s:EditFile(path.item, 1, orig_win, 1)

        elseif c == char2nr("\<c-o>") "{{{3
            if selected == -1
                continue
            endif
            let item = item_list[selected]

            " if directory
            if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
                continue
            endif
            let orig_win = s:EditFile(path.item, 0, orig_win, 1)

        elseif c == char2nr("\<cr>") "{{{3
            if selected == -1
                continue
            endif
            let item = item_list[selected]

            " if directory
            if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
                let path = resolve(path.item)
                let file_list = s:GetFileList(path, show_hidden, recursive)
                let selected = -1
                let filter = ''
            else
                call s:CloseExplorerWindow()
                call s:EditFile(path.item, 0, orig_win, 0)
                return
            endif

        elseif c == "\<bs>" "{{{3
            let filter = strpart(filter, 0, strlen(filter)-1)
            let selected = -1

        elseif c == char2nr("\<tab>") "{{{3
            if len(item_list) == 0
                continue
            endif
            let selected += 1
            if selected >= len(item_list)
                let selected = 0
            endif

        elseif c == "\<s-tab>" "{{{3
            if len(item_list) == 0
                continue
            endif
            let selected -= 1
            if selected < 0
                let selected = len(item_list) - 1
            endif

        elseif c == char2nr("\<c-r>") "{{{3
            let recursive = !recursive
            let file_list = s:GetFileList(path, show_hidden, recursive)
            let selected = -1
            let filter = ''

        elseif c == char2nr("\<c-h>") "{{{3
            let show_hidden = !show_hidden
            let file_list = s:GetFileList(path, show_hidden, recursive)
            let selected = -1
            let filter = ''

        elseif c == char2nr("\<c-u>") "{{{3
            let path = resolve(path.'..'.g:ffeDirSeparator)
            let file_list = s:GetFileList(path, show_hidden, recursive)
            let selected = -1
            let filter = ''

        elseif c == char2nr("\<c-p>") "{{{3
            let show_path = !show_path

        elseif c == char2nr("\<c-n>") "{{{3
            if show_pattern == 0 " never
                let show_pattern = 2 " always

            elseif show_pattern == 1 " auto
                if strlen(filter) == 0
                    let show_pattern = 2 " always
                else
                    let show_pattern = 0 " never
                endif

            elseif show_pattern == 2 " always
                let show_pattern = 0
            endif

        elseif c == char2nr("\<c-l>") "{{{3
            let filter = ''

        elseif c == char2nr("\<c-f>") "{{{3
            let file_list = s:GetFileList(path, show_hidden, recursive)
            let selected = -1
            let filter = ''

        elseif c == char2nr("\<c-a>") "{{{3
            call s:CloseExplorerWindow()
            for item in item_list
                " if directory
                if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
                    continue
                endif
                call s:EditFile(path.item, 0, orig_win, 0)
            endfor
            return

        elseif c == char2nr("\<c-v>") "{{{3
            call s:CloseExplorerWindow()
            for item in item_list
                " if directory
                if strpart(item, strlen(item) - 1) == g:ffeDirSeparator
                    continue
                endif
                call s:EditFile(path.item, 1, orig_win, 0)
            endfor
            return

        elseif c == char2nr("\<c-e>") "{{{3
            return

        else "{{{3
            let selected = -1
            let filter .= nr2char(c)
        endif "}}}

        let item_list = s:FilterItems(file_list, filter)
        if len(item_list) == 1
            let selected = 0
        endif

        call s:DisplayItems(item_list, filter, selected, path, show_path, show_pattern)

        syn clear
        syntax match fileFindSelected /\[[^\]]\+\]/
        if len(filter) != 0
            exec 'syntax match fileFindMatch /'.escape(filter, '\/').'/'
        endif
    endwhile
    " end Process keystrokes
endfunction

" Set Defaults {{{1
"------------------------------------------------------------------------------
call s:SetDefault('g:ffeAlwaysOpenNewWindow', 0)
call s:SetDefault('g:ffeCaseSensitive', 0)
call s:SetDefault('g:ffeCaseSensitive', 0)
call s:SetDefault('g:ffeShowDotFiles', 0)
call s:SetDefault('g:ffeExplorerOnTop', 0)
call s:SetDefault('g:ffeDisplayPath', 0)
call s:SetDefault('g:ffeShowPattern', 1)
call s:SetDefault('g:ffeKeepExplorerWindowOpen', 0)
call s:SetDefault('g:ffeIgnoreFileRexExPattern', "''")
call s:SetDefault('g:ffeWildIgnoreFile', "''")

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
command! -nargs=1 -complete=dir FilterFileExplorer call s:FilterFileExplorer('<args>')

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
