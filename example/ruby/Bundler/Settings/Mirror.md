# Class: Bundler::Settings::Mirror
**Inherits:** Object
    

A mirror

Contains both the uri that should be used as a mirror and the
    fallback timeout which will be used for probing if the mirror
    replies on time or not.


# Attributes
## fallback_timeout[RW] [](#attribute-i-fallback_timeout)
Returns the value of attribute fallback_timeout.

## uri[RW] [](#attribute-i-uri)
Returns the value of attribute uri.


#Instance Methods
## ==(other) [](#method-i-==)

## initialize(urinil, fallback_timeout0) [](#method-i-initialize)

**@return** [Mirror] a new instance of Mirror

## valid?() [](#method-i-valid?)

**@return** [Boolean] 

## validate!(probenil) [](#method-i-validate!)

