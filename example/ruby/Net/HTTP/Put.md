# Class: Net::HTTP::Put
**Inherits:** Net::HTTPRequest
    

Class for representing [HTTP method
PUT](https://en.wikipedia.org/w/index.php?title=Hypertext_Transfer_Protocol#PU
T_method):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    uri.path = '/posts'
    req = Net::HTTP::Put.new(uri) # => #<Net::HTTP::Put PUT>
    req.body = '{"title": "foo","body": "bar","userId": 1}'
    req.content_type = 'application/json'
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Properties:

*   Request body: yes.
*   Response body: yes.
*   [Safe](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Safe_meth
    ods): no.
*   [Idempotent](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Ide
    mpotent_methods): yes.
*   [Cacheable](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Cach
    eable_methods): no.

Related:

*   Net::HTTP.put: sends `PUT` request, returns response object.
*   Net::HTTP#put: sends `PUT` request, returns response object.



