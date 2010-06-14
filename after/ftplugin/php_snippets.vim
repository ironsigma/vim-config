if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let tag = g:snip_start_tag.g:snip_end_tag

exec "Snippet /** /**<CR>* ".tag."<CR>**/"

exec "Snippet <> <".st."tag".et.tag.">".tag."</".st."tag".et.">"

exec "Snippet </ <".st."tag".et.tag." />"

exec "Snippet <>> <".st."tag".et.tag."><cr>".tag."<cr></".st."tag".et.">"

exec "Snippet get $".tag." = (isset($_GET['".st."var".et."'])?$_GET['".st."var".et."']:'');<cr>".tag

exec "Snippet post $".tag." = (isset($_POST['".st."var".et."'])?$_POST['".st."var".et."']:'');<cr>".tag

exec "Snippet iif <?php if ( ".tag." ) : ?><cr>".
        \ tag."<cr>".
        \ "<?php endif ?>"

exec "Snippet iifelse <?php if ( ".tag." ) : ?><cr>".
        \ tag."<cr>".
        \ "<?php else : ?><cr>".
        \ tag."<cr>".
        \ "<?php endif ?>"

exec "Snippet ielseif <?php elseif ( ".tag." ) : ?><cr>".
        \ "<tab>".tag

exec "Snippet ielse <?php else : ?><cr>".
        \ tag

exec "Snippet if if ( ".tag." ) {<cr>".
        \ tag."<cr>".
        \ "}"

exec "Snippet ifelse if ( ".tag." ) {<cr>".
        \ tag."<cr>".
        \ "} else {<cr>".
        \ tag."<cr>".
        \ "}"

exec "Snippet elseif } elseif ( ".tag." ) {<cr>".
        \ "<tab>".tag

exec "Snippet else } else {<cr>".
        \ tag

exec "Snippet ifor <?php for ( $".st."i".et."=".tag."; $".st."i".et." < ".tag."; $".st."i".et."++ ) : ?><cr>".
        \ tag."<cr>".
        \ "<?php endfor ?>"

exec "Snippet iforv <?php foreach( $".tag." as $".tag." ) : ?><cr>".
        \ tag."<cr>".
        \ "<?php endforeach ?>"

exec "Snippet iforkv <?php foreach( $".tag." as $".tag." => $".tag." ) : ?><cr>".
        \ tag."<cr>".
        \ "<?php endforeach ?>"

exec "Snippet for for ( $".st."i".et."=".tag."; $".st."i".et." < ".tag."; $".st."i".et."++ ) {<cr>".
        \ tag."<cr>".
        \ "}"

exec "Snippet forv foreach( $".tag." as $".tag." ) {<cr>".
        \ tag."<cr>".
        \ "}"

exec "Snippet forkv foreach( $".tag." as $".tag." => $".tag." ) {<cr>".
        \ tag."<cr>".
        \ "}"

exec "Snippet iwhile <?php while ( ".tag." ) : ?><cr>".
        \ tag."<cr>".
        \ "<?php endwhile ?>"

exec "Snippet while while ( ".tag." ) {<cr>".
        \ tag."<cr>".
        \ "}"

exec "Snippet switch switch ( ".tag." ) {<cr>".
        \ "case '".tag."':<cr>".
        \ tag."<cr>".
        \ "break;<cr>".
        \ "<cr>".
        \ "default:<cr>".
        \ "<cr>".
        \ "break;<cr>".
        \ "}<cr>".
        \ tag

exec "Snippet case case '".tag."':<cr>".
        \ tag."<cr>".
        \ "break;"

exec "Snippet function function ".tag." (".tag.") {<cr>".
        \ tag."<cr>".
        \ "}"

exec "Snippet method ".st."public".et." function ".tag." (".tag.") {<cr>".
        \ tag."<cr>".
        \ "}"

exec "Snippet if? ((".tag.")?".tag.":".tag.")".tag

exec "Snippet phpe <?php echo ".tag." ?>"

exec "Snippet dbg $GLOBALS['dbg']->debug(".tag.");"

exec "Snippet dump $GLOBALS['dbg']->dump(".tag.");"

exec "Snippet class class ".tag." {<cr>".
        \ "function __construct (".tag.") {<cr>".
        \ tag."<cr>".
        \ "}<cr>".
        \ "}"

runtime after/ftplugin/html_snippets.vim
runtime after/ftplugin/extjs_snippets.vim
