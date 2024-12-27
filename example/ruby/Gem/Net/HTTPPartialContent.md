# Class: Gem::Net::HTTPPartialContent
**Inherits:** Gem::Net::HTTPSuccess
    

Response class for `Partial Content` responses (status code 206).

The `Partial Content` response indicates that the server is delivering only
part of the resource (byte serving) due to a Range header in the request.

:include: doc/net-http/included_getters.rdoc

References:

*   [Mozilla](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/206).
*   [RFC
    9110](https://www.rfc-editor.org/rfc/rfc9110.html#name-206-partial-content
    ).
*   [Wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#206).



