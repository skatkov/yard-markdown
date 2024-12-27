# Class: Gem::Net::HTTP::Post
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [HTTP method
POST](https://en.wikipedia.org/w/index.php?title=Hypertext_Transfer_Protocol#P
OST_method):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    uri.path = '/posts'
    req = Gem::Net::HTTP::Post.new(uri) # => #<Gem::Net::HTTP::Post POST>
    req.body = '{"title": "foo","body": "bar","userId": 1}'
    req.content_type = 'application/json'
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

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

*   Gem::Net::HTTP.post: sends `POST` request, returns response object.
*   Gem::Net::HTTP#post: sends `POST` request, returns response object.



