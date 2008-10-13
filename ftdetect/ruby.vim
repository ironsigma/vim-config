" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec	set filetype=ruby sts=2 sw=2

" Ruby on Rails
au BufNewFile,BufRead *.builder,*.rxml,*.rjs		set filetype=ruby sts=2 sw=2

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake		set filetype=ruby sts=2 sw=2

" Rantfile
au BufNewFile,BufRead [rR]antfile,*.rant		set filetype=ruby sts=2 sw=2

" eRuby
au BufNewFile,BufRead *.erb,*.rhtml			set filetype=eruby sts=2 sw=2
