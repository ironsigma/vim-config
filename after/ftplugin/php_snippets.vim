if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let tag = g:snip_start_tag.g:snip_end_tag

exec "Snippet if if ( ".tag." ) {<cr>".tag."<cr>}<cr>".tag
exec "Snippet ifelse if ( ".tag." ) {<cr>".tag."<cr>}<cr>else {<cr>".tag."<cr>}<cr>".tag
exec "Snippet elseif } elseif ( ".tag." ) {<cr><tab>".tag
exec "Snippet else } else {<cr>".tag
exec "Snippet for for ( $".st."i".et."=".tag."; $".st."i".et." < ".tag."; $".st."i".et."++ ) { <cr>".tag."<cr>}<cr>".tag
exec "Snippet forv foreach( $".tag." as $".tag." ) {<cr>".tag."<cr>}<cr>".tag
exec "Snippet forkv foreach( $".tag." as $".tag." => $".tag." )<cr>{<cr>".tag."<cr>}<cr>".tag
exec "Snippet while while ( ".tag." ) {<cr>".tag."<cr>}<cr>".tag
exec "Snippet switch switch ( ".tag." ) {<cr>case '".tag."':<cr>".tag."<cr>break;<cr><cr>".tag."<cr><cr>default:<cr>".tag."<cr>break;<cr>}<cr>".tag
exec "Snippet case case '".tag."':<cr>".tag."<cr>break;<cr>".tag
exec "Snippet function function ".tag." (".tag.") {<cr>".tag."<cr>}<cr>".tag
exec "Snippet method ".st."public".et." function ".tag." (".tag.") {<cr>".tag."<cr>}<cr>".tag
exec "Snippet if? (( ".tag." ) ? ".tag." : ".tag." )".tag
exec "Snippet php <?php<cr><tab>".tag."<cr>?>"
exec "Snippet phpe <?php echo ".tag." ?>"
exec "Snippet dbg $GLOBALS['dbg']->debug(".tag.");"
exec "Snippet dump $GLOBALS['dbg']->dump(".tag.");"
exec "Snippet class class ".tag." {<cr>function __construct (".tag.") {<cr>".tag."<cr>}<cr>}"
exec "Snippet /** /**<CR>* ".tag."<CR>**/"

runtime after/ftplugin/html_snippets.vim
