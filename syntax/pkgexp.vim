syntax region pkgexpFlag    start='\[' end=']'
syntax match pkgexpMarkers conceal "┆.$"
syntax match pkgexpFile    /^.*┆ﬁ$/me=e-2
syntax match pkgexpFolder  /^.*┆ﬂ$/me=e-2
syntax match pkgexpSource  /^.*┆∫$/me=e-2
syntax match pkgexpPackage /^.*┆¶$/me=e-2
syntax match pkgexpHelp    /^.*┆н$/me=e-2 contains=pkgexpFlag
syntax match pkgexpPath    /^.*┆₧$/me=e-2

hi def link pkgexpFlag      Boolean
hi def link pkgexpFile      Identifier
hi def link pkgexpFolder    String
hi def link pkgexpSource    PreProc
hi def link pkgexpPackage   Statement
hi def link pkgexpPath      Directory
hi def link pkgexpHelp      Comment
