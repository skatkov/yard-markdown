# Class: CGI::Cookie
**Inherits:** Array
    

Class representing an HTTP cookie.

In addition to its specific fields and methods, a Cookie instance is a
delegator to the array of its values.

See RFC 2965.

## Examples of use
    cookie1 = CGI::Cookie.new("name", "value1", "value2", ...)
    cookie1 = CGI::Cookie.new("name" => "name", "value" => "value")
    cookie1 = CGI::Cookie.new('name'     => 'name',
                              'value'    => ['value1', 'value2', ...],
                              'path'     => 'path',   # optional
                              'domain'   => 'domain', # optional
                              'expires'  => Time.now, # optional
                              'secure'   => true,     # optional
                              'httponly' => true      # optional
                              )

    cgi.out("cookie" => [cookie1, cookie2]) { "string" }

    name     = cookie1.name
    values   = cookie1.value
    path     = cookie1.path
    domain   = cookie1.domain
    expires  = cookie1.expires
    secure   = cookie1.secure
    httponly = cookie1.httponly

    cookie1.name     = 'name'
    cookie1.value    = ['value1', 'value2', ...]
    cookie1.path     = 'path'
    cookie1.domain   = 'domain'
    cookie1.expires  = Time.now + 30
    cookie1.secure   = true
    cookie1.httponly = true


# Class Methods
## parse(raw_cookie ) [](#method-c-parse)
Parse a raw cookie string into a hash of cookie-name=>Cookie pairs.

    cookies = CGI::Cookie.parse("raw_cookie_string")
      # { "name1" => cookie1, "name2" => cookie2, ... }
# Attributes
## domain[RW] [](#attribute-i-domain)
Domain for which this cookie applies, as a `String`

## expires[RW] [](#attribute-i-expires)
Time at which this cookie expires, as a `Time`

## httponly[RW] [](#attribute-i-httponly)
True if this cookie is httponly; false otherwise

## name[RW] [](#attribute-i-name)
Name of this cookie, as a `String`

## path[RW] [](#attribute-i-path)
Path for which this cookie applies, as a `String`

## secure[RW] [](#attribute-i-secure)
True if this cookie is secure; false otherwise


#Instance Methods
## initialize(name"", *value) [](#method-i-initialize)
Create a new CGI::Cookie object.

:call-seq:
    Cookie.new(name_string,*value)
    Cookie.new(options_hash)

`name_string`
:   The name of the cookie; in this form, there is no #domain or #expiration. 
    The #path is gleaned from the `SCRIPT_NAME` environment variable, and
    #secure is false.

`*value`
:   value or list of values of the cookie

`options_hash`
:   A Hash of options to initialize this Cookie.  Possible options are:

    name
:       the name of the cookie.  Required.

    value
:       the cookie's value or list of values.

    path
:       the path for which this cookie applies.  Defaults to the value of the
        `SCRIPT_NAME` environment variable.

    domain
:       the domain for which this cookie applies.

    expires
:       the time at which this cookie expires, as a `Time` object.

    secure
:       whether this cookie is a secure cookie or not (default to false). 
        Secure cookies are only transmitted to HTTPS servers.

    httponly
:       whether this cookie is a HttpOnly cookie or not (default to

        false).  HttpOnly cookies are not available to javascript.

    These keywords correspond to attributes of the cookie object.


**@return** [Cookie] a new instance of Cookie

## inspect() [](#method-i-inspect)
A summary of cookie string.

## to_s() [](#method-i-to_s)
Convert the Cookie to its string representation.

## value() [](#method-i-value)
Returns the value or list of values for this cookie.

## value=(val) [](#method-i-value=)
Replaces the value of this cookie with a new value or list of values.

