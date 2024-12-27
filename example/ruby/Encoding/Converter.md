# Class: Encoding::Converter
**Inherits:** Object
    

Encoding conversion class.


# Class Methods
## asciicompat_encoding(arg ) [](#method-c-asciicompat_encoding)
Returns the corresponding ASCII compatible encoding.

Returns nil if the argument is an ASCII compatible encoding.

"corresponding ASCII compatible encoding" is an ASCII compatible encoding
which can represents exactly the same characters as the given ASCII
incompatible encoding. So, no conversion undefined error occurs when
converting between the two encodings.

    Encoding::Converter.asciicompat_encoding("ISO-2022-JP") #=> #<Encoding:stateless-ISO-2022-JP>
    Encoding::Converter.asciicompat_encoding("UTF-16BE") #=> #<Encoding:UTF-8>
    Encoding::Converter.asciicompat_encoding("UTF-8") #=> nil
**@overload** [] 

**@overload** [] 

## search_convpath(*args ) [](#method-c-search_convpath)
Returns a conversion path.

    p Encoding::Converter.search_convpath("ISO-8859-1", "EUC-JP")
    #=> [[#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>],
    #    [#<Encoding:UTF-8>, #<Encoding:EUC-JP>]]

    p Encoding::Converter.search_convpath("ISO-8859-1", "EUC-JP", universal_newline: true)
    or
    p Encoding::Converter.search_convpath("ISO-8859-1", "EUC-JP", newline: :universal)
    #=> [[#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>],
    #    [#<Encoding:UTF-8>, #<Encoding:EUC-JP>],
    #    "universal_newline"]

    p Encoding::Converter.search_convpath("ISO-8859-1", "UTF-32BE", universal_newline: true)
    or
    p Encoding::Converter.search_convpath("ISO-8859-1", "UTF-32BE", newline: :universal)
    #=> [[#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>],
    #    "universal_newline",
    #    [#<Encoding:UTF-8>, #<Encoding:UTF-32BE>]]
**@overload** [] 

**@overload** [] 


#Instance Methods
## ==(other) [](#method-i-==)

**@overload** [] 

## convert(source_string) [](#method-i-convert)
Convert source_string and return destination_string.

source_string is assumed as a part of source. i.e.  :partial_input=>true is
specified internally. finish method should be used last.

    ec = Encoding::Converter.new("utf-8", "euc-jp")
    puts ec.convert("\u3042").dump     #=> "\xA4\xA2"
    puts ec.finish.dump                #=> ""

    ec = Encoding::Converter.new("euc-jp", "utf-8")
    puts ec.convert("\xA4").dump       #=> ""
    puts ec.convert("\xA2").dump       #=> "\xE3\x81\x82"
    puts ec.finish.dump                #=> ""

    ec = Encoding::Converter.new("utf-8", "iso-2022-jp")
    puts ec.convert("\xE3").dump       #=> "".force_encoding("ISO-2022-JP")
    puts ec.convert("\x81").dump       #=> "".force_encoding("ISO-2022-JP")
    puts ec.convert("\x82").dump       #=> "\e$B$\"".force_encoding("ISO-2022-JP")
    puts ec.finish.dump                #=> "\e(B".force_encoding("ISO-2022-JP")

If a conversion error occur, Encoding::UndefinedConversionError or
Encoding::InvalidByteSequenceError is raised. Encoding::Converter#convert
doesn't supply methods to recover or restart from these exceptions. When you
want to handle these conversion errors, use
Encoding::Converter#primitive_convert.

**@overload** [] 

## convpath() [](#method-i-convpath)
Returns the conversion path of ec.

The result is an array of conversions.

    ec = Encoding::Converter.new("ISO-8859-1", "EUC-JP", crlf_newline: true)
    p ec.convpath
    #=> [[#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>],
    #    [#<Encoding:UTF-8>, #<Encoding:EUC-JP>],
    #    "crlf_newline"]

Each element of the array is a pair of encodings or a string. A pair means an
encoding conversion. A string means a decorator.

In the above example, [#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>] means a
converter from ISO-8859-1 to UTF-8. "crlf_newline" means newline converter
from LF to CRLF.

**@overload** [] 

## destination_encoding() [](#method-i-destination_encoding)
Returns the destination encoding as an Encoding object.

**@overload** [] 

## finish() [](#method-i-finish)
Finishes the converter. It returns the last part of the converted string.

    ec = Encoding::Converter.new("utf-8", "iso-2022-jp")
    p ec.convert("\u3042")     #=> "\e$B$\""
    p ec.finish                #=> "\e(B"

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
possible options elements:
    hash form:
      :invalid => nil            # raise error on invalid byte sequence (default)
      :invalid => :replace       # replace invalid byte sequence
      :undef => nil              # raise error on undefined conversion (default)
      :undef => :replace         # replace undefined conversion
      :replace => string         # replacement string ("?" or "\uFFFD" if not specified)
      :newline => :universal     # decorator for converting CRLF and CR to LF
      :newline => :lf            # decorator for converting CRLF and CR to LF when writing
      :newline => :crlf          # decorator for converting LF to CRLF
      :newline => :cr            # decorator for converting LF to CR
      :universal_newline => true # decorator for converting CRLF and CR to LF
      :crlf_newline => true      # decorator for converting LF to CRLF
      :cr_newline => true        # decorator for converting LF to CR
      :lf_newline => true        # decorator for converting CRLF and CR to LF when writing
      :xml => :text              # escape as XML CharData.
      :xml => :attr              # escape as XML AttValue
    integer form:
      Encoding::Converter::INVALID_REPLACE
      Encoding::Converter::UNDEF_REPLACE
      Encoding::Converter::UNDEF_HEX_CHARREF
      Encoding::Converter::UNIVERSAL_NEWLINE_DECORATOR
      Encoding::Converter::LF_NEWLINE_DECORATOR
      Encoding::Converter::CRLF_NEWLINE_DECORATOR
      Encoding::Converter::CR_NEWLINE_DECORATOR
      Encoding::Converter::XML_TEXT_DECORATOR
      Encoding::Converter::XML_ATTR_CONTENT_DECORATOR
      Encoding::Converter::XML_ATTR_QUOTE_DECORATOR

Encoding::Converter.new creates an instance of Encoding::Converter.

Source_encoding and destination_encoding should be a string or Encoding
object.

opt should be nil, a hash or an integer.

convpath should be an array. convpath may contain
*   two-element arrays which contain encodings or encoding names, or
*   strings representing decorator names.

Encoding::Converter.new optionally takes an option. The option should be a
hash or an integer. The option hash can contain :invalid => nil, etc. The
option integer should be logical-or of constants such as
Encoding::Converter::INVALID_REPLACE, etc.

:invalid => nil
:   Raise error on invalid byte sequence.  This is a default behavior.

:invalid => :replace
:   Replace invalid byte sequence by replacement string.

:undef => nil
:   Raise an error if a character in source_encoding is not defined in
    destination_encoding. This is a default behavior.

:undef => :replace
:   Replace undefined character in destination_encoding with replacement
    string.

:replace => string
:   Specify the replacement string. If not specified, "uFFFD" is used for
    Unicode encodings and "?" for others.

:universal_newline => true
:   Convert CRLF and CR to LF.

:crlf_newline => true
:   Convert LF to CRLF.

:cr_newline => true
:   Convert LF to CR.

:lf_newline => true
:   Convert CRLF and CR to LF (when writing).

:xml => :text
:   Escape as XML CharData. This form can be used as an HTML 4.0 #PCDATA.
    *   '&' -> '&amp;'
    *   '<' -> '&lt;'
    *   '>' -> '&gt;'
    *   undefined characters in destination_encoding -> hexadecimal CharRef
        such as &#xHH;

:xml => :attr
:   Escape as XML AttValue. The converted result is quoted as "...". This form
    can be used as an HTML 4.0 attribute value.
    *   '&' -> '&amp;'
    *   '<' -> '&lt;'
    *   '>' -> '&gt;'
    *   '"' -> '&quot;'
    *   undefined characters in destination_encoding -> hexadecimal CharRef
        such as &#xHH;


Examples:
    # UTF-16BE to UTF-8
    ec = Encoding::Converter.new("UTF-16BE", "UTF-8")

    # Usually, decorators such as newline conversion are inserted last.
    ec = Encoding::Converter.new("UTF-16BE", "UTF-8", :universal_newline => true)
    p ec.convpath #=> [[#<Encoding:UTF-16BE>, #<Encoding:UTF-8>],
                  #    "universal_newline"]

    # But, if the last encoding is ASCII incompatible,
    # decorators are inserted before the last conversion.
    ec = Encoding::Converter.new("UTF-8", "UTF-16BE", :crlf_newline => true)
    p ec.convpath #=> ["crlf_newline",
                  #    [#<Encoding:UTF-8>, #<Encoding:UTF-16BE>]]

    # Conversion path can be specified directly.
    ec = Encoding::Converter.new(["universal_newline", ["EUC-JP", "UTF-8"], ["UTF-8", "UTF-16BE"]])
    p ec.convpath #=> ["universal_newline",
                  #    [#<Encoding:EUC-JP>, #<Encoding:UTF-8>],
                  #    [#<Encoding:UTF-8>, #<Encoding:UTF-16BE>]]

**@overload** [] 

**@overload** [] 

**@overload** [] 

## insert_output(string) [](#method-i-insert_output)
Inserts string into the encoding converter. The string will be converted to
the destination encoding and output on later conversions.

If the destination encoding is stateful, string is converted according to the
state and the state is updated.

This method should be used only when a conversion error occurs.

    ec = Encoding::Converter.new("utf-8", "iso-8859-1")
    src = "HIRAGANA LETTER A is \u{3042}."
    dst = ""
    p ec.primitive_convert(src, dst)    #=> :undefined_conversion
    puts "[#{dst.dump}, #{src.dump}]"   #=> ["HIRAGANA LETTER A is ", "."]
    ec.insert_output("<err>")
    p ec.primitive_convert(src, dst)    #=> :finished
    puts "[#{dst.dump}, #{src.dump}]"   #=> ["HIRAGANA LETTER A is <err>.", ""]

    ec = Encoding::Converter.new("utf-8", "iso-2022-jp")
    src = "\u{306F 3041 3068 2661 3002}" # U+2661 is not representable in iso-2022-jp
    dst = ""
    p ec.primitive_convert(src, dst)    #=> :undefined_conversion
    puts "[#{dst.dump}, #{src.dump}]"   #=> ["\e$B$O$!$H".force_encoding("ISO-2022-JP"), "\xE3\x80\x82"]
    ec.insert_output "?"                # state change required to output "?".
    p ec.primitive_convert(src, dst)    #=> :finished
    puts "[#{dst.dump}, #{src.dump}]"   #=> ["\e$B$O$!$H\e(B?\e$B!#\e(B".force_encoding("ISO-2022-JP"), ""]

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a printable version of *ec*

    ec = Encoding::Converter.new("iso-8859-1", "utf-8")
    puts ec.inspect    #=> #<Encoding::Converter: ISO-8859-1 to UTF-8>

**@overload** [] 

## last_error() [](#method-i-last_error)
Returns an exception object for the last conversion. Returns nil if the last
conversion did not produce an error.

"error" means that Encoding::InvalidByteSequenceError and
Encoding::UndefinedConversionError for Encoding::Converter#convert and
:invalid_byte_sequence, :incomplete_input and :undefined_conversion for
Encoding::Converter#primitive_convert.

    ec = Encoding::Converter.new("utf-8", "iso-8859-1")
    p ec.primitive_convert(src="\xf1abcd", dst="")       #=> :invalid_byte_sequence
    p ec.last_error      #=> #<Encoding::InvalidByteSequenceError: "\xF1" followed by "a" on UTF-8>
    p ec.primitive_convert(src, dst, nil, 1)             #=> :destination_buffer_full
    p ec.last_error      #=> nil

**@overload** [] 

## primitive_convert(*args) [](#method-i-primitive_convert)
possible opt elements:
    hash form:
      :partial_input => true           # source buffer may be part of larger source
      :after_output => true            # stop conversion after output before input
    integer form:
      Encoding::Converter::PARTIAL_INPUT
      Encoding::Converter::AFTER_OUTPUT

possible results:
    :invalid_byte_sequence
    :incomplete_input
    :undefined_conversion
    :after_output
    :destination_buffer_full
    :source_buffer_empty
    :finished

primitive_convert converts source_buffer into destination_buffer.

source_buffer should be a string or nil. nil means an empty string.

destination_buffer should be a string.

destination_byteoffset should be an integer or nil. nil means the end of
destination_buffer. If it is omitted, nil is assumed.

destination_bytesize should be an integer or nil. nil means unlimited. If it
is omitted, nil is assumed.

opt should be nil, a hash or an integer. nil means no flags. If it is omitted,
nil is assumed.

primitive_convert converts the content of source_buffer from beginning and
store the result into destination_buffer.

destination_byteoffset and destination_bytesize specify the region which the
converted result is stored. destination_byteoffset specifies the start
position in destination_buffer in bytes. If destination_byteoffset is nil,
destination_buffer.bytesize is used for appending the result.
destination_bytesize specifies maximum number of bytes. If
destination_bytesize is nil, destination size is unlimited. After conversion,
destination_buffer is resized to destination_byteoffset + actually produced
number of bytes. Also destination_buffer's encoding is set to
destination_encoding.

primitive_convert drops the converted part of source_buffer. the dropped part
is converted in destination_buffer or buffered in Encoding::Converter object.

primitive_convert stops conversion when one of following condition met.
*   invalid byte sequence found in source buffer (:invalid_byte_sequence)
    `primitive_errinfo` and `last_error` methods returns the detail of the
    error.
*   unexpected end of source buffer (:incomplete_input) this occur only when
    :partial_input is not specified. `primitive_errinfo` and `last_error`
    methods returns the detail of the error.
*   character not representable in output encoding (:undefined_conversion)
    `primitive_errinfo` and `last_error` methods returns the detail of the
    error.
*   after some output is generated, before input is done (:after_output) this
    occur only when :after_output is specified.
*   destination buffer is full (:destination_buffer_full) this occur only when
    destination_bytesize is non-nil.
*   source buffer is empty (:source_buffer_empty) this occur only when
    :partial_input is specified.
*   conversion is finished (:finished)

example:
    ec = Encoding::Converter.new("UTF-8", "UTF-16BE")
    ret = ec.primitive_convert(src="pi", dst="", nil, 100)
    p [ret, src, dst] #=> [:finished, "", "\x00p\x00i"]

    ec = Encoding::Converter.new("UTF-8", "UTF-16BE")
    ret = ec.primitive_convert(src="pi", dst="", nil, 1)
    p [ret, src, dst] #=> [:destination_buffer_full, "i", "\x00"]
    ret = ec.primitive_convert(src, dst="", nil, 1)
    p [ret, src, dst] #=> [:destination_buffer_full, "", "p"]
    ret = ec.primitive_convert(src, dst="", nil, 1)
    p [ret, src, dst] #=> [:destination_buffer_full, "", "\x00"]
    ret = ec.primitive_convert(src, dst="", nil, 1)
    p [ret, src, dst] #=> [:finished, "", "i"]

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## primitive_errinfo() [](#method-i-primitive_errinfo)
primitive_errinfo returns important information regarding the last error as a
5-element array:

    [result, enc1, enc2, error_bytes, readagain_bytes]

result is the last result of primitive_convert.

Other elements are only meaningful when result is :invalid_byte_sequence,
:incomplete_input or :undefined_conversion.

enc1 and enc2 indicate a conversion step as a pair of strings. For example, a
converter from EUC-JP to ISO-8859-1 converts a string as follows: EUC-JP ->
UTF-8 -> ISO-8859-1. So [enc1, enc2] is either ["EUC-JP", "UTF-8"] or
["UTF-8", "ISO-8859-1"].

error_bytes and readagain_bytes indicate the byte sequences which caused the
error. error_bytes is discarded portion. readagain_bytes is buffered portion
which is read again on next conversion.

Example:

    # \xff is invalid as EUC-JP.
    ec = Encoding::Converter.new("EUC-JP", "Shift_JIS")
    ec.primitive_convert(src="\xff", dst="", nil, 10)
    p ec.primitive_errinfo
    #=> [:invalid_byte_sequence, "EUC-JP", "Shift_JIS", "\xFF", ""]

    # HIRAGANA LETTER A (\xa4\xa2 in EUC-JP) is not representable in ISO-8859-1.
    # Since this error is occur in UTF-8 to ISO-8859-1 conversion,
    # error_bytes is HIRAGANA LETTER A in UTF-8 (\xE3\x81\x82).
    ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
    ec.primitive_convert(src="\xa4\xa2", dst="", nil, 10)
    p ec.primitive_errinfo
    #=> [:undefined_conversion, "UTF-8", "ISO-8859-1", "\xE3\x81\x82", ""]

    # partial character is invalid
    ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
    ec.primitive_convert(src="\xa4", dst="", nil, 10)
    p ec.primitive_errinfo
    #=> [:incomplete_input, "EUC-JP", "UTF-8", "\xA4", ""]

    # Encoding::Converter::PARTIAL_INPUT prevents invalid errors by
    # partial characters.
    ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
    ec.primitive_convert(src="\xa4", dst="", nil, 10, Encoding::Converter::PARTIAL_INPUT)
    p ec.primitive_errinfo
    #=> [:source_buffer_empty, nil, nil, nil, nil]

    # \xd8\x00\x00@ is invalid as UTF-16BE because
    # no low surrogate after high surrogate (\xd8\x00).
    # It is detected by 3rd byte (\00) which is part of next character.
    # So the high surrogate (\xd8\x00) is discarded and
    # the 3rd byte is read again later.
    # Since the byte is buffered in ec, it is dropped from src.
    ec = Encoding::Converter.new("UTF-16BE", "UTF-8")
    ec.primitive_convert(src="\xd8\x00\x00@", dst="", nil, 10)
    p ec.primitive_errinfo
    #=> [:invalid_byte_sequence, "UTF-16BE", "UTF-8", "\xD8\x00", "\x00"]
    p src
    #=> "@"

    # Similar to UTF-16BE, \x00\xd8@\x00 is invalid as UTF-16LE.
    # The problem is detected by 4th byte.
    ec = Encoding::Converter.new("UTF-16LE", "UTF-8")
    ec.primitive_convert(src="\x00\xd8@\x00", dst="", nil, 10)
    p ec.primitive_errinfo
    #=> [:invalid_byte_sequence, "UTF-16LE", "UTF-8", "\x00\xD8", "@\x00"]
    p src
    #=> ""

**@overload** [] 

## putback(*args) [](#method-i-putback)
Put back the bytes which will be converted.

The bytes are caused by invalid_byte_sequence error. When
invalid_byte_sequence error, some bytes are discarded and some bytes are
buffered to be converted later. The latter bytes can be put back. It can be
observed by Encoding::InvalidByteSequenceError#readagain_bytes and
Encoding::Converter#primitive_errinfo.

    ec = Encoding::Converter.new("utf-16le", "iso-8859-1")
    src = "\x00\xd8\x61\x00"
    dst = ""
    p ec.primitive_convert(src, dst)   #=> :invalid_byte_sequence
    p ec.primitive_errinfo     #=> [:invalid_byte_sequence, "UTF-16LE", "UTF-8", "\x00\xD8", "a\x00"]
    p ec.putback               #=> "a\x00"
    p ec.putback               #=> ""          # no more bytes to put back

**@overload** [] 

**@overload** [] 

## replacement() [](#method-i-replacement)
Returns the replacement string.

    ec = Encoding::Converter.new("euc-jp", "us-ascii")
    p ec.replacement    #=> "?"

    ec = Encoding::Converter.new("euc-jp", "utf-8")
    p ec.replacement    #=> "\uFFFD"

**@overload** [] 

## replacement=(arg) [](#method-i-replacement=)
Sets the replacement string.

    ec = Encoding::Converter.new("utf-8", "us-ascii", :undef => :replace)
    ec.replacement = "<undef>"
    p ec.convert("a \u3042 b")      #=> "a <undef> b"

**@overload** [] 

## source_encoding() [](#method-i-source_encoding)
Returns the source encoding as an Encoding object.

**@overload** [] 

