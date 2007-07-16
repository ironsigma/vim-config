" Vim syntax file
" Language:     Descript.ion file
" Maintainer:   Juan Frias <juan.frias@earthlink.net>
" Last Change:  2004 Mar 31

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match   ionFile     /^[^" ]\+/
syn match   ionFile     /^"[^"]\+/

" Color it!
if version >= 508 || !exists("did_fsc_syn_inits")
  if version < 508
    let did_fsc_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink ionFile    String

  delcommand HiLink
endif

let b:current_syntax = "ION"
