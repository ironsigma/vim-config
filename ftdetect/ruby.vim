" Ruby file type autodetect
" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec	setlocal filetype=ruby

" Ruby on Rails
au BufNewFile,BufRead *.builder,*.rxml,*.rjs		setlocal filetype=ruby

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake		setlocal filetype=ruby

" Rantfile
au BufNewFile,BufRead [rR]antfile,*.rant		setlocal filetype=ruby

" eRuby
au BufNewFile,BufRead *.erb,*.rhtml			setlocal filetype=eruby
