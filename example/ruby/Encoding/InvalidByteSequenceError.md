# Exception: Encoding::InvalidByteSequenceError
**Inherits:** EncodingError
    

Raised by Encoding and String methods when the string being transcoded
contains a byte invalid for the either the source or target encoding.



#Instance Methods
## destination_encoding() [](#method-i-destination_encoding)
Returns the destination encoding as an encoding object.

**@overload** [] 

## destination_encoding_name() [](#method-i-destination_encoding_name)
Returns the destination encoding name as a string.

**@overload** [] 

## error_bytes() [](#method-i-error_bytes)
Returns the discarded bytes when Encoding::InvalidByteSequenceError occurs.

    ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
    begin
      ec.convert("abc\xA1\xFFdef")
    rescue Encoding::InvalidByteSequenceError
      p $!      #=> #<Encoding::InvalidByteSequenceError: "\xA1" followed by "\xFF" on EUC-JP>
      puts $!.error_bytes.dump          #=> "\xA1"
      puts $!.readagain_bytes.dump      #=> "\xFF"
    end

**@overload** [] 

## incomplete_input?() [](#method-i-incomplete_input?)
Returns true if the invalid byte sequence error is caused by premature end of
string.

    ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")

    begin
      ec.convert("abc\xA1z")
    rescue Encoding::InvalidByteSequenceError
      p $!      #=> #<Encoding::InvalidByteSequenceError: "\xA1" followed by "z" on EUC-JP>
      p $!.incomplete_input?    #=> false
    end

    begin
      ec.convert("abc\xA1")
      ec.finish
    rescue Encoding::InvalidByteSequenceError
      p $!      #=> #<Encoding::InvalidByteSequenceError: incomplete "\xA1" on EUC-JP>
      p $!.incomplete_input?    #=> true
    end

**@overload** [] 

## readagain_bytes() [](#method-i-readagain_bytes)
Returns the bytes to be read again when Encoding::InvalidByteSequenceError
occurs.

**@overload** [] 

## source_encoding() [](#method-i-source_encoding)
Returns the source encoding as an encoding object.

Note that the result may not be equal to the source encoding of the encoding
converter if the conversion has multiple steps.

    ec = Encoding::Converter.new("ISO-8859-1", "EUC-JP") # ISO-8859-1 -> UTF-8 -> EUC-JP
    begin
      ec.convert("\xa0") # NO-BREAK SPACE, which is available in UTF-8 but not in EUC-JP.
    rescue Encoding::UndefinedConversionError
      p $!.source_encoding              #=> #<Encoding:UTF-8>
      p $!.destination_encoding         #=> #<Encoding:EUC-JP>
      p $!.source_encoding_name         #=> "UTF-8"
      p $!.destination_encoding_name    #=> "EUC-JP"
    end

**@overload** [] 

## source_encoding_name() [](#method-i-source_encoding_name)
Returns the source encoding name as a string.

**@overload** [] 

