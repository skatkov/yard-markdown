# Class: RDoc::RD::BlockParser
**Inherits:** Racc::Parser
    

RD format parser for headings, paragraphs, lists, verbatim sections that exist
as blocks.


# Attributes
## footnotes[RW] [](#attribute-i-footnotes)
Footnotes for this document

## include_path[RW] [](#attribute-i-include_path)
Path to find included files in

## labels[RW] [](#attribute-i-labels)
Labels for items in this document


#Instance Methods
## _reduce_1(val, _values, result) [](#method-i-_reduce_1)
reduce 0 omitted

## _reduce_10(val, _values, result) [](#method-i-_reduce_10)

## _reduce_11(val, _values, result) [](#method-i-_reduce_11)

## _reduce_12(val, _values, result) [](#method-i-_reduce_12)

## _reduce_13(val, _values, result) [](#method-i-_reduce_13)

## _reduce_14(val, _values, result) [](#method-i-_reduce_14)

## _reduce_15(val, _values, result) [](#method-i-_reduce_15)

## _reduce_16(val, _values, result) [](#method-i-_reduce_16)

## _reduce_17(val, _values, result) [](#method-i-_reduce_17)

## _reduce_18(val, _values, result) [](#method-i-_reduce_18)

## _reduce_19(val, _values, result) [](#method-i-_reduce_19)

## _reduce_2(val, _values, result) [](#method-i-_reduce_2)

**@raise** [ParseError] 

## _reduce_20(val, _values, result) [](#method-i-_reduce_20)

## _reduce_21(val, _values, result) [](#method-i-_reduce_21)

## _reduce_22(val, _values, result) [](#method-i-_reduce_22)

## _reduce_27(val, _values, result) [](#method-i-_reduce_27)
reduce 26 omitted

## _reduce_28(val, _values, result) [](#method-i-_reduce_28)

## _reduce_29(val, _values, result) [](#method-i-_reduce_29)

## _reduce_3(val, _values, result) [](#method-i-_reduce_3)

## _reduce_30(val, _values, result) [](#method-i-_reduce_30)

## _reduce_31(val, _values, result) [](#method-i-_reduce_31)

## _reduce_32(val, _values, result) [](#method-i-_reduce_32)

## _reduce_33(val, _values, result) [](#method-i-_reduce_33)

## _reduce_34(val, _values, result) [](#method-i-_reduce_34)

## _reduce_35(val, _values, result) [](#method-i-_reduce_35)

## _reduce_36(val, _values, result) [](#method-i-_reduce_36)

## _reduce_37(val, _values, result) [](#method-i-_reduce_37)

## _reduce_38(val, _values, result) [](#method-i-_reduce_38)

## _reduce_39(val, _values, result) [](#method-i-_reduce_39)

## _reduce_4(val, _values, result) [](#method-i-_reduce_4)

## _reduce_40(val, _values, result) [](#method-i-_reduce_40)

## _reduce_41(val, _values, result) [](#method-i-_reduce_41)

## _reduce_42(val, _values, result) [](#method-i-_reduce_42)

## _reduce_43(val, _values, result) [](#method-i-_reduce_43)

## _reduce_44(val, _values, result) [](#method-i-_reduce_44)

## _reduce_45(val, _values, result) [](#method-i-_reduce_45)

## _reduce_46(val, _values, result) [](#method-i-_reduce_46)

## _reduce_47(val, _values, result) [](#method-i-_reduce_47)

## _reduce_48(val, _values, result) [](#method-i-_reduce_48)

## _reduce_49(val, _values, result) [](#method-i-_reduce_49)

## _reduce_5(val, _values, result) [](#method-i-_reduce_5)

## _reduce_50(val, _values, result) [](#method-i-_reduce_50)

## _reduce_51(val, _values, result) [](#method-i-_reduce_51)

## _reduce_52(val, _values, result) [](#method-i-_reduce_52)

## _reduce_54(val, _values, result) [](#method-i-_reduce_54)
reduce 53 omitted

## _reduce_55(val, _values, result) [](#method-i-_reduce_55)

## _reduce_57(val, _values, result) [](#method-i-_reduce_57)
reduce 56 omitted

## _reduce_6(val, _values, result) [](#method-i-_reduce_6)

## _reduce_62(val, _values, result) [](#method-i-_reduce_62)
reduce 61 omitted

## _reduce_63(val, _values, result) [](#method-i-_reduce_63)

## _reduce_64(val, _values, result) [](#method-i-_reduce_64)

## _reduce_65(val, _values, result) [](#method-i-_reduce_65)

## _reduce_66(val, _values, result) [](#method-i-_reduce_66)

## _reduce_67(val, _values, result) [](#method-i-_reduce_67)

## _reduce_68(val, _values, result) [](#method-i-_reduce_68)

## _reduce_69(val, _values, result) [](#method-i-_reduce_69)

## _reduce_71(val, _values, result) [](#method-i-_reduce_71)
reduce 70 omitted

## _reduce_72(val, _values, result) [](#method-i-_reduce_72)

## _reduce_8(val, _values, result) [](#method-i-_reduce_8)
reduce 7 omitted

## _reduce_9(val, _values, result) [](#method-i-_reduce_9)

## _reduce_none(val, _values, result) [](#method-i-_reduce_none)

## add_footnote(content) [](#method-i-add_footnote)
Adds footnote `content` to the document

## add_label(label) [](#method-i-add_label)
Adds label `label` to the document

## content(values) [](#method-i-content)
Retrieves the content of `values` as a single String

## initialize() [](#method-i-initialize)
Creates a new RDoc::RD::BlockParser.  Use #parse to parse an rd-format
document.

**@return** [BlockParser] a new instance of BlockParser

## line_index() [](#method-i-line_index)
Current line number

## next_token() [](#method-i-next_token)
Returns the next token from the document

## on_error(et, ev, _values) [](#method-i-on_error)
Raises a ParseError when invalid formatting is found

**@raise** [ParseError] 

## paragraph(value) [](#method-i-paragraph)
Creates a paragraph for `value`

## parse(src) [](#method-i-parse)
Parses `src` and returns an RDoc::Markup::Document.

