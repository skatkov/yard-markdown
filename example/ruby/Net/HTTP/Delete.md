# Class: Net::HTTP::Delete
**Inherits:** Net::HTTPRequest
    

Class for representing [HTTP method
DELETE](https://en.wikipedia.org/w/index.php?title=Hypertext_Transfer_Protocol
#DELETE_method):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    uri.path = '/posts/1'
    req = Net::HTTP::Delete.new(uri) # => #<Net::HTTP::Delete DELETE>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Properties:

*   Request body: optional.
*   Response body: yes.
*   [Safe](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Safe_meth
    ods): no.
*   [Idempotent](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Ide
    mpotent_methods): yes.
*   [Cacheable](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Cach
    eable_methods): no.

Related:

*   Net::HTTP#delete: sends `DELETE` request, returns response object.



