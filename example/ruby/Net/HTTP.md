# Class: Net::HTTP
**Inherits:** Net::Protocol
    

Class Net::HTTP provides a rich library that implements the client in a
client-server model that uses the HTTP request-response protocol. For
information about HTTP, see:

*   [Hypertext Transfer
    Protocol](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol).
*   [Technical
    overview](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Techni
    cal_overview).

## About the Examples

:include: doc/net-http/examples.rdoc

## Strategies

*   If you will make only a few GET requests, consider using
    [OpenURI](rdoc-ref:OpenURI).
*   If you will make only a few requests of all kinds, consider using the
    various singleton convenience methods in this class. Each of the following
    methods automatically starts and finishes a
    [session](rdoc-ref:Net::HTTP@Sessions) that sends a single request:

        # Return string response body.
        Net::HTTP.get(hostname, path)
        Net::HTTP.get(uri)

        # Write string response body to $stdout.
        Net::HTTP.get_print(hostname, path)
        Net::HTTP.get_print(uri)

        # Return response as Net::HTTPResponse object.
        Net::HTTP.get_response(hostname, path)
        Net::HTTP.get_response(uri)
        data = '{"title": "foo", "body": "bar", "userId": 1}'
        Net::HTTP.post(uri, data)
        params = {title: 'foo', body: 'bar', userId: 1}
        Net::HTTP.post_form(uri, params)
        data = '{"title": "foo", "body": "bar", "userId": 1}'
        Net::HTTP.put(uri, data)

*   If performance is important, consider using sessions, which lower request
    overhead. This [session](rdoc-ref:Net::HTTP@Sessions) has multiple
    requests for [HTTP
    methods](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request
    _methods) and [WebDAV
    methods](https://en.wikipedia.org/wiki/WebDAV#Implementation):

        Net::HTTP.start(hostname) do |http|
          # Session started automatically before block execution.
          http.get(path)
          http.head(path)
          body = 'Some text'
          http.post(path, body)  # Can also have a block.
          http.put(path, body)
          http.delete(path)
          http.options(path)
          http.trace(path)
          http.patch(path, body) # Can also have a block.
          http.copy(path)
          http.lock(path, body)
          http.mkcol(path, body)
          http.move(path)
          http.propfind(path, body)
          http.proppatch(path, body)
          http.unlock(path, body)
          # Session finished automatically at block exit.
        end

The methods cited above are convenience methods that, via their few arguments,
allow minimal control over the requests. For greater control, consider using
[request objects](rdoc-ref:Net::HTTPRequest).

## URIs

On the internet, a URI ([Universal Resource
Identifier](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier)) is a
string that identifies a particular resource. It consists of some or all of:
scheme, hostname, path, query, and fragment; see [URI
syntax](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier#Syntax).

A Ruby [URI::Generic](rdoc-ref:URI::Generic) object represents an internet
URI. It provides, among others, methods `scheme`, `hostname`, `path`, `query`,
and `fragment`.

### Schemes

An internet URI has a
[scheme](https://en.wikipedia.org/wiki/List_of_URI_schemes).

The two schemes supported in Net::HTTP are `'https'` and `'http'`:

    uri.scheme                       # => "https"
    URI('http://example.com').scheme # => "http"

### Hostnames

A hostname identifies a server (host) to which requests may be sent:

    hostname = uri.hostname # => "jsonplaceholder.typicode.com"
    Net::HTTP.start(hostname) do |http|
      # Some HTTP stuff.
    end

### Paths

A host-specific path identifies a resource on the host:

    _uri = uri.dup
    _uri.path = '/todos/1'
    hostname = _uri.hostname
    path = _uri.path
    Net::HTTP.get(hostname, path)

### Queries

A host-specific query adds name/value pairs to the URI:

    _uri = uri.dup
    params = {userId: 1, completed: false}
    _uri.query = URI.encode_www_form(params)
    _uri # => #<URI::HTTPS https://jsonplaceholder.typicode.com?userId=1&completed=false>
    Net::HTTP.get(_uri)

### Fragments

A [URI fragment](https://en.wikipedia.org/wiki/URI_fragment) has no effect in
Net::HTTP; the same data is returned, regardless of whether a fragment is
included.

## Request Headers

Request headers may be used to pass additional information to the host,
similar to arguments passed in a method call; each header is a name/value
pair.

Each of the Net::HTTP methods that sends a request to the host has optional
argument `headers`, where the headers are expressed as a hash of
field-name/value pairs:

    headers = {Accept: 'application/json', Connection: 'Keep-Alive'}
    Net::HTTP.get(uri, headers)

See lists of both standard request fields and common request fields at
[Request
Fields](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Request_field
s). A host may also accept other custom fields.

## HTTP Sessions

A *session* is a connection between a server (host) and a client that:

*   Is begun by instance method Net::HTTP#start.
*   May contain any number of requests.
*   Is ended by instance method Net::HTTP#finish.

See example sessions at [Strategies](rdoc-ref:Net::HTTP@Strategies).

### Session Using Net::HTTP.start

If you have many requests to make to a single host (and port), consider using
singleton method Net::HTTP.start with a block; the method handles the session
automatically by:

*   Calling #start before block execution.
*   Executing the block.
*   Calling #finish after block execution.

In the block, you can use these instance methods, each of which that sends a
single request:

*   [HTTP
    methods](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request
    _methods):

    *   #get, #request_get: GET.
    *   #head, #request_head: HEAD.
    *   #post, #request_post: POST.
    *   #delete: DELETE.
    *   #options: OPTIONS.
    *   #trace: TRACE.
    *   #patch: PATCH.

*   [WebDAV methods](https://en.wikipedia.org/wiki/WebDAV#Implementation):

    *   #copy: COPY.
    *   #lock: LOCK.
    *   #mkcol: MKCOL.
    *   #move: MOVE.
    *   #propfind: PROPFIND.
    *   #proppatch: PROPPATCH.
    *   #unlock: UNLOCK.

### Session Using Net::HTTP.start and Net::HTTP.finish

You can manage a session manually using methods #start and #finish:

    http = Net::HTTP.new(hostname)
    http.start
    http.get('/todos/1')
    http.get('/todos/2')
    http.delete('/posts/1')
    http.finish # Needed to free resources.

### Single-Request Session

Certain convenience methods automatically handle a session by:

*   Creating an HTTP object
*   Starting a session.
*   Sending a single request.
*   Finishing the session.
*   Destroying the object.

Such methods that send GET requests:

*   ::get: Returns the string response body.
*   ::get_print: Writes the string response body to $stdout.
*   ::get_response: Returns a Net::HTTPResponse object.

Such methods that send POST requests:

*   ::post: Posts data to the host.
*   ::post_form: Posts form data to the host.

## HTTP Requests and Responses

Many of the methods above are convenience methods, each of which sends a
request and returns a string without directly using Net::HTTPRequest and
Net::HTTPResponse objects.

You can, however, directly create a request object, send the request, and
retrieve the response object; see:

*   Net::HTTPRequest.
*   Net::HTTPResponse.

## Following Redirection

Each returned response is an instance of a subclass of Net::HTTPResponse. See
the [response class
hierarchy](rdoc-ref:Net::HTTPResponse@Response+Subclasses).

In particular, class Net::HTTPRedirection is the parent of all redirection
classes. This allows you to craft a case statement to handle redirections
properly:

    def fetch(uri, limit = 10)
      # You should choose a better exception.
      raise ArgumentError, 'Too many HTTP redirects' if limit == 0

      res = Net::HTTP.get_response(URI(uri))
      case res
      when Net::HTTPSuccess     # Any success class.
        res
      when Net::HTTPRedirection # Any redirection class.
        location = res['Location']
        warn "Redirected to #{location}"
        fetch(location, limit - 1)
      else                      # Any other class.
        res.value
      end
    end

    fetch(uri)

## Basic Authentication

Basic authentication is performed according to
[RFC2617](http://www.ietf.org/rfc/rfc2617.txt):

    req = Net::HTTP::Get.new(uri)
    req.basic_auth('user', 'pass')
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

## Streaming Response Bodies

By default Net::HTTP reads an entire response into memory.  If you are
handling large files or wish to implement a progress bar you can instead
stream the body directly to an IO.

    Net::HTTP.start(hostname) do |http|
      req = Net::HTTP::Get.new(uri)
      http.request(req) do |res|
        open('t.tmp', 'w') do |f|
          res.read_body do |chunk|
            f.write chunk
          end
        end
      end
    end

## HTTPS

HTTPS is enabled for an HTTP connection by Net::HTTP#use_ssl=:

    Net::HTTP.start(hostname, :use_ssl => true) do |http|
      req = Net::HTTP::Get.new(uri)
      res = http.request(req)
    end

Or if you simply want to make a GET request, you may pass in a URI object that
has an HTTPS URL. Net::HTTP automatically turns on TLS verification if the URI
object has a 'https' URI scheme:

    uri # => #<URI::HTTPS https://jsonplaceholder.typicode.com/>
    Net::HTTP.get(uri)

## Proxy Server

An HTTP object can have a [proxy
server](https://en.wikipedia.org/wiki/Proxy_server).

You can create an HTTP object with a proxy server using method Net::HTTP.new
or method Net::HTTP.start.

The proxy may be defined either by argument `p_addr` or by environment
variable `'http_proxy'`.

### Proxy Using Argument `p_addr` as a String

When argument `p_addr` is a string hostname, the returned `http` has the given
host as its proxy:

    http = Net::HTTP.new(hostname, nil, 'proxy.example')
    http.proxy?          # => true
    http.proxy_from_env? # => false
    http.proxy_address   # => "proxy.example"
    # These use default values.
    http.proxy_port      # => 80
    http.proxy_user      # => nil
    http.proxy_pass      # => nil

The port, username, and password for the proxy may also be given:

    http = Net::HTTP.new(hostname, nil, 'proxy.example', 8000, 'pname', 'ppass')
    # => #<Net::HTTP jsonplaceholder.typicode.com:80 open=false>
    http.proxy?          # => true
    http.proxy_from_env? # => false
    http.proxy_address   # => "proxy.example"
    http.proxy_port      # => 8000
    http.proxy_user      # => "pname"
    http.proxy_pass      # => "ppass"

### Proxy Using '`ENV['http_proxy']`'

When environment variable `'http_proxy'` is set to a URI string, the returned
`http` will have the server at that URI as its proxy; note that the URI string
must have a protocol such as `'http'` or `'https'`:

    ENV['http_proxy'] = 'http://example.com'
    http = Net::HTTP.new(hostname)
    http.proxy?          # => true
    http.proxy_from_env? # => true
    http.proxy_address   # => "example.com"
    # These use default values.
    http.proxy_port      # => 80
    http.proxy_user      # => nil
    http.proxy_pass      # => nil

The URI string may include proxy username, password, and port number:

    ENV['http_proxy'] = 'http://pname:ppass@example.com:8000'
    http = Net::HTTP.new(hostname)
    http.proxy?          # => true
    http.proxy_from_env? # => true
    http.proxy_address   # => "example.com"
    http.proxy_port      # => 8000
    http.proxy_user      # => "pname"
    http.proxy_pass      # => "ppass"

### Filtering Proxies

With method Net::HTTP.new (but not Net::HTTP.start), you can use argument
`p_no_proxy` to filter proxies:

*   Reject a certain address:

        http = Net::HTTP.new('example.com', nil, 'proxy.example', 8000, 'pname', 'ppass', 'proxy.example')
        http.proxy_address # => nil

*   Reject certain domains or subdomains:

        http = Net::HTTP.new('example.com', nil, 'my.proxy.example', 8000, 'pname', 'ppass', 'proxy.example')
        http.proxy_address # => nil

*   Reject certain addresses and port combinations:

        http = Net::HTTP.new('example.com', nil, 'proxy.example', 8000, 'pname', 'ppass', 'proxy.example:1234')
        http.proxy_address # => "proxy.example"

        http = Net::HTTP.new('example.com', nil, 'proxy.example', 8000, 'pname', 'ppass', 'proxy.example:8000')
        http.proxy_address # => nil

*   Reject a list of the types above delimited using a comma:

        http = Net::HTTP.new('example.com', nil, 'proxy.example', 8000, 'pname', 'ppass', 'my.proxy,proxy.example:8000')
        http.proxy_address # => nil

        http = Net::HTTP.new('example.com', nil, 'my.proxy', 8000, 'pname', 'ppass', 'my.proxy,proxy.example:8000')
        http.proxy_address # => nil

## Compression and Decompression

Net::HTTP does not compress the body of a request before sending.

By default, Net::HTTP adds header `'Accept-Encoding'` to a new [request
object](rdoc-ref:Net::HTTPRequest):

    Net::HTTP::Get.new(uri)['Accept-Encoding']
    # => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"

This requests the server to zip-encode the response body if there is one; the
server is not required to do so.

Net::HTTP does not automatically decompress a response body if the response
has header `'Content-Range'`.

Otherwise decompression (or not) depends on the value of header
[Content-Encoding](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#co
ntent-encoding-response-header):

*   `'deflate'`, `'gzip'`, or `'x-gzip'`: decompresses the body and deletes
    the header.
*   `'none'` or `'identity'`: does not decompress the body, but deletes the
    header.
*   Any other value: leaves the body and header unchanged.

## What's Here

First, what's elsewhere. Class Net::HTTP:

*   Inherits from [class Object](rdoc-ref:Object@What-27s+Here).

This is a categorized summary of methods and attributes.

### Net::HTTP Objects

*   [::new](rdoc-ref:Net::HTTP.new): Creates a new instance.
*   [#inspect](rdoc-ref:Net::HTTP#inspect): Returns a string representation of
    `self`.

### Sessions

*   [::start](rdoc-ref:Net::HTTP.start): Begins a new session in a new
    Net::HTTP object.
*   [#started?](rdoc-ref:Net::HTTP#started?): Returns whether in a session.
*   [#finish](rdoc-ref:Net::HTTP#finish): Ends an active session.
*   [#start](rdoc-ref:Net::HTTP#start): Begins a new session in an existing
    Net::HTTP object (`self`).

### Connections

*   [:continue_timeout](rdoc-ref:Net::HTTP#continue_timeout): Returns the
    continue timeout.
*   [#continue_timeout=](rdoc-ref:Net::HTTP#continue_timeout=): Sets the
    continue timeout seconds.
*   [:keep_alive_timeout](rdoc-ref:Net::HTTP#keep_alive_timeout): Returns the
    keep-alive timeout.
*   [:keep_alive_timeout=](rdoc-ref:Net::HTTP#keep_alive_timeout=): Sets the
    keep-alive timeout.
*   [:max_retries](rdoc-ref:Net::HTTP#max_retries): Returns the maximum
    retries.
*   [#max_retries=](rdoc-ref:Net::HTTP#max_retries=): Sets the maximum
    retries.
*   [:open_timeout](rdoc-ref:Net::HTTP#open_timeout): Returns the open
    timeout.
*   [:open_timeout=](rdoc-ref:Net::HTTP#open_timeout=): Sets the open timeout.
*   [:read_timeout](rdoc-ref:Net::HTTP#read_timeout): Returns the open
    timeout.
*   [:read_timeout=](rdoc-ref:Net::HTTP#read_timeout=): Sets the read timeout.
*   [:ssl_timeout](rdoc-ref:Net::HTTP#ssl_timeout): Returns the ssl timeout.
*   [:ssl_timeout=](rdoc-ref:Net::HTTP#ssl_timeout=): Sets the ssl timeout.
*   [:write_timeout](rdoc-ref:Net::HTTP#write_timeout): Returns the write
    timeout.
*   [write_timeout=](rdoc-ref:Net::HTTP#write_timeout=): Sets the write
    timeout.

### Requests

*   [::get](rdoc-ref:Net::HTTP.get): Sends a GET request and returns the
    string response body.
*   [::get_print](rdoc-ref:Net::HTTP.get_print): Sends a GET request and write
    the string response body to $stdout.
*   [::get_response](rdoc-ref:Net::HTTP.get_response): Sends a GET request and
    returns a response object.
*   [::post_form](rdoc-ref:Net::HTTP.post_form): Sends a POST request with
    form data and returns a response object.
*   [::post](rdoc-ref:Net::HTTP.post): Sends a POST request with data and
    returns a response object.
*   [::put](rdoc-ref:Net::HTTP.put): Sends a PUT request with data and returns
    a response object.
*   [#copy](rdoc-ref:Net::HTTP#copy): Sends a COPY request and returns a
    response object.
*   [#delete](rdoc-ref:Net::HTTP#delete): Sends a DELETE request and returns a
    response object.
*   [#get](rdoc-ref:Net::HTTP#get): Sends a GET request and returns a response
    object.
*   [#head](rdoc-ref:Net::HTTP#head): Sends a HEAD request and returns a
    response object.
*   [#lock](rdoc-ref:Net::HTTP#lock): Sends a LOCK request and returns a
    response object.
*   [#mkcol](rdoc-ref:Net::HTTP#mkcol): Sends a MKCOL request and returns a
    response object.
*   [#move](rdoc-ref:Net::HTTP#move): Sends a MOVE request and returns a
    response object.
*   [#options](rdoc-ref:Net::HTTP#options): Sends a OPTIONS request and
    returns a response object.
*   [#patch](rdoc-ref:Net::HTTP#patch): Sends a PATCH request and returns a
    response object.
*   [#post](rdoc-ref:Net::HTTP#post): Sends a POST request and returns a
    response object.
*   [#propfind](rdoc-ref:Net::HTTP#propfind): Sends a PROPFIND request and
    returns a response object.
*   [#proppatch](rdoc-ref:Net::HTTP#proppatch): Sends a PROPPATCH request and
    returns a response object.
*   [#put](rdoc-ref:Net::HTTP#put): Sends a PUT request and returns a response
    object.
*   [#request](rdoc-ref:Net::HTTP#request): Sends a request and returns a
    response object.
*   [#request_get](rdoc-ref:Net::HTTP#request_get): Sends a GET request and
    forms a response object; if a block given, calls the block with the
    object, otherwise returns the object.
*   [#request_head](rdoc-ref:Net::HTTP#request_head): Sends a HEAD request and
    forms a response object; if a block given, calls the block with the
    object, otherwise returns the object.
*   [#request_post](rdoc-ref:Net::HTTP#request_post): Sends a POST request and
    forms a response object; if a block given, calls the block with the
    object, otherwise returns the object.
*   [#send_request](rdoc-ref:Net::HTTP#send_request): Sends a request and
    returns a response object.
*   [#trace](rdoc-ref:Net::HTTP#trace): Sends a TRACE request and returns a
    response object.
*   [#unlock](rdoc-ref:Net::HTTP#unlock): Sends an UNLOCK request and returns
    a response object.

### Responses

*   [:close_on_empty_response](rdoc-ref:Net::HTTP#close_on_empty_response):
    Returns whether to close connection on empty response.
*   [:close_on_empty_response=](rdoc-ref:Net::HTTP#close_on_empty_response=):
    Sets whether to close connection on empty response.
*   [:ignore_eof](rdoc-ref:Net::HTTP#ignore_eof): Returns whether to ignore
    end-of-file when reading a response body with `Content-Length` headers.
*   [:ignore_eof=](rdoc-ref:Net::HTTP#ignore_eof=): Sets whether to ignore
    end-of-file when reading a response body with `Content-Length` headers.
*   [:response_body_encoding](rdoc-ref:Net::HTTP#response_body_encoding):
    Returns the encoding to use for the response body.
*   [#response_body_encoding=](rdoc-ref:Net::HTTP#response_body_encoding=):
    Sets the response body encoding.

### Proxies

*   [:proxy_address](rdoc-ref:Net::HTTP#proxy_address): Returns the proxy
    address.
*   [:proxy_address=](rdoc-ref:Net::HTTP#proxy_address=): Sets the proxy
    address.
*   [::proxy_class?](rdoc-ref:Net::HTTP.proxy_class?): Returns whether `self`
    is a proxy class.
*   [#proxy?](rdoc-ref:Net::HTTP#proxy?): Returns whether `self` has a proxy.
*   [#proxy_address](rdoc-ref:Net::HTTP#proxy_address): Returns the proxy
    address.
*   [#proxy_from_env?](rdoc-ref:Net::HTTP#proxy_from_env?): Returns whether
    the proxy is taken from an environment variable.
*   [:proxy_from_env=](rdoc-ref:Net::HTTP#proxy_from_env=): Sets whether the
    proxy is to be taken from an environment variable.
*   [:proxy_pass](rdoc-ref:Net::HTTP#proxy_pass): Returns the proxy password.
*   [:proxy_pass=](rdoc-ref:Net::HTTP#proxy_pass=): Sets the proxy password.
*   [:proxy_port](rdoc-ref:Net::HTTP#proxy_port): Returns the proxy port.
*   [:proxy_port=](rdoc-ref:Net::HTTP#proxy_port=): Sets the proxy port.
*   [#proxy_user](rdoc-ref:Net::HTTP#proxy_user): Returns the proxy user name.
*   [:proxy_user=](rdoc-ref:Net::HTTP#proxy_user=): Sets the proxy user.

### Security

*   [:ca_file](rdoc-ref:Net::HTTP#ca_file): Returns the path to a CA
    certification file.
*   [:ca_file=](rdoc-ref:Net::HTTP#ca_file=): Sets the path to a CA
    certification file.
*   [:ca_path](rdoc-ref:Net::HTTP#ca_path): Returns the path of to CA
    directory containing certification files.
*   [:ca_path=](rdoc-ref:Net::HTTP#ca_path=): Sets the path of to CA directory
    containing certification files.
*   [:cert](rdoc-ref:Net::HTTP#cert): Returns the OpenSSL::X509::Certificate
    object to be used for client certification.
*   [:cert=](rdoc-ref:Net::HTTP#cert=): Sets the OpenSSL::X509::Certificate
    object to be used for client certification.
*   [:cert_store](rdoc-ref:Net::HTTP#cert_store): Returns the X509::Store to
    be used for verifying peer certificate.
*   [:cert_store=](rdoc-ref:Net::HTTP#cert_store=): Sets the X509::Store to be
    used for verifying peer certificate.
*   [:ciphers](rdoc-ref:Net::HTTP#ciphers): Returns the available SSL ciphers.
*   [:ciphers=](rdoc-ref:Net::HTTP#ciphers=): Sets the available SSL ciphers.
*   [:extra_chain_cert](rdoc-ref:Net::HTTP#extra_chain_cert): Returns the
    extra X509 certificates to be added to the certificate chain.
*   [:extra_chain_cert=](rdoc-ref:Net::HTTP#extra_chain_cert=): Sets the extra
    X509 certificates to be added to the certificate chain.
*   [:key](rdoc-ref:Net::HTTP#key): Returns the OpenSSL::PKey::RSA or
    OpenSSL::PKey::DSA object.
*   [:key=](rdoc-ref:Net::HTTP#key=): Sets the OpenSSL::PKey::RSA or
    OpenSSL::PKey::DSA object.
*   [:max_version](rdoc-ref:Net::HTTP#max_version): Returns the maximum SSL
    version.
*   [:max_version=](rdoc-ref:Net::HTTP#max_version=): Sets the maximum SSL
    version.
*   [:min_version](rdoc-ref:Net::HTTP#min_version): Returns the minimum SSL
    version.
*   [:min_version=](rdoc-ref:Net::HTTP#min_version=): Sets the minimum SSL
    version.
*   [#peer_cert](rdoc-ref:Net::HTTP#peer_cert): Returns the X509 certificate
    chain for the session's socket peer.
*   [:ssl_version](rdoc-ref:Net::HTTP#ssl_version): Returns the SSL version.
*   [:ssl_version=](rdoc-ref:Net::HTTP#ssl_version=): Sets the SSL version.
*   [#use_ssl=](rdoc-ref:Net::HTTP#use_ssl=): Sets whether a new session is to
    use Transport Layer Security.
*   [#use_ssl?](rdoc-ref:Net::HTTP#use_ssl?): Returns whether `self` uses SSL.
*   [:verify_callback](rdoc-ref:Net::HTTP#verify_callback): Returns the
    callback for the server certification verification.
*   [:verify_callback=](rdoc-ref:Net::HTTP#verify_callback=): Sets the
    callback for the server certification verification.
*   [:verify_depth](rdoc-ref:Net::HTTP#verify_depth): Returns the maximum
    depth for the certificate chain verification.
*   [:verify_depth=](rdoc-ref:Net::HTTP#verify_depth=): Sets the maximum depth
    for the certificate chain verification.
*   [:verify_hostname](rdoc-ref:Net::HTTP#verify_hostname): Returns the flags
    for server the certification verification at the beginning of the SSL/TLS
    session.
*   [:verify_hostname=](rdoc-ref:Net::HTTP#verify_hostname=): Sets he flags
    for server the certification verification at the beginning of the SSL/TLS
    session.
*   [:verify_mode](rdoc-ref:Net::HTTP#verify_mode): Returns the flags for
    server the certification verification at the beginning of the SSL/TLS
    session.
*   [:verify_mode=](rdoc-ref:Net::HTTP#verify_mode=): Sets the flags for
    server the certification verification at the beginning of the SSL/TLS
    session.

### Addresses and Ports

*   [:address](rdoc-ref:Net::HTTP#address): Returns the string host name or
    host IP.
*   [::default_port](rdoc-ref:Net::HTTP.default_port): Returns integer 80, the
    default port to use for HTTP requests.
*   [::http_default_port](rdoc-ref:Net::HTTP.http_default_port): Returns
    integer 80, the default port to use for HTTP requests.
*   [::https_default_port](rdoc-ref:Net::HTTP.https_default_port): Returns
    integer 443, the default port to use for HTTPS requests.
*   [#ipaddr](rdoc-ref:Net::HTTP#ipaddr): Returns the IP address for the
    connection.
*   [#ipaddr=](rdoc-ref:Net::HTTP#ipaddr=): Sets the IP address for the
    connection.
*   [:local_host](rdoc-ref:Net::HTTP#local_host): Returns the string local
    host used to establish the connection.
*   [:local_host=](rdoc-ref:Net::HTTP#local_host=): Sets the string local host
    used to establish the connection.
*   [:local_port](rdoc-ref:Net::HTTP#local_port): Returns the integer local
    port used to establish the connection.
*   [:local_port=](rdoc-ref:Net::HTTP#local_port=): Sets the integer local
    port used to establish the connection.
*   [:port](rdoc-ref:Net::HTTP#port): Returns the integer port number.

### HTTP Version

*   [::version_1_2?](rdoc-ref:Net::HTTP.version_1_2?) (aliased as
    [::version_1_2](rdoc-ref:Net::HTTP.version_1_2)): Returns true; retained
    for compatibility.

### Debugging

*   [#set_debug_output](rdoc-ref:Net::HTTP#set_debug_output): Sets the output
    stream for debugging.


# Class Methods
## Proxy(p_addr :ENV, p_port nil, p_user nil, p_pass nil, p_use_ssl nil) [](#method-c-Proxy)
Creates an HTTP proxy class which behaves like Net::HTTP, but performs all
access via the specified proxy.

This class is obsolete.  You may pass these same parameters directly to
Net::HTTP.new.  See Net::HTTP.new for details of the arguments.
## default_port() [](#method-c-default_port)
Returns integer `80`, the default port to use for HTTP requests:

    Net::HTTP.default_port # => 80
## get(uri_or_host , path_or_headers nil, port nil) [](#method-c-get)
:call-seq:
    Net::HTTP.get(hostname, path, port = 80) -> body
    Net::HTTP:get(uri, headers = {}, port = uri.port) -> body

Sends a GET request and returns the HTTP response body as a string.

With string arguments `hostname` and `path`:

    hostname = 'jsonplaceholder.typicode.com'
    path = '/todos/1'
    puts Net::HTTP.get(hostname, path)

Output:

    {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false
    }

With URI object `uri` and optional hash argument `headers`:

    uri = URI('https://jsonplaceholder.typicode.com/todos/1')
    headers = {'Content-type' => 'application/json; charset=UTF-8'}
    Net::HTTP.get(uri, headers)

Related:

*   Net::HTTP::Get: request class for HTTP method `GET`.
*   Net::HTTP#get: convenience method for HTTP method `GET`.
## get_print(uri_or_host , path_or_headers nil, port nil) [](#method-c-get_print)
:call-seq:
    Net::HTTP.get_print(hostname, path, port = 80) -> nil
    Net::HTTP:get_print(uri, headers = {}, port = uri.port) -> nil

Like Net::HTTP.get, but writes the returned body to $stdout; returns `nil`.
## get_response(uri_or_host , path_or_headers nil, port nil, &block ) [](#method-c-get_response)
:call-seq:
    Net::HTTP.get_response(hostname, path, port = 80) -> http_response
    Net::HTTP:get_response(uri, headers = {}, port = uri.port) -> http_response

Like Net::HTTP.get, but returns a Net::HTTPResponse object instead of the body
string.
## http_default_port() [](#method-c-http_default_port)
Returns integer `80`, the default port to use for HTTP requests:

    Net::HTTP.http_default_port # => 80
## https_default_port() [](#method-c-https_default_port)
Returns integer `443`, the default port to use for HTTPS requests:

    Net::HTTP.https_default_port # => 443
## new(address , port nil, p_addr :ENV, p_port nil, p_user nil, p_pass nil, p_no_proxy nil, p_use_ssl nil) [](#method-c-new)
Returns a new Net::HTTP object `http` (but does not open a TCP connection or
HTTP session).

With only string argument `address` given (and `ENV['http_proxy']` undefined
or `nil`), the returned `http`:

*   Has the given address.
*   Has the default port number, Net::HTTP.default_port (80).
*   Has no proxy.

Example:

    http = Net::HTTP.new(hostname)
    # => #<Net::HTTP jsonplaceholder.typicode.com:80 open=false>
    http.address # => "jsonplaceholder.typicode.com"
    http.port    # => 80
    http.proxy?  # => false

With integer argument `port` also given, the returned `http` has the given
port:

    http = Net::HTTP.new(hostname, 8000)
    # => #<Net::HTTP jsonplaceholder.typicode.com:8000 open=false>
    http.port # => 8000

For proxy-defining arguments `p_addr` through `p_no_proxy`, see [Proxy
Server](rdoc-ref:Net::HTTP@Proxy+Server).
## newobj() [](#method-c-newobj)
:nodoc:
## post(url , data , header nil) [](#method-c-post)
Posts data to a host; returns a Net::HTTPResponse object.

Argument `url` must be a URL; argument `data` must be a string:

    _uri = uri.dup
    _uri.path = '/posts'
    data = '{"title": "foo", "body": "bar", "userId": 1}'
    headers = {'content-type': 'application/json'}
    res = Net::HTTP.post(_uri, data, headers) # => #<Net::HTTPCreated 201 Created readbody=true>
    puts res.body

Output:

    {
      "title": "foo",
      "body": "bar",
      "userId": 1,
      "id": 101
    }

Related:

*   Net::HTTP::Post: request class for HTTP method `POST`.
*   Net::HTTP#post: convenience method for HTTP method `POST`.
## post_form(url , params ) [](#method-c-post_form)
Posts data to a host; returns a Net::HTTPResponse object.

Argument `url` must be a URI; argument `data` must be a hash:

    _uri = uri.dup
    _uri.path = '/posts'
    data = {title: 'foo', body: 'bar', userId: 1}
    res = Net::HTTP.post_form(_uri, data) # => #<Net::HTTPCreated 201 Created readbody=true>
    puts res.body

Output:

    {
      "title": "foo",
      "body": "bar",
      "userId": "1",
      "id": 101
    }
## proxy_class?() [](#method-c-proxy_class?)
Returns true if self is a class which was created by HTTP::Proxy.
**@return** [Boolean] 

## put(url , data , header nil) [](#method-c-put)
Sends a PUT request to the server; returns a Net::HTTPResponse object.

Argument `url` must be a URL; argument `data` must be a string:

    _uri = uri.dup
    _uri.path = '/posts'
    data = '{"title": "foo", "body": "bar", "userId": 1}'
    headers = {'content-type': 'application/json'}
    res = Net::HTTP.put(_uri, data, headers) # => #<Net::HTTPCreated 201 Created readbody=true>
    puts res.body

Output:

    {
      "title": "foo",
      "body": "bar",
      "userId": 1,
      "id": 101
    }

Related:

*   Net::HTTP::Put: request class for HTTP method `PUT`.
*   Net::HTTP#put: convenience method for HTTP method `PUT`.
## socket_type() [](#method-c-socket_type)
:nodoc: obsolete
## start(address , *arg , &block ) [](#method-c-start)
:call-seq:
    HTTP.start(address, port = nil, p_addr = :ENV, p_port = nil, p_user = nil, p_pass = nil, opts) -> http
    HTTP.start(address, port = nil, p_addr = :ENV, p_port = nil, p_user = nil, p_pass = nil, opts) {|http| ... } -> object

Creates a new Net::HTTP object, `http`, via Net::HTTP.new:

*   For arguments `address` and `port`, see Net::HTTP.new.
*   For proxy-defining arguments `p_addr` through `p_pass`, see [Proxy
    Server](rdoc-ref:Net::HTTP@Proxy+Server).
*   For argument `opts`, see below.

With no block given:

*   Calls `http.start` with no block (see #start), which opens a TCP
    connection and HTTP session.
*   Returns `http`.
*   The caller should call #finish to close the session:

        http = Net::HTTP.start(hostname)
        http.started? # => true
        http.finish
        http.started? # => false

With a block given:

*   Calls `http.start` with the block (see #start), which:

    *   Opens a TCP connection and HTTP session.
    *   Calls the block, which may make any number of requests to the host.
    *   Closes the HTTP session and TCP connection on block exit.
    *   Returns the block's value `object`.

*   Returns `object`.

Example:

    hostname = 'jsonplaceholder.typicode.com'
    Net::HTTP.start(hostname) do |http|
      puts http.get('/todos/1').body
      puts http.get('/todos/2').body
    end

Output:

    {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false
    }
    {
      "userId": 1,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false
    }

If the last argument given is a hash, it is the `opts` hash, where each key is
a method or accessor to be called, and its value is the value to be set.

The keys may include:

*   #ca_file
*   #ca_path
*   #cert
*   #cert_store
*   #ciphers
*   #close_on_empty_response
*   `ipaddr` (calls #ipaddr=)
*   #keep_alive_timeout
*   #key
*   #open_timeout
*   #read_timeout
*   #ssl_timeout
*   #ssl_version
*   `use_ssl` (calls #use_ssl=)
*   #verify_callback
*   #verify_depth
*   #verify_mode
*   #write_timeout

Note: If `port` is `nil` and `opts[:use_ssl]` is a truthy value, the value
passed to `new` is Net::HTTP.https_default_port, not `port`.
## version_1_1?() [](#method-c-version_1_1?)
Returns `false`; retained for compatibility.
**@return** [Boolean] 

## version_1_2() [](#method-c-version_1_2)
Returns `true`; retained for compatibility.
## version_1_2?() [](#method-c-version_1_2?)
Returns `true`; retained for compatibility.
**@return** [Boolean] 

# Attributes
## default_configuration[RW] [](#attribute-c-default_configuration)
Allows to set the default configuration that will be used when creating a new
connection.

Example:

    Net::HTTP.default_configuration = {
      read_timeout: 1,
      write_timeout: 1
    }
    http = Net::HTTP.new(hostname)
    http.open_timeout   # => 60
    http.read_timeout   # => 1
    http.write_timeout  # => 1

## proxy_address[RW] [](#attribute-c-proxy_address)
Returns the address of the proxy host, or `nil` if none; see
Net::HTTP@Proxy+Server.

## proxy_pass[RW] [](#attribute-c-proxy_pass)
Returns the password for accessing the proxy, or `nil` if none; see
Net::HTTP@Proxy+Server.

## proxy_port[RW] [](#attribute-c-proxy_port)
Returns the port number of the proxy host, or `nil` if none; see
Net::HTTP@Proxy+Server.

## proxy_use_ssl[RW] [](#attribute-c-proxy_use_ssl)
Use SSL when talking to the proxy. If Net::HTTP does not use a proxy, nil.

## proxy_user[RW] [](#attribute-c-proxy_user)
Returns the user name for accessing the proxy, or `nil` if none; see
Net::HTTP@Proxy+Server.

## address[RW] [](#attribute-i-address)
Returns the string host name or host IP given as argument `address` in ::new.

## ca_file[RW] [](#attribute-i-ca_file)
Sets or returns the path to a CA certification file in PEM format.

## ca_path[RW] [](#attribute-i-ca_path)
Sets or returns the path of to CA directory containing certification files in
PEM format.

## cert[RW] [](#attribute-i-cert)
Sets or returns the OpenSSL::X509::Certificate object to be used for client
certification.

## cert_store[RW] [](#attribute-i-cert_store)
Sets or returns the X509::Store to be used for verifying peer certificate.

## ciphers[RW] [](#attribute-i-ciphers)
Sets or returns the available SSL ciphers. See
[:SSL::SSLContext#ciphers=](OpenSSL::SSL::SSL::Context#ciphers=).

## close_on_empty_response[RW] [](#attribute-i-close_on_empty_response)
Sets or returns whether to close the connection when the response is empty;
initially `false`.

## continue_timeout[RW] [](#attribute-i-continue_timeout)
Returns the continue timeout value; see continue_timeout=.

## extra_chain_cert[RW] [](#attribute-i-extra_chain_cert)
Sets or returns the extra X509 certificates to be added to the certificate
chain. See
[:SSL::SSLContext#add_certificate](OpenSSL::SSL::SSL::Context#add_certificate)
.

## ignore_eof[RW] [](#attribute-i-ignore_eof)
Sets or returns whether to ignore end-of-file when reading a response body
with `Content-Length` headers; initially `true`.

## keep_alive_timeout[RW] [](#attribute-i-keep_alive_timeout)
Sets or returns the numeric (Integer or Float) number of seconds to keep the
connection open after a request is sent; initially 2. If a new request is made
during the given interval, the still-open connection is used; otherwise the
connection will have been closed and a new connection is opened.

## key[RW] [](#attribute-i-key)
Sets or returns the OpenSSL::PKey::RSA or OpenSSL::PKey::DSA object.

## local_host[RW] [](#attribute-i-local_host)
Sets or returns the string local host used to establish the connection;
initially `nil`.

## local_port[RW] [](#attribute-i-local_port)
Sets or returns the integer local port used to establish the connection;
initially `nil`.

## max_retries[RW] [](#attribute-i-max_retries)
Returns the maximum number of times to retry an idempotent request; see
#max_retries=.

## max_version[RW] [](#attribute-i-max_version)
Sets or returns the maximum SSL version. See
[:SSL::SSLContext#max_version=](OpenSSL::SSL::SSL::Context#max_version=).

## min_version[RW] [](#attribute-i-min_version)
Sets or returns the minimum SSL version. See
[:SSL::SSLContext#min_version=](OpenSSL::SSL::SSL::Context#min_version=).

## open_timeout[RW] [](#attribute-i-open_timeout)
Sets or returns the numeric (Integer or Float) number of seconds to wait for a
connection to open; initially 60. If the connection is not made in the given
interval, an exception is raised.

## port[RW] [](#attribute-i-port)
Returns the integer port number given as argument `port` in ::new.

## proxy_address[RW] [](#attribute-i-proxy_address)
Returns the address of the proxy server, if defined, `nil` otherwise; see
[Proxy Server](rdoc-ref:Net::HTTP@Proxy+Server).

## proxy_from_env=[R] [](#attribute-i-proxy_from_env=)
Sets whether to determine the proxy from environment variable
'`ENV['http_proxy']`'; see [Proxy Using
ENV['http_proxy']](rdoc-ref:Net::HTTP@Proxy+Using+-27ENV-5B-27http_proxy-27-5D
-27).

## proxy_pass[RW] [](#attribute-i-proxy_pass)
Returns the password of the proxy server, if defined, `nil` otherwise; see
[Proxy Server](rdoc-ref:Net::HTTP@Proxy+Server).

## proxy_port[RW] [](#attribute-i-proxy_port)
Returns the port number of the proxy server, if defined, `nil` otherwise; see
[Proxy Server](rdoc-ref:Net::HTTP@Proxy+Server).

## proxy_use_ssl=[R] [](#attribute-i-proxy_use_ssl=)
Sets the attribute proxy_use_ssl

**@param** [] the value to set the attribute proxy_use_ssl to.

## proxy_user[RW] [](#attribute-i-proxy_user)
Returns the user name of the proxy server, if defined, `nil` otherwise; see
[Proxy Server](rdoc-ref:Net::HTTP@Proxy+Server).

## read_timeout[RW] [](#attribute-i-read_timeout)
Returns the numeric (Integer or Float) number of seconds to wait for one block
to be read (via one read(2) call); see #read_timeout=.

## response_body_encoding[RW] [](#attribute-i-response_body_encoding)
Returns the encoding to use for the response body; see
#response_body_encoding=.

## ssl_timeout[RW] [](#attribute-i-ssl_timeout)
Sets or returns the SSL timeout seconds.

## ssl_version[RW] [](#attribute-i-ssl_version)
Sets or returns the SSL version. See
[:SSL::SSLContext#ssl_version=](OpenSSL::SSL::SSL::Context#ssl_version=).

## verify_callback[RW] [](#attribute-i-verify_callback)
Sets or returns the callback for the server certification verification.

## verify_depth[RW] [](#attribute-i-verify_depth)
Sets or returns the maximum depth for the certificate chain verification.

## verify_hostname[RW] [](#attribute-i-verify_hostname)
Sets or returns whether to verify that the server certificate is valid for the
hostname. See
[:SSL::SSLContext#verify_hostname=](OpenSSL::SSL::SSL::Context#verify_hostname
=).

## verify_mode[RW] [](#attribute-i-verify_mode)
Sets or returns the flags for server the certification verification at the
beginning of the SSL/TLS session. OpenSSL::SSL::VERIFY_NONE or
OpenSSL::SSL::VERIFY_PEER are acceptable.

## write_timeout[RW] [](#attribute-i-write_timeout)
Returns the numeric (Integer or Float) number of seconds to wait for one block
to be written (via one write(2) call); see #write_timeout=.


#Instance Methods
## copy(path, initheadernil) [](#method-i-copy)
Sends a COPY request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Copy object created from string `path`
and initial headers hash `initheader`.

    http = Net::HTTP.new(hostname)
    http.copy('/todos/1')

## delete(path, initheader{'Depth' => 'Infinity'}) [](#method-i-delete)
Sends a DELETE request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Delete object created from string
`path` and initial headers hash `initheader`.

    http = Net::HTTP.new(hostname)
    http.delete('/todos/1')

## finish() [](#method-i-finish)
Finishes the HTTP session:

    http = Net::HTTP.new(hostname)
    http.start
    http.started? # => true
    http.finish   # => nil
    http.started? # => false

Raises IOError if not in a session.

**@raise** [IOError] 

## get(path, initheadernil, destnil, &block) [](#method-i-get)
:call-seq:
    get(path, initheader = nil) {|res| ... }

Sends a GET request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Get object created from string `path`
and initial headers hash `initheader`.

With a block given, calls the block with the response body:

    http = Net::HTTP.new(hostname)
    http.get('/todos/1') do |res|
      p res
    end # => #<Net::HTTPOK 200 OK readbody=true>

Output:

    "{\n  \"userId\": 1,\n  \"id\": 1,\n  \"title\": \"delectus aut autem\",\n  \"completed\": false\n}"

With no block given, simply returns the response object:

    http.get('/') # => #<Net::HTTPOK 200 OK readbody=true>

Related:

*   Net::HTTP::Get: request class for HTTP method GET.
*   Net::HTTP.get: sends GET request, returns response body.

## head(path, initheadernil) [](#method-i-head)
Sends a HEAD request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Head object created from string `path`
and initial headers hash `initheader`:

    res = http.head('/todos/1') # => #<Net::HTTPOK 200 OK readbody=true>
    res.body                    # => nil
    res.to_hash.take(3)
    # =>
    [["date", ["Wed, 15 Feb 2023 15:25:42 GMT"]],
     ["content-type", ["application/json; charset=utf-8"]],
     ["connection", ["close"]]]

## initialize(address, portnil) [](#method-i-initialize)
Creates a new Net::HTTP object for the specified server address, without
opening the TCP connection or initializing the HTTP session. The `address`
should be a DNS hostname or IP address.

**@return** [HTTP] a new instance of HTTP

## inspect() [](#method-i-inspect)
Returns a string representation of `self`:

    Net::HTTP.new(hostname).inspect
    # => "#<Net::HTTP jsonplaceholder.typicode.com:80 open=false>"

## ipaddr() [](#method-i-ipaddr)
Returns the IP address for the connection.

If the session has not been started, returns the value set by #ipaddr=, or
`nil` if it has not been set:

    http = Net::HTTP.new(hostname)
    http.ipaddr # => nil
    http.ipaddr = '172.67.155.76'
    http.ipaddr # => "172.67.155.76"

If the session has been started, returns the IP address from the socket:

    http = Net::HTTP.new(hostname)
    http.start
    http.ipaddr # => "172.67.155.76"
    http.finish

## ipaddr=(addr) [](#method-i-ipaddr=)
Sets the IP address for the connection:

    http = Net::HTTP.new(hostname)
    http.ipaddr # => nil
    http.ipaddr = '172.67.155.76'
    http.ipaddr # => "172.67.155.76"

The IP address may not be set if the session has been started.

**@raise** [IOError] 

## lock(path, body, initheadernil) [](#method-i-lock)
Sends a LOCK request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Lock object created from string `path`,
string `body`, and initial headers hash `initheader`.

    data = '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}'
    http = Net::HTTP.new(hostname)
    http.lock('/todos/1', data)

## mkcol(path, bodynil, initheadernil) [](#method-i-mkcol)
Sends a MKCOL request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Mkcol object created from string
`path`, string `body`, and initial headers hash `initheader`.

    data = '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}'
    http.mkcol('/todos/1', data)
    http = Net::HTTP.new(hostname)

## move(path, initheadernil) [](#method-i-move)
Sends a MOVE request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Move object created from string `path`
and initial headers hash `initheader`.

    http = Net::HTTP.new(hostname)
    http.move('/todos/1')

## options(path, initheadernil) [](#method-i-options)
Sends an Options request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Options object created from string
`path` and initial headers hash `initheader`.

    http = Net::HTTP.new(hostname)
    http.options('/')

## patch(path, data, initheadernil, destnil, &block) [](#method-i-patch)
:call-seq:
    patch(path, data, initheader = nil) {|res| ... }

Sends a PATCH request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Patch object created from string
`path`, string `data`, and initial headers hash `initheader`.

With a block given, calls the block with the response body:

    data = '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}'
    http = Net::HTTP.new(hostname)
    http.patch('/todos/1', data) do |res|
      p res
    end # => #<Net::HTTPOK 200 OK readbody=true>

Output:

    "{\n  \"userId\": 1,\n  \"id\": 1,\n  \"title\": \"delectus aut autem\",\n  \"completed\": false,\n  \"{\\\"userId\\\": 1, \\\"id\\\": 1, \\\"title\\\": \\\"delectus aut autem\\\", \\\"completed\\\": false}\": \"\"\n}"

With no block given, simply returns the response object:

    http.patch('/todos/1', data) # => #<Net::HTTPCreated 201 Created readbody=true>

## peer_cert() [](#method-i-peer_cert)
Returns the X509 certificate chain (an array of strings) for the session's
socket peer, or `nil` if none.

## post(path, data, initheadernil, destnil, &block) [](#method-i-post)
:call-seq:
    post(path, data, initheader = nil) {|res| ... }

Sends a POST request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Post object created from string `path`,
string `data`, and initial headers hash `initheader`.

With a block given, calls the block with the response body:

    data = '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}'
    http = Net::HTTP.new(hostname)
    http.post('/todos', data) do |res|
      p res
    end # => #<Net::HTTPCreated 201 Created readbody=true>

Output:

    "{\n  \"{\\\"userId\\\": 1, \\\"id\\\": 1, \\\"title\\\": \\\"delectus aut autem\\\", \\\"completed\\\": false}\": \"\",\n  \"id\": 201\n}"

With no block given, simply returns the response object:

    http.post('/todos', data) # => #<Net::HTTPCreated 201 Created readbody=true>

Related:

*   Net::HTTP::Post: request class for HTTP method POST.
*   Net::HTTP.post: sends POST request, returns response body.

## propfind(path, bodynil, initheader{'Depth' => '0'}) [](#method-i-propfind)
Sends a PROPFIND request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Propfind object created from string
`path`, string `body`, and initial headers hash `initheader`.

    data = '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}'
    http = Net::HTTP.new(hostname)
    http.propfind('/todos/1', data)

## proppatch(path, body, initheadernil) [](#method-i-proppatch)
Sends a PROPPATCH request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Proppatch object created from string
`path`, string `body`, and initial headers hash `initheader`.

    data = '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}'
    http = Net::HTTP.new(hostname)
    http.proppatch('/todos/1', data)

## proxy?() [](#method-i-proxy?)
Returns `true` if a proxy server is defined, `false` otherwise; see [Proxy
Server](rdoc-ref:Net::HTTP@Proxy+Server).

**@return** [Boolean] 

## proxy_from_env?() [](#method-i-proxy_from_env?)
Returns `true` if the proxy server is defined in the environment, `false`
otherwise; see [Proxy Server](rdoc-ref:Net::HTTP@Proxy+Server).

**@return** [Boolean] 

## proxy_uri() [](#method-i-proxy_uri)
The proxy URI determined from the environment for this connection.

## put(path, data, initheadernil) [](#method-i-put)
Sends a PUT request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Put object created from string `path`,
string `data`, and initial headers hash `initheader`.

    data = '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}'
    http = Net::HTTP.new(hostname)
    http.put('/todos/1', data) # => #<Net::HTTPOK 200 OK readbody=true>

Related:

*   Net::HTTP::Put: request class for HTTP method PUT.
*   Net::HTTP.put: sends PUT request, returns response body.

## request(req, bodynil, &block) [](#method-i-request)
Sends the given request `req` to the server; forms the response into a
Net::HTTPResponse object.

The given `req` must be an instance of a [subclass of
Net::HTTPRequest](rdoc-ref:Net::HTTPRequest@Request+Subclasses). Argument
`body` should be given only if needed for the request.

With no block given, returns the response object:

    http = Net::HTTP.new(hostname)

    req = Net::HTTP::Get.new('/todos/1')
    http.request(req)
    # => #<Net::HTTPOK 200 OK readbody=true>

    req = Net::HTTP::Post.new('/todos')
    http.request(req, 'xyzzy')
    # => #<Net::HTTPCreated 201 Created readbody=true>

With a block given, calls the block with the response and returns the
response:

    req = Net::HTTP::Get.new('/todos/1')
    http.request(req) do |res|
      p res
    end # => #<Net::HTTPOK 200 OK readbody=true>

Output:

    #<Net::HTTPOK 200 OK readbody=false>

## request_get(path, initheadernil, &block) [](#method-i-request_get)
Sends a GET request to the server; forms the response into a Net::HTTPResponse
object.

The request is based on the Net::HTTP::Get object created from string `path`
and initial headers hash `initheader`.

With no block given, returns the response object:

    http = Net::HTTP.new(hostname)
    http.request_get('/todos') # => #<Net::HTTPOK 200 OK readbody=true>

With a block given, calls the block with the response object and returns the
response object:

    http.request_get('/todos') do |res|
      p res
    end # => #<Net::HTTPOK 200 OK readbody=true>

Output:

    #<Net::HTTPOK 200 OK readbody=false>

## request_head(path, initheadernil, &block) [](#method-i-request_head)
Sends a HEAD request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Head object created from string `path`
and initial headers hash `initheader`.

    http = Net::HTTP.new(hostname)
    http.head('/todos/1') # => #<Net::HTTPOK 200 OK readbody=true>

## request_post(path, data, initheadernil, &block) [](#method-i-request_post)
Sends a POST request to the server; forms the response into a
Net::HTTPResponse object.

The request is based on the Net::HTTP::Post object created from string `path`,
string `data`, and initial headers hash `initheader`.

With no block given, returns the response object:

    http = Net::HTTP.new(hostname)
    http.post('/todos', 'xyzzy')
    # => #<Net::HTTPCreated 201 Created readbody=true>

With a block given, calls the block with the response body and returns the
response object:

    http.post('/todos', 'xyzzy') do |res|
      p res
    end # => #<Net::HTTPCreated 201 Created readbody=true>

Output:

    "{\n  \"xyzzy\": \"\",\n  \"id\": 201\n}"

## request_put(path, data, initheadernil, &block) [](#method-i-request_put)
Sends a PUT request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Put object created from string `path`,
string `data`, and initial headers hash `initheader`.

    http = Net::HTTP.new(hostname)
    http.put('/todos/1', 'xyzzy')
    # => #<Net::HTTPOK 200 OK readbody=true>

## send_request(name, path, datanil, headernil) [](#method-i-send_request)
Sends an HTTP request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTPRequest object created from string
`path`, string `data`, and initial headers hash `header`. That object is an
instance of the [subclass of
Net::HTTPRequest](rdoc-ref:Net::HTTPRequest@Request+Subclasses), that
corresponds to the given uppercase string `name`, which must be an [HTTP
request method](https://en.wikipedia.org/wiki/HTTP#Request_methods) or a
[WebDAV request method](https://en.wikipedia.org/wiki/WebDAV#Implementation).

Examples:

    http = Net::HTTP.new(hostname)
    http.send_request('GET', '/todos/1')
    # => #<Net::HTTPOK 200 OK readbody=true>
    http.send_request('POST', '/todos', 'xyzzy')
    # => #<Net::HTTPCreated 201 Created readbody=true>

## set_debug_output(output) [](#method-i-set_debug_output)
**WARNING** This method opens a serious security hole. Never use this method
in production code.

Sets the output stream for debugging:

    http = Net::HTTP.new(hostname)
    File.open('t.tmp', 'w') do |file|
      http.set_debug_output(file)
      http.start
      http.get('/nosuch/1')
      http.finish
    end
    puts File.read('t.tmp')

Output:

    opening connection to jsonplaceholder.typicode.com:80...
    opened
    <- "GET /nosuch/1 HTTP/1.1\r\nAccept-Encoding: gzip;q=1.0,deflate;q=0.6,identity;q=0.3\r\nAccept: */*\r\nUser-Agent: Ruby\r\nHost: jsonplaceholder.typicode.com\r\n\r\n"
    -> "HTTP/1.1 404 Not Found\r\n"
    -> "Date: Mon, 12 Dec 2022 21:14:11 GMT\r\n"
    -> "Content-Type: application/json; charset=utf-8\r\n"
    -> "Content-Length: 2\r\n"
    -> "Connection: keep-alive\r\n"
    -> "X-Powered-By: Express\r\n"
    -> "X-Ratelimit-Limit: 1000\r\n"
    -> "X-Ratelimit-Remaining: 999\r\n"
    -> "X-Ratelimit-Reset: 1670879660\r\n"
    -> "Vary: Origin, Accept-Encoding\r\n"
    -> "Access-Control-Allow-Credentials: true\r\n"
    -> "Cache-Control: max-age=43200\r\n"
    -> "Pragma: no-cache\r\n"
    -> "Expires: -1\r\n"
    -> "X-Content-Type-Options: nosniff\r\n"
    -> "Etag: W/\"2-vyGp6PvFo4RvsFtPoIWeCReyIC8\"\r\n"
    -> "Via: 1.1 vegur\r\n"
    -> "CF-Cache-Status: MISS\r\n"
    -> "Server-Timing: cf-q-config;dur=1.3000000762986e-05\r\n"
    -> "Report-To: {\"endpoints\":[{\"url\":\"https:\\/\\/a.nel.cloudflare.com\\/report\\/v3?s=yOr40jo%2BwS1KHzhTlVpl54beJ5Wx2FcG4gGV0XVrh3X9OlR5q4drUn2dkt5DGO4GDcE%2BVXT7CNgJvGs%2BZleIyMu8CLieFiDIvOviOY3EhHg94m0ZNZgrEdpKD0S85S507l1vsEwEHkoTm%2Ff19SiO\"}],\"group\":\"cf-nel\",\"max_age\":604800}\r\n"
    -> "NEL: {\"success_fraction\":0,\"report_to\":\"cf-nel\",\"max_age\":604800}\r\n"
    -> "Server: cloudflare\r\n"
    -> "CF-RAY: 778977dc484ce591-DFW\r\n"
    -> "alt-svc: h3=\":443\"; ma=86400, h3-29=\":443\"; ma=86400\r\n"
    -> "\r\n"
    reading 2 bytes...
    -> "{}"
    read 2 bytes
    Conn keep-alive

## start() [](#method-i-start)
Starts an HTTP session.

Without a block, returns `self`:

    http = Net::HTTP.new(hostname)
    # => #<Net::HTTP jsonplaceholder.typicode.com:80 open=false>
    http.start
    # => #<Net::HTTP jsonplaceholder.typicode.com:80 open=true>
    http.started? # => true
    http.finish

With a block, calls the block with `self`, finishes the session when the block
exits, and returns the block's value:

    http.start do |http|
      http
    end
    # => #<Net::HTTP jsonplaceholder.typicode.com:80 open=false>
    http.started? # => false

**@raise** [IOError] 

## started?() [](#method-i-started?)
Returns `true` if the HTTP session has been started:

    http = Net::HTTP.new(hostname)
    http.started? # => false
    http.start
    http.started? # => true
    http.finish # => nil
    http.started? # => false

    Net::HTTP.start(hostname) do |http|
      http.started?
    end # => true
    http.started? # => false

**@return** [Boolean] 

## trace(path, initheadernil) [](#method-i-trace)
Sends a TRACE request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Trace object created from string `path`
and initial headers hash `initheader`.

    http = Net::HTTP.new(hostname)
    http.trace('/todos/1')

## unlock(path, body, initheadernil) [](#method-i-unlock)
Sends an UNLOCK request to the server; returns an instance of a subclass of
Net::HTTPResponse.

The request is based on the Net::HTTP::Unlock object created from string
`path`, string `body`, and initial headers hash `initheader`.

    data = '{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}'
    http = Net::HTTP.new(hostname)
    http.unlock('/todos/1', data)

## use_ssl=(flag) [](#method-i-use_ssl=)
Sets whether a new session is to use [Transport Layer
Security](https://en.wikipedia.org/wiki/Transport_Layer_Security):

Raises IOError if attempting to change during a session.

Raises OpenSSL::SSL::SSLError if the port is not an HTTPS port.

## use_ssl?() [](#method-i-use_ssl?)
Returns `true` if `self` uses SSL, `false` otherwise. See Net::HTTP#use_ssl=.

**@return** [Boolean] 

