if exists("current_compiler")
    finish
endif

let current_compiler = "xcodebuild"
setlocal makeprg=xcodebuild\ -configuration\ Debug
