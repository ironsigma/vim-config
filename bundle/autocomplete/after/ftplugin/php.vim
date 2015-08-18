" Snippets for PHP

call SnippetAC('php', "<?php\<cr><@>\<cr>?>")

call SnippetAC('if', "if (<@>) {\<cr>}")
call SnippetAC('iif', "<?php if (<@>) : ?>\<cr><?php endif ?>")

call SnippetAC('for', "for ($i = 0; $i < <@>; $i++) {\<cr>}")
call SnippetAC('ifor', "<?php for ($i = 0; $i < <@>; $i++) : ?>\<cr><?php endfor ?>")

call SnippetAC('fore', "foreach (<@>) {\<cr>}")
call SnippetAC('ifore', "<?php foreach (<@>) : ?>\<cr><?php endforeach ?>")

call SnippetAC('html',
\"<!doctype html>\<cr>
\<html lang=\"en\">\<cr>
\<head>\<cr>
\    <meta charset=\"utf-8\" />\<cr>
\    <title><@></title>\<cr>
\    <link rel=\"stylesheet\" href=\"css/styles.css\">\<cr>
\</head>\<cr>
\<body>\<cr>
\</body>\<cr>
\</html>")
