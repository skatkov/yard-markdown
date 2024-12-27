# Class: OpenSSL::HMAC
**Inherits:** Object
    

OpenSSL::HMAC allows computing Hash-based Message Authentication Code (HMAC).
It is a type of message authentication code (MAC) involving a hash function in
combination with a key. HMAC can be used to verify the integrity of a message
as well as the authenticity.

OpenSSL::HMAC has a similar interface to OpenSSL::Digest.

### HMAC-SHA256 using one-shot interface

    key = "key"
    data = "message-to-be-authenticated"
    mac = OpenSSL::HMAC.hexdigest("SHA256", key, data)
    #=> "cddb0db23f469c8bf072b21fd837149bd6ace9ab771cceef14c9e517cc93282e"

### HMAC-SHA256 using incremental interface

    data1 = File.binread("file1")
    data2 = File.binread("file2")
    key = "key"
    hmac = OpenSSL::HMAC.new(key, 'SHA256')
    hmac << data1
    hmac << data2
    mac = hmac.digest


# Class Methods
## base64digest(digest , key , data ) [](#method-c-base64digest)
:call-seq:
    HMAC.base64digest(digest, key, data) -> aString

Returns the authentication code as a Base64-encoded string. The *digest*
parameter specifies the digest algorithm to use. This may be a String
representing the algorithm name or an instance of OpenSSL::Digest.

### Example
    key = 'key'
    data = 'The quick brown fox jumps over the lazy dog'

    hmac = OpenSSL::HMAC.base64digest('SHA1', key, data)
    #=> "3nybhbi3iqa8ino29wqQcBydtNk="
## digest(digest , key , data ) [](#method-c-digest)
:call-seq:
    HMAC.digest(digest, key, data) -> aString

Returns the authentication code as a binary string. The *digest* parameter
specifies the digest algorithm to use. This may be a String representing the
algorithm name or an instance of OpenSSL::Digest.

### Example
    key = 'key'
    data = 'The quick brown fox jumps over the lazy dog'

    hmac = OpenSSL::HMAC.digest('SHA1', key, data)
    #=> "\xDE|\x9B\x85\xB8\xB7\x8A\xA6\xBC\x8Az6\xF7\n\x90p\x1C\x9D\xB4\xD9"
## hexdigest(digest , key , data ) [](#method-c-hexdigest)
:call-seq:
    HMAC.hexdigest(digest, key, data) -> aString

Returns the authentication code as a hex-encoded string. The *digest*
parameter specifies the digest algorithm to use. This may be a String
representing the algorithm name or an instance of OpenSSL::Digest.

### Example
    key = 'key'
    data = 'The quick brown fox jumps over the lazy dog'

    hmac = OpenSSL::HMAC.hexdigest('SHA1', key, data)
    #=> "de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9"

#Instance Methods
## ==(other) [](#method-i-==)
Securely compare with another HMAC instance in constant time.

## base64digest() [](#method-i-base64digest)
:call-seq:
    hmac.base64digest -> string

Returns the authentication code an a Base64-encoded string.

## digest() [](#method-i-digest)
Returns the authentication code an instance represents as a binary string.

### Example
instance = OpenSSL::HMAC.new('key', 'SHA1') #=>
f42bb0eeb018ebbd4597ae7213711ec60760843f instance.digest #=>
"xF4+xB0xEExB0x18xEBxBDEx97xAErx13qx1ExC6a`x84?"

**@overload** [] 

## hexdigest() [](#method-i-hexdigest)
Returns the authentication code an instance represents as a hex-encoded
string.

**@overload** [] 

## initialize(key, digest) [](#method-i-initialize)
Returns an instance of OpenSSL::HMAC set with the key and digest algorithm to
be used. The instance represents the initial state of the message
authentication code before any data has been processed. To process data with
it, use the instance method #update with your data as an argument.

### Example

key = 'key' instance = OpenSSL::HMAC.new(key, 'SHA1') #=>
f42bb0eeb018ebbd4597ae7213711ec60760843f instance.class #=> OpenSSL::HMAC

### A note about comparisons

Two instances can be securely compared with #== in constant time:

other_instance = OpenSSL::HMAC.new('key', 'SHA1') #=>
f42bb0eeb018ebbd4597ae7213711ec60760843f instance == other_instance #=> true

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## inspect() [](#method-i-inspect)
Returns the authentication code an instance represents as a hex-encoded
string.

**@overload** [] 

## reset() [](#method-i-reset)
Returns *hmac* as it was when it was first initialized, with all processed
data cleared from it.

### Example

data = "The quick brown fox jumps over the lazy dog" instance =
OpenSSL::HMAC.new('key', 'SHA1') #=> f42bb0eeb018ebbd4597ae7213711ec60760843f

instance.update(data) #=> de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9
instance.reset #=> f42bb0eeb018ebbd4597ae7213711ec60760843f

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns the authentication code an instance represents as a hex-encoded
string.

**@overload** [] 

## update(data) [](#method-i-update)
Returns *hmac* updated with the message to be authenticated. Can be called
repeatedly with chunks of the message.

### Example

first_chunk = 'The quick brown fox jumps ' second_chunk = 'over the lazy dog'

instance.update(first_chunk) #=> 5b9a8038a65d571076d97fe783989e52278a492a
instance.update(second_chunk) #=> de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9

**@overload** [] 

