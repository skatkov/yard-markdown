# Class: Net::HTTPAlreadyReported
**Inherits:** Net::HTTPSuccess
    

Response class for `Already Reported (WebDAV)` responses (status code 208).

The `Already Reported (WebDAV)` response indicates that the server has
received the request, and that the members of a DAV binding have already been
enumerated in a preceding part of the (multi-status) response, and are not
being included again.

:include: doc/net-http/included_getters.rdoc

References:

*   [RFC 5842](https://www.rfc-editor.org/rfc/rfc5842.html#section-7.1).
*   [Wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#208).



