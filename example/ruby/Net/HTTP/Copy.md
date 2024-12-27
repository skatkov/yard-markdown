# Class: Net::HTTP::Copy
**Inherits:** Net::HTTPRequest
    

Class for representing [WebDAV method
COPY](http://www.webdav.org/specs/rfc4918.html#METHOD_COPY):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Net::HTTP::Copy.new(uri) # => #<Net::HTTP::Copy COPY>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Related:

*   Net::HTTP#copy: sends `COPY` request, returns response object.



