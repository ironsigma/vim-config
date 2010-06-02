if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let tag = g:snip_start_tag.g:snip_end_tag

exec "Snippet doc4s <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><cr>".
        \ "<html><cr>".
        \ tag."<cr>".
        \ "</html>"

exec "Snippet doc4t <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\"><cr>".
        \ "<html><cr>".
        \ tag."<cr>".
        \ "</html>"

exec "Snippet docxs <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><cr>".
        \ "<html><cr>".
        \ tag."<cr>".
        \ "</html>"

exec "Snippet docxt <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><cr>".
        \ "<html><cr>".
        \ tag."<cr>".
        \ "</html>"

exec "Snippet head <head><cr>".
        \ "<tab><meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\"><cr>".
        \ "<tab><title>".tag."</title><cr>".
        \ "<tab>".tag."<cr>".
        \ "</head><cr>".
        \ tag

exec "Snippet body <body><cr>".
        \ tag."<cr>".
        \ "</body>"

exec "Snippet script <script type=\"text/javascript\" src=\"".tag."\"></script>"

exec "Snippet style <link rel=\"stylesheet\" type=\"text/css\" href=\"".tag."\">"

exec "Snippet istyle <style type=\"text/css\"><cr>".
        \ "<tab>".tag."<cr>".
        \ "<tab></style>"

exec "Snippet iscript <script type=\"text/javascript\"><cr>".
        \ "<tab>".tag."<cr>".
        \ "<tab></script>"

exec "Snippet div <div ".tag.">".tag."</div>"

exec "Snippet tr <tr>".tag."</tr>".tag

exec "Snippet th <th>".tag."</th>".tag

exec "Snippet td <td>".tag."</td>".tag

exec "Snippet table <table><cr>".
        \ "<tab><thead><cr>".
        \ "<tab><tab><tr><th>".tag."</th>".tag."</tr><cr>".
        \ "<tab></thead><cr>".
        \ "<tab><tbody><cr>".
        \ "<tab><tab><tr><td>".tag."</td>".tag."</tr><cr>".
        \ "<tab></tbody><cr>".
        \ "<tab></table>"

exec "Snippet form <form action=\"".tag."\" method=\"".tag."\"><cr>".
        \ tag."<cr>".
        \ "</form>"

exec "Snippet ref <a href=\"".tag."\">".tag."</a>".tag

exec "Snippet h1 <h1 id=\"".tag."\">".tag."</h1>".tag

exec "Snippet input <input id=\"".st."id".et."\" name=\"".st."id".et."\" type=\"".tag."\" value=\"".tag."\"".tag.">".tag

exec "Snippet option <option value=\"".tag."\" ".tag.">".tag."</option>"
