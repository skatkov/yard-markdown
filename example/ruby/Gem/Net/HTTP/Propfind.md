# Class: Gem::Net::HTTP::Propfind
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [WebDAV method
PROPFIND](http://www.webdav.org/specs/rfc4918.html#METHOD_PROPFIND):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Propfind.new(uri) # => #<Gem::Net::HTTP::Propfind PROPFIND>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

Related:

*   Gem::Net::HTTP#propfind: sends `PROPFIND` request, returns response
    object.



