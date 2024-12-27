# Module: Gem::Net::HTTPHeader
    

The HTTPHeader module provides access to HTTP headers.

The module is included in:

*   Gem::Net::HTTPGenericRequest (and therefore Gem::Net::HTTPRequest).
*   Gem::Net::HTTPResponse.

The headers are a hash-like collection of key/value pairs called *fields*.

## Request and Response Fields

Headers may be included in:

*   A Gem::Net::HTTPRequest object: the object's headers will be sent with the
    request. Any fields may be defined in the request; see
    [Setters](rdoc-ref:Gem::Net::HTTPHeader@Setters).
*   A Gem::Net::HTTPResponse object: the objects headers are usually those
    returned from the host. Fields may be retrieved from the object; see
    [Getters](rdoc-ref:Gem::Net::HTTPHeader@Getters) and
    [Iterators](rdoc-ref:Gem::Net::HTTPHeader@Iterators).

Exactly which fields should be sent or expected depends on the host; see:

*   [Request
    fields](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Request_f
    ields).
*   [Response
    fields](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Response_
    fields).

## About the Examples

:include: doc/net-http/examples.rdoc

## Fields

A header field is a key/value pair.

### Field Keys

A field key may be:

*   A string: Key `'Accept'` is treated as if it were `'Accept'.downcase`; 
    i.e., `'accept'`.
*   A symbol: Key `:Accept` is treated as if it were `:Accept.to_s.downcase`; 
    i.e., `'accept'`.

Examples:

    req = Gem::Net::HTTP::Get.new(uri)
    req[:accept]  # => "*/*"
    req['Accept'] # => "*/*"
    req['ACCEPT'] # => "*/*"

    req['accept'] = 'text/html'
    req[:accept] = 'text/html'
    req['ACCEPT'] = 'text/html'

### Field Values

A field value may be returned as an array of strings or as a string:

*   These methods return field values as arrays:

    *   #get_fields: Returns the array value for the given key, or `nil` if it
        does not exist.
    *   #to_hash: Returns a hash of all header fields: each key is a field
        name; its value is the array value for the field.

*   These methods return field values as string; the string value for a field
    is equivalent to `self[key.downcase.to_s].join(', '))`:

    *   #[]: Returns the string value for the given key, or `nil` if it does
        not exist.
    *   #fetch: Like #[], but accepts a default value to be returned if the
        key does not exist.

The field value may be set:

*   #[]=: Sets the value for the given key; the given value may be a string, a
    symbol, an array, or a hash.
*   #add_field: Adds a given value to a value for the given key (not
    overwriting the existing value).
*   #delete: Deletes the field for the given key.

Example field values:

*   String:

        req['Accept'] = 'text/html' # => "text/html"
        req['Accept']               # => "text/html"
        req.get_fields('Accept')    # => ["text/html"]

*   Symbol:

        req['Accept'] = :text    # => :text
        req['Accept']            # => "text"
        req.get_fields('Accept') # => ["text"]

*   Simple array:

        req[:foo] = %w[bar baz bat]
        req[:foo]            # => "bar, baz, bat"
        req.get_fields(:foo) # => ["bar", "baz", "bat"]

*   Simple hash:

        req[:foo] = {bar: 0, baz: 1, bat: 2}
        req[:foo]            # => "bar, 0, baz, 1, bat, 2"
        req.get_fields(:foo) # => ["bar", "0", "baz", "1", "bat", "2"]

*   Nested:

        req[:foo] = [%w[bar baz], {bat: 0, bam: 1}]
        req[:foo]            # => "bar, baz, bat, 0, bam, 1"
        req.get_fields(:foo) # => ["bar", "baz", "bat", "0", "bam", "1"]

        req[:foo] = {bar: %w[baz bat], bam: {bah: 0, bad: 1}}
        req[:foo]            # => "bar, baz, bat, bam, bah, 0, bad, 1"
        req.get_fields(:foo) # => ["bar", "baz", "bat", "bam", "bah", "0", "bad", "1"]

## Convenience Methods

Various convenience methods retrieve values, set values, query values, set
form values, or iterate over fields.

### Setters

Method #[]= can set any field, but does little to validate the new value; some
of the other setter methods provide some validation:

*   #[]=: Sets the string or array value for the given key.
*   #add_field: Creates or adds to the array value for the given key.
*   #basic_auth: Sets the string authorization header for `'Authorization'`.
*   #content_length=: Sets the integer length for field `'Content-Length`.
*   #content_type=: Sets the string value for field `'Content-Type'`.
*   #proxy_basic_auth: Sets the string authorization header for
    `'Proxy-Authorization'`.
*   #set_range: Sets the value for field `'Range'`.

### Form Setters

*   #set_form: Sets an HTML form data set.
*   #set_form_data: Sets header fields and a body from HTML form data.

### Getters

Method #[] can retrieve the value of any field that exists, but always as a
string; some of the other getter methods return something different from the
simple string value:

*   #[]: Returns the string field value for the given key.
*   #content_length: Returns the integer value of field `'Content-Length'`.
*   #content_range: Returns the Range value of field `'Content-Range'`.
*   #content_type: Returns the string value of field `'Content-Type'`.
*   #fetch: Returns the string field value for the given key.
*   #get_fields: Returns the array field value for the given `key`.
*   #main_type: Returns first part of the string value of field
    `'Content-Type'`.
*   #sub_type: Returns second part of the string value of field
    `'Content-Type'`.
*   #range: Returns an array of Range objects of field `'Range'`, or `nil`.
*   #range_length: Returns the integer length of the range given in field
    `'Content-Range'`.
*   #type_params: Returns the string parameters for `'Content-Type'`.

### Queries

*   #chunked?: Returns whether field `'Transfer-Encoding'` is set to
    `'chunked'`.
*   #connection_close?: Returns whether field `'Connection'` is set to
    `'close'`.
*   #connection_keep_alive?: Returns whether field `'Connection'` is set to
    `'keep-alive'`.
*   #key?: Returns whether a given key exists.

### Iterators

*   #each_capitalized: Passes each field capitalized-name/value pair to the
    block.
*   #each_capitalized_name: Passes each capitalized field name to the block.
*   #each_header: Passes each field name/value pair to the block.
*   #each_name: Passes each field name to the block.
*   #each_value: Passes each string field value to the block.



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

## chunked?() [](#method-i-chunked?)
Returns `true` if field `'Transfer-Encoding'` exists and has value
`'chunked'`, `false` otherwise; see [Transfer-Encoding response
header](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#transfer-enco
ding-response-header):

    res = Gem::Net::HTTP.get_response(hostname, '/todos/1')
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

## initialize_http_header(initheader) [](#method-i-initialize_http_header)
:nodoc:

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

