# Class: Gem::Net::HTTP::Mkcol
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [WebDAV method
MKCOL](http://www.webdav.org/specs/rfc4918.html#METHOD_MKCOL):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Mkcol.new(uri) # => #<Gem::Net::HTTP::Mkcol MKCOL>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

Related:

*   Gem::Net::HTTP#mkcol: sends `MKCOL` request, returns response object.



