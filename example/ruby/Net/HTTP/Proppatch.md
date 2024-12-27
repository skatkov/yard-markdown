# Class: Net::HTTP::Proppatch
**Inherits:** Net::HTTPRequest
    

Class for representing [WebDAV method
PROPPATCH](http://www.webdav.org/specs/rfc4918.html#METHOD_PROPPATCH):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Net::HTTP::Proppatch.new(uri) # => #<Net::HTTP::Proppatch PROPPATCH>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Related:

*   Net::HTTP#proppatch: sends `PROPPATCH` request, returns response object.



