# Class: Gem::Net::HTTP::Proppatch
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [WebDAV method
PROPPATCH](http://www.webdav.org/specs/rfc4918.html#METHOD_PROPPATCH):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Proppatch.new(uri) # => #<Gem::Net::HTTP::Proppatch PROPPATCH>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

Related:

*   Gem::Net::HTTP#proppatch: sends `PROPPATCH` request, returns response
    object.



