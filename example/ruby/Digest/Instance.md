# Module: Digest::Instance
    

This module provides instance methods for a digest implementation object to
calculate message digest values.



#Instance Methods
## <<(str) [](#method-i-<<)
Updates the digest using a given *string* and returns self.

The update() method and the left-shift operator are overridden by each
implementation subclass. (One should be an alias for the other)

**@overload** [] 

**@overload** [] 

## ==(other) [](#method-i-==)
If a string is given, checks whether it is equal to the hex-encoded hash value
of the digest object.  If another digest instance is given, checks whether
they have the same hash value.  Otherwise returns false.

**@overload** [] 

**@overload** [] 

## base64digest(strnil) [](#method-i-base64digest)
If none is given, returns the resulting hash value of the digest in a base64
encoded form, keeping the digest's state.

If a `string` is given, returns the hash value for the given `string` in a
base64 encoded form, resetting the digest to the initial state before and
after the process.

In either case, the return value is properly padded with '=' and contains no
line feeds.

## base64digest!() [](#method-i-base64digest!)
Returns the resulting hash value and resets the digest to the initial state.

## block_length() [](#method-i-block_length)
Returns the block length of the digest.

This method is overridden by each implementation subclass.

**@overload** [] 

## bubblebabble() [](#method-i-bubblebabble)
call-seq:
    digest_obj.bubblebabble -> hash_string

Returns the resulting hash value in a Bubblebabble encoded form.

## digest(*args) [](#method-i-digest)
If none is given, returns the resulting hash value of the digest, keeping the
digest's state.

If a *string* is given, returns the hash value for the given *string*,
resetting the digest to the initial state before and after the process.

**@overload** [] 

**@overload** [] 

## digest!() [](#method-i-digest!)
Returns the resulting hash value and resets the digest to the initial state.

**@overload** [] 

## digest_length() [](#method-i-digest_length)
Returns the length of the hash value of the digest.

This method should be overridden by each implementation subclass. If not,
digest_obj.digest().length() is returned.

**@overload** [] 

## file(name) [](#method-i-file)
Updates the digest with the contents of a given file *name* and returns self.

## hexdigest(*args) [](#method-i-hexdigest)
If none is given, returns the resulting hash value of the digest in a
hex-encoded form, keeping the digest's state.

If a *string* is given, returns the hash value for the given *string* in a
hex-encoded form, resetting the digest to the initial state before and after
the process.

**@overload** [] 

**@overload** [] 

## hexdigest!() [](#method-i-hexdigest!)
Returns the resulting hash value in a hex-encoded form and resets the digest
to the initial state.

**@overload** [] 

## inspect() [](#method-i-inspect)
Creates a printable version of the digest object.

**@overload** [] 

## length() [](#method-i-length)
Returns digest_obj.digest_length().

**@overload** [] 

**@overload** [] 

## new() [](#method-i-new)
Returns a new, initialized copy of the digest object.  Equivalent to
digest_obj.clone().reset().

**@overload** [] 

## reset() [](#method-i-reset)
Resets the digest to the initial state and returns self.

This method is overridden by each implementation subclass.

**@overload** [] 

## size() [](#method-i-size)
Returns digest_obj.digest_length().

**@overload** [] 

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns digest_obj.hexdigest().

**@overload** [] 

## update(str) [](#method-i-update)
Updates the digest using a given *string* and returns self.

The update() method and the left-shift operator are overridden by each
implementation subclass. (One should be an alias for the other)

**@overload** [] 

**@overload** [] 

