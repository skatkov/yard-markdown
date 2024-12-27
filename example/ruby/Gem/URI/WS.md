# Class: Gem::URI::WS
**Inherits:** Gem::URI::Generic
    

The syntax of WS URIs is defined in RFC6455 section 3.

Note that the Ruby Gem::URI library allows WS URLs containing usernames and
passwords. This is not legal as per the RFC, but used to be supported in
Internet Explorer 5 and 6, before the MS04-004 security update. See
<URL:http://support.microsoft.com/kb/834489>.


# Class Methods
## build(args ) [](#method-c-build)
## Description

Creates a new Gem::URI::WS object from components, with syntax checking.

The components accepted are userinfo, host, port, path, and query.

The components should be provided either as an Array, or as a Hash with keys
formed by preceding the component names with a colon.

If an Array is used, the components must be passed in the order `[userinfo,
host, port, path, query]`.

Example:

    uri = Gem::URI::WS.build(host: 'www.example.com', path: '/foo/bar')

    uri = Gem::URI::WS.build([nil, "www.example.com", nil, "/path", "query"])

Currently, if passed userinfo components this method generates invalid WS URIs
as per RFC 1738.

#Instance Methods
## request_uri() [](#method-i-request_uri)
## Description

Returns the full path for a WS Gem::URI, as required by Net::HTTP::Get.

If the Gem::URI contains a query, the full path is Gem::URI#path + '?' +
Gem::URI#query. Otherwise, the path is simply Gem::URI#path.

Example:

    uri = Gem::URI::WS.build(path: '/foo/bar', query: 'test=true')
    uri.request_uri #  => "/foo/bar?test=true"

