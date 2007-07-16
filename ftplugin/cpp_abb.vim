if !exists(":Iabbr") || exists("b:did_cpp_abbr")
    finish
endif
let b:did_cpp_abbr = 1

" C++ Mappings
"--------------------------------------------------------------------------
Iabbr <buffer> class <C-R>=MapNoContext("class ",  'class !class! {\<cr\>\<cr\>\<bs\>'.
            \'public:\<cr\>\<cr\>// Life Cycle\<cr\>\<bs\>\<bs\>\<bs\>!class!();\<cr\>'.
            \'!class!(const !class! &rFrom);\<cr\>\<cr\>~!class!();\<cr\>\<cr\>'.
            \'// Operators\<cr\>\<bs\>\<bs\>\<bs\>!class!& operator=(const !class! &rFrom);\<cr\>\<cr\>'.
            \'protected:\<cr\>\<cr\>};\<esc\>:%s/!class!/')<cr>

Iabbr <buffer> classdef <C-R>=MapNoContext("classdef ", '#include \"!class!.h\"\<cr\>\<cr\>'.
            \'!class!::!class!() {\<cr\>'.
            \'/* todo: Add constructor code. */\<cr\>'.
            \'}\<cr\>'.
            \'!class!::!class!(const !class! &rFrom) {\<cr\>'.
            \'/* todo: Add copy constructor code. */\<cr\>'.
            \'}\<cr\>'.
            \'!class!::~!class!() {\<cr\>'.
            \'/* todo: Add destructor code. */\<cr\>'.
            \'}\<cr\>'.
            \'!class!& !class!::operator=(const !class! &rFrom) {\<cr\>'.
            \'/* todo: Add assignment operator code. */\<cr\>'.
            \'return *this;\<cr\>'.
            \'}\<cr\>'.
            \'\<esc\>:%s/!class!/')<cr>
