# Module: OpenSSL
    

--
# Ruby-space definitions to add DER (de)serialization to classes

# Info
'OpenSSL for Ruby 2' project Copyright (C) 2002  Michal Rokos
<m.rokos@sh.cvut.cz> All rights reserved.

# Licence
This program is licensed under the same licence as Ruby. (See the file
'COPYING'.) ++


# Class Methods
## Digest(name ) [](#method-c-Digest)
Returns a Digest subclass by *name*

    require 'openssl'

    OpenSSL::Digest("MD5")
    # => OpenSSL::Digest::MD5

    Digest("Foo")
    # => NameError: wrong constant name Foo
## debug() [](#method-c-debug)
## debug=() [](#method-c-debug=)
## errors() [](#method-c-errors)
## fips_mode() [](#method-c-fips_mode)
## fips_mode=() [](#method-c-fips_mode=)
## fixed_length_secure_compare() [](#method-c-fixed_length_secure_compare)
## secure_compare(a , b ) [](#method-c-secure_compare)
call-seq:
    OpenSSL.secure_compare(string, string) -> boolean

Constant time memory comparison. Inputs are hashed using SHA-256 to mask the
length of the secret. Returns `true` if the strings are identical, `false`
otherwise.

