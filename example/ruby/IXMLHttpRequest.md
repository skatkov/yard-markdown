# Module: IXMLHttpRequest
    
**Includes:** WIN32OLE::VARIANT
  

IXMLHttpRequest Interface


# Attributes
## lastargs[RW] [](#attribute-i-lastargs)
Returns the value of attribute lastargs.


#Instance Methods
## abort() [](#method-i-abort)
VOID abort Abort HTTP request

## getAllResponseHeaders() [](#method-i-getAllResponseHeaders)
BSTR getAllResponseHeaders Get all HTTP response headers

## getResponseHeader(arg0) [](#method-i-getResponseHeader)
BSTR getResponseHeader Get HTTP response header
    BSTR arg0 --- bstrHeader [IN]

## onreadystatechange=(arg0) [](#method-i-onreadystatechange=)
VOID onreadystatechange Register a complete event handler

## open(arg0, arg1, arg2nil, arg3nil, arg4nil) [](#method-i-open)
VOID open Open HTTP connection
    BSTR arg0 --- bstrMethod [IN]
    BSTR arg1 --- bstrUrl [IN]
    VARIANT arg2 --- varAsync [IN]
    VARIANT arg3 --- bstrUser [IN]
    VARIANT arg4 --- bstrPassword [IN]

## readyState() [](#method-i-readyState)
I4 readyState Get ready state

## responseBody() [](#method-i-responseBody)
VARIANT responseBody Get response body

## responseStream() [](#method-i-responseStream)
VARIANT responseStream Get response body

## responseText() [](#method-i-responseText)
BSTR responseText Get response body

## responseXML() [](#method-i-responseXML)
DISPATCH responseXML Get response body

## send(arg0nil) [](#method-i-send)
VOID send Send HTTP request
    VARIANT arg0 --- varBody [IN]

## setRequestHeader(arg0, arg1) [](#method-i-setRequestHeader)
VOID setRequestHeader Add HTTP request header
    BSTR arg0 --- bstrHeader [IN]
    BSTR arg1 --- bstrValue [IN]

## status() [](#method-i-status)
I4 status Get HTTP status code

## statusText() [](#method-i-statusText)
BSTR statusText Get HTTP status text

