if !exists('loaded_snippet') || &cp
    finish
endif

let tag = g:snip_start_tag.g:snip_end_tag

exec "Snippet doc4s <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><cr><html><cr>".tag."<cr></html>"
exec "Snippet doc4t <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"<cr>\"http://www.w3.org/TR/html4/loose.dtd\"><cr>".tag
exec "Snippet docxs <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\"<cr>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><cr>".tag
exec "Snippet docxt <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Transitional//EN\"<cr>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><cr>".tag
exec "Snippet head <head><cr><tab><meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" /><cr><tab><title>".tag."</title><cr><tab>".tag."<cr></head><cr>".tag
exec "Snippet body <body><cr>".tag."<cr></body>"
exec "Snippet script <script type=\"text/javascript\" src=\"".tag."\"></script><cr><tab>".tag
exec "Snippet style <link rel=\"stylesheet\" type=\"text/css\" href=\"".tag."\" /><cr><tab>".tag
exec "Snippet istyle <style type=\"text/css\"><cr><tab>".tag."<cr><tab></style><cr><tab>".tag
exec "Snippet iscript <script type=\"text/javascript\"><cr><tab>".tag."<cr><tab></script><cr><tab>".tag
exec "Snippet div <div ".tag."><cr>".tag."<cr></div><cr>".tag
exec "Snippet table <table><cr><tr><th>".tag."</th></tr><cr><tr><td>".tag."</td></tr><cr></table>"
exec "Snippet form <form action=\"".tag."\" method=\"".tag."\"><cr>".tag."<cr></form><cr>".tag
exec "Snippet ref <a href=\"".tag."\">".tag."</a>".tag
exec "Snippet h1 <h1 id=\"".tag."\">".tag."</h1>".tag
exec "Snippet input <input type=\"".tag."\" name=\"".tag."\" value=\"".tag."\" ".tag."/>".tag
exec "Snippet option <option value=\"".tag."\" ".tag.">".tag."</option><cr>".tag
