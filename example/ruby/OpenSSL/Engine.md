# Class: OpenSSL::Engine
**Inherits:** Object
    

This class is the access to openssl's ENGINE cryptographic module
implementation.

See also, https://www.openssl.org/docs/crypto/engine.html


# Class Methods
## by_id(id ) [](#method-c-by_id)
Fetches the engine as specified by the *id* String.

    OpenSSL::Engine.by_id("openssl")
     => #<OpenSSL::Engine id="openssl" name="Software engine support">

See OpenSSL::Engine.engines for the currently loaded engines.
**@overload** [] 

## cleanup() [](#method-c-cleanup)
It is only necessary to run cleanup when engines are loaded via
OpenSSL::Engine.load. However, running cleanup before exit is recommended.

Note that this is needed and works only in OpenSSL < 1.1.0.
**@overload** [] 

## engines() [](#method-c-engines)
Returns an array of currently loaded engines.
**@overload** [] 

## load(*args ) [](#method-c-load)
This method loads engines. If *name* is nil, then all builtin engines are
loaded. Otherwise, the given *name*, as a String,  is loaded if available to
your runtime, and returns true. If *name* is not found, then nil is returned.
**@overload** [] 


#Instance Methods
## cipher(name) [](#method-i-cipher)
Returns a new instance of OpenSSL::Cipher by *name*, if it is available in
this engine.

An EngineError will be raised if the cipher is unavailable.

    e = OpenSSL::Engine.by_id("openssl")
     => #<OpenSSL::Engine id="openssl" name="Software engine support">
    e.cipher("RC4")
     => #<OpenSSL::Cipher:0x007fc5cacc3048>

**@overload** [] 

## cmds() [](#method-i-cmds)
Returns an array of command definitions for the current engine

**@overload** [] 

## ctrl_cmd(*args) [](#method-i-ctrl_cmd)
Sends the given *command* to this engine.

Raises an EngineError if the command fails.

**@overload** [] 

## digest(name) [](#method-i-digest)
Returns a new instance of OpenSSL::Digest by *name*.

Will raise an EngineError if the digest is unavailable.

    e = OpenSSL::Engine.by_id("openssl")

#=> #<OpenSSL::Engine id="openssl" name="Software engine support">
    e.digest("SHA1")

#=> #<OpenSSL::Digest: da39a3ee5e6b4b0d3255bfef95601890afd80709>
    e.digest("zomg")

#=> OpenSSL::Engine::EngineError: no such digest `zomg'

**@overload** [] 

## finish() [](#method-i-finish)
Releases all internal structural references for this engine.

May raise an EngineError if the engine is unavailable

**@overload** [] 

## id() [](#method-i-id)
Gets the id for this engine.

    OpenSSL::Engine.load
    OpenSSL::Engine.engines #=> [#<OpenSSL::Engine#>, ...]
    OpenSSL::Engine.engines.first.id

#=> "rsax"

**@overload** [] 

## inspect() [](#method-i-inspect)
Pretty prints this engine.

**@overload** [] 

## load_private_key(*args) [](#method-i-load_private_key)
Loads the given private key identified by *id* and *data*.

An EngineError is raised of the OpenSSL::PKey is unavailable.

**@overload** [] 

## load_public_key(*args) [](#method-i-load_public_key)
Loads the given public key identified by *id* and *data*.

An EngineError is raised of the OpenSSL::PKey is unavailable.

**@overload** [] 

## name() [](#method-i-name)
Get the descriptive name for this engine.

    OpenSSL::Engine.load
    OpenSSL::Engine.engines #=> [#<OpenSSL::Engine#>, ...]
    OpenSSL::Engine.engines.first.name

#=> "RSAX engine support"

**@overload** [] 

## set_default(flag) [](#method-i-set_default)
Set the defaults for this engine with the given *flag*.

These flags are used to control combinations of algorithm methods.

*flag* can be one of the following, other flags are available depending on
your OS.

All flags
:   0xFFFF

[No flags]	0x0000

See also <openssl/engine.h>

**@overload** [] 

