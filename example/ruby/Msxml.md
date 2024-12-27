# Class: Msxml
**Inherits:** Object
    
**Includes:** WIN32OLE::VARIANT
  

XMLDocument extends IXML Document.  It is obsolete.  You should use
DOMDocument.  This object should not be confused with the XMLDocument property
on the XML data island.


# Attributes
## clsid[RW] [](#attribute-i-clsid)
Returns the value of attribute clsid.

## dispatch[RW] [](#attribute-i-dispatch)
Returns the value of attribute dispatch.

## lastargs[RW] [](#attribute-i-lastargs)
Returns the value of attribute lastargs.

## progid[RW] [](#attribute-i-progid)
Returns the value of attribute progid.


#Instance Methods
## async() [](#method-i-async)
HRESULT async get asynchronous loading flag.
    BOOL arg0 --- pf [OUT]

## async=(arg0) [](#method-i-async=)
HRESULT async get asynchronous loading flag.
    BOOL arg0 --- pf [IN]

## charset() [](#method-i-charset)
HRESULT charset get encoding.
    BSTR arg0 --- p [OUT]

## charset=(arg0) [](#method-i-charset=)
HRESULT charset get encoding.
    BSTR arg0 --- p [IN]

## createElement(arg0, arg1nil, arg2nil) [](#method-i-createElement)
HRESULT createElement create different types of IXMLElements.
    VARIANT arg0 --- vType [IN]
    VARIANT arg1 --- var1 [IN]
    IXMLElement2,IXMLElement2 arg2 --- ppElem [OUT]

## doctype() [](#method-i-doctype)
HRESULT doctype get document type.
    BSTR arg0 --- p [OUT]

## initialize(objnil) [](#method-i-initialize)

**@return** [Msxml] a new instance of Msxml

## method_missing(cmd, *arg) [](#method-i-method_missing)

## readyState() [](#method-i-readyState)
HRESULT readyState get ready state.
    I4 arg0 --- pl [OUT]

## root() [](#method-i-root)
HRESULT root get root IXMLElement of the XML document.
    IXMLElement2,IXMLElement2 arg0 --- p [OUT]

## url() [](#method-i-url)
HRESULT url set URL to load an XML document from the URL.
    BSTR arg0 --- p [OUT]

## url=(arg0) [](#method-i-url=)
HRESULT url set URL to load an XML document from the URL.
    BSTR arg0 --- p [IN]

## version() [](#method-i-version)
HRESULT version get XML version number.
    BSTR arg0 --- p [OUT]

