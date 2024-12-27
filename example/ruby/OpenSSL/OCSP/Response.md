# Class: OpenSSL::OCSP::Response
**Inherits:** Object
    



# Class Methods
## create(status , basic_resp ) [](#method-c-create)
Creates an OpenSSL::OCSP::Response from *status* and *basic_response*.
**@overload** [] 


#Instance Methods
## basic() [](#method-i-basic)
Returns a BasicResponse for this response

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new OpenSSL::OCSP::Response.  The response may be created empty or
from a *response_der* string.

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## status() [](#method-i-status)
Returns the status of the response.

**@overload** [] 

## status_string() [](#method-i-status_string)
Returns a status string for the response.

**@overload** [] 

## to_der() [](#method-i-to_der)
Returns this response as a DER-encoded string.

**@overload** [] 

