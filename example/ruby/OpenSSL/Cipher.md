# Class: OpenSSL::Cipher
**Inherits:** Object
    

Provides symmetric algorithms for encryption and decryption. The algorithms
that are available depend on the particular version of OpenSSL that is
installed.

### Listing all supported algorithms

A list of supported algorithms can be obtained by

    puts OpenSSL::Cipher.ciphers

### Instantiating a Cipher

There are several ways to create a Cipher instance. Generally, a Cipher
algorithm is categorized by its name, the key length in bits and the cipher
mode to be used. The most generic way to create a Cipher is the following

    cipher = OpenSSL::Cipher.new('<name>-<key length>-<mode>')

That is, a string consisting of the hyphenated concatenation of the individual
components name, key length and mode. Either all uppercase or all lowercase
strings may be used, for example:

    cipher = OpenSSL::Cipher.new('aes-128-cbc')

### Choosing either encryption or decryption mode

Encryption and decryption are often very similar operations for symmetric
algorithms, this is reflected by not having to choose different classes for
either operation, both can be done using the same class. Still, after
obtaining a Cipher instance, we need to tell the instance what it is that we
intend to do with it, so we need to call either

    cipher.encrypt

or

    cipher.decrypt

on the Cipher instance. This should be the first call after creating the
instance, otherwise configuration that has already been set could get lost in
the process.

### Choosing a key

Symmetric encryption requires a key that is the same for the encrypting and
for the decrypting party and after initial key establishment should be kept as
private information. There are a lot of ways to create insecure keys, the most
notable is to simply take a password as the key without processing the
password further. A simple and secure way to create a key for a particular
Cipher is

    cipher = OpenSSL::Cipher.new('aes-256-cfb')
    cipher.encrypt
    key = cipher.random_key # also sets the generated key on the Cipher

If you absolutely need to use passwords as encryption keys, you should use
Password-Based Key Derivation Function 2 (PBKDF2) by generating the key with
the help of the functionality provided by OpenSSL::PKCS5.pbkdf2_hmac_sha1 or
OpenSSL::PKCS5.pbkdf2_hmac.

Although there is Cipher#pkcs5_keyivgen, its use is deprecated and it should
only be used in legacy applications because it does not use the newer PKCS#5
v2 algorithms.

### Choosing an IV

The cipher modes CBC, CFB, OFB and CTR all need an "initialization vector", or
short, IV. ECB mode is the only mode that does not require an IV, but there is
almost no legitimate use case for this mode because of the fact that it does
not sufficiently hide plaintext patterns. Therefore

**You should never use ECB mode unless you are absolutely sure that you
absolutely need it**

Because of this, you will end up with a mode that explicitly requires an IV in
any case. Although the IV can be seen as public information, i.e. it may be
transmitted in public once generated, it should still stay unpredictable to
prevent certain kinds of attacks. Therefore, ideally

**Always create a secure random IV for every encryption of your Cipher**

A new, random IV should be created for every encryption of data. Think of the
IV as a nonce (number used once) - it's public but random and unpredictable. A
secure random IV can be created as follows

    cipher = ...
    cipher.encrypt
    key = cipher.random_key
    iv = cipher.random_iv # also sets the generated IV on the Cipher

Although the key is generally a random value, too, it is a bad choice as an
IV. There are elaborate ways how an attacker can take advantage of such an IV.
As a general rule of thumb, exposing the key directly or indirectly should be
avoided at all cost and exceptions only be made with good reason.

### Calling Cipher#final

ECB (which should not be used) and CBC are both block-based modes. This means
that unlike for the other streaming-based modes, they operate on fixed-size
blocks of data, and therefore they require a "finalization" step to produce or
correctly decrypt the last block of data by appropriately handling some form
of padding. Therefore it is essential to add the output of
OpenSSL::Cipher#final to your encryption/decryption buffer or you will end up
with decryption errors or truncated data.

Although this is not really necessary for streaming-mode ciphers, it is still
recommended to apply the same pattern of adding the output of Cipher#final
there as well - it also enables you to switch between modes more easily in the
future.

### Encrypting and decrypting some data

    data = "Very, very confidential data"

    cipher = OpenSSL::Cipher.new('aes-128-cbc')
    cipher.encrypt
    key = cipher.random_key
    iv = cipher.random_iv

    encrypted = cipher.update(data) + cipher.final
    ...
    decipher = OpenSSL::Cipher.new('aes-128-cbc')
    decipher.decrypt
    decipher.key = key
    decipher.iv = iv

    plain = decipher.update(encrypted) + decipher.final

    puts data == plain #=> true

### Authenticated Encryption and Associated Data (AEAD)

If the OpenSSL version used supports it, an Authenticated Encryption mode
(such as GCM or CCM) should always be preferred over any unauthenticated mode.
Currently, OpenSSL supports AE only in combination with Associated Data (AEAD)
where additional associated data is included in the encryption process to
compute a tag at the end of the encryption. This tag will also be used in the
decryption process and by verifying its validity, the authenticity of a given
ciphertext is established.

This is superior to unauthenticated modes in that it allows to detect if
somebody effectively changed the ciphertext after it had been encrypted. This
prevents malicious modifications of the ciphertext that could otherwise be
exploited to modify ciphertexts in ways beneficial to potential attackers.

An associated data is used where there is additional information, such as
headers or some metadata, that must be also authenticated but not necessarily
need to be encrypted. If no associated data is needed for encryption and later
decryption, the OpenSSL library still requires a value to be set - "" may be
used in case none is available.

An example using the GCM (Galois/Counter Mode). You have 16 bytes *key*, 12
bytes (96 bits) *nonce* and the associated data *auth_data*. Be sure not to
reuse the *key* and *nonce* pair. Reusing an nonce ruins the security
guarantees of GCM mode.

    cipher = OpenSSL::Cipher.new('aes-128-gcm').encrypt
    cipher.key = key
    cipher.iv = nonce
    cipher.auth_data = auth_data

    encrypted = cipher.update(data) + cipher.final
    tag = cipher.auth_tag # produces 16 bytes tag by default

Now you are the receiver. You know the *key* and have received *nonce*,
*auth_data*, *encrypted* and *tag* through an untrusted network. Note that GCM
accepts an arbitrary length tag between 1 and 16 bytes. You may additionally
need to check that the received tag has the correct length, or you allow
attackers to forge a valid single byte tag for the tampered ciphertext with a
probability of 1/256.

    raise "tag is truncated!" unless tag.bytesize == 16
    decipher = OpenSSL::Cipher.new('aes-128-gcm').decrypt
    decipher.key = key
    decipher.iv = nonce
    decipher.auth_tag = tag
    decipher.auth_data = auth_data

    decrypted = decipher.update(encrypted) + decipher.final

    puts data == decrypted #=> true


# Class Methods
## ciphers() [](#method-c-ciphers)
Returns the names of all available ciphers in an array.
**@overload** [] 


#Instance Methods
## auth_data=(data) [](#method-i-auth_data=)
Sets the cipher's additional authenticated data. This field must be set when
using AEAD cipher modes such as GCM or CCM. If no associated data shall be
used, this method must **still** be called with a value of "". The contents of
this field should be non-sensitive data which will be added to the ciphertext
to generate the authentication tag which validates the contents of the
ciphertext.

The AAD must be set prior to encryption or decryption. In encryption mode, it
must be set after calling Cipher#encrypt and setting Cipher#key= and
Cipher#iv=. When decrypting, the authenticated data must be set after key, iv
and especially **after** the authentication tag has been set. I.e. set it only
after calling Cipher#decrypt, Cipher#key=, Cipher#iv= and Cipher#auth_tag=
first.

**@overload** [] 

## auth_tag(*args) [](#method-i-auth_tag)
Gets the authentication tag generated by Authenticated Encryption Cipher modes
(GCM for example). This tag may be stored along with the ciphertext, then set
on the decryption cipher to authenticate the contents of the ciphertext
against changes. If the optional integer parameter *tag_len* is given, the
returned tag will be *tag_len* bytes long. If the parameter is omitted, the
default length of 16 bytes or the length previously set by #auth_tag_len= will
be used. For maximum security, the longest possible should be chosen.

The tag may only be retrieved after calling Cipher#final.

**@overload** [] 

## auth_tag=(vtag) [](#method-i-auth_tag=)
Sets the authentication tag to verify the integrity of the ciphertext. This
can be called only when the cipher supports AE. The tag must be set after
calling Cipher#decrypt, Cipher#key= and Cipher#iv=, but before calling
Cipher#final. After all decryption is performed, the tag is verified
automatically in the call to Cipher#final.

For OCB mode, the tag length must be supplied with #auth_tag_len= beforehand.

**@overload** [] 

## auth_tag_len=(vlen) [](#method-i-auth_tag_len=)
Sets the length of the authentication tag to be generated or to be given for
AEAD ciphers that requires it as in input parameter. Note that not all AEAD
ciphers support this method.

In OCB mode, the length must be supplied both when encrypting and when
decrypting, and must be before specifying an IV.

**@overload** [] 

## authenticated?() [](#method-i-authenticated?)
Indicated whether this Cipher instance uses an Authenticated Encryption mode.

**@overload** [] 

**@return** [Boolean] 

## block_size() [](#method-i-block_size)
Returns the size in bytes of the blocks on which this Cipher operates on.

**@overload** [] 

## ccm_data_len=(data_len) [](#method-i-ccm_data_len=)
Sets the length of the plaintext / ciphertext message that will be processed
in CCM mode. Make sure to call this method after #key= and #iv= have been set,
and before #auth_data=.

Only call this method after calling Cipher#encrypt or Cipher#decrypt.

**@overload** [] 

## decrypt(*args) [](#method-i-decrypt)
Initializes the Cipher for decryption.

Make sure to call Cipher#encrypt or Cipher#decrypt before using any of the
following methods:

    #key=, #iv=, #random_key, #random_iv, #pkcs5_keyivgen
:       
Internally calls EVP_CipherInit_ex(ctx, NULL, NULL, NULL, NULL, 0).

**@overload** [] 

## encrypt(*args) [](#method-i-encrypt)
Initializes the Cipher for encryption.

Make sure to call Cipher#encrypt or Cipher#decrypt before using any of the
following methods:

    #key=, #iv=, #random_key, #random_iv, #pkcs5_keyivgen
:       
Internally calls EVP_CipherInit_ex(ctx, NULL, NULL, NULL, NULL, 1).

**@overload** [] 

## final() [](#method-i-final)
Returns the remaining data held in the cipher object. Further calls to
Cipher#update or Cipher#final will return garbage. This call should always be
made as the last call of an encryption or decryption operation, after having
fed the entire plaintext or ciphertext to the Cipher instance.

If an authenticated cipher was used, a CipherError is raised if the tag could
not be authenticated successfully. Only call this method after setting the
authentication tag and passing the entire contents of the ciphertext into the
cipher.

**@overload** [] 

## initialize(str) [](#method-i-initialize)
The string must contain a valid cipher name like "aes-256-cbc".

A list of cipher names is available by calling OpenSSL::Cipher.ciphers.

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## iv=(iv) [](#method-i-iv=)
Sets the cipher IV. Please note that since you should never be using ECB mode,
an IV is always explicitly required and should be set prior to encryption. The
IV itself can be safely transmitted in public, but it should be unpredictable
to prevent certain kinds of attacks. You may use Cipher#random_iv to create a
secure random IV.

Only call this method after calling Cipher#encrypt or Cipher#decrypt.

**@overload** [] 

## iv_len() [](#method-i-iv_len)
Returns the expected length in bytes for an IV for this Cipher.

**@overload** [] 

## iv_len=(iv_length) [](#method-i-iv_len=)
Sets the IV/nonce length of the Cipher. Normally block ciphers don't allow
changing the IV length, but some make use of IV for 'nonce'. You may need this
for interoperability with other applications.

**@overload** [] 

## key=(key) [](#method-i-key=)
Sets the cipher key. To generate a key, you should either use a secure random
byte string or, if the key is to be derived from a password, you should rely
on PBKDF2 functionality provided by OpenSSL::PKCS5. To generate a secure
random-based key, Cipher#random_key may be used.

Only call this method after calling Cipher#encrypt or Cipher#decrypt.

**@overload** [] 

## key_len() [](#method-i-key_len)
Returns the key length in bytes of the Cipher.

**@overload** [] 

## key_len=(key_length) [](#method-i-key_len=)
Sets the key length of the cipher.  If the cipher is a fixed length cipher
then attempting to set the key length to any value other than the fixed value
is an error.

Under normal circumstances you do not need to call this method (and probably
shouldn't).

See EVP_CIPHER_CTX_set_key_length for further information.

**@overload** [] 

## name() [](#method-i-name)
Returns the short name of the cipher which may differ slightly from the
original name provided.

**@overload** [] 

## padding=(padding) [](#method-i-padding=)
Enables or disables padding. By default encryption operations are padded using
standard block padding and the padding is checked and removed when decrypting.
If the pad parameter is zero then no padding is performed, the total amount of
data encrypted or decrypted must then be a multiple of the block size or an
error will occur.

See EVP_CIPHER_CTX_set_padding for further information.

**@overload** [] 

## pkcs5_keyivgen(*args) [](#method-i-pkcs5_keyivgen)
Generates and sets the key/IV based on a password.

**WARNING**: This method is only PKCS5 v1.5 compliant when using RC2, RC4-40,
or DES with MD5 or SHA1. Using anything else (like AES) will generate the
key/iv using an OpenSSL specific method. This method is deprecated and should
no longer be used. Use a PKCS5 v2 key generation method from OpenSSL::PKCS5
instead.

### Parameters
*   *salt* must be an 8 byte string if provided.
*   *iterations* is an integer with a default of 2048.
*   *digest* is a Digest object that defaults to 'MD5'

A minimum of 1000 iterations is recommended.

**@overload** [] 

## random_iv() [](#method-i-random_iv)
call-seq:
    cipher.random_iv -> iv

Generate a random IV with OpenSSL::Random.random_bytes and sets it to the
cipher, and returns it.

You must call #encrypt or #decrypt before calling this method.

## random_key() [](#method-i-random_key)
call-seq:
    cipher.random_key -> key

Generate a random key with OpenSSL::Random.random_bytes and sets it to the
cipher, and returns it.

You must call #encrypt or #decrypt before calling this method.

## reset() [](#method-i-reset)
Fully resets the internal state of the Cipher. By using this, the same Cipher
instance may be used several times for encryption or decryption tasks.

Internally calls EVP_CipherInit_ex(ctx, NULL, NULL, NULL, NULL, -1).

**@overload** [] 

## update(*args) [](#method-i-update)
Encrypts data in a streaming fashion. Hand consecutive blocks of data to the
#update method in order to encrypt it. Returns the encrypted data chunk. When
done, the output of Cipher#final should be additionally added to the result.

If *buffer* is given, the encryption/decryption result will be written to it.
*buffer* will be resized automatically.

**@overload** [] 

