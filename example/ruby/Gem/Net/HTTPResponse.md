# Class: Gem::Net::HTTPResponse
**Inherits:** Object
    
**Includes:** Gem::Net::HTTPHeader
  

This class is the base class for Gem::Net::HTTP response classes.

## About the Examples

:include: doc/net-http/examples.rdoc

## Returned Responses

Method Gem::Net::HTTP.get_response returns an instance of one of the
subclasses of Gem::Net::HTTPResponse:

    Gem::Net::HTTP.get_response(uri)
    # => #<Gem::Net::HTTPOK 200 OK readbody=true>
    Gem::Net::HTTP.get_response(hostname, '/nosuch')
    # => #<Gem::Net::HTTPNotFound 404 Not Found readbody=true>

As does method Gem::Net::HTTP#request:

    req = Gem::Net::HTTP::Get.new(uri)
    Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end # => #<Gem::Net::HTTPOK 200 OK readbody=true>

Class Gem::Net::HTTPResponse includes module Gem::Net::HTTPHeader, which
provides access to response header values via (among others):

*   Hash-like method `[]`.
*   Specific reader methods, such as `content_type`.

Examples:

    res = Gem::Net::HTTP.get_response(uri) # => #<Gem::Net::HTTPOK 200 OK readbody=true>
    res['Content-Type']               # => "text/html; charset=UTF-8"
    res.content_type                  # => "text/html"

## Response Subclasses

Class Gem::Net::HTTPResponse has a subclass for each [HTTP status
code](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes). You can look
up the response class for a given code:

    Gem::Net::HTTPResponse::CODE_TO_OBJ['200'] # => Gem::Net::HTTPOK
    Gem::Net::HTTPResponse::CODE_TO_OBJ['400'] # => Gem::Net::HTTPBadRequest
    Gem::Net::HTTPResponse::CODE_TO_OBJ['404'] # => Gem::Net::HTTPNotFound

And you can retrieve the status code for a response object:

    Gem::Net::HTTP.get_response(uri).code                 # => "200"
    Gem::Net::HTTP.get_response(hostname, '/nosuch').code # => "404"

The response subclasses (indentation shows class hierarchy):

*   Gem::Net::HTTPUnknownResponse (for unhandled HTTP extensions).

*   Gem::Net::HTTPInformation:

    *   Gem::Net::HTTPContinue (100)
    *   Gem::Net::HTTPSwitchProtocol (101)
    *   Gem::Net::HTTPProcessing (102)
    *   Gem::Net::HTTPEarlyHints (103)

*   Gem::Net::HTTPSuccess:

    *   Gem::Net::HTTPOK (200)
    *   Gem::Net::HTTPCreated (201)
    *   Gem::Net::HTTPAccepted (202)
    *   Gem::Net::HTTPNonAuthoritativeInformation (203)
    *   Gem::Net::HTTPNoContent (204)
    *   Gem::Net::HTTPResetContent (205)
    *   Gem::Net::HTTPPartialContent (206)
    *   Gem::Net::HTTPMultiStatus (207)
    *   Gem::Net::HTTPAlreadyReported (208)
    *   Gem::Net::HTTPIMUsed (226)

*   Gem::Net::HTTPRedirection:

    *   Gem::Net::HTTPMultipleChoices (300)
    *   Gem::Net::HTTPMovedPermanently (301)
    *   Gem::Net::HTTPFound (302)
    *   Gem::Net::HTTPSeeOther (303)
    *   Gem::Net::HTTPNotModified (304)
    *   Gem::Net::HTTPUseProxy (305)
    *   Gem::Net::HTTPTemporaryRedirect (307)
    *   Gem::Net::HTTPPermanentRedirect (308)

*   Gem::Net::HTTPClientError:

    *   Gem::Net::HTTPBadRequest (400)
    *   Gem::Net::HTTPUnauthorized (401)
    *   Gem::Net::HTTPPaymentRequired (402)
    *   Gem::Net::HTTPForbidden (403)
    *   Gem::Net::HTTPNotFound (404)
    *   Gem::Net::HTTPMethodNotAllowed (405)
    *   Gem::Net::HTTPNotAcceptable (406)
    *   Gem::Net::HTTPProxyAuthenticationRequired (407)
    *   Gem::Net::HTTPRequestTimeOut (408)
    *   Gem::Net::HTTPConflict (409)
    *   Gem::Net::HTTPGone (410)
    *   Gem::Net::HTTPLengthRequired (411)
    *   Gem::Net::HTTPPreconditionFailed (412)
    *   Gem::Net::HTTPRequestEntityTooLarge (413)
    *   Gem::Net::HTTPRequestURITooLong (414)
    *   Gem::Net::HTTPUnsupportedMediaType (415)
    *   Gem::Net::HTTPRequestedRangeNotSatisfiable (416)
    *   Gem::Net::HTTPExpectationFailed (417)
    *   Gem::Net::HTTPMisdirectedRequest (421)
    *   Gem::Net::HTTPUnprocessableEntity (422)
    *   Gem::Net::HTTPLocked (423)
    *   Gem::Net::HTTPFailedDependency (424)
    *   Gem::Net::HTTPUpgradeRequired (426)
    *   Gem::Net::HTTPPreconditionRequired (428)
    *   Gem::Net::HTTPTooManyRequests (429)
    *   Gem::Net::HTTPRequestHeaderFieldsTooLarge (431)
    *   Gem::Net::HTTPUnavailableForLegalReasons (451)

*   Gem::Net::HTTPServerError:

    *   Gem::Net::HTTPInternalServerError (500)
    *   Gem::Net::HTTPNotImplemented (501)
    *   Gem::Net::HTTPBadGateway (502)
    *   Gem::Net::HTTPServiceUnavailable (503)
    *   Gem::Net::HTTPGatewayTimeOut (504)
    *   Gem::Net::HTTPVersionNotSupported (505)
    *   Gem::Net::HTTPVariantAlsoNegotiates (506)
    *   Gem::Net::HTTPInsufficientStorage (507)
    *   Gem::Net::HTTPLoopDetected (508)
    *   Gem::Net::HTTPNotExtended (510)
    *   Gem::Net::HTTPNetworkAuthenticationRequired (511)

There is also the Gem::Net::HTTPBadResponse exception which is raised when
there is a protocol error.


# Class Methods
## body_permitted?() [](#method-c-body_permitted?)
true if the response has a body.
**@return** [Boolean] 

## exception_type() [](#method-c-exception_type)
:nodoc: internal use only
## read_new(sock ) [](#method-c-read_new)
:nodoc: internal use only
# Attributes
## body_encoding[RW] [](#attribute-i-body_encoding)
Returns the value set by body_encoding=, or `false` if none; see
#body_encoding=.

## code[RW] [](#attribute-i-code)
The HTTP result code string. For example, '302'.  You can also determine the
response type by examining which response subclass the response object is an
instance of.

## decode_content[RW] [](#attribute-i-decode_content)
Set to true automatically when the request did not contain an Accept-Encoding
header from the user.

## http_version[RW] [](#attribute-i-http_version)
The HTTP version supported by the server.

## ignore_eof[RW] [](#attribute-i-ignore_eof)
Whether to ignore EOF when reading bodies with a specified Content-Length
header.

## message[RW] [](#attribute-i-message)
The HTTP result message sent by the server. For example, 'Not Found'.

## uri[RW] [](#attribute-i-uri)
The Gem::URI used to fetch this response.  The response Gem::URI is only
available if a Gem::URI was used to create the request.


#Instance Methods
## [](key) [](#method-i-[])
Returns the string field value for the case-insensitive field `key`, or `nil`
if there is no such key; see [Fields](rdoc-ref:Gem::Net::HTTPHeader@Fields):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res['Connection'] # => "keep-alive"
    res['Nosuch']     # => nil

Note that some field values may be retrieved via convenience methods; see
[Getters](rdoc-ref:Gem::Net::HTTPHeader@Getters).

## []=(key, val) [](#method-i-[]=)
Sets the value for the case-insensitive `key` to `val`, overwriting the
previous value if the field exists; see
[Fields](rdoc-ref:Gem::Net::HTTPHeader@Fields):

    req = Gem::Net::HTTP::Get.new(uri)
    req['Accept'] # => "*/*"
    req['Accept'] = 'text/html'
    req['Accept'] # => "text/html"

Note that some field values may be set via convenience methods; see
[Setters](rdoc-ref:Gem::Net::HTTPHeader@Setters).

## add_field(key, val) [](#method-i-add_field)
Adds value `val` to the value array for field `key` if the field exists;
creates the field with the given `key` and `val` if it does not exist. see
[Fields](rdoc-ref:Gem::Net::HTTPHeader@Fields):

    req = Gem::Net::HTTP::Get.new(uri)
    req.add_field('Foo', 'bar')
    req['Foo']            # => "bar"
    req.add_field('Foo', 'baz')
    req['Foo']            # => "bar, baz"
    req.add_field('Foo', %w[baz bam])
    req['Foo']            # => "bar, baz, baz, bam"
    req.get_fields('Foo') # => ["bar", "baz", "baz", "bam"]

## basic_auth(account, password) [](#method-i-basic_auth)
Sets header `'Authorization'` using the given `account` and `password`
strings:

    req.basic_auth('my_account', 'my_password')
    req['Authorization']
    # => "Basic bXlfYWNjb3VudDpteV9wYXNzd29yZA=="

## body() [](#method-i-body)
Returns the string response body; note that repeated calls for the unmodified
body return a cached string:

    path = '/todos/1'
    Gem::Net::HTTP.start(hostname) do |http|
      res = http.get(path)
      p res.body
      p http.head(path).body # No body.
    end

Output:

    "{\n  \"userId\": 1,\n  \"id\": 1,\n  \"title\": \"delectus aut autem\",\n  \"completed\": false\n}"
    nil

## body=(value) [](#method-i-body=)
Sets the body of the response to the given value.

## chunked?() [](#method-i-chunked?)
Returns `true` if field `'Transfer-Encoding'` exists and has value
`'chunked'`, `false` otherwise; see [Transfer-Encoding response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#transfer-enco
ding-response-header):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res['Transfer-Encoding'] # => "chunked"
    res.chunked?             # => true

**@return** [Boolean] 

## code_type() [](#method-i-code_type)
response <-> exception relationship

## connection_close?() [](#method-i-connection_close?)
Returns whether the HTTP session is to be closed.

**@return** [Boolean] 

## connection_keep_alive?() [](#method-i-connection_keep_alive?)
Returns whether the HTTP session is to be kept alive.

**@return** [Boolean] 

## content_length() [](#method-i-content_length)
Returns the value of field `'Content-Length'` as an integer, or `nil` if there
is no such field; see [Content-Length request
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-lengt
h-request-header):

    res = Gem::Net::HTTP.get_response(hostname, '/nosuch/1')
    res.content_length # => 2
    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res.content_length # => nil

## content_length=(len) [](#method-i-content_length=)
Sets the value of field `'Content-Length'` to the given numeric; see
[Content-Length response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-lengt
h-response-header):

    _uri = uri.dup
    hostname = _uri.hostname           # => "jsonplaceholder.typicode.com"
    _uri.path = '/posts'               # => "/posts"
    req = Gem::Net::HTTP::Post.new(_uri)    # => #<Gem::Net::HTTP::Post POST>
    req.body = '{"title": "foo","body": "bar","userId": 1}'
    req.content_length = req.body.size # => 42
    req.content_type = 'application/json'
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end # => #<Gem::Net::HTTPCreated 201 Created readbody=true>

## content_range() [](#method-i-content_range)
Returns a Range object representing the value of field `'Content-Range'`, or
`nil` if no such field exists; see [Content-Range response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-range
-response-header):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res['Content-Range'] # => nil
    res['Content-Range'] = 'bytes 0-499/1000'
    res['Content-Range'] # => "bytes 0-499/1000"
    res.content_range    # => 0..499

## content_type() [](#method-i-content_type)
Returns the [media type](https://en.wikipedia.org/wiki/Media_type) from the
value of field `'Content-Type'`, or `nil` if no such field exists; see
[Content-Type response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-type-
response-header):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res['content-type'] # => "application/json; charset=utf-8"
    res.content_type    # => "application/json"

## delete(key) [](#method-i-delete)
Removes the header for the given case-insensitive `key` (see
[Fields](rdoc-ref:Gem::Net::HTTPHeader@Fields)); returns the deleted value, or
`nil` if no such field exists:

    req = Gem::Net::HTTP::Get.new(uri)
    req.delete('Accept') # => ["*/*"]
    req.delete('Nosuch') # => nil

## each_capitalized() [](#method-i-each_capitalized)
Like #each_header, but the keys are returned in capitalized form.

Gem::Net::HTTPHeader#canonical_each is an alias for
Gem::Net::HTTPHeader#each_capitalized.

## each_capitalized_name() [](#method-i-each_capitalized_name)
Calls the block with each capitalized field name:

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res.each_capitalized_name do |key|
      p key if key.start_with?('C')
    end

Output:

    "Content-Type"
    "Connection"
    "Cache-Control"
    "Cf-Cache-Status"
    "Cf-Ray"

The capitalization is system-dependent; see [Case
Mapping](https://docs.ruby-lang.org/en/master/case_mapping_rdoc.html).

Returns an enumerator if no block is given.

## each_header() [](#method-i-each_header)
Calls the block with each key/value pair:

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res.each_header do |key, value|
      p [key, value] if key.start_with?('c')
    end

Output:

    ["content-type", "application/json; charset=utf-8"]
    ["connection", "keep-alive"]
    ["cache-control", "max-age=43200"]
    ["cf-cache-status", "HIT"]
    ["cf-ray", "771d17e9bc542cf5-ORD"]

Returns an enumerator if no block is given.

Gem::Net::HTTPHeader#each is an alias for Gem::Net::HTTPHeader#each_header.

## each_name(&block) [](#method-i-each_name)
Calls the block with each field key:

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res.each_key do |key|
      p key if key.start_with?('c')
    end

Output:

    "content-type"
    "connection"
    "cache-control"
    "cf-cache-status"
    "cf-ray"

Returns an enumerator if no block is given.

Gem::Net::HTTPHeader#each_name is an alias for Gem::Net::HTTPHeader#each_key.

## each_value() [](#method-i-each_value)
Calls the block with each string field value:

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res.each_value do |value|
      p value if value.start_with?('c')
    end

Output:

    "chunked"
    "cf-q-config;dur=6.0000002122251e-06"
    "cloudflare"

Returns an enumerator if no block is given.

## error!() [](#method-i-error!)
:nodoc:

**@raise** [error_type()] 

## error_type() [](#method-i-error_type)
:nodoc:

## fetch(key, *args, &block) [](#method-i-fetch)
call-seq:
    fetch(key, default_val = nil) {|key| ... } -> object
    fetch(key, default_val = nil) -> value or default_val

With a block, returns the string value for `key` if it exists; otherwise
returns the value of the block; ignores the `default_val`; see
[Fields](rdoc-ref:Gem::Net::HTTPHeader@Fields):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')

    # Field exists; block not called.
    res.fetch('Connection') do |value|
      fail 'Cannot happen'
    end # => "keep-alive"

    # Field does not exist; block called.
    res.fetch('Nosuch') do |value|
      value.downcase
    end # => "nosuch"

With no block, returns the string value for `key` if it exists; otherwise,
returns `default_val` if it was given; otherwise raises an exception:

    res.fetch('Connection', 'Foo') # => "keep-alive"
    res.fetch('Nosuch', 'Foo')     # => "Foo"
    res.fetch('Nosuch')            # Raises KeyError.

## get_fields(key) [](#method-i-get_fields)
Returns the array field value for the given `key`, or `nil` if there is no
such field; see [Fields](rdoc-ref:Gem::Net::HTTPHeader@Fields):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res.get_fields('Connection') # => ["keep-alive"]
    res.get_fields('Nosuch')     # => nil

## header() [](#method-i-header)
:nodoc:

## initialize(httpv, code, msg) [](#method-i-initialize)
:nodoc: internal use only

**@return** [HTTPResponse] a new instance of HTTPResponse

## initialize_http_header(initheader) [](#method-i-initialize_http_header)
:nodoc:

## inspect() [](#method-i-inspect)

## key?(key) [](#method-i-key?)
Returns `true` if the field for the case-insensitive `key` exists, `false`
otherwise:

    req = Gem::Net::HTTP::Get.new(uri)
    req.key?('Accept') # => true
    req.key?('Nosuch') # => false

**@return** [Boolean] 

## main_type() [](#method-i-main_type)
Returns the leading ('type') part of the [media
type](https://en.wikipedia.org/wiki/Media_type) from the value of field
`'Content-Type'`, or `nil` if no such field exists; see [Content-Type response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-type-
response-header):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res['content-type'] # => "application/json; charset=utf-8"
    res.main_type       # => "application"

## proxy_basic_auth(account, password) [](#method-i-proxy_basic_auth)
Sets header `'Proxy-Authorization'` using the given `account` and `password`
strings:

    req.proxy_basic_auth('my_account', 'my_password')
    req['Proxy-Authorization']
    # => "Basic bXlfYWNjb3VudDpteV9wYXNzd29yZA=="

## range() [](#method-i-range)
Returns an array of Range objects that represent the value of field `'Range'`,
or `nil` if there is no such field; see [Range request
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#range-request
-header):

    req = Gem::Net::HTTP::Get.new(uri)
    req['Range'] = 'bytes=0-99,200-299,400-499'
    req.range # => [0..99, 200..299, 400..499]
    req.delete('Range')
    req.range # # => nil

## range_length() [](#method-i-range_length)
Returns the integer representing length of the value of field
`'Content-Range'`, or `nil` if no such field exists; see [Content-Range
response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-range
-response-header):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res['Content-Range'] # => nil
    res['Content-Range'] = 'bytes 0-499/1000'
    res.range_length     # => 500

## read_body(destnil, &block) [](#method-i-read_body)
Gets the entity body returned by the remote HTTP server.

If a block is given, the body is passed to the block, and the body is provided
in fragments, as it is read in from the socket.

If `dest` argument is given, response is read into that variable, with
`dest#<<` method (it could be String or IO, or any other object responding to
`<<`).

Calling this method a second or subsequent time for the same HTTPResponse
object will return the value already read.

    http.request_get('/index.html') {|res|
      puts res.read_body
    }

    http.request_get('/index.html') {|res|
      p res.read_body.object_id   # 538149362
      p res.read_body.object_id   # 538149362
    }

    # using iterator
    http.request_get('/index.html') {|res|
      res.read_body do |segment|
        print segment
      end
    }

## read_header() [](#method-i-read_header)
:nodoc:

## reading_body(sock, reqmethodallowbody) [](#method-i-reading_body)
body

## response() [](#method-i-response)
header (for backward compatibility only; DO NOT USE)

## set_content_type(type, params{}) [](#method-i-set_content_type)
Sets the value of field `'Content-Type'`; returns the new value; see
[Content-Type request
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-type-
request-header):

    req = Gem::Net::HTTP::Get.new(uri)
    req.set_content_type('application/json') # => ["application/json"]

Gem::Net::HTTPHeader#content_type= is an alias for
Gem::Net::HTTPHeader#set_content_type.

## set_form(params, enctype'application/x-www-form-urlencoded', formopt{}) [](#method-i-set_form)
Stores form data to be used in a `POST` or `PUT` request.

The form data given in `params` consists of zero or more fields; each field
is:

*   A scalar value.
*   A name/value pair.
*   An IO stream opened for reading.

Argument `params` should be an
[Enumerable](https://docs.ruby-lang.org/en/master/Enumerable.html#module-Enume
rable-label-Enumerable+in+Ruby+Classes) (method `params.map` will be called),
and is often an array or hash.

First, we set up a request:

    _uri = uri.dup
    _uri.path ='/posts'
    req = Gem::Net::HTTP::Post.new(_uri)

**Argument `params` As an Array**

When `params` is an array, each of its elements is a subarray that defines a
field; the subarray may contain:

*   One string:

        req.set_form([['foo'], ['bar'], ['baz']])

*   Two strings:

        req.set_form([%w[foo 0], %w[bar 1], %w[baz 2]])

*   When argument `enctype` (see below) is given as `'multipart/form-data'`:

    *   A string name and an IO stream opened for reading:

            require 'stringio'
            req.set_form([['file', StringIO.new('Ruby is cool.')]])

    *   A string name, an IO stream opened for reading, and an options hash,
        which may contain these entries:

        *   `:filename`: The name of the file to use.
        *   `:content_type`: The content type of the uploaded file.

        Example:

            req.set_form([['file', file, {filename: "other-filename.foo"}]]

The various forms may be mixed:

    req.set_form(['foo', %w[bar 1], ['file', file]])

**Argument `params` As a Hash**

When `params` is a hash, each of its entries is a name/value pair that defines
a field:

*   The name is a string.
*   The value may be:

    *   `nil`.
    *   Another string.
    *   An IO stream opened for reading (only when argument `enctype` -- see
        below -- is given as `'multipart/form-data'`).

Examples:

    # Nil-valued fields.
    req.set_form({'foo' => nil, 'bar' => nil, 'baz' => nil})

    # String-valued fields.
    req.set_form({'foo' => 0, 'bar' => 1, 'baz' => 2})

    # IO-valued field.
    require 'stringio'
    req.set_form({'file' => StringIO.new('Ruby is cool.')})

    # Mixture of fields.
    req.set_form({'foo' => nil, 'bar' => 1, 'file' => file})

Optional argument `enctype` specifies the value to be given to field
`'Content-Type'`, and must be one of:

*   `'application/x-www-form-urlencoded'` (the default).
*   `'multipart/form-data'`; see [RFC
    7578](https://www.rfc-editor.org/rfc/rfc7578).

Optional argument `formopt` is a hash of options (applicable only when
argument `enctype` is `'multipart/form-data'`) that may include the following
entries:

*   `:boundary`: The value is the boundary string for the multipart message.
    If not given, the boundary is a random string. See
    [Boundary](https://www.rfc-editor.org/rfc/rfc7578#section-4.1).
*   `:charset`: Value is the character set for the form submission. Field
    names and values of non-file fields should be encoded with this charset.

## set_form_data(params, sep'&') [](#method-i-set_form_data)
Sets the request body to a URL-encoded string derived from argument `params`,
and sets request header field `'Content-Type'` to
`'application/x-www-form-urlencoded'`.

The resulting request is suitable for HTTP request `POST` or `PUT`.

Argument `params` must be suitable for use as argument `enum` to
[Gem::URI.encode_www_form](https://docs.ruby-lang.org/en/master/Gem::URI.html#
method-c-encode_www_form).

With only argument `params` given, sets the body to a URL-encoded string with
the default separator `'&'`:

    req = Gem::Net::HTTP::Post.new('example.com')

    req.set_form_data(q: 'ruby', lang: 'en')
    req.body            # => "q=ruby&lang=en"
    req['Content-Type'] # => "application/x-www-form-urlencoded"

    req.set_form_data([['q', 'ruby'], ['lang', 'en']])
    req.body            # => "q=ruby&lang=en"

    req.set_form_data(q: ['ruby', 'perl'], lang: 'en')
    req.body            # => "q=ruby&q=perl&lang=en"

    req.set_form_data([['q', 'ruby'], ['q', 'perl'], ['lang', 'en']])
    req.body            # => "q=ruby&q=perl&lang=en"

With string argument `sep` also given, uses that string as the separator:

    req.set_form_data({q: 'ruby', lang: 'en'}, '|')
    req.body # => "q=ruby|lang=en"

Gem::Net::HTTPHeader#form_data= is an alias for
Gem::Net::HTTPHeader#set_form_data.

## set_range(r, enil) [](#method-i-set_range)
call-seq:
    set_range(length) -> length
    set_range(offset, length) -> range
    set_range(begin..length) -> range

Sets the value for field `'Range'`; see [Range request
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#range-request
-header):

With argument `length`:

    req = Gem::Net::HTTP::Get.new(uri)
    req.set_range(100)      # => 100
    req['Range']            # => "bytes=0-99"

With arguments `offset` and `length`:

    req.set_range(100, 100) # => 100...200
    req['Range']            # => "bytes=100-199"

With argument `range`:

    req.set_range(100..199) # => 100..199
    req['Range']            # => "bytes=100-199"

Gem::Net::HTTPHeader#range= is an alias for Gem::Net::HTTPHeader#set_range.

## size() [](#method-i-size)
:nodoc: obsolete

## sub_type() [](#method-i-sub_type)
Returns the trailing ('subtype') part of the [media
type](https://en.wikipedia.org/wiki/Media_type) from the value of field
`'Content-Type'`, or `nil` if no such field exists; see [Content-Type response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-type-
response-header):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res['content-type'] # => "application/json; charset=utf-8"
    res.sub_type        # => "json"

## to_hash() [](#method-i-to_hash)
Returns a hash of the key/value pairs:

    req = Gem::Net::HTTP::Get.new(uri)
    req.to_hash
    # =>
    {"accept-encoding"=>["gzip;q=1.0,deflate;q=0.6,identity;q=0.3"],
     "accept"=>["*/*"],
     "user-agent"=>["Ruby"],
     "host"=>["jsonplaceholder.typicode.com"]}

## type_params() [](#method-i-type_params)
Returns the trailing ('parameters') part of the value of field
`'Content-Type'`, or `nil` if no such field exists; see [Content-Type response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-type-
response-header):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
    res['content-type'] # => "application/json; charset=utf-8"
    res.type_params     # => {"charset"=>"utf-8"}

## value() [](#method-i-value)
Raises an HTTP error if the response is not 2xx (success).

