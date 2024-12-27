# Class: Net::HTTP::Unlock
**Inherits:** Net::HTTPRequest
    

Class for representing [WebDAV method
UNLOCK](http://www.webdav.org/specs/rfc4918.html#METHOD_UNLOCK):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Net::HTTP::Unlock.new(uri) # => #<Net::HTTP::Unlock UNLOCK>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Related:

*   Net::HTTP#unlock: sends `UNLOCK` request, returns response object.



