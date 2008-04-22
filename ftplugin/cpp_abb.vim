if !exists(":Cabbr") || exists("b:did_cpp_abbr")
    finish
endif
let b:did_cpp_abbr = 1

" C++ Mappings
"--------------------------------------------------------------------------
Cabbr <buffer> class <C-R>=MapNoContext("class ",  'class CLASS_NAME {\<cr\>\<cr\>'.
            \'\<bs\>public:\<cr\>\<cr\>'.
            \'// Life Cycle\<cr\>'.
            \'\<bs\>\<bs\>\<bs\>CLASS_NAME();\<cr\>'.
            \'CLASS_NAME(const CLASS_NAME &rFrom);\<cr\>\<cr\>'.
            \'~CLASS_NAME();\<cr\>\<cr\>'.
            \'// Operators\<cr\>'.
            \'\<bs\>\<bs\>\<bs\>CLASS_NAME& operator=(const CLASS_NAME &rFrom);\<cr\>\<cr\>'.
            \'\<bs\>protected:\<cr\>\<cr\>'.
            \'};')<cr><esc>:%s/CLASS_NAME/

Cabbr <buffer> classdef <C-R>=MapNoContext("classdef ", '#include \"CLASS_NAME.h\"\<cr\>\<cr\>'.
            \'CLASS_NAME::CLASS_NAME() {\<cr\>'.
            \'/* todo: Add constructor code. */\<cr\>'.
            \'}\<cr\>'.
            \'CLASS_NAME::CLASS_NAME(const CLASS_NAME &rFrom) {\<cr\>'.
            \'/* todo: Add copy constructor code. */\<cr\>'.
            \'}\<cr\>'.
            \'CLASS_NAME::~CLASS_NAME() {\<cr\>'.
            \'/* todo: Add destructor code. */\<cr\>'.
            \'}\<cr\>'.
            \'CLASS_NAME& CLASS_NAME::operator=(const CLASS_NAME &rFrom) {\<cr\>'.
            \'/* todo: Add assignment operator code. */\<cr\>'.
            \'return this;\<cr\>'.
            \'}')<cr><esc>:%s/CLASS_NAME/
