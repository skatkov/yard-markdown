# Class: Net::HTTPGenericRequest
**Inherits:** Object
    
**Includes:** Net::HTTPHeader
  

HTTPGenericRequest is the parent of the Net::HTTPRequest class.

Do not use this directly; instead, use a subclass of Net::HTTPRequest.

## About the Examples

:include: doc/net-http/examples.rdoc


# Attributes
## body[RW] [](#attribute-i-body)
Returns the string body for the request, or `nil` if there is none:

    req = Net::HTTP::Post.new(uri)
    req.body # => nil
    req.body = '{"title": "foo","body": "bar","userId": 1}'
    req.body # => "{\"title\": \"foo\",\"body\": \"bar\",\"userId\": 1}"

## body_stream[RW] [](#attribute-i-body_stream)
Returns the body stream object for the request, or `nil` if there is none:

    req = Net::HTTP::Post.new(uri)          # => #<Net::HTTP::Post POST>
    req.body_stream                         # => nil
    require 'stringio'
    req.body_stream = StringIO.new('xyzzy') # => #<StringIO:0x0000027d1e5affa8>
    req.body_stream                         # => #<StringIO:0x0000027d1e5affa8>

## decode_content[RW] [](#attribute-i-decode_content)
Returns `false` if the request's header `'Accept-Encoding'` has been set
manually or deleted (indicating that the user intends to handle encoding in
the response), `true` otherwise:

    req = Net::HTTP::Get.new(uri) # => #<Net::HTTP::Get GET>
    req['Accept-Encoding']        # => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"
    req.decode_content            # => true
    req['Accept-Encoding'] = 'foo'
    req.decode_content            # => false
    req.delete('Accept-Encoding')
    req.decode_content            # => false

## method[RW] [](#attribute-i-method)
Returns the string method name for the request:

    Net::HTTP::Get.new(uri).method  # => "GET"
    Net::HTTP::Post.new(uri).method # => "POST"

## path[RW] [](#attribute-i-path)
Returns the string path for the request:

    Net::HTTP::Get.new(uri).path # => "/"
    Net::HTTP::Post.new('example.com').path # => "example.com"

## uri[RW] [](#attribute-i-uri)
Returns the URI object for the request, or `nil` if none:

    Net::HTTP::Get.new(uri).uri
    # => #<URI::HTTPS https://jsonplaceholder.typicode.com/>
    Net::HTTP::Get.new('example.com').uri # => nil


#Instance Methods
## [](key) [](#method-i-[])
Returns the string field value for the case-insensitive field `key`, or `nil`
if there is no such key; see [Fields](rdoc-ref:Net::HTTPHeader@Fields):

    res = Net::HTTP.get_response(hostname, '/todos/1')
    res['Connection'] # => "keep-alive"
    res['Nosuch']     # => nil

Note that some field values may be retrieved via convenience methods; see
[Getters](rdoc-ref:Net::HTTPHeader@Getters).

## []=(key, val) [](#method-i-[]=)
Don't automatically decode response content-encoding if the user indicates
they want to handle it.

## add_field(key, val) [](#method-i-add_field)
Adds value `val` to the value array for field `key` if the field exists;
creates the field with the given `key` and `val` if it does not exist. see
[Fields](rdoc-ref:Net::HTTPHeader@Fields):

    req = Net::HTTP::Get.new(uri)
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

## body_exist?() [](#method-i-body_exist?)
:nodoc:

**@return** [Boolean] 

## chunked?() [](#method-i-chunked?)
Returns `true` if field `'Transfer-Encoding'` exists and has value
`'chunked'`, `false` otherwise; see [Transfer-Encoding response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#transfer-enco
ding-response-header):

    res = Net::HTTP.get_response(hostname, '/todos/1')
    res['Transfer-Encoding'] # => "chunked"
    res.chunked?             # => true

**@return** [Boolean] 

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

    res = Net::HTTP.get_response(hostname, '/nosuch/1')
    res.content_length # => 2
    res = Net::HTTP.get_response(hostname, '/todos/1')
    res.content_length # => nil

## content_length=(len) [](#method-i-content_length=)
Sets the value of field `'Content-Length'` to the given numeric; see
[Content-Length response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-lengt
h-response-header):

    _uri = uri.dup
    hostname = _uri.hostname           # => "jsonplaceholder.typicode.com"
    _uri.path = '/posts'               # => "/posts"
    req = Net::HTTP::Post.new(_uri)    # => #<Net::HTTP::Post POST>
    req.body = '{"title": "foo","body": "bar","userId": 1}'
    req.content_length = req.body.size # => 42
    req.content_type = 'application/json'
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end # => #<Net::HTTPCreated 201 Created readbody=true>

## content_range() [](#method-i-content_range)
Returns a Range object representing the value of field `'Content-Range'`, or
`nil` if no such field exists; see [Content-Range response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-range
-response-header):

    res = Net::HTTP.get_response(hostname, '/todos/1')
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

    res = Net::HTTP.get_response(hostname, '/todos/1')
    res['content-type'] # => "application/json; charset=utf-8"
    res.content_type    # => "application/json"

## delete(key) [](#method-i-delete)
Removes the header for the given case-insensitive `key` (see
[Fields](rdoc-ref:Net::HTTPHeader@Fields)); returns the deleted value, or
`nil` if no such field exists:

    req = Net::HTTP::Get.new(uri)
    req.delete('Accept') # => ["*/*"]
    req.delete('Nosuch') # => nil

## each_capitalized() [](#method-i-each_capitalized)
Like #each_header, but the keys are returned in capitalized form.

Net::HTTPHeader#canonical_each is an alias for
Net::HTTPHeader#each_capitalized.

## each_capitalized_name() [](#method-i-each_capitalized_name)
Calls the block with each capitalized field name:

    res = Net::HTTP.get_response(hostname, '/todos/1')
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
Mapping](rdoc-ref:case_mapping.rdoc).

Returns an enumerator if no block is given.

## each_header() [](#method-i-each_header)
Calls the block with each key/value pair:

    res = Net::HTTP.get_response(hostname, '/todos/1')
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

Net::HTTPHeader#each is an alias for Net::HTTPHeader#each_header.

## each_name(&block) [](#method-i-each_name)
Calls the block with each field key:

    res = Net::HTTP.get_response(hostname, '/todos/1')
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

Net::HTTPHeader#each_name is an alias for Net::HTTPHeader#each_key.

## each_value() [](#method-i-each_value)
Calls the block with each string field value:

    res = Net::HTTP.get_response(hostname, '/todos/1')
    res.each_value do |value|
      p value if value.start_with?('c')
    end

Output:

    "chunked"
    "cf-q-config;dur=6.0000002122251e-06"
    "cloudflare"

Returns an enumerator if no block is given.

## exec(sock, ver, path) [](#method-i-exec)
write

## fetch(key, *args, &block) [](#method-i-fetch)
call-seq:
    fetch(key, default_val = nil) {|key| ... } -> object
    fetch(key, default_val = nil) -> value or default_val

With a block, returns the string value for `key` if it exists; otherwise
returns the value of the block; ignores the `default_val`; see
[Fields](rdoc-ref:Net::HTTPHeader@Fields):

    res = Net::HTTP.get_response(hostname, '/todos/1')

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
such field; see [Fields](rdoc-ref:Net::HTTPHeader@Fields):

    res = Net::HTTP.get_response(hostname, '/todos/1')
    res.get_fields('Connection') # => ["keep-alive"]
    res.get_fields('Nosuch')     # => nil

## initialize(m, reqbody, resbody, uri_or_path, initheadernil) [](#method-i-initialize)
:nodoc:

**@return** [HTTPGenericRequest] a new instance of HTTPGenericRequest

## initialize_http_header(initheader) [](#method-i-initialize_http_header)
:nodoc:

## inspect() [](#method-i-inspect)
Returns a string representation of the request:

    Net::HTTP::Post.new(uri).inspect # => "#<Net::HTTP::Post POST>"

## key?(key) [](#method-i-key?)
Returns `true` if the field for the case-insensitive `key` exists, `false`
otherwise:

    req = Net::HTTP::Get.new(uri)
    req.key?('Accept') # => true
    req.key?('Nosuch') # => false

**@return** [Boolean] 

## main_type() [](#method-i-main_type)
Returns the leading ('type') part of the [media
type](https://en.wikipedia.org/wiki/Media_type) from the value of field
`'Content-Type'`, or `nil` if no such field exists; see [Content-Type response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-type-
response-header):

    res = Net::HTTP.get_response(hostname, '/todos/1')
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

    req = Net::HTTP::Get.new(uri)
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

    res = Net::HTTP.get_response(hostname, '/todos/1')
    res['Content-Range'] # => nil
    res['Content-Range'] = 'bytes 0-499/1000'
    res.range_length     # => 500

## request_body_permitted?() [](#method-i-request_body_permitted?)
Returns whether the request may have a body:

    Net::HTTP::Post.new(uri).request_body_permitted? # => true
    Net::HTTP::Get.new(uri).request_body_permitted?  # => false

**@return** [Boolean] 

## response_body_permitted?() [](#method-i-response_body_permitted?)
Returns whether the response may have a body:

    Net::HTTP::Post.new(uri).response_body_permitted? # => true
    Net::HTTP::Head.new(uri).response_body_permitted? # => false

**@return** [Boolean] 

## set_body_internal(str) [](#method-i-set_body_internal)
:nodoc: internal use only

**@raise** [ArgumentError] 

## set_content_type(type, params{}) [](#method-i-set_content_type)
Sets the value of field `'Content-Type'`; returns the new value; see
[Content-Type request
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-type-
request-header):

    req = Net::HTTP::Get.new(uri)
    req.set_content_type('application/json') # => ["application/json"]

Net::HTTPHeader#content_type= is an alias for
Net::HTTPHeader#set_content_type.

## set_form(params, enctype'application/x-www-form-urlencoded', formopt{}) [](#method-i-set_form)
Stores form data to be used in a `POST` or `PUT` request.

The form data given in `params` consists of zero or more fields; each field
is:

*   A scalar value.
*   A name/value pair.
*   An IO stream opened for reading.

Argument `params` should be an
[Enumerable](rdoc-ref:Enumerable@Enumerable+in+Ruby+Classes) (method
`params.map` will be called), and is often an array or hash.

First, we set up a request:

    _uri = uri.dup
    _uri.path ='/posts'
    req = Net::HTTP::Post.new(_uri)

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
[URI.encode_www_form](rdoc-ref:URI.encode_www_form).

With only argument `params` given, sets the body to a URL-encoded string with
the default separator `'&'`:

    req = Net::HTTP::Post.new('example.com')

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

Net::HTTPHeader#form_data= is an alias for Net::HTTPHeader#set_form_data.

## set_range(r, enil) [](#method-i-set_range)
call-seq:
    set_range(length) -> length
    set_range(offset, length) -> range
    set_range(begin..length) -> range

Sets the value for field `'Range'`; see [Range request
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#range-request
-header):

With argument `length`:

    req = Net::HTTP::Get.new(uri)
    req.set_range(100)      # => 100
    req['Range']            # => "bytes=0-99"

With arguments `offset` and `length`:

    req.set_range(100, 100) # => 100...200
    req['Range']            # => "bytes=100-199"

With argument `range`:

    req.set_range(100..199) # => 100..199
    req['Range']            # => "bytes=100-199"

Net::HTTPHeader#range= is an alias for Net::HTTPHeader#set_range.

## size() [](#method-i-size)
:nodoc: obsolete

## sub_type() [](#method-i-sub_type)
Returns the trailing ('subtype') part of the [media
type](https://en.wikipedia.org/wiki/Media_type) from the value of field
`'Content-Type'`, or `nil` if no such field exists; see [Content-Type response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#content-type-
response-header):

    res = Net::HTTP.get_response(hostname, '/todos/1')
    res['content-type'] # => "application/json; charset=utf-8"
    res.sub_type        # => "json"

## to_hash() [](#method-i-to_hash)
Returns a hash of the key/value pairs:

    req = Net::HTTP::Get.new(uri)
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

    res = Net::HTTP.get_response(hostname, '/todos/1')
    res['content-type'] # => "application/json; charset=utf-8"
    res.type_params     # => {"charset"=>"utf-8"}

## update_uri(addr, port, ssl) [](#method-i-update_uri)
:nodoc: internal use only

