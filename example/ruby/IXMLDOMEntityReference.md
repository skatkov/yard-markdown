# Module: IXMLDOMEntityReference
    
**Includes:** WIN32OLE::VARIANT
  



# Attributes
## lastargs[RW] [](#attribute-i-lastargs)
Returns the value of attribute lastargs.


#Instance Methods
## appendChild(arg0) [](#method-i-appendChild)
IXMLDOMNode appendChild append a child node
    IXMLDOMNode arg0 --- newChild [IN]

## attributes() [](#method-i-attributes)
IXMLDOMNamedNodeMap attributes the collection of the node's attributes

## baseName() [](#method-i-baseName)
BSTR baseName the base name of the node (nodename with the prefix stripped
off)

## childNodes() [](#method-i-childNodes)
IXMLDOMNodeList childNodes the collection of the node's children

## cloneNode(arg0) [](#method-i-cloneNode)
IXMLDOMNode cloneNode
    BOOL arg0 --- deep [IN]

## dataType() [](#method-i-dataType)
VARIANT dataType the data type of the node

## dataType=(arg0) [](#method-i-dataType=)
VOID dataType the data type of the node

## definition() [](#method-i-definition)
IXMLDOMNode definition pointer to the definition of the node in the DTD or
schema

## firstChild() [](#method-i-firstChild)
IXMLDOMNode firstChild first child of the node

## hasChildNodes() [](#method-i-hasChildNodes)
BOOL hasChildNodes

## insertBefore(arg0, arg1) [](#method-i-insertBefore)
IXMLDOMNode insertBefore insert a child node
    IXMLDOMNode arg0 --- newChild [IN]
    VARIANT arg1 --- refChild [IN]

## lastChild() [](#method-i-lastChild)
IXMLDOMNode lastChild first child of the node

## namespaceURI() [](#method-i-namespaceURI)
BSTR namespaceURI the URI for the namespace applying to the node

## nextSibling() [](#method-i-nextSibling)
IXMLDOMNode nextSibling right sibling of the node

## nodeName() [](#method-i-nodeName)
BSTR nodeName name of the node

## nodeType() [](#method-i-nodeType)
DOMNodeType nodeType the node's type

## nodeTypeString() [](#method-i-nodeTypeString)
BSTR nodeTypeString the type of node in string form

## nodeTypedValue() [](#method-i-nodeTypedValue)
VARIANT nodeTypedValue get the strongly typed value of the node

## nodeTypedValue=(arg0) [](#method-i-nodeTypedValue=)
VOID nodeTypedValue get the strongly typed value of the node

## nodeValue() [](#method-i-nodeValue)
VARIANT nodeValue value stored in the node

## nodeValue=(arg0) [](#method-i-nodeValue=)
VOID nodeValue value stored in the node

## ownerDocument() [](#method-i-ownerDocument)
IXMLDOMDocument ownerDocument document that contains the node

## parentNode() [](#method-i-parentNode)
IXMLDOMNode parentNode parent of the node

## parsed() [](#method-i-parsed)
BOOL parsed has sub-tree been completely parsed

## prefix() [](#method-i-prefix)
BSTR prefix the prefix for the namespace applying to the node

## previousSibling() [](#method-i-previousSibling)
IXMLDOMNode previousSibling left sibling of the node

## removeChild(arg0) [](#method-i-removeChild)
IXMLDOMNode removeChild remove a child node
    IXMLDOMNode arg0 --- childNode [IN]

## replaceChild(arg0, arg1) [](#method-i-replaceChild)
IXMLDOMNode replaceChild replace a child node
    IXMLDOMNode arg0 --- newChild [IN]
    IXMLDOMNode arg1 --- oldChild [IN]

## selectNodes(arg0) [](#method-i-selectNodes)
IXMLDOMNodeList selectNodes execute query on the subtree
    BSTR arg0 --- queryString [IN]

## selectSingleNode(arg0) [](#method-i-selectSingleNode)
IXMLDOMNode selectSingleNode execute query on the subtree
    BSTR arg0 --- queryString [IN]

## specified() [](#method-i-specified)
BOOL specified indicates whether node is a default value

## text() [](#method-i-text)
BSTR text text content of the node and subtree

## text=(arg0) [](#method-i-text=)
VOID text text content of the node and subtree

## transformNode(arg0) [](#method-i-transformNode)
BSTR transformNode apply the stylesheet to the subtree
    IXMLDOMNode arg0 --- stylesheet [IN]

## transformNodeToObject(arg0, arg1) [](#method-i-transformNodeToObject)
VOID transformNodeToObject apply the stylesheet to the subtree, returning the
result through a document or a stream
    IXMLDOMNode arg0 --- stylesheet [IN]
    VARIANT arg1 --- outputObject [IN]

## xml() [](#method-i-xml)
BSTR xml return the XML source for the node and each of its descendants

