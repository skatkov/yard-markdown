# Class: RDoc::RD::InlineParser
**Inherits:** Racc::Parser
    

RD format parser for inline markup such as emphasis, links, footnotes, etc.



#Instance Methods
## _reduce_101(val, _values, result) [](#method-i-_reduce_101)
reduce 100 omitted

## _reduce_102(val, _values, result) [](#method-i-_reduce_102)

## _reduce_109(val, _values, result) [](#method-i-_reduce_109)
reduce 108 omitted

## _reduce_111(val, _values, result) [](#method-i-_reduce_111)
reduce 110 omitted

## _reduce_113(val, _values, result) [](#method-i-_reduce_113)
reduce 112 omitted

## _reduce_114(val, _values, result) [](#method-i-_reduce_114)

## _reduce_115(val, _values, result) [](#method-i-_reduce_115)

## _reduce_13(val, _values, result) [](#method-i-_reduce_13)
reduce 12 omitted

## _reduce_136(val, _values, result) [](#method-i-_reduce_136)
reduce 135 omitted

## _reduce_14(val, _values, result) [](#method-i-_reduce_14)

## _reduce_15(val, _values, result) [](#method-i-_reduce_15)

## _reduce_16(val, _values, result) [](#method-i-_reduce_16)

## _reduce_17(val, _values, result) [](#method-i-_reduce_17)

## _reduce_18(val, _values, result) [](#method-i-_reduce_18)

## _reduce_19(val, _values, result) [](#method-i-_reduce_19)

## _reduce_2(val, _values, result) [](#method-i-_reduce_2)
reduce 1 omitted

## _reduce_20(val, _values, result) [](#method-i-_reduce_20)

## _reduce_21(val, _values, result) [](#method-i-_reduce_21)

## _reduce_22(val, _values, result) [](#method-i-_reduce_22)

## _reduce_23(val, _values, result) [](#method-i-_reduce_23)

## _reduce_24(val, _values, result) [](#method-i-_reduce_24)

## _reduce_25(val, _values, result) [](#method-i-_reduce_25)

## _reduce_26(val, _values, result) [](#method-i-_reduce_26)

## _reduce_27(val, _values, result) [](#method-i-_reduce_27)

## _reduce_29(val, _values, result) [](#method-i-_reduce_29)
reduce 28 omitted

## _reduce_3(val, _values, result) [](#method-i-_reduce_3)

## _reduce_30(val, _values, result) [](#method-i-_reduce_30)

## _reduce_31(val, _values, result) [](#method-i-_reduce_31)

## _reduce_32(val, _values, result) [](#method-i-_reduce_32)

## _reduce_33(val, _values, result) [](#method-i-_reduce_33)

## _reduce_34(val, _values, result) [](#method-i-_reduce_34)

## _reduce_36(val, _values, result) [](#method-i-_reduce_36)
reduce 35 omitted

## _reduce_37(val, _values, result) [](#method-i-_reduce_37)

## _reduce_38(val, _values, result) [](#method-i-_reduce_38)

## _reduce_39(val, _values, result) [](#method-i-_reduce_39)

## _reduce_40(val, _values, result) [](#method-i-_reduce_40)

## _reduce_41(val, _values, result) [](#method-i-_reduce_41)

## _reduce_43(val, _values, result) [](#method-i-_reduce_43)
reduce 42 omitted

## _reduce_44(val, _values, result) [](#method-i-_reduce_44)

## _reduce_45(val, _values, result) [](#method-i-_reduce_45)

## _reduce_46(val, _values, result) [](#method-i-_reduce_46)

## _reduce_57(val, _values, result) [](#method-i-_reduce_57)
reduce 56 omitted

## _reduce_58(val, _values, result) [](#method-i-_reduce_58)

## _reduce_59(val, _values, result) [](#method-i-_reduce_59)

## _reduce_60(val, _values, result) [](#method-i-_reduce_60)

## _reduce_62(val, _values, result) [](#method-i-_reduce_62)
reduce 61 omitted

## _reduce_64(val, _values, result) [](#method-i-_reduce_64)
reduce 63 omitted

## _reduce_78(val, _values, result) [](#method-i-_reduce_78)
reduce 77 omitted

## _reduce_none(val, _values, result) [](#method-i-_reduce_none)
reduce 137 omitted

## initialize(block_parser) [](#method-i-initialize)
Creates a new parser for inline markup in the rd format.  The `block_parser`
is used to for footnotes and labels in the inline text.

**@return** [InlineParser] a new instance of InlineParser

## inline(rdoc, referencerdoc) [](#method-i-inline)
Creates a new RDoc::RD::Inline for the `rdoc` markup and the raw `reference`

## next_token() [](#method-i-next_token)
Returns the next token from the inline text

## next_words_on_error() [](#method-i-next_words_on_error)
Returns words following an error

## on_error(et, ev, values) [](#method-i-on_error)
Raises a ParseError when invalid formatting is found

**@raise** [ParseError] 

## parse(inline) [](#method-i-parse)
Parses the `inline` text from RD format into RDoc format.

## prev_words_on_error(ev) [](#method-i-prev_words_on_error)
Returns words before the error

