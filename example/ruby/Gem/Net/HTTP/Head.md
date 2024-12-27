# Class: Gem::Net::HTTP::Head
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [HTTP method
HEAD](https://en.wikipedia.org/w/index.php?title=Hypertext_Transfer_Protocol#H
EAD_method):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Head.new(uri) # => #<Gem::Net::HTTP::Head HEAD>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

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

*   Gem::Net::HTTP#head: sends `HEAD` request, returns response object.



