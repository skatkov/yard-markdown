# Class: Bundler::Settings::Mirrors
**Inherits:** Object
    

Class used to build the mirror set and then find a mirror for a given URI

**@param** [Prober object, nil] by default a TCPSocketProbe, this object
will be used to probe the mirror address to validate that the mirror replies.



#Instance Methods
## each() [](#method-i-each)

## for(uri) [](#method-i-for)
Returns a mirror for the given uri.

Depending on the uri having a valid mirror or not, it may be a
    mirror that points to the provided uri

## initialize(probernil) [](#method-i-initialize)

**@return** [Mirrors] a new instance of Mirrors

## parse(key, value) [](#method-i-parse)

