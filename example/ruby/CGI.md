# Class: CGI
**Inherits:** Object
  
**Extended by:** CGI::Util
    
**Includes:** CGI::Util
  

-- Methods for generating HTML, parsing CGI-related parameters, and generating
HTTP responses. ++


# Class Methods
## accept_charset() [](#method-c-accept_charset)
Return the accept character set for all new CGI instances.
## accept_charset=(accept_charset ) [](#method-c-accept_charset=)
Set the accept character set for all new CGI instances.
## escape(string ) [](#method-c-escape)
URL-encode a string into application/x-www-form-urlencoded. Space characters
(+" "+) are encoded with plus signs (+"+"+)
    url_encoded_string = CGI.escape("'Stop!' said Fred")
       # => "%27Stop%21%27+said+Fred"
## escapeElement(string , *elements ) [](#method-c-escapeElement)
Escape only the tags of certain HTML elements in `string`.

Takes an element or elements or array of elements.  Each element is specified
by the name of the element, without angle brackets. This matches both the
start and the end tag of that element. The attribute list of the open tag will
also be escaped (for instance, the double-quotes surrounding attribute
values).

    print CGI.escapeElement('<BR><A HREF="url"></A>', "A", "IMG")
      # "<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt"

    print CGI.escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"])
      # "<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt"
## escapeHTML(string ) [](#method-c-escapeHTML)
Escape special characters in HTML, namely '&"<>
    CGI.escapeHTML('Usage: foo "bar" <baz>')
       # => "Usage: foo &quot;bar&quot; &lt;baz&gt;"
## escapeURIComponent(string ) [](#method-c-escapeURIComponent)
URL-encode a string following RFC 3986 Space characters (+" "+) are encoded
with (+"%20"+)
    url_encoded_string = CGI.escapeURIComponent("'Stop!' said Fred")
       # => "%27Stop%21%27%20said%20Fred"
## parse(query ) [](#method-c-parse)
Parse an HTTP query string into a hash of key=>value pairs.

    params = CGI.parse("query_string")
      # {"name1" => ["value1", "value2", ...],
      #  "name2" => ["value1", "value2", ...], ... }
## pretty(string , shift "  ") [](#method-c-pretty)
Prettify (indent) an HTML string.

`string` is the HTML string to indent.  `shift` is the indentation unit to
use; it defaults to two spaces.

    print CGI.pretty("<HTML><BODY></BODY></HTML>")
      # <HTML>
      #   <BODY>
      #   </BODY>
      # </HTML>

    print CGI.pretty("<HTML><BODY></BODY></HTML>", "\t")
      # <HTML>
      #         <BODY>
      #         </BODY>
      # </HTML>
## rfc1123_date(time ) [](#method-c-rfc1123_date)
Format a `Time` object as a String using the format specified by RFC 1123.

    CGI.rfc1123_date(Time.now)
      # Sat, 01 Jan 2000 00:00:00 GMT
## unescape(string , encoding @@accept_charset) [](#method-c-unescape)
URL-decode an application/x-www-form-urlencoded string with
encoding(optional).
    string = CGI.unescape("%27Stop%21%27+said+Fred")
       # => "'Stop!' said Fred"
## unescapeElement(string , *elements ) [](#method-c-unescapeElement)
Undo escaping such as that done by CGI.escapeElement()

    print CGI.unescapeElement(
            CGI.escapeHTML('<BR><A HREF="url"></A>'), "A", "IMG")
      # "&lt;BR&gt;<A HREF="url"></A>"

    print CGI.unescapeElement(
            CGI.escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"])
      # "&lt;BR&gt;<A HREF="url"></A>"
## unescapeHTML(string ) [](#method-c-unescapeHTML)
Unescape a string that has been HTML-escaped
    CGI.unescapeHTML("Usage: foo &quot;bar&quot; &lt;baz&gt;")
       # => "Usage: foo \"bar\" <baz>"
## unescapeURIComponent(string , encoding @@accept_charset) [](#method-c-unescapeURIComponent)
URL-decode a string following RFC 3986 with encoding(optional).
    string = CGI.unescapeURIComponent("%27Stop%21%27+said%20Fred")
       # => "'Stop!'+said Fred"
# Attributes
## accept_charset[RW] [](#attribute-i-accept_charset)
Return the accept character set for this CGI instance.


#Instance Methods
## escape(string) [](#method-i-escape)
URL-encode a string into application/x-www-form-urlencoded. Space characters
(+" "+) are encoded with plus signs (+"+"+)
    url_encoded_string = CGI.escape("'Stop!' said Fred")
       # => "%27Stop%21%27+said+Fred"

## escapeElement(string, *elements) [](#method-i-escapeElement)
Escape only the tags of certain HTML elements in `string`.

Takes an element or elements or array of elements.  Each element is specified
by the name of the element, without angle brackets. This matches both the
start and the end tag of that element. The attribute list of the open tag will
also be escaped (for instance, the double-quotes surrounding attribute
values).

    print CGI.escapeElement('<BR><A HREF="url"></A>', "A", "IMG")
      # "<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt"

    print CGI.escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"])
      # "<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt"

## escapeHTML(string) [](#method-i-escapeHTML)
Escape special characters in HTML, namely '&"<>
    CGI.escapeHTML('Usage: foo "bar" <baz>')
       # => "Usage: foo &quot;bar&quot; &lt;baz&gt;"

## escapeURIComponent(string) [](#method-i-escapeURIComponent)
URL-encode a string following RFC 3986 Space characters (+" "+) are encoded
with (+"%20"+)
    url_encoded_string = CGI.escapeURIComponent("'Stop!' said Fred")
       # => "%27Stop%21%27%20said%20Fred"

## http_header(options'text/html') [](#method-i-http_header)
Create an HTTP header block as a string.

:call-seq:
    http_header(content_type_string="text/html")
    http_header(headers_hash)

Includes the empty line that ends the header block.

`content_type_string`
:   If this form is used, this string is the `Content-Type`

`headers_hash`
:   A Hash of header values. The following header keys are recognized:

    type
:       The Content-Type header.  Defaults to "text/html"

    charset
:       The charset of the body, appended to the Content-Type header.

    nph
:       A boolean value.  If true, prepend protocol string and status code,
        and date; and sets default values for "server" and "connection" if not
        explicitly set.

    status
:       The HTTP status code as a String, returned as the Status header.  The
        values are:

        OK
:           200 OK

        PARTIAL_CONTENT
:           206 Partial Content

        MULTIPLE_CHOICES
:           300 Multiple Choices

        MOVED
:           301 Moved Permanently

        REDIRECT
:           302 Found

        NOT_MODIFIED
:           304 Not Modified

        BAD_REQUEST
:           400 Bad Request

        AUTH_REQUIRED
:           401 Authorization Required

        FORBIDDEN
:           403 Forbidden

        NOT_FOUND
:           404 Not Found

        METHOD_NOT_ALLOWED
:           405 Method Not Allowed

        NOT_ACCEPTABLE
:           406 Not Acceptable

        LENGTH_REQUIRED
:           411 Length Required

        PRECONDITION_FAILED
:           412 Precondition Failed

        SERVER_ERROR
:           500 Internal Server Error

        NOT_IMPLEMENTED
:           501 Method Not Implemented

        BAD_GATEWAY
:           502 Bad Gateway

        VARIANT_ALSO_VARIES
:           506 Variant Also Negotiates



    server
:       The server software, returned as the Server header.

    connection
:       The connection type, returned as the Connection header (for instance,
        "close".

    length
:       The length of the content that will be sent, returned as the
        Content-Length header.

    language
:       The language of the content, returned as the Content-Language header.

    expires
:       The time on which the current content expires, as a `Time` object,
        returned as the Expires header.

    cookie
:       A cookie or cookies, returned as one or more Set-Cookie headers.  The
        value can be the literal string of the cookie; a CGI::Cookie object;
        an Array of literal cookie strings or Cookie objects; or a hash all of
        whose values are literal cookie strings or Cookie objects.

        These cookies are in addition to the cookies held in the
        @output_cookies field.


    Other headers can also be set; they are appended as key: value.


Examples:

    http_header
      # Content-Type: text/html

    http_header("text/plain")
      # Content-Type: text/plain

    http_header("nph"        => true,
                "status"     => "OK",  # == "200 OK"
                  # "status"     => "200 GOOD",
                "server"     => ENV['SERVER_SOFTWARE'],
                "connection" => "close",
                "type"       => "text/html",
                "charset"    => "iso-2022-jp",
                  # Content-Type: text/html; charset=iso-2022-jp
                "length"     => 103,
                "language"   => "ja",
                "expires"    => Time.now + 30,
                "cookie"     => [cookie1, cookie2],
                "my_header1" => "my_value",
                "my_header2" => "my_value")

This method does not perform charset conversion.

## initialize(options{}, &block) [](#method-i-initialize)
Create a new CGI instance.

:call-seq:
    CGI.new(tag_maker) { block }
    CGI.new(options_hash = {}) { block }

`tag_maker`
:   This is the same as using the `options_hash` form with the value `{
    :tag_maker => tag_maker }` Note that it is recommended to use the
    `options_hash` form, since it also allows you specify the charset you will
    accept.

`options_hash`
:   A Hash that recognizes three options:

    `:accept_charset`
:       specifies encoding of received query string.  If omitted,
        `@@accept_charset` is used.  If the encoding is not valid, a
        CGI::InvalidEncoding will be raised.

        Example. Suppose `@@accept_charset` is "UTF-8"

        when not specified:

            cgi=CGI.new      # @accept_charset # => "UTF-8"

        when specified as "EUC-JP":

            cgi=CGI.new(:accept_charset => "EUC-JP") # => "EUC-JP"


    `:tag_maker`
:       String that specifies which version of the HTML generation methods to
        use.  If not specified, no HTML generation methods will be loaded.

        The following values are supported:

        "html3"
:           HTML 3.x

        "html4"
:           HTML 4.0

        "html4Tr"
:           HTML 4.0 Transitional

        "html4Fr"
:           HTML 4.0 with Framesets

        "html5"
:           HTML 5



    `:max_multipart_length`
:       Specifies maximum length of multipart data. Can be an Integer scalar
        or a lambda, that will be evaluated when the request is parsed. This
        allows more complex logic to be set when determining whether to accept
        multipart data (e.g. consult a registered users upload allowance)

        Default is 128 * 1024 * 1024 bytes

            cgi=CGI.new(:max_multipart_length => 268435456) # simple scalar

            cgi=CGI.new(:max_multipart_length => -> {check_filesystem}) # lambda



`block`
:   If provided, the block is called when an invalid encoding is encountered.
    For example:

        encoding_errors={}
        cgi=CGI.new(:accept_charset=>"EUC-JP") do |name,value|
          encoding_errors[name] = value
        end


Finally, if the CGI object is not created in a standard CGI call environment
(that is, it can't locate REQUEST_METHOD in its environment), then it will run
in "offline" mode.  In this mode, it reads its parameters from the command
line or (failing that) from standard input.  Otherwise, cookies and other
parameters are parsed automatically from the standard CGI locations, which
varies according to the REQUEST_METHOD.

**@return** [CGI] a new instance of CGI

## nph?() [](#method-i-nph?)
:nodoc:

**@return** [Boolean] 

## out(options"text/html") [](#method-i-out)
Print an HTTP header and body to $DEFAULT_OUTPUT ($>)

:call-seq:
    cgi.out(content_type_string='text/html')
    cgi.out(headers_hash)

`content_type_string`
:   If a string is passed, it is assumed to be the content type.

`headers_hash`
:   This is a Hash of headers, similar to that used by #http_header.

`block`
:   A block is required and should evaluate to the body of the response.


`Content-Length` is automatically calculated from the size of the String
returned by the content block.

If `ENV['REQUEST_METHOD'] == "HEAD"`, then only the header is output (the
content block is still required, but it is ignored).

If the charset is "iso-2022-jp" or "euc-jp" or "shift_jis" then the content is
converted to this charset, and the language is set to "ja".

Example:

    cgi = CGI.new
    cgi.out{ "string" }
      # Content-Type: text/html
      # Content-Length: 6
      #
      # string

    cgi.out("text/plain") { "string" }
      # Content-Type: text/plain
      # Content-Length: 6
      #
      # string

    cgi.out("nph"        => true,
            "status"     => "OK",  # == "200 OK"
            "server"     => ENV['SERVER_SOFTWARE'],
            "connection" => "close",
            "type"       => "text/html",
            "charset"    => "iso-2022-jp",
              # Content-Type: text/html; charset=iso-2022-jp
            "language"   => "ja",
            "expires"    => Time.now + (3600 * 24 * 30),
            "cookie"     => [cookie1, cookie2],
            "my_header1" => "my_value",
            "my_header2" => "my_value") { "string" }
       # HTTP/1.1 200 OK
       # Date: Sun, 15 May 2011 17:35:54 GMT
       # Server: Apache 2.2.0
       # Connection: close
       # Content-Type: text/html; charset=iso-2022-jp
       # Content-Length: 6
       # Content-Language: ja
       # Expires: Tue, 14 Jun 2011 17:35:54 GMT
       # Set-Cookie: foo
       # Set-Cookie: bar
       # my_header1: my_value
       # my_header2: my_value
       #
       # string

## pretty(string, shift"  ") [](#method-i-pretty)
Prettify (indent) an HTML string.

`string` is the HTML string to indent.  `shift` is the indentation unit to
use; it defaults to two spaces.

    print CGI.pretty("<HTML><BODY></BODY></HTML>")
      # <HTML>
      #   <BODY>
      #   </BODY>
      # </HTML>

    print CGI.pretty("<HTML><BODY></BODY></HTML>", "\t")
      # <HTML>
      #         <BODY>
      #         </BODY>
      # </HTML>

## print(*options) [](#method-i-print)
Print an argument or list of arguments to the default output stream

    cgi = CGI.new
    cgi.print    # default:  cgi.print == $DEFAULT_OUTPUT.print

## rfc1123_date(time) [](#method-i-rfc1123_date)
Format a `Time` object as a String using the format specified by RFC 1123.

    CGI.rfc1123_date(Time.now)
      # Sat, 01 Jan 2000 00:00:00 GMT

## unescape(string, encoding@@accept_charset) [](#method-i-unescape)
URL-decode an application/x-www-form-urlencoded string with
encoding(optional).
    string = CGI.unescape("%27Stop%21%27+said+Fred")
       # => "'Stop!' said Fred"

## unescapeElement(string, *elements) [](#method-i-unescapeElement)
Undo escaping such as that done by CGI.escapeElement()

    print CGI.unescapeElement(
            CGI.escapeHTML('<BR><A HREF="url"></A>'), "A", "IMG")
      # "&lt;BR&gt;<A HREF="url"></A>"

    print CGI.unescapeElement(
            CGI.escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"])
      # "&lt;BR&gt;<A HREF="url"></A>"

## unescapeHTML(string) [](#method-i-unescapeHTML)
Unescape a string that has been HTML-escaped
    CGI.unescapeHTML("Usage: foo &quot;bar&quot; &lt;baz&gt;")
       # => "Usage: foo \"bar\" <baz>"

## unescapeURIComponent(string, encoding@@accept_charset) [](#method-i-unescapeURIComponent)
URL-decode a string following RFC 3986 with encoding(optional).
    string = CGI.unescapeURIComponent("%27Stop%21%27+said%20Fred")
       # => "'Stop!'+said Fred"

