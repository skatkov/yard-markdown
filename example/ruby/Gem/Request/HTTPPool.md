# Class: Gem::Request::HTTPPool
**Inherits:** Object
    

A connection "pool" that only manages one connection for now.  Provides thread
safe `checkout` and `checkin` methods.  The pool consists of one connection
that corresponds to `http_args`.  This class is private, do not use it.


# Attributes
## cert_files[RW] [](#attribute-i-cert_files)
:nodoc:

## proxy_uri[RW] [](#attribute-i-proxy_uri)
:nodoc:


#Instance Methods
## checkin(connection) [](#method-i-checkin)

## checkout() [](#method-i-checkout)

## close_all() [](#method-i-close_all)

## initialize(http_args, cert_files, proxy_uri) [](#method-i-initialize)

**@return** [HTTPPool] a new instance of HTTPPool

