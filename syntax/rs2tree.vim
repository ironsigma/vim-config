" rs2tree.vim - Syntax file for rs2tree output report
" Copyright (C) 2009 Juan D Frias <juandfrias@gmail.com>
" 
" This program is free software; you can redistribute it and/or
" modify it under the terms of the GNU General Public License
" as published by the Free Software Foundation; either version 2
" of the License, or (at your option) any later version.
" 
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with this program; if not, write to the Free Software
" Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
" or visit http://www.gnu.org/licenses/gpl-2.0.html

" Maintainer:	Juan frias <juandfrias@gmail.com>
" Last Change:	2009 Jul 8
" Version:	0.1
"
if exists('b:current_syntax')
    finish
endif
let b:current_syntax = "rs2tree"

syn match rs2treeAdd        /^\s\++ .*$/
syn match rs2treeDelete     /^\s\+- .*$/
syn match rs2treeChange     /^\s\+! .*$/
syn match rs2treePath       /^.* {{{\|}}}$/

hi def link rs2treeAdd      DiffAdd
hi def link rs2treeDelete   DiffDelete
hi def link rs2treeChange   DiffChange
hi def link rs2treePath     FoldColumn
