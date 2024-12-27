# Class: Gem::Net::HTTP::Unlock
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [WebDAV method
UNLOCK](http://www.webdav.org/specs/rfc4918.html#METHOD_UNLOCK):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Unlock.new(uri) # => #<Gem::Net::HTTP::Unlock UNLOCK>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

Related:

*   Gem::Net::HTTP#unlock: sends `UNLOCK` request, returns response object.



