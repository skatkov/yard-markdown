# Class: Gem::Net::HTTP::Lock
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [WebDAV method
LOCK](http://www.webdav.org/specs/rfc4918.html#METHOD_LOCK):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Lock.new(uri) # => #<Gem::Net::HTTP::Lock LOCK>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

Related:

*   Gem::Net::HTTP#lock: sends `LOCK` request, returns response object.



