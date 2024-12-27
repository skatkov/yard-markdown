# Class: Net::HTTP::Mkcol
**Inherits:** Net::HTTPRequest
    

Class for representing [WebDAV method
MKCOL](http://www.webdav.org/specs/rfc4918.html#METHOD_MKCOL):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Net::HTTP::Mkcol.new(uri) # => #<Net::HTTP::Mkcol MKCOL>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Related:

*   Net::HTTP#mkcol: sends `MKCOL` request, returns response object.



