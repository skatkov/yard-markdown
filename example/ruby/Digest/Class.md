# Class: Digest::Class
**Inherits:** Object
    
**Includes:** Digest::Instance
  

This module stands as a base class for digest implementation classes.


# Class Methods
## base64digest(str , *args ) [](#method-c-base64digest)
Returns the base64 encoded hash value of a given *string*.  The return value
is properly padded with '=' and contains no line feeds.
## bubblebabble(*args ) [](#method-c-bubblebabble)
call-seq:
    Digest::Class.bubblebabble(string, ...) -> hash_string

Returns the BubbleBabble encoded hash value of a given *string*.
## digest(*args ) [](#method-c-digest)
Returns the hash value of a given *string*.  This is equivalent to
Digest::Class.new(*parameters).digest(string), where extra *parameters*, if
any, are passed through to the constructor and the *string* is passed to
#digest().
**@overload** [] 

## file(name , *args ) [](#method-c-file)
Creates a digest object and reads a given file, *name*. Optional arguments are
passed to the constructor of the digest class.

    p Digest::SHA256.file("X11R6.8.2-src.tar.bz2").hexdigest
    # => "f02e3c85572dc9ad7cb77c2a638e3be24cc1b5bea9fdbb0b0299c9668475c534"
## hexdigest(*args ) [](#method-c-hexdigest)
Returns the hex-encoded hash value of a given *string*.  This is almost
equivalent to Digest.hexencode(Digest::Class.new(*parameters).digest(string)).
**@overload** [] 


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

## initialize() [](#method-i-initialize)
:nodoc:

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

