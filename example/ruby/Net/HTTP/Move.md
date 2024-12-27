# Class: Net::HTTP::Move
**Inherits:** Net::HTTPRequest
    

Class for representing [WebDAV method
MOVE](http://www.webdav.org/specs/rfc4918.html#METHOD_MOVE):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Net::HTTP::Move.new(uri) # => #<Net::HTTP::Move MOVE>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Related:

*   Net::HTTP#move: sends `MOVE` request, returns response object.



