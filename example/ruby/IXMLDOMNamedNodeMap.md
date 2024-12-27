# Module: IXMLDOMNamedNodeMap
    
**Includes:** WIN32OLE::VARIANT
  



# Attributes
## lastargs[RW] [](#attribute-i-lastargs)
Returns the value of attribute lastargs.


#Instance Methods
## getNamedItem(arg0) [](#method-i-getNamedItem)
IXMLDOMNode getNamedItem lookup item by name
    BSTR arg0 --- name [IN]

## getQualifiedItem(arg0, arg1) [](#method-i-getQualifiedItem)
IXMLDOMNode getQualifiedItem lookup the item by name and namespace
    BSTR arg0 --- baseName [IN]
    BSTR arg1 --- namespaceURI [IN]

## item() [](#method-i-item)
PTR item collection of nodes
    I4 arg0 --- index [IN]

## length() [](#method-i-length)
I4 length number of nodes in the collection

## nextNode() [](#method-i-nextNode)
IXMLDOMNode nextNode get next node from iterator

## removeNamedItem(arg0) [](#method-i-removeNamedItem)
IXMLDOMNode removeNamedItem remove item by name
    BSTR arg0 --- name [IN]

## removeQualifiedItem(arg0, arg1) [](#method-i-removeQualifiedItem)
IXMLDOMNode removeQualifiedItem remove the item by name and namespace
    BSTR arg0 --- baseName [IN]
    BSTR arg1 --- namespaceURI [IN]

## reset() [](#method-i-reset)
VOID reset reset the position of iterator

## setNamedItem(arg0) [](#method-i-setNamedItem)
IXMLDOMNode setNamedItem set item by name
    IXMLDOMNode arg0 --- newItem [IN]

