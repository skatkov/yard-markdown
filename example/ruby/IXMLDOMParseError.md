# Module: IXMLDOMParseError
    
**Includes:** WIN32OLE::VARIANT
  

structure for reporting parser errors


# Attributes
## lastargs[RW] [](#attribute-i-lastargs)
Returns the value of attribute lastargs.


#Instance Methods
## errorCode() [](#method-i-errorCode)
I4 errorCode the error code

## filepos() [](#method-i-filepos)
I4 filepos the absolute file position in the XML document containing the error

## line() [](#method-i-line)
I4 line the line number in the XML document where the error occurred

## linepos() [](#method-i-linepos)
I4 linepos the character position in the line containing the error

## reason() [](#method-i-reason)
BSTR reason the cause of the error

## srcText() [](#method-i-srcText)
BSTR srcText the data where the error occurred

## url() [](#method-i-url)
BSTR url the URL of the XML document containing the error

