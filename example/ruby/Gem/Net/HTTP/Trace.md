# Class: Gem::Net::HTTP::Trace
**Inherits:** Gem::Net::HTTPRequest
    

Class for representing [HTTP method
TRACE](https://en.wikipedia.org/w/index.php?title=Hypertext_Transfer_Protocol#
TRACE_method):

    require 'rubygems/vendor/net-http/lib/net/http'
    uri = Gem::URI('http://example.com')
    hostname = uri.hostname # => "example.com"
    req = Gem::Net::HTTP::Trace.new(uri) # => #<Gem::Net::HTTP::Trace TRACE>
    res = Gem::Net::HTTP.start(hostname) do |http|
      http.request(req)
    end

See [Request Headers](rdoc-ref:Gem::Net::HTTPRequest@Request+Headers).

Properties:

*   Request body: no.
*   Response body: yes.
*   [Safe](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Safe_meth
    ods): yes.
*   [Idempotent](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Ide
    mpotent_methods): yes.
*   [Cacheable](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Cach
    eable_methods): no.

Related:

*   Gem::Net::HTTP#trace: sends `TRACE` request, returns response object.



