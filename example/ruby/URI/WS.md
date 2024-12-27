# Class: URI::WS
**Inherits:** URI::Generic
    

The syntax of WS URIs is defined in RFC6455 section 3.

Note that the Ruby URI library allows WS URLs containing usernames and
passwords. This is not legal as per the RFC, but used to be supported in
Internet Explorer 5 and 6, before the MS04-004 security update. See
<URL:http://support.microsoft.com/kb/834489>.


# Class Methods
## build(args ) [](#method-c-build)
## Description

Creates a new URI::WS object from components, with syntax checking.

The components accepted are userinfo, host, port, path, and query.

The components should be provided either as an Array, or as a Hash with keys
formed by preceding the component names with a colon.

If an Array is used, the components must be passed in the order `[userinfo,
host, port, path, query]`.

Example:

    uri = URI::WS.build(host: 'www.example.com', path: '/foo/bar')

    uri = URI::WS.build([nil, "www.example.com", nil, "/path", "query"])

Currently, if passed userinfo components this method generates invalid WS URIs
as per RFC 1738.

#Instance Methods
## request_uri() [](#method-i-request_uri)
## Description

Returns the full path for a WS URI, as required by Net::HTTP::Get.

If the URI contains a query, the full path is URI#path + '?' + URI#query.
Otherwise, the path is simply URI#path.

Example:

    uri = URI::WS.build(path: '/foo/bar', query: 'test=true')
    uri.request_uri #  => "/foo/bar?test=true"

