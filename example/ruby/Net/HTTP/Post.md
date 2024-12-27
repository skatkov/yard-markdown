# Class: Net::HTTP::Post
**Inherits:** Net::HTTPRequest
    

Class for representing [HTTP method
POST](https://en.wikipedia.org/w/index.php?title=Hypertext_Transfer_Protocol#P
OST_method):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    uri.path = '/posts'
    req = Net::HTTP::Post.new(uri) # => #<Net::HTTP::Post POST>
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
    mpotent_methods): no.
*   [Cacheable](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Cach
    eable_methods): yes.

Related:

*   Net::HTTP.post: sends `POST` request, returns response object.
*   Net::HTTP#post: sends `POST` request, returns response object.



