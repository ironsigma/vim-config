" Package Explorer
" Author: Juan D Frias
" Version: 4.3
" Copyright: Sep 2015, All Rights Reserved

" Options: {{{1
" Hide files matching the following expressions
"
" for files you can match the following:
"   match at start: .*     - hide files starting with dot
"   match at end:   *.swp  - hide files ending with .swp
"   contains match: *Test* - hide files that have 'Test' anywhere
"
" folder patterns must end in a slash and can match the following:
"   match at root:  /bin/  - hide folder matching bin, but only at root level
"   match anywhere: test/  - hide folder that have '/test/' at any level
"   match starts:   .*/    - hide folder starting with dot at any level
"   match starts:   /.*/   - hide folder starting with dot at root level
"
if !exists('g:pkgexpHidden')
    let g:pkgexpHidden = ['.*/', '/target/', '*.swp', '*~', '.*']
endif

" Window width
if !exists('g:pkgexpWindowWidth')
    let g:pkgexpWindowWidth = 40
endif

" Source paths for packages
if !exists('g:pkgexpSourcePaths')
    let g:pkgexpSourcePaths = [
        \   'src/main/java',    'src/main/resources',
        \   'src/test/java',    'src/test/resources',
        \   'src/inttest/java', 'src/inttest/resources',
        \]
endif

" Class: FileSystemNode {{{1
let s:FileSystemNode = {'expanded': 0}

" Static: new(props) : FileSystemNode {{{2
function s:FileSystemNode.new(props) dict
    let this = copy(s:FileSystemNode)
    for p in keys(a:props)
        let this[p] = a:props[p]
    endfor
    return this
endfunction

" Static: getRoot() : FileSystemNode {{{2
function s:FileSystemNode.getRoot()
    if !exists('s:FileSystemRootNode')
        let s:FileSystemRootNode = s:FileSystemNode.new({'name':'/', '__isroot':1, 'type': 'dir'})
    endif
    return s:FileSystemRootNode
endfunction

" Method: isRoot() : boolean {{{2
function s:FileSystemNode.isRoot()
    return has_key(self, '__isroot')
endfunction

" Method: isFile() : boolean {{{2
function s:FileSystemNode.isFile()
    return has_key(self, '__isfile')
endfunction

" Method: isFolder() : boolean {{{2
function s:FileSystemNode.isFolder()
    return !has_key(self, '__isfile')
endfunction

" Method: getFiles() : List <FileSystemNode> {{{2
function s:FileSystemNode.getFiles() dict
    call self._populate()
    return sort(values(self.__files), s:FileSystemNode._compareNodes, self)
endfunction

" Method: getFolders() : List <FileSystemNode> {{{2
function s:FileSystemNode.getFolders() dict
    call self._populate()
    return sort(values(self.__folders), s:FileSystemNode._compareNodes, self)
endfunction

" Method: fileCount() : Integer {{{2
function s:FileSystemNode.fileCount() dict
    call self._populate()
    return len(self.__files)
endfunction

" Method: folderCount() : Integer {{{2
function s:FileSystemNode.folderCount() dict
    call self._populate()
    return len(self.__folders)
endfunction

" Method: getParent() : FileSystemNode {{{2
function s:FileSystemNode.getParent() dict
    if self.isRoot()
        return self
    endif
    return self.__parent
endfunction

" Method: getContainer() : dict {{{2
function s:FileSystemNode.getContainer() dict
    if self.isFile()
        return self.getParent().__files
    endif
    return self.getParent().__folders
endfunction

" Method: getAbsolutePath() : String {{{2
function s:FileSystemNode.getAbsolutePath() dict
    if self.isRoot()
        return '/'
    endif
    return self._getPathUpTo(self.getRoot())
endfunction

" Method: getRelativePath(parentNode) :String {{{2
function s:FileSystemNode.getRelativePath(parentNode) dict
    if self.isRoot()
        return ''
    endif
    if self == a:parentNode
        return '/'
    endif
    return self._getPathUpTo(a:parentNode)
endfunction

" Method: find(name) : FileSystemNode {{{2
function s:FileSystemNode.find(name) dict
    call self._populate()

    " Check folders
    if has_key(self.__folders, a:name)
        return self.__folders[a:name]

    " Check files
    elseif has_key(self.__files, a:name)
        return self.__files[a:name]
    endif

    " no match
    return {}
endfunction

" Method: findRecursive(path, [refresh]) : FileSystemNode {{{2
function s:FileSystemNode.findRecursive(path, ...) dict
    let refresh = a:0 == 0 ? 0 : 1
    let node = self
    for nodeName in split(a:path, '/')
        let childNode = node.find(nodeName)
        if !empty(childNode)
            let node = childNode
            continue
        endif
        if !refresh
            return {}
        endif
        call node.refresh()
        let childNode = node.find(nodeName)
        if empty(childNode)
            return {}
        endif
        let node = childNode
    endfor
    return node
endfunction

" Method: delete() {{{2
function s:FileSystemNode.delete()
    if self.isRoot()
        return
    endif

    " File
    if self.isFile()
        call remove(self.__parent.__files, self.name)

    " Folder
    else
        if has_key(self, '__populated')
            for folder in values(self.__folders)
                call folder.delete()
            endfor
            for file in values(self.__files)
                call file.delete()
            endfor
        endif
        call remove(self.__parent.__folders, self.name)
    endif
endfunction

" Method: refresh([recursive]) {{{2
function s:FileSystemNode.refresh(...)
    if !has_key(self, '__populated')
        return
    endif
    call self._populate(1)
    if a:0 == 0 || !a:1
        return
    endif
    for folder in values(self.__folders)
        call folder.refresh(a:1)
    endfor
endfunction

" Method: _getPathUpTo(ancestorNode) : String {{{2
function s:FileSystemNode._getPathUpTo(ancestorNode) dict
    let node = self.__parent
    let path = ''
    while !node.isRoot() && node != a:ancestorNode
        let path = '/'. node.name . path
        let node = node.__parent
    endwhile
    let path .= '/' . self.name . (self.isFile() ? '' : '/')
    return path
endfunction

" Method: _populate([force]) {{{2
function s:FileSystemNode._populate(...) dict
    let force = a:0 != 0

    if has_key(self, '__populated')
        if !force
            return
        endif
    else
        let self.__folders = {}
        let self.__files = {}
    endif

    let self.__populated = 1
    let path = self.getAbsolutePath()
    for fullpath in split(glob(path .'.*') ."\n". glob(path .'*'), "\n")
        let name = fnamemodify(fullpath, ':t')

        if name == '.' || name == '..'
            continue
        endif

        let args = {'__parent': self, 'name': name, 'type': getftype(fullpath)}

        if isdirectory(fullpath)
            let container = self.__folders
        else
            let container = self.__files
            let args.__isfile = 1
        endif

        if force
            if has_key(container, name) && args.type == container[name].type
                let container[name].__verified__ = 1
                continue
            endif
            let args.__verified__ = 1
        endif

        let container[name] = s:FileSystemNode.new(args)
    endfor

    if !force
        return
    endif

    " Remove deleted nodes
    for container in [self.__folders, self.__files]
        for name in keys(container)
            if !has_key(container[name], '__verified__')
                call remove(container, name)
            else
                call remove(container[name], '__verified__')
            endif
        endfor
    endfor
endfunction

" Method: _compareNodes(this, that) : Integer {{{2
function s:FileSystemNode._compareNodes(this, that) dict
    if a:this.name > a:that.name
        return 1
    elseif a:this.name < a:that.name
        return -1
    endif
    return 0
endfunction

"}}}1
" Class: PackageView {{{1
let s:PackageView = {
    \ 'showHidden': 0,
    \ 'showHelp': 0,
    \ '__fileSystemRootNode': s:FileSystemNode.getRoot(),
    \ '__hidden': {
    \       'folders': {'dots':1, 'begins':[], 'contains':[], 'exact':[]},
    \       'files': {'dots':1, 'begins':[], 'ends':[], 'contains':[], 'exact':[]}
    \ }
\ }

" Method: setHidden(patterns) {{{2
function s:PackageView.setHidden(patterns) dict
    for p in a:patterns
        if p == '.*'
            let self.__hidden.files.dots = 0
        elseif p == '.*/'
            let self.__hidden.folders.dots = 0
        endif

        let lastch = p[strlen(p) - 1]

        " Hidden Directories
        if lastch == '/'
            let post = p[strlen(p) - 2] == '*'
            if p[0] == '/'
                if post
                    call add(self.__hidden.folders.begins, strpart(p, 0, strlen(p) - 2))
                else
                    call add(self.__hidden.folders.exact, p)
                endif
            else
                if post
                    call add(self.__hidden.folders.begins, strpart(p, 0, strlen(p) - 2))
                else
                    call add(self.__hidden.folders.contains, '/'. p)
                endif
            endif

        " Hidden files
        else
            let pre = p[0] == '*'
            let post = lastch == '*'
            if !pre && !post
                call add(self.__hidden.files.exact, p)
            elseif pre && post
                call add(self.__hidden.files.contains, strpart(p, 1, strlen(p) - 2))
            elseif pre
                call add(self.__hidden.files.ends, strpart(p, 1))
            elseif post
                call add(self.__hidden.files.begins, strpart(p, 0, strlen(p) - 1))
            endif
        endif
    endfor
endfunction

" Method: showExplorerWindow(path) {{{2
function s:PackageView.showExplorerWindow(path) dict
    " Set root
    let self.__rootNode = self.__fileSystemRootNode.findRecursive(a:path)
    let self.__rootNode.expanded = 1

    " Open window
    execute 'top vertical '. g:pkgexpWindowWidth .' new '. fnameescape('∷∷ PkgExp ∷∷')
    setlocal noswapfile
    setlocal nobuflisted
    setlocal buftype=nowrite
    setlocal bufhidden=delete
    setlocal nowrap
    setlocal nonumber
    setlocal syntax=pkgexp
    setlocal conceallevel=3
    setlocal concealcursor=n
    setlocal foldcolumn=0

    call self._updateView()
endfunction

" Method: handleOpenNode(expand, split) {{{2
"   expand: 1: only open, 0: only close, -1: toggle, 2: no change
"   open:  noopen, edit, split, splitbelow, tab
function s:PackageView.handleOpenNode(expand, open)
    let selectedNode = self._getSelectedNode()
    if empty(selectedNode)
        return
    endif

    " Folder/Package
    if selectedNode.isFolder()
        if a:expand == 'noexpcollapse'
            return
        endif
        if !self._expandCollapseNode(selectedNode, a:expand)
            return
        endif
        call self._pushCursorPos()
        call self._updateView()
        call self._popCursorPos()

        " if only expanding
        if a:expand == 'expand'
            let movedown = 0
            " if file children, move down
            if selectedNode.fileCount() != 0
                let movedown = 1

            " if folders and any is not a source path, move down
            elseif selectedNode.folderCount() != 0
                for folderNode in selectedNode.getFolders()
                    if !has_key(folderNode, 'sourcePath')
                        let movedown = 1
                        break
                    endif
                endfor
            endif

            if movedown
                execute 'normal! j'
            endif
        endif
        return
    endif

    " file
    if a:open != 'noopen'
        let file = fnameescape(selectedNode.getAbsolutePath())
        if a:open == 'split'
            execute 'wincmd p | split '. file
        elseif a:open == 'splitbelow'
            execute 'wincmd p | bel split '. file
        elseif a:open == 'vsplit'
            execute 'wincmd p | vsplit '. file
        elseif a:open == 'tab'
            execute 'tabnew '. file
        else
            execute 'wincmd p | edit '. file
        endif
    endif
endfunction

" Method: handleExpandCollapseNodeRecursive() {{{2
function s:PackageView.handleExpandCollapseNodeRecursive() dict
    let selectedNode = self._getSelectedNode()
    if empty(selectedNode) || selectedNode.isFile()
        return
    endif

    call self._expandCollapseNodeRecursive(selectedNode, !selectedNode.expanded)
    call self._pushCursorPos()
    call self._updateView()
    call self._popCursorPos()
endfunction

" Method: handleCollapseNode() {{{2
function s:PackageView.handleCollapseNode()
    let curr_line = line('.')
    let orig_level = -1

    while 1
        " went to the top, stop
        if curr_line <= 0
            return
        endif

        let selectedNode = self._getSelectedNode(curr_line - 1)
        if empty(selectedNode)
            return
        endif
        let path = selectedNode.getRelativePath(self.__rootNode)

        let level = len(split(path, '/'))

        " save original level
        if orig_level == -1
            let orig_level = level
        endif

        " current path is directory
        if selectedNode.isFolder()
            " if level is same or higher, and not at the original line
            if level >= orig_level && curr_line != line('.')
                " go up another line
                let curr_line -= 1
                continue
            endif

            " if the node is collapsable, close it
            if selectedNode.expanded
                break
            endif
        endif

        " keep going up
        let curr_line -= 1
    endwhile

    let selectedNode.expanded = 0
    let winline = winline()
    call self._updateView()
    call self._setCursorPos(winline, curr_line)
endfunction

" Method: handleAddNode() {{{2
function s:PackageView.handleAddNode() dict

    " Prompt
    echo 'Add file or folder, folders must end with a slash'
    let selectedNode = self._getSelectedNode()
    if empty(selectedNode)
        let node_path = ''
    else
        let node_path = strpart(selectedNode.getRelativePath(self.__rootNode), 1)
    endif
    let node_path = input('new> ', node_path, 'file')
    if node_path == ''
        return
    endif

    " Check dir status and remove final slash
    let isdir = 0
    if node_path[strlen(node_path) - 1] == '/'
        let isdir = 1
        let node_path = strpart(node_path, 0, strlen(node_path) - 1)
    endif

    let node_path = simplify(node_path)

    " Full path
    if node_path[0] == '/'
        let full_path = node_path
    else
        let full_path = self.__rootNode.getAbsolutePath() . node_path
    endif

    " Exists
    if getfperm(full_path) != ''
        echo ' '
        echoh ErrorMsg | echo '"'. node_path . '" already exists!' | echoh None
        return
    endif

    " Create physical node
    if isdir
        call mkdir(full_path, 'p')
    else
        let parent_path = fnamemodify(full_path, ':h')
        sil! call mkdir(parent_path, 'p')
        call writefile([], full_path, 'b')
    endif

    " Node outside tree
    if node_path[0] == '/'
        echo ' '
        echo '"'. full_path .'" created.'
        return
    endif

    " Add file and update view
    call self.__rootNode.findRecursive(node_path, 1)
    call self._pushCursorPos()
    call self._updateView()
    call self._popCursorPos()

    echo '"'. node_path .'" created.'
endfunction

" Method: handleRenameNode() {{{2
function s:PackageView.handleRenameNode() dict
    let selectedNode = self._getSelectedNode()
    if empty(selectedNode)
        return
    endif

    " Prompt
    echo 'Enter new name/location for selected node'
    let relative_path = strpart(selectedNode.getRelativePath(self.__rootNode), 1)
    if relative_path[strlen(relative_path) - 1] == '/'
        let relative_path = strpart(relative_path, 0, strlen(relative_path) - 1)
    endif
    let target_path = input('rename> ', relative_path, 'file')
    if target_path == '' || target_path == relative_path
        return
    endif

    " Full path
    let target_path = simplify(target_path)
    if target_path[0] == '/'
        let full_target_path = target_path
    else
        let full_target_path = self.__rootNode.getAbsolutePath() . target_path
    endif

    " Exists
    if getfperm(full_target_path) != ''
        echo ' '
        echo '"'. target_path .'" alredy exists. Override (y/N)?'
        let response = nr2char(getchar())
        if response != 'y' && response != 'Y'
            return
        endif
    endif

    " Move physical node
    call rename(selectedNode.getAbsolutePath(), full_target_path)
    call selectedNode.delete()

    " Node outside tree
    if target_path[0] == '/'
        echo ' '
        echo 'node renamed.'
        return
    endif

    " Add file and update view
    call self.__rootNode.findRecursive(target_path, 1)
    call self._pushCursorPos()
    call self._updateView()
    call self._popCursorPos()

    echo 'node renamed.'
endfunction

" Method: handleDeleteNode() {{{2
function s:PackageView.handleDeleteNode()
    " Prompt
    let selectedNode = self._getSelectedNode()
    if empty(selectedNode)
        return
    endif
    let node_path = strpart(selectedNode.getRelativePath(self.__rootNode), 1)

    echo 'Delete "'. node_path .'"? (y/N): '
    let response = nr2char(getchar())
    if response != 'y' && response != 'Y'
        return
    endif

    let full_path = selectedNode.getAbsolutePath()

    if selectedNode.isFile()
        call delete(full_path)

    " Directory
    else
        echo 'Are you sure? "'. full_path .'" is a directory (y/N): '
        let response = nr2char(getchar())
        if response != 'y' && response != 'Y'
            return
        endif
        call system('rm -rf '. shellescape(full_path))
    endif

    call selectedNode.delete()
    call self._pushCursorPos()
    call self._updateView()
    call self._popCursorPos()

    echo '"'. full_path .'" deleted.'
endfunction

" Method: handleChangeRoot(new_root) {{{2
function s:PackageView.handleChangeRoot(new_root) dict

    if a:new_root == 'selected'
        let selectedNode = self._getSelectedNode()
        if empty(selectedNode)
            return
        endif
    endif

    " Remove source packages
    for srcPath in g:pkgexpSourcePaths
        let srcNode = self.__rootNode.findRecursive(srcPath)
        if !empty(srcNode)
            unlet srcNode.sourcePath
        endif
    endfor

    " Selected folder
    if a:new_root == 'selected'
        if selectedNode.isFile()
            echoh ErrorMsg | echo 'Not a directory' | echoh None
            return
        endif

        " Assign and init new root
        let self.__rootNode = selectedNode

    " Root's Parent
    else
        if self.__rootNode.isRoot()
            echoh ErrorMsg | echo 'Already at root' | echoh None
            return
        endif

        " Assign and init new root
        let self.__rootNode = self.__rootNode.getParent()
    endif

    let self.__rootNode.expanded = 1
    call self._updateView()
endfunction

" Method: handleToggleHidden() {{{2
function s:PackageView.handleToggleHidden() dict
    let self.showHidden = !self.showHidden
    call self._pushCursorPos()
    call self._updateView()
    call self._popCursorPos()
endfunction
" Method: handleShowInfo(full) {{{2
function s:PackageView.handleShowInfo(full) dict
    let selectedNode = self._getSelectedNode()
    if !empty(selectedNode)
        if a:full
            echo selectedNode.getAbsolutePath()
        else
            echo selectedNode.getRelativePath(self.__rootNode)
        endif
    endif
endfunction

" Method: handleToggleShowHelp() {{{2
function s:PackageView.handleToggleShowHelp() dict
    let self.showHelp = !self.showHelp
    call self._updateView()
endfunction

" Method: handleAddPathAsSource() {{{2
function s:PackageView.handleAddPathAsSource() dict
    let selectedNode = self._getSelectedNode()
    if empty(selectedNode)
        return
    endif
    if selectedNode.isFile()
        echo 'Cannot add a file as a source path.'
        return
    endif

    let path = selectedNode.getRelativePath(self.__rootNode)
    let path = strpart(path, 1, strlen(path) - 2)
    for srcPath in g:pkgexpSourcePaths
        if path == srcPath
            echo 'Path "'. srcPath .'" is already a source path.'
            return
        elseif stridx(path, srcPath) != -1
            echo 'Cannot add "'. path .'", parent already a source path.'
            return
        endif
    endfor

    call add(g:pkgexpSourcePaths, path)
    call self._updateView()
endfunction

" Method: handleRemovePathFromSource() {{{2
function s:PackageView.handleRemovePathFromSource() dict
    let selectedNode = self._getSelectedNode()
    if empty(selectedNode)
        return
    endif
    if selectedNode.isFile()
        echo 'Cannot remove a file from source path.'
        return
    endif

    let path = selectedNode.getRelativePath(self.__rootNode)
    let path = strpart(path, 1, strlen(path) - 2)
    let idx = 0
    for srcPath in g:pkgexpSourcePaths
        if path == srcPath
            unlet selectedNode.sourcePath
            call remove(g:pkgexpSourcePaths, idx)
            call self._updateView()
            return
        endif
        let idx += 1
    endfor
    echo 'Path "'. path .'", is not a source path.'
endfunction


" Method: handleRefreshNode(recursive) {{{2
function s:PackageView.handleRefreshNode(recursive) dict
    let selectedNode = self._getSelectedNode()
    if empty(selectedNode)
        return
    endif
    call selectedNode.refresh(a:recursive)
    call self._pushCursorPos()
    call self._updateView()
    call self._popCursorPos()
endfunction

" Method: _updateView() {{{2
function s:PackageView._updateView() dict
    let self.__nodeLookup = []

    setlocal modifiable
    setlocal paste
    execute 'normal! gg0dG'

    call self._addHelpText()
    call self._addCurrentPath()

    for srcPath in g:pkgexpSourcePaths
        let srcNode = self.__rootNode.findRecursive(srcPath)
        if empty(srcNode)
            continue
        endif

        let srcNode.sourcePath = 1
        let srcPath = srcNode.getRelativePath(self.__rootNode)
        let icon = srcNode.expanded ? '▢ ' : '▣ '
        call self._addEntry('source', icon . srcPath, srcNode)

        if srcNode.expanded
            call self._displayPackage(strlen(srcPath), srcNode)
        endif
    endfor

    call self._displayFiles('', self.__rootNode)

    execute 'normal! gg0dd'
    setlocal nopaste
    setlocal nomodified
    setlocal nomodifiable

    nnoremap <silent> <buffer> q :sil! bwipe!<cr>
    nnoremap <silent> <buffer> o :call <sid>call_dict_method('s:PackageView', 'handleOpenNode', 'toggle', 'edit')<cr>
    nnoremap <silent> <buffer> i :call <sid>call_dict_method('s:PackageView', 'handleOpenNode', 'noexpcollapse', 'split')<cr>
    nnoremap <silent> <buffer> I :call <sid>call_dict_method('s:PackageView', 'handleOpenNode', 'noexpcollapse', 'splitbelow')<cr>
    nnoremap <silent> <buffer> v :call <sid>call_dict_method('s:PackageView', 'handleOpenNode', 'noexpcollapse', 'vsplit')<cr>
    nnoremap <silent> <buffer> t :call <sid>call_dict_method('s:PackageView', 'handleOpenNode', 'noexpcollapse', 'tab')<cr>
    nnoremap <silent> <buffer> l :call <sid>call_dict_method('s:PackageView', 'handleOpenNode', 'expand', 'noopen')<cr>
    nnoremap <silent> <buffer> O :call <sid>call_dict_method('s:PackageView', 'handleExpandCollapseNodeRecursive')<cr>
    nnoremap <silent> <buffer> h :call <sid>call_dict_method('s:PackageView', 'handleCollapseNode')<cr>
    nnoremap <silent> <buffer> D :call <sid>call_dict_method('s:PackageView', 'handleDeleteNode')<cr>
    nnoremap <silent> <buffer> a :call <sid>call_dict_method('s:PackageView', 'handleAddNode')<cr>
    nnoremap <silent> <buffer> C :call <sid>call_dict_method('s:PackageView', 'handleChangeRoot', 'selected')<cr>
    nnoremap <silent> <buffer> U :call <sid>call_dict_method('s:PackageView', 'handleChangeRoot', 'root-parent')<cr>
    nnoremap <silent> <buffer> p :call <sid>call_dict_method('s:PackageView', 'handleShowInfo', 0)<cr>
    nnoremap <silent> <buffer> P :call <sid>call_dict_method('s:PackageView', 'handleShowInfo', 1)<cr>
    nnoremap <silent> <buffer> s :call <sid>call_dict_method('s:PackageView', 'handleAddPathAsSource')<cr>
    nnoremap <silent> <buffer> S :call <sid>call_dict_method('s:PackageView', 'handleRemovePathFromSource')<cr>
    nnoremap <silent> <buffer> . :call <sid>call_dict_method('s:PackageView', 'handleToggleHidden')<cr>
    nnoremap <silent> <buffer> ? :call <sid>call_dict_method('s:PackageView', 'handleToggleShowHelp')<cr>
    nnoremap <silent> <buffer> m :call <sid>call_dict_method('s:PackageView', 'handleRenameNode')<cr>
    nnoremap <silent> <buffer> r :call <sid>call_dict_method('s:PackageView', 'handleRefreshNode', 0)<cr>
    nnoremap <silent> <buffer> R :call <sid>call_dict_method('s:PackageView', 'handleRefreshNode', 1)<cr>
endfunction

" Method: _addHelpText() {{{2
function s:PackageView._addHelpText() dict
    if !self.showHelp
        return
    endif
    call self._addEntry('help', 'Package Explorer v3.0', {})
    call self._addEntry('help', '---------------------', {})
    call self._addEntry('help', 'l - Open folder', {})
    call self._addEntry('help', 'h - Close folder', {})
    call self._addEntry('help', 'o - Open/Close folder, open file', {})
    call self._addEntry('help', 'O - Open/Close folder recursivly', {})
    call self._addEntry('help', 'i - Open file (horizontal split)', {})
    call self._addEntry('help', 'I - Open file (horizontal split below)', {})
    call self._addEntry('help', 'v - Open file (vert split)', {})
    call self._addEntry('help', 't - Open file (new tab)', {})
    call self._addEntry('help', ' ', {})
    call self._addEntry('help', 'D - Delete file/folder', {})
    call self._addEntry('help', 'a - Add file/folder', {})
    call self._addEntry('help', 'm - Rename/Move file/folder', {})
    call self._addEntry('help', ' ', {})
    call self._addEntry('help', 'C - Change root', {})
    call self._addEntry('help', 'U - Up a root level', {})
    call self._addEntry('help', 'r - refresh files/folder', {})
    call self._addEntry('help', 'R - refresh recursivly', {})
    call self._addEntry('help', ' ', {})
    call self._addEntry('help', 's - add path as source', {})
    call self._addEntry('help', 'S - remove path from source', {})
    call self._addEntry('help', ' ', {})
    call self._addEntry('help', 'p - Print selected relative path', {})
    call self._addEntry('help', 'P - Print selected full path', {})
    call self._addEntry('help', '. - Toggle hidden files ['. (self.showHidden ? 'on' : 'off') .']', {})
    call self._addEntry('help', ' ', {})
    call self._addEntry('help', '? - Toggle help', {})
    call self._addEntry('help', 'q - Close panel', {})
endfunction

" Method: _addCurrentPath() {{{2
function s:PackageView._addCurrentPath() dict
    if self.__rootNode == self.__fileSystemRootNode
        call self._addEntry('path', '/', self.__rootNode)
        return
    endif
    let path = self.__rootNode.getAbsolutePath()
    let path = strpart(path, 0, strlen(path) - 1)
    if strlen(path) > g:pkgexpWindowWidth - 2
        let path = strpart(path, strlen(path) - (g:pkgexpWindowWidth - 3))
        while path[0] != '/' && path != ''
            let path = strpart(path, 1)
        endwhile
        let path = '←'. path
    endif
    call self._addEntry('path', path, self.__rootNode)
endfunction

" Method: _expandCollapseNode(node, expand) {{{2
function s:PackageView._expandCollapseNode(node, expand) dict
    if (a:node.expanded == 1 && a:expand == 'expand')
        \ || (a:node.expanded == 0 && a:expand == 'collapse')
        return 0
    endif
    let a:node.expanded = !a:node.expanded
    return 1
endfunction

" Method: _expandCollapseNodeRecursive(node, expand) {{{2
function s:PackageView._expandCollapseNodeRecursive(node, expand) dict
    let a:node.expanded = a:expand == 1
    for folder in a:node.getFolders()
        call self._expandCollapseNodeRecursive(folder, a:expand)
    endfor
endfunction

" Method: _getSelectedNode([lineno]) : FileSystemNode {{{2
function s:PackageView._getSelectedNode(...) dict
    if a:0 == 1
        return self.__nodeLookup[a:1]
    endif
    return self.__nodeLookup[line('.') - 1]
endfunction

" Method: _pushCursorPos() {{{2
function s:PackageView._pushCursorPos() dict
    if !has_key(self, 'cursorPosStack')
        let self.cursorPosStack = []
    endif
    call add(self.cursorPosStack,
        \ {'line': line('.'), 'winline': winline()})
endfunction

" Method: _popCursorPos() {{{2
function s:PackageView._popCursorPos() dict
    if !has_key(self, 'cursorPosStack') || len(self.cursorPosStack) == 0
        echoh ErrorMsg | echo 'posPop() on empty stack' | echoh None
        return
    endif
    let pos = remove(self.cursorPosStack, len(self.cursorPosStack) - 1)
    let scrolloff = &scrolloff
    setl scrolloff=0
    execute 'normal! '. (pos.line - pos.winline + 1) .'zt'. pos.line .'G'
    execute 'setl scrolloff='. scrolloff
endfunction

" Method: _setCursorPos(winline, pos) {{{2
function s:PackageView._setCursorPos(winline, pos) dict
    let scrolloff = &scrolloff
    setl scrolloff=0
    execute 'normal! '. (a:pos - a:winline + 1) .'zt'
    execute 'normal! '. a:pos .'G'
    execute 'setl scrolloff='. scrolloff
endfunction

" Method: _addEntry(type, label, node) {{{2
function s:PackageView._addEntry(type, label, node) dict
    let hint = ''
    if a:type == 'file'
        let hint = '┆ﬁ'
    elseif a:type == 'folder'
        let hint = '┆ﬂ'
    elseif a:type == 'source'
        let hint = '┆∫'
    elseif a:type == 'package'
        let hint = '┆¶'
    elseif a:type == 'help'
        let hint = '┆н'
    elseif a:type == 'path'
        let hint = '┆₧'
    endif
    execute 'normal! o'. a:label . hint
    call add(self.__nodeLookup, a:node)
endfunction

" Method: _displayFile(indent, node) {{{2
function s:PackageView._displayFiles(indent, node) dict
    if a:node.expanded == 0
        return
    endif

    let path = a:node.getRelativePath(self.__rootNode)

    for folderNode in a:node.getFolders()
        if has_key(folderNode, 'sourcePath')
            continue
        endif
        if self._isHiddenFolder(path . folderNode.name . '/', folderNode.name)
            continue
        endif
        let icon = folderNode.expanded ? '▽ ' : '▷ '
        call self._addEntry('folder', a:indent . icon . folderNode.name, folderNode)
        call self._displayFiles(a:indent .'  ', folderNode)
    endfor

    if a:node.fileCount() != 0
        for fileNode in a:node.getFiles()
            if !self._isHiddenFile(fileNode.name)
                call self._addEntry('file', a:indent . fileNode.name, fileNode)
            endif
        endfor
    endif
endfunction

" Method: _displayPackage(path_start, node) {{{2
function s:PackageView._displayPackage(path_start, node) dict
    for folderNode in a:node.getFolders()
        call self._displayPackage(a:path_start, folderNode)
    endfor

    let files = []
    for fileNode in a:node.getFiles()
        if !self._isHiddenFile(fileNode.name)
            call add(files, fileNode)
        endif
    endfor

    if len(files) == 0 && (
        \ a:node.folderCount() != 0 ||
        \ a:node.folderCount() == 0 && !self.showHidden
    \ )
        return
    endif

    let indent = '  '
    let nodePath = a:node.getRelativePath(self.__rootNode)

    if self._isHiddenFolder(nodePath . a:node.name . '/', a:node.name)
        return
    endif

    let package = strpart(nodePath, a:path_start)

    if package != ''
        let pkg = self._compressPackageName(package)
        let icon = a:node.expanded ? '▼ ' : '▶ '
        call self._addEntry('package', indent . icon . pkg, a:node)
        let indent .= '  '
    endif

    if !a:node.expanded
        return
    endif

    for fileNode in files
        call self._addEntry('file', indent . fileNode.name, fileNode)
    endfor
endfunction

" Method: _compressPackageName(name) {{{2
function s:PackageView._compressPackageName(name) dict
    let max_len = g:pkgexpWindowWidth - 5
    let packages = split(a:name, '/')
    let numpkgs = len(packages) - 1
    let compressed = join(packages, '.')
    let index = 0
    while strlen(compressed) > max_len && index < numpkgs
        let packages[index] = packages[index][0]
        let compressed = join(packages, '.')
        let index += 1
    endwhile
    return compressed
endfunction
" Method: _isHiddenFile(filename) {{{2
function s:PackageView._isHiddenFile(filename) dict
    if self.showHidden
        return 0
    endif
    if !self.__hidden.files.dots && a:filename[0] == '.'
        return 1
    endif
    for p in self.__hidden.files.ends
        let lenp = strlen(p)
        let lenf = strlen(a:filename)
        if lenp == lenf
            if p == a:filename
                return 1
            endif
            continue
        endif
        if lenp > lenf
            continue
        endif
        if strpart(a:filename, lenf - lenp, lenp) == p
            return 1
        endif
    endfor
    for p in self.__hidden.files.begins
        let lenp = strlen(p)
        let lenf = strlen(a:filename)
        if lenp == lenf
            if p == a:filename
                return 1
            endif
            continue
        endif
        if lenp > lenf
            continue
        endif
        if strpart(a:filename, 0, lenp) == p
            return 1
        endif
    endfor
    for p in self.__hidden.files.exact
        if p == a:filename
            return 1
        endif
    endfor
    for p in self.__hidden.files.contains
        if stridx(a:filename, p) != -1
            return 1
        endif
    endfor
    return 0
endfunction

" Method: _isHiddenFolder(path, name) {{{2
function s:PackageView._isHiddenFolder(path, name) dict
    if self.showHidden
        return 0
    endif
    if !self.__hidden.folders.dots && a:name[0] == '.'
        return 1
    endif
    for p in self.__hidden.folders.exact
        if p == a:path
            return 1
        endif
    endfor
    for p in self.__hidden.folders.contains
        if stridx(a:path, p) != -1
            return 1
        endif
    endfor
    for p in self.__hidden.folders.begins
        if p == strpart(a:name, 0, strlen(p))
            return 1
        endif
    endfor
    return 0
endfunction


" Function: call_dict_method(dict, method, [args...]) {{{1
function! s:call_dict_method(dict, method, ...)
    if has_key({a:dict}, a:method)
        call call({a:dict}[a:method], a:000, {a:dict})
    endif
endfunction

" Function: package_explorer_toggle([path]) {{{1
function! s:package_explorer_toggle(...)
    let bufnumber = bufnr(fnameescape('∷∷ PkgExp ∷∷'))
    if bufnumber != -1
        execute 'bwipe! '. bufnumber
        return
    endif

    if a:0 == 0
        let path = getcwd()
    else
        let path = expand(a:1)
    endif

    call s:PackageView.showExplorerWindow(expand(path))
endfunction
"}}}1

" Parse hide patterns
call s:PackageView.setHidden(g:pkgexpHidden)

" Command
command! -nargs=? -complete=dir PackageExplorerToggle call <sid>package_explorer_toggle(<f-args>)

" vim:fdm=marker
