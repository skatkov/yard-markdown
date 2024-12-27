# Class: Gem::UriFormatter
**Inherits:** Object
    

The UriFormatter handles URIs from user-input and escaping.

    uf = Gem::UriFormatter.new 'example.com'

    p uf.normalize #=> 'http://example.com'


# Attributes
## uri[RW] [](#attribute-i-uri)
The URI to be formatted.


#Instance Methods
## escape() [](#method-i-escape)
Escapes the #uri for use as a CGI parameter

## initialize(uri) [](#method-i-initialize)
Creates a new URI formatter for `uri`.

**@return** [UriFormatter] a new instance of UriFormatter

## normalize() [](#method-i-normalize)
Normalize the URI by adding "http://" if it is missing.

## unescape() [](#method-i-unescape)
Unescapes the #uri which came from a CGI parameter

