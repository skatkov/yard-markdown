# Class: Gem::Net::HTTP::Persistent::Connection
**Inherits:** Object
    

A Gem::Net::HTTP connection wrapper that holds extra information for managing
the connection's lifetime.


# Attributes
## http[RW] [](#attribute-i-http)
:nodoc:

## last_use[RW] [](#attribute-i-last_use)
Returns the value of attribute last_use.

## requests[RW] [](#attribute-i-requests)
Returns the value of attribute requests.

## ssl_generation[RW] [](#attribute-i-ssl_generation)
Returns the value of attribute ssl_generation.


#Instance Methods
## finish() [](#method-i-finish)

## initialize(http_class, http_args, ssl_generation) [](#method-i-initialize)

**@return** [Connection] a new instance of Connection

## reset() [](#method-i-reset)

## ressl(ssl_generation) [](#method-i-ressl)

