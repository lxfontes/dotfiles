" Vim syntax file
" Language:     Sandvine Policy
" Maintainer:   Nathan Kaun <nkaun@sandvine.com>
" Last Change:  2012 Jan 29
"

syntax clear

if exists("b:current_syntax")
    finish
endif

syn case ignore

syn keyword svConditional   if then

syn keyword svStructure     Classifier PolicyGroup Table Measurement Limiter shaper
syn keyword svStructure     Timer Session IpAssignment Flow Subscriber Diameter
syn keyword svStructure     Radius DHCP
syn keyword svStructure     define function

syn keyword svBoolean       true false

syn keyword svStatement     expr Now Random Attribute

syn keyword svOperator      and or not set is

syn keyword svFunction      Integer Float String Boolean Timestamp Substr
syn keyword svFunction      Mid Left Right Length ToLower ToUpper Concat
syn keyword svFunction      ReplaceFirst LocalTime Regex RegSub
syn keyword svFunction      GmTime Year Month Day DayOfWeek Hour Minute Second
syn keyword svFunction      TimeIntervalMonth TimeIntervalWeek TimeIntervalDay
syn keyword svFunction      TimeIntervalHour Round Ceil Floor Abs
syn keyword svFunction      Any All OneOf Flow.IsApplicationProtocol IpInClass
syn keyword svFunction      NetworkName PolicyClassName Minimum Maximum Between
syn keyword svFunction      AES RC5 HMACMD5 Base64Encode HexToBase64 NormalizePath
syn keyword svFunction      PercentEncode PercentDecode StringIPToOctets OctetsIPToString
syn keyword svFunction      HexToOctets OctetsToHex IpToString StringToIP StringToMac
syn keyword svFunction      BinaryString Serialize Join Extract Coalesce TestNull
syn keyword svFunction      FindThreshold ToSeconds ToMilliseconds ToMicroseconds


syn keyword svAction        allow analyze block captive_portal continue count
syn keyword svAction        delete_row divert http_response limit mark rateclass
syn keyword svAction        reevaluate send_event set set_attribute shape
syn keyword svAction        tcp_reset tee increment decrement
syn keyword svTodo      TODO

syn region svComment    start="^\s*\#" end="$" contains=svTodo
syn region svString     start=+L\="+ skip=+\\\\\|\\"\[\]+ end=+"+
syn region svPCLCall    start="\$\[" end="]\$"
syn region svPAL        start=+'+ end=+'+
syn region svBraces     start="{" end="}" fold transparent
"contains=cSpecial,cFormat,@Spell
"
" additional types
syn keyword svConstant null
syn keyword svDebug log values
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
hi link svPAL           Statement
hi link svString        String
hi link svBoolean       Boolean
hi link svOperator      Operator
hi link svPCLCall       String

hi link svConstant      Constant
hi link svDebug         Debug
hi link svFunction      Function
hi link svType          Type
hi link svTodo          Todo

hi link svBraces        PreProc
