if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let tag = g:snip_start_tag.g:snip_end_tag

exec "Snippet $ Ext.fly('".tag."')".tag

exec "Snippet val Ext.fly('".tag."').dom.value".tag

exec "Snippet sel Ext.fly('".st.'select_id'.et."').dom.options[Ext.fly('".st.'select_id'.et."').dom.selectedIndex].value".tag

exec "Snippet ready Ext.onReady(function() {<cr>".
        \ tag."<cr>".
        \ "});"

exec "Snippet on Ext.fly('".tag."').on('".tag."', function() {<cr>".
        \ tag."<cr>".
        \ "});"

exec "Snippet ajax Ext.Ajax.request({<cr>".
        \ "url: '".tag."',<cr>".
        \ "<bs>disableCaching: true,<cr>".
        \ "disableCachingParam: 'rand',<cr>".
        \ "method: 'post',<cr>".
        \ "params: { data: Ext.encode({".
        \ "<tab>action: '".tag."' }) },<cr>".
        \ "<cr>// on success<cr>".
        \ "<bs><bs><bs>success: function(response) {<cr>".
        \ "var response = Ext.decode(response.responseText);<cr>".
        \ tag."<cr>".
        \ "},<cr>".
        \ "<cr>// on failure<cr>".
        \ "<bs><bs><bs>failure: function() {<cr>".
        \ "}<cr>".
        \ "});"
