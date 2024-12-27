# Class: OpenSSL::X509::Extension
**Inherits:** Object
    
**Includes:** OpenSSL::Marshal
  




#Instance Methods
## ==(other) [](#method-i-==)

## _dump(_level) [](#method-i-_dump)

## critical=(flag) [](#method-i-critical=)

## critical?() [](#method-i-critical?)

**@return** [Boolean] 

## initialize(*args) [](#method-i-initialize)
Creates an X509 extension.

The extension may be created from *der* data or from an extension *oid* and
*value*.  The *oid* may be either an OID or an extension name.  If *critical*
is `true` the extension is marked critical.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## oid() [](#method-i-oid)

## oid=(oid) [](#method-i-oid=)

## to_a() [](#method-i-to_a)

## to_der() [](#method-i-to_der)

## to_h() [](#method-i-to_h)
{"oid"=>sn|ln, "value"=>value, "critical"=>true|false}

## to_s() [](#method-i-to_s)
"oid = critical, value"

## value() [](#method-i-value)

## value=(data) [](#method-i-value=)

## value_der() [](#method-i-value_der)

