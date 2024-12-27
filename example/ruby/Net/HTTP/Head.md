# Class: Net::HTTP::Head
**Inherits:** Net::HTTPRequest
    

Class for representing [HTTP method
HEAD](https://en.wikipedia.org/w/index.php?title=Hypertext_Transfer_Protocol#H
EAD_method):

    require 'net/http'
    uri = URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Net::HTTP::Head.new(uri) # => #<Net::HTTP::Head HEAD>
    res = Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Net::HTTPRequest@Request+Headers).

Properties:

*   Request body: optional.
*   Response body: no.
*   [Safe](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Safe_meth
    ods): yes.
*   [Idempotent](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Ide
    mpotent_methods): yes.
*   [Cacheable](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Cach
    eable_methods): yes.

Related:

*   Net::HTTP#head: sends `HEAD` request, returns response object.



