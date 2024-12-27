# Class: Microsoft_FreeThreadedXMLDOM_1_0
**Inherits:** Object
    
**Includes:** WIN32OLE::VARIANT
  

W3C-DOM XML Document (Apartment)


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
## abort() [](#method-i-abort)
VOID abort abort an asynchronous download

## appendChild(arg0) [](#method-i-appendChild)
IXMLDOMNode appendChild append a child node
    IXMLDOMNode arg0 --- newChild [IN]

## async() [](#method-i-async)
BOOL async flag for asynchronous download

## async=(arg0) [](#method-i-async=)
VOID async flag for asynchronous download

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

## createAttribute(arg0) [](#method-i-createAttribute)
IXMLDOMAttribute createAttribute create an attribute node
    BSTR arg0 --- name [IN]

## createCDATASection(arg0) [](#method-i-createCDATASection)
IXMLDOMCDATASection createCDATASection create a CDATA section node
    BSTR arg0 --- data [IN]

## createComment(arg0) [](#method-i-createComment)
IXMLDOMComment createComment create a comment node
    BSTR arg0 --- data [IN]

## createDocumentFragment() [](#method-i-createDocumentFragment)
IXMLDOMDocumentFragment createDocumentFragment create a DocumentFragment node

## createElement(arg0) [](#method-i-createElement)
IXMLDOMElement createElement create an Element node
    BSTR arg0 --- tagName [IN]

## createEntityReference(arg0) [](#method-i-createEntityReference)
IXMLDOMEntityReference createEntityReference create an entity reference node
    BSTR arg0 --- name [IN]

## createNode(arg0, arg1, arg2) [](#method-i-createNode)
IXMLDOMNode createNode create a node of the specified node type and name
    VARIANT arg0 --- type [IN]
    BSTR arg1 --- name [IN]
    BSTR arg2 --- namespaceURI [IN]

## createProcessingInstruction(arg0, arg1) [](#method-i-createProcessingInstruction)
IXMLDOMProcessingInstruction createProcessingInstruction create a processing
instruction node
    BSTR arg0 --- target [IN]
    BSTR arg1 --- data [IN]

## createTextNode(arg0) [](#method-i-createTextNode)
IXMLDOMText createTextNode create a text node
    BSTR arg0 --- data [IN]

## dataType() [](#method-i-dataType)
VARIANT dataType the data type of the node

## dataType=(arg0) [](#method-i-dataType=)
VOID dataType the data type of the node

## definition() [](#method-i-definition)
IXMLDOMNode definition pointer to the definition of the node in the DTD or
schema

## doctype() [](#method-i-doctype)
IXMLDOMDocumentType doctype node corresponding to the DOCTYPE

## documentElement() [](#method-i-documentElement)
IXMLDOMElement documentElement the root of the tree

## firstChild() [](#method-i-firstChild)
IXMLDOMNode firstChild first child of the node

## getElementsByTagName(arg0) [](#method-i-getElementsByTagName)
IXMLDOMNodeList getElementsByTagName build a list of elements by name
    BSTR arg0 --- tagName [IN]

## hasChildNodes() [](#method-i-hasChildNodes)
BOOL hasChildNodes

## implementation() [](#method-i-implementation)
IXMLDOMImplementation implementation info on this DOM implementation

## initialize(objnil) [](#method-i-initialize)

**@return** [Microsoft_FreeThreadedXMLDOM_1_0] a new instance of Microsoft_FreeThreadedXMLDOM_1_0

## insertBefore(arg0, arg1) [](#method-i-insertBefore)
IXMLDOMNode insertBefore insert a child node
    IXMLDOMNode arg0 --- newChild [IN]
    VARIANT arg1 --- refChild [IN]

## lastChild() [](#method-i-lastChild)
IXMLDOMNode lastChild first child of the node

## load(arg0) [](#method-i-load)
BOOL load load document from the specified XML source
    VARIANT arg0 --- xmlSource [IN]

## loadXML(arg0) [](#method-i-loadXML)
BOOL loadXML load the document from a string
    BSTR arg0 --- bstrXML [IN]

## method_missing(cmd, *arg) [](#method-i-method_missing)

## namespaceURI() [](#method-i-namespaceURI)
BSTR namespaceURI the URI for the namespace applying to the node

## nextSibling() [](#method-i-nextSibling)
IXMLDOMNode nextSibling right sibling of the node

## nodeFromID(arg0) [](#method-i-nodeFromID)
IXMLDOMNode nodeFromID retrieve node from it's ID
    BSTR arg0 --- idString [IN]

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

## ondataavailable() [](#method-i-ondataavailable)
HRESULT ondataavailable EVENT in XMLDOMDocumentEvents

## ondataavailable=(arg0) [](#method-i-ondataavailable=)
VOID ondataavailable register an ondataavailable event handler

## onreadystatechange() [](#method-i-onreadystatechange)
HRESULT onreadystatechange EVENT in XMLDOMDocumentEvents

## onreadystatechange=(arg0) [](#method-i-onreadystatechange=)
VOID onreadystatechange register a readystatechange event handler

## ontransformnode=(arg0) [](#method-i-ontransformnode=)
VOID ontransformnode register an ontransformnode event handler

## ownerDocument() [](#method-i-ownerDocument)
IXMLDOMDocument ownerDocument document that contains the node

## parentNode() [](#method-i-parentNode)
IXMLDOMNode parentNode parent of the node

## parseError() [](#method-i-parseError)
IXMLDOMParseError parseError get the last parser error

## parsed() [](#method-i-parsed)
BOOL parsed has sub-tree been completely parsed

## prefix() [](#method-i-prefix)
BSTR prefix the prefix for the namespace applying to the node

## preserveWhiteSpace() [](#method-i-preserveWhiteSpace)
BOOL preserveWhiteSpace indicates whether the parser preserves whitespace

## preserveWhiteSpace=(arg0) [](#method-i-preserveWhiteSpace=)
VOID preserveWhiteSpace indicates whether the parser preserves whitespace

## previousSibling() [](#method-i-previousSibling)
IXMLDOMNode previousSibling left sibling of the node

## readyState() [](#method-i-readyState)
I4 readyState get the state of the XML document

## removeChild(arg0) [](#method-i-removeChild)
IXMLDOMNode removeChild remove a child node
    IXMLDOMNode arg0 --- childNode [IN]

## replaceChild(arg0, arg1) [](#method-i-replaceChild)
IXMLDOMNode replaceChild replace a child node
    IXMLDOMNode arg0 --- newChild [IN]
    IXMLDOMNode arg1 --- oldChild [IN]

## resolveExternals() [](#method-i-resolveExternals)
BOOL resolveExternals indicates whether the parser resolves references to
external DTD/Entities/Schema

## resolveExternals=(arg0) [](#method-i-resolveExternals=)
VOID resolveExternals indicates whether the parser resolves references to
external DTD/Entities/Schema

## save(arg0) [](#method-i-save)
VOID save save the document to a specified destination
    VARIANT arg0 --- destination [IN]

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

## url() [](#method-i-url)
BSTR url get the URL for the loaded XML document

## validateOnParse() [](#method-i-validateOnParse)
BOOL validateOnParse indicates whether the parser performs validation

## validateOnParse=(arg0) [](#method-i-validateOnParse=)
VOID validateOnParse indicates whether the parser performs validation

## xml() [](#method-i-xml)
BSTR xml return the XML source for the node and each of its descendants

