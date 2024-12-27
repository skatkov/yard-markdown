# Class: Gem::Net::HTTP::Options
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [HTTP method
OPTIONS](https://en.wikipedia.org/w/index.php?title=Hypertext_Transfer_Protoco
l#OPTIONS_method):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Options.new(uri) # => #<Gem::Net::HTTP::Options OPTIONS>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

Properties:

*   Request body: optional.
*   Response body: yes.
*   [Safe](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Safe_meth
    ods): yes.
*   [Idempotent](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Ide
    mpotent_methods): yes.
*   [Cacheable](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Cach
    eable_methods): no.

Related:

*   Gem::Net::HTTP#options: sends `OPTIONS` request, returns response object.



