" vim: filetype=php
ParseThisSnippetFile
finish

:snippet php <?PHP tag block ?>
<?php
<@>
?>

:snippet echo Inline echo
<?php echo <@> ?>

:snippet if
if (<@>) {
}

:snippet class
class <@> {
    public function __construct() {
    }
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
