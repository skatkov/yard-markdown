# Class: Gem::Net::HTTP::Move
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [WebDAV method
MOVE](http://www.webdav.org/specs/rfc4918.html#METHOD_MOVE):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Move.new(uri) # => #<Gem::Net::HTTP::Move MOVE>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

Related:

*   Gem::Net::HTTP#move: sends `MOVE` request, returns response object.



