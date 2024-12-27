# Class: Gem::URI::HTTP
**Inherits:** Gem::URI::Generic
    

The syntax of HTTP URIs is defined in RFC1738 section 3.3.

Note that the Ruby Gem::URI library allows HTTP URLs containing usernames and
passwords. This is not legal as per the RFC, but used to be supported in
Internet Explorer 5 and 6, before the MS04-004 security update. See
<URL:http://support.microsoft.com/kb/834489>.


# Class Methods
## build(args ) [](#method-c-build)
## Description

Creates a new Gem::URI::HTTP object from components, with syntax checking.

The components accepted are userinfo, host, port, path, query, and fragment.

The components should be provided either as an Array, or as a Hash with keys
formed by preceding the component names with a colon.

If an Array is used, the components must be passed in the order `[userinfo,
host, port, path, query, fragment]`.

Example:

    uri = Gem::URI::HTTP.build(host: 'www.example.com', path: '/foo/bar')

    uri = Gem::URI::HTTP.build([nil, "www.example.com", nil, "/path",
      "query", 'fragment'])

Currently, if passed userinfo components this method generates invalid HTTP
URIs as per RFC 1738.

#Instance Methods
## authority() [](#method-i-authority)
## Description

Returns the authority for an HTTP uri, as defined in
https://www.rfc-editor.org/rfc/rfc3986#section-3.2.

Example:

    Gem::URI::HTTP.build(host: 'www.example.com', path: '/foo/bar').authority #=> "www.example.com"
    Gem::URI::HTTP.build(host: 'www.example.com', port: 8000, path: '/foo/bar').authority #=> "www.example.com:8000"
    Gem::URI::HTTP.build(host: 'www.example.com', port: 80, path: '/foo/bar').authority #=> "www.example.com"

## origin() [](#method-i-origin)
## Description

Returns the origin for an HTTP uri, as defined in
https://www.rfc-editor.org/rfc/rfc6454.

Example:

    Gem::URI::HTTP.build(host: 'www.example.com', path: '/foo/bar').origin #=> "http://www.example.com"
    Gem::URI::HTTP.build(host: 'www.example.com', port: 8000, path: '/foo/bar').origin #=> "http://www.example.com:8000"
    Gem::URI::HTTP.build(host: 'www.example.com', port: 80, path: '/foo/bar').origin #=> "http://www.example.com"
    Gem::URI::HTTPS.build(host: 'www.example.com', path: '/foo/bar').origin #=> "https://www.example.com"

## request_uri() [](#method-i-request_uri)
## Description

Returns the full path for an HTTP request, as required by Net::HTTP::Get.

If the Gem::URI contains a query, the full path is Gem::URI#path + '?' +
Gem::URI#query. Otherwise, the path is simply Gem::URI#path.

Example:

    uri = Gem::URI::HTTP.build(path: '/foo/bar', query: 'test=true')
    uri.request_uri #  => "/foo/bar?test=true"

