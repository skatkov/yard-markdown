# Class: OpenSSL::PKCS7
**Inherits:** Object
    



# Class Methods
## encrypt(*args ) [](#method-c-encrypt)
Creates a PKCS #7 enveloped-data structure.

Before version 3.3.0, `cipher` was optional and defaulted to `"RC2-40-CBC"`.

See also the man page PKCS7_encrypt(3).
**@overload** [] 

## read_smime(arg ) [](#method-c-read_smime)
**@overload** [] 

## sign(*args ) [](#method-c-sign)
**@overload** [] 

## write_smime(*args ) [](#method-c-write_smime)
**@overload** [] 


#Instance Methods
## add_certificate(cert) [](#method-i-add_certificate)

## add_crl(crl) [](#method-i-add_crl)

## add_data(data) [](#method-i-add_data)

## add_recipient(recip) [](#method-i-add_recipient)

## add_signer(signer) [](#method-i-add_signer)

## certificates() [](#method-i-certificates)

## certificates=(ary) [](#method-i-certificates=)

## cipher=(cipher) [](#method-i-cipher=)

## crls() [](#method-i-crls)

## crls=(ary) [](#method-i-crls=)

## decrypt(*args) [](#method-i-decrypt)

## detached() [](#method-i-detached)

## detached=(flag) [](#method-i-detached=)

## detached?() [](#method-i-detached?)

**@return** [Boolean] 

## initialize(*args) [](#method-i-initialize)
Many methods in this class aren't documented.

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## recipients() [](#method-i-recipients)

## signers() [](#method-i-signers)

## to_der() [](#method-i-to_der)

## to_pem() [](#method-i-to_pem)

## to_text() [](#method-i-to_text)

## type() [](#method-i-type)

**@overload** [] 

## type=(type) [](#method-i-type=)

**@overload** [] 

## verify(*args) [](#method-i-verify)

