# Class: Digest::Base
**Inherits:** Digest::Class
    

This abstract class provides a common interface to message digest
implementation classes written in C.

## Write a Digest subclass in C
Digest::Base provides a common interface to message digest classes written in
C. These classes must provide a struct of type rb_digest_metadata_t:
    typedef int (*rb_digest_hash_init_func_t)(void *);
    typedef void (*rb_digest_hash_update_func_t)(void *, unsigned char *, size_t);
    typedef int (*rb_digest_hash_finish_func_t)(void *, unsigned char *);

    typedef struct {
      int api_version;
      size_t digest_len;
      size_t block_len;
      size_t ctx_size;
      rb_digest_hash_init_func_t init_func;
      rb_digest_hash_update_func_t update_func;
      rb_digest_hash_finish_func_t finish_func;
    } rb_digest_metadata_t;

This structure must be set as an instance variable named `metadata` (without
the +@+ in front of the name). By example:
     static const rb_digest_metadata_t sha1 = {
        RUBY_DIGEST_API_VERSION,
        SHA1_DIGEST_LENGTH,
        SHA1_BLOCK_LENGTH,
        sizeof(SHA1_CTX),
        (rb_digest_hash_init_func_t)SHA1_Init,
        (rb_digest_hash_update_func_t)SHA1_Update,
        (rb_digest_hash_finish_func_t)SHA1_Finish,
    };

    rb_ivar_set(cDigest_SHA1, rb_intern("metadata"),

	rb_digest_make_metadata(&sha1));



#Instance Methods
## <<(str) [](#method-i-<<)
Update the digest using given *string* and return `self`.

**@overload** [] 

**@overload** [] 

## block_length() [](#method-i-block_length)
Return the block length of the digest in bytes.

**@overload** [] 

## digest_length() [](#method-i-digest_length)
Return the length of the hash value in bytes.

**@overload** [] 

## initialize_copy(obj) [](#method-i-initialize_copy)
:nodoc:

## reset() [](#method-i-reset)
Reset the digest to its initial state and return `self`.

**@overload** [] 

## update(str) [](#method-i-update)
Update the digest using given *string* and return `self`.

**@overload** [] 

**@overload** [] 

