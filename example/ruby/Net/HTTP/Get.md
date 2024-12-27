# Class: Net::HTTP::Get
**Inherits:** Net::HTTPRequest
    

Class for representing [HTTP method
GET](https://en.wikipedia.org/w/index.php?title=Hypertext_Transfer_Protocol#GE
T_method):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Net::HTTP::Get.new(uri) # => #<Net::HTTP::Get GET>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Properties:

*   Request body: optional.
*   Response body: yes.
*   [Safe](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Safe_meth
    ods): yes.
*   [Idempotent](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Ide
    mpotent_methods): yes.
*   [Cacheable](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Cach
    eable_methods): yes.

Related:

*   Net::HTTP.get: sends `GET` request, returns response body.
*   Net::HTTP#get: sends `GET` request, returns response object.



