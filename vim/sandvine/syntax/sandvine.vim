" Vim syntax file
" Language:     Sandvine Policy
" Maintainer:   Nathan Kaun <nkaun@sandvine.com>
" Last Change:  2010 May 19
"

syntax clear

if exists("b:current_syntax")
    finish
endif

syn case ignore 

syn keyword svConditional   if then
syn keyword svStructure     Classifier PolicyGroup Table Measurement Limiter 
syn keyword svStructure     Timer Session IpAssignment Flow 
syn keyword svStructure     define function
syn keyword svBoolean       true false
syn keyword svStatement     expr
syn keyword svOperator      and or not set is 
syn keyword svAction        allow analyze block captive_portal continue count 
syn keyword svAction        delete_row divert http_response limit mark rateclass
syn keyword svAction        reevaluate send_event set set_attribute shape 
syn keyword svAction        tcp_reset tee increment decrement
syn keyword svTodo      TODO

syn region svComment    start="^\s*\#" end="$" contains=svTodo
syn region svString     start=+L\="+ skip=+\\\\\|\\"\[\]+ end=+"+
syn region svPCLCall    start="\$\[" end="]\$"
"contains=cSpecial,cFormat,@Spell
"
" additional types
syn keyword svConstant null Attribute
syn keyword svDebug log values
syn keyword svFunction Extract Coalesce OneOf Join Any All HexToOctets Serialize
syn keyword svFunction Deserialize TestNull Concat Left SubStr
syn keyword svType cursor integer boolean string byte timestamp ipaddress
syn keyword svType integer8 integer16 integer32 unsigned8 unsigned16 unsigned32

syn match  svNumber            "-\?\<\d\+\(u\=l\=\|lu\|f\)\>"
"floating point number, with dot, optional exponent
syn match  svNumber            "\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, starting with a dot, optional exponent
syn match  svNumber            "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match  svNumber            "\<\d\+e[-+]\=\d\+[fl]\=\>"
"hex number
syn match  svNumber            "0x[0-9a-f]\+\(u\=l\=\|lu\)\>"


hi link svConditional   Conditional
hi link svStructure     Structure
hi link svComment       Comment
hi link svNumber        Number
hi link svStatement     Statement
hi link svString        String
hi link svBoolean       Boolean
hi link svOperator      Operator
hi link svPCLCall       String

hi link svConstant      Constant
hi link svDebug         Debug
hi link svFunction      Function
hi link svType          Type
hi link svTodo          Todo
