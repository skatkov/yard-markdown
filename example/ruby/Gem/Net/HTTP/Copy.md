# Class: Gem::Net::HTTP::Copy
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [WebDAV method
COPY](http://www.webdav.org/specs/rfc4918.html#METHOD_COPY):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Copy.new(uri) # => #<Gem::Net::HTTP::Copy COPY>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

Related:

*   Gem::Net::HTTP#copy: sends `COPY` request, returns response object.



