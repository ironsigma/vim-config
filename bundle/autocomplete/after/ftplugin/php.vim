" vim filetype=php

call ParseSnippetFile(expand('<sfile>:p'))
finish

:snippet <? PHP tag
<?php
<@>
?>

:snippet if
if (<@>) {
}

:snippet iif Inline HTML if
<?php if (<@>) : ?>
<?php endif ?>

:snippet for
for ($i = 0; $i < <@>; $i++) {
}

:snippet ifor Inline HTML for
<?php for ($i = 0; $i < <@>; $i++) : ?>
<?php endfor ?>

:snippet fore
foreach (<@>) {
}

:snippet ifore Inline HTML foreach
<?php foreach (<@>) : ?>
<?php endforeach ?>

:snippet html HTML5 Template
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><@></title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
</body>
</html>
