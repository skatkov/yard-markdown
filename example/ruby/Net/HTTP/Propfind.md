# Class: Net::HTTP::Propfind
**Inherits:** Net::HTTPRequest
    

Class for representing [WebDAV method
PROPFIND](http://www.webdav.org/specs/rfc4918.html#METHOD_PROPFIND):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Net::HTTP::Propfind.new(uri) # => #<Net::HTTP::Propfind PROPFIND>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Related:

*   Net::HTTP#propfind: sends `PROPFIND` request, returns response object.



