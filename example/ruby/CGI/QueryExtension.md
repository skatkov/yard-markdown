# Module: CGI::QueryExtension
    

Mixin module that provides the following:

1.  Access to the CGI environment variables as methods.  See documentation to
    the CGI class for a list of these variables.  The methods are exposed by
    removing the leading `HTTP_` (if it exists) and downcasing the name.  For
    example, `auth_type` will return the environment variable `AUTH_TYPE`, and
    `accept` will return the value for `HTTP_ACCEPT`.

2.  Access to cookies, including the cookies attribute.

3.  Access to parameters, including the params attribute, and overloading #[]
    to perform parameter value lookup by key.

4.  The initialize_query method, for initializing the above mechanisms,
    handling multipart forms, and allowing the class to be used in "offline"
    mode.


# Attributes
## cookies[RW] [](#attribute-i-cookies)
Get the cookies as a hash of cookie-name=>Cookie pairs.

## files[RW] [](#attribute-i-files)
Get the uploaded files as a hash of name=>values pairs

## params[RW] [](#attribute-i-params)
Get the parameters as a hash of name=>values pairs, where values is an Array.


#Instance Methods
## [](key) [](#method-i-[])
Get the value for the parameter with a given key.

If the parameter has multiple values, only the first will be retrieved; use
#params to get the array of values.

## create_body(is_large) [](#method-i-create_body)
:nodoc:

## has_key?(*args) [](#method-i-has_key?)
Returns true if a given query string parameter exists.

**@return** [Boolean] 

## keys(*args) [](#method-i-keys)
Return all query parameter names as an array of String.

## multipart?() [](#method-i-multipart?)
Returns whether the form contained multipart/form-data

**@return** [Boolean] 

## raw_cookie() [](#method-i-raw_cookie)
Get the raw cookies as a string.

## raw_cookie2() [](#method-i-raw_cookie2)
Get the raw RFC2965 cookies as a string.

## unescape_filename?() [](#method-i-unescape_filename?)
:nodoc:

**@return** [Boolean] 

