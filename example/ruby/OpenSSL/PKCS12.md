# Class: OpenSSL::PKCS12
**Inherits:** Object
    



# Class Methods
## create(*args ) [](#method-c-create)
### Parameters
*   *pass* - string
*   *name* - A string describing the key.
*   *key* - Any PKey.
*   *cert* - A X509::Certificate.
    *   The public_key portion of the certificate must contain a valid public
        key.
    *   The not_before and not_after fields must be filled in.
*   *ca* - An optional array of X509::Certificate's.
*   *key_pbe* - string
*   *cert_pbe* - string
*   *key_iter* - integer
*   *mac_iter* - integer
*   *keytype* - An integer representing an MSIE specific extension.

Any optional arguments may be supplied as `nil` to preserve the OpenSSL
defaults.

See the OpenSSL documentation for PKCS12_create().
**@overload** [] 


#Instance Methods
## initialize(*args) [](#method-i-initialize)
### Parameters
*   *str* - Must be a DER encoded PKCS12 string.
*   *pass* - string

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## set_mac(*args) [](#method-i-set_mac)
Sets MAC parameters and generates MAC over the PKCS #12 structure.

This method uses HMAC and the PKCS #12 specific password-based KDF as
specified in the original PKCS #12.

See also the man page PKCS12_set_mac(3).

Added in version 3.3.0.

**@overload** [] 

## to_der() [](#method-i-to_der)

