if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let tag = g:snip_start_tag.g:snip_end_tag

let xml_head = "<head xmlns=\"http://www.w3.org/1999/xhtml\"><cr>"
let head = "<head><cr>"

let html = "<tab><meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\"><cr>".
        \ "<tab><title>".tag."</title><cr>".
        \ "</head><cr>".
        \ "<body><cr>".
        \ "</body><cr>".
        \ "</html>"

exec "Snippet doc4s <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><cr><html><cr>".head.html

exec "Snippet doc4t <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\"><cr><html><cr>".head.html

exec "Snippet docxs <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><cr><html><cr>".xml_head.html

exec "Snippet docxt <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><cr><html><cr>".xml_head.html

exec "Snippet script <script type=\"text/javascript\" src=\"".tag."\"></script>"

exec "Snippet iscript <script type=\"text/javascript\"><cr>".
        \ "<tab>".tag."<cr>".
        \ "<tab></script>"

exec "Snippet style <link rel=\"stylesheet\" type=\"text/css\" href=\"".tag."\">"

exec "Snippet istyle <style type=\"text/css\"><cr>".
        \ "<tab>".tag."<cr>".
        \ "<tab></style>"

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

exec "Snippet input <input id=\"".st."id".et."\" name=\"".st."id".et."\" type=\"".tag."\" value=\"".tag."\"".tag.">".tag

exec "Snippet option <option value=\"".tag."\" ".tag.">".tag."</option>"

exec "Snippet lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque faucibus sagittis magna non sollicitudin. Praesent vestibulum laoreet purus in semper. Aliquam ullamcorper gravida placerat. Ut rutrum molestie diam sed tincidunt. In hac habitasse platea dictumst. Ut justo mauris, tristique at volutpat quis, cursus non leo. Phasellus facilisis nibh ullamcorper est fringilla aliquam. Quisque pretium aliquet dolor vel condimentum. Aliquam turpis nibh, tincidunt et tempus vel, malesuada vel lorem. Aenean dui sapien, lacinia sed ullamcorper quis, blandit ut libero. Integer a nisi sit amet mauris fringilla pharetra nec nec neque. Nam ante ante, rutrum sit amet placerat sit amet, suscipit non elit. Sed sed est ac mauris ornare vehicula a non urna. Nulla vitae mauris volutpat dolor elementum fermentum et eget elit. Phasellus dapibus adipiscing risus in tincidunt.".tag

exec "Snippet lorem2 Vestibulum imperdiet, ipsum ut viverra bibendum, lectus massa accumsan orci, ut fringilla lorem eros sit amet velit. Morbi iaculis elementum accumsan. Praesent ante augue, porta vel accumsan id, ultricies ut nunc. Vestibulum scelerisque lorem et quam lacinia ultricies. Nullam in libero mauris, et semper nunc. Phasellus malesuada magna eget elit ornare blandit. Nunc venenatis, massa sed pretium eleifend, leo nunc pulvinar est, pharetra facilisis nisl erat tempus mi. In hendrerit neque sed mauris pulvinar at tincidunt odio semper. Donec risus magna, pulvinar sed iaculis ac, euismod eu nisl. Duis id libero ac purus cursus elementum.".tag

exec "Snippet lorem3 Morbi blandit lobortis sem, eu suscipit nunc varius lacinia. Morbi sollicitudin quam leo, non suscipit libero. Morbi euismod fringilla massa in rhoncus. Integer iaculis, felis id vestibulum laoreet, metus quam rutrum augue, eu tempus erat nisi ut felis. Nulla facilisi. Curabitur dictum eros eget nisl viverra consectetur. Integer bibendum ante nec elit vehicula vitae ornare augue semper. Praesent arcu est, porta vitae ornare sit amet, imperdiet lobortis metus. Proin eleifend ante in velit commodo at lobortis orci euismod. Sed dictum, velit vel malesuada vehicula, massa est posuere nulla, vel iaculis mauris arcu in dui. Donec tempus, lacus sit amet molestie porttitor, metus ante ultricies velit, vitae imperdiet est urna quis metus. Ut id blandit enim. Vestibulum accumsan velit sit amet augue posuere luctus.".tag

exec "Snippet lorem4 Aenean faucibus semper orci, bibendum bibendum odio porttitor vel. Fusce dignissim, tortor ut consequat luctus, nibh purus consequat urna, vitae ultricies lacus lacus eget arcu. Praesent urna risus, bibendum ut sodales et, scelerisque non mi. Sed rutrum neque sit amet erat sollicitudin sodales. In hac habitasse platea dictumst. Sed nec turpis nisl, at tincidunt odio. Proin ut quam sit amet magna tempor ultricies et sed odio. Pellentesque sit amet elit in enim sodales ullamcorper. Donec tincidunt luctus dolor, id sagittis orci bibendum a. In diam mauris, rutrum at scelerisque in, bibendum eget metus. Phasellus vel orci sed justo rhoncus fringilla eget a enim. Morbi mattis tempor ante, nec aliquam purus egestas eget. Donec sodales vehicula nulla, non congue eros blandit quis. Fusce venenatis, magna sed ultricies elementum, magna augue tincidunt eros, sit amet pulvinar lacus magna ut est. Nulla elementum vehicula augue sit amet varius.".tag

exec "Snippet lorem5 Phasellus porta vestibulum risus. Fusce vitae dolor sed nisl varius lobortis at vitae mi. Mauris vel mi vel nisi aliquet interdum at eu lectus. Nam et est id neque pretium pharetra at ac est. Donec non mauris ut libero venenatis imperdiet. Donec non justo velit. Etiam sit amet nulla vel sapien dignissim lobortis. Donec dui arcu, placerat eu auctor non, volutpat in sem. Aliquam erat volutpat. Nunc rutrum suscipit augue, nec rutrum ligula tincidunt id. Donec quam sem, faucibus nec tincidunt sed, egestas ut est. Vivamus a nunc sem, non dictum velit. Nullam id magna odio, eu hendrerit libero. Aenean luctus tortor hendrerit dolor faucibus semper. Proin placerat adipiscing nulla id scelerisque.".tag

exec "Snippet llorem * Lorem ipsum dolor sit amet, consectetur adipiscing elit.<cr>".
            \ "* Curabitur tincidunt mauris ut leo rutrum id gravida purus lacinia.<cr>".
            \ "* Phasellus at arcu at ante molestie vestibulum a id metus.<cr>".
            \ "* Suspendisse sagittis nisi vitae nisl aliquam placerat.<cr>".
            \ "* Aenean vulputate iaculis sapien, sit amet consectetur justo ornare nec.<cr>".
            \ "* Donec tristique tortor ac urna mollis pretium.<cr>".
            \ "* Fusce auctor dui in diam pharetra sit amet tempor neque scelerisque.<cr>".
            \ "* In id eros quis est mattis vulputate eu sit amet metus.<cr>".
            \ "* Donec fermentum malesuada leo, vel feugiat ante dictum sed.<cr>".
            \ "* Nunc commodo tortor in dolor aliquam semper aliquam arcu sagittis.<cr>".
            \ "* Integer malesuada mauris eu nisi vulputate id hendrerit nunc facilisis.<cr>".
            \ "* Pellentesque at risus et mi vestibulum euismod.<cr>".tag
