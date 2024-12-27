# Exception: Encoding::UndefinedConversionError
**Inherits:** EncodingError
    

Raised by Encoding and String methods when a transcoding operation fails.



#Instance Methods
## destination_encoding() [](#method-i-destination_encoding)
Returns the destination encoding as an encoding object.

**@overload** [] 

## destination_encoding_name() [](#method-i-destination_encoding_name)
Returns the destination encoding name as a string.

**@overload** [] 

## error_char() [](#method-i-error_char)
Returns the one-character string which cause
Encoding::UndefinedConversionError.

    ec = Encoding::Converter.new("ISO-8859-1", "EUC-JP")
    begin
      ec.convert("\xa0")
    rescue Encoding::UndefinedConversionError
      puts $!.error_char.dump   #=> "\xC2\xA0"
      p $!.error_char.encoding  #=> #<Encoding:UTF-8>
    end

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

