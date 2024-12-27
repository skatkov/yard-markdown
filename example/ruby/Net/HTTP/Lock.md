# Class: Net::HTTP::Lock
**Inherits:** Net::HTTPRequest
    

Class for representing [WebDAV method
LOCK](http://www.webdav.org/specs/rfc4918.html#METHOD_LOCK):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Net::HTTP::Lock.new(uri) # => #<Net::HTTP::Lock LOCK>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Related:

*   Net::HTTP#lock: sends `LOCK` request, returns response object.



