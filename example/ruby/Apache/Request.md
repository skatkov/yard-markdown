# Class: Apache::Request
**Inherits:** Object
    



# Attributes
## args[RW] [](#attribute-i-args)
Returns the value of attribute args.

## content_encoding[RW] [](#attribute-i-content_encoding)
Returns the value of attribute content_encoding.

## content_type[RW] [](#attribute-i-content_type)
Returns the value of attribute content_type.

## headers_out[RW] [](#attribute-i-headers_out)
Returns the value of attribute headers_out.

## status[RW] [](#attribute-i-status)
Returns the value of attribute status.

## status_line[RW] [](#attribute-i-status_line)
Returns the value of attribute status_line.


#Instance Methods
## _send_http_header_invoked?() [](#method-i-_send_http_header_invoked?)

**@return** [Boolean] 

## _setup_cgi_env_invoked?() [](#method-i-_setup_cgi_env_invoked?)

**@return** [Boolean] 

## initialize() [](#method-i-initialize)

**@return** [Request] a new instance of Request

## send_http_header() [](#method-i-send_http_header)
def args
    return ENV['QUERY_STRING']

end

## setup_cgi_env() [](#method-i-setup_cgi_env)

