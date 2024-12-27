# Class: OpenSSL::SSL::Session
**Inherits:** Object
    




#Instance Methods
## ==(val2) [](#method-i-==)
Returns `true` if the two Session is the same, `false` if not.

**@overload** [] 

## id() [](#method-i-id)
Returns the Session ID.

**@overload** [] 

## initialize(arg1) [](#method-i-initialize)
Creates a new Session object from an instance of SSLSocket or DER/PEM encoded
String.

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## time() [](#method-i-time)
Returns the time at which the session was established.

**@overload** [] 

## time=(time_v) [](#method-i-time=)
Sets start time of the session. Time resolution is in seconds.

**@overload** [] 

**@overload** [] 

## timeout() [](#method-i-timeout)
Returns the timeout value set for the session, in seconds from the established
time.

**@overload** [] 

## timeout=(time_v) [](#method-i-timeout=)
Sets how long until the session expires in seconds.

**@overload** [] 

## to_der() [](#method-i-to_der)
Returns an ASN1 encoded String that contains the Session object.

**@overload** [] 

## to_pem() [](#method-i-to_pem)
Returns a PEM encoded String that contains the Session object.

**@overload** [] 

## to_text() [](#method-i-to_text)
Shows everything in the Session object. This is for diagnostic purposes.

**@overload** [] 

