# Class: OpenSSL::ASN1::ObjectId
**Inherits:** OpenSSL::ASN1::Primitive
    

Represents the primitive object id for OpenSSL::ASN1


# Class Methods
## register(oid , sn , ln ) [](#method-c-register)
This adds a new ObjectId to the internal tables. Where *object_id* is the
numerical form, *short_name* is the short name, and *long_name* is the long
name.

Returns `true` if successful. Raises an OpenSSL::ASN1::ASN1Error if it fails.
**@overload** [] 


#Instance Methods
## ==(other) [](#method-i-==)
Returns `true` if *other_oid* is the same as *oid*.

**@overload** [] 

## ln() [](#method-i-ln)
The long name of the ObjectId, as defined in <openssl/objects.h>.

**@overload** [] 

**@overload** [] 

## oid() [](#method-i-oid)
Returns a String representing the Object Identifier in the dot notation, e.g.
"1.2.3.4.5"

**@overload** [] 

## sn() [](#method-i-sn)
The short name of the ObjectId, as defined in <openssl/objects.h>.

**@overload** [] 

**@overload** [] 

