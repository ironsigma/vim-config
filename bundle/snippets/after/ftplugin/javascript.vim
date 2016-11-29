" vim: filetype=javascript
ParseThisSnippetFile
finish

:snippet jqdoc Document ready block
$(document).ready(function() {
    <@>
});

:snippet req
var <@> = require('');

:snippet func
function (<@>) {
}

:snippet fun
(<@>) => {
}

:snippet if
if (<@>) {
}

:snippet else
else {
    <@>
}
