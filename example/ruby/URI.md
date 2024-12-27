# Module: URI
    

--
# uri/common.rb

Author
:   Akira Yamada <akira@ruby-lang.org>

License
:   You can redistribute it and/or modify it under the same term as Ruby.


See URI for general documentation


# Class Methods
## const_missing(const ) [](#method-c-const_missing)
## decode_uri_component(str , enc Encoding::UTF_8) [](#method-c-decode_uri_component)
Like URI.decode_www_form_component, except that `'+'` is preserved.
## decode_www_form(str , enc Encoding::UTF_8, separator: '&', use__charset_: false, isindex: false) [](#method-c-decode_www_form)
Returns name/value pairs derived from the given string `str`, which must be an
ASCII string.

The method may be used to decode the body of Net::HTTPResponse object `res`
for which `res['Content-Type']` is `'application/x-www-form-urlencoded'`.

The returned data is an array of 2-element subarrays; each subarray is a
name/value pair (both are strings). Each returned string has encoding `enc`,
and has had invalid characters removed via
[String#scrub](rdoc-ref:String#scrub).

A simple example:

    URI.decode_www_form('foo=0&bar=1&baz')
    # => [["foo", "0"], ["bar", "1"], ["baz", ""]]

The returned strings have certain conversions, similar to those performed in
URI.decode_www_form_component:

    URI.decode_www_form('f%23o=%2F&b-r=%24&b+z=%40')
    # => [["f#o", "/"], ["b-r", "$"], ["b z", "@"]]

The given string may contain consecutive separators:

    URI.decode_www_form('foo=0&&bar=1&&baz=2')
    # => [["foo", "0"], ["", ""], ["bar", "1"], ["", ""], ["baz", "2"]]

A different separator may be specified:

    URI.decode_www_form('foo=0--bar=1--baz', separator: '--')
    # => [["foo", "0"], ["bar", "1"], ["baz", ""]]
**@raise** [ArgumentError] 

## decode_www_form_component(str , enc Encoding::UTF_8) [](#method-c-decode_www_form_component)
Returns a string decoded from the given URL-encoded string `str`.

The given string is first encoded as Encoding::ASCII-8BIT (using String#b),
then decoded (as below), and finally force-encoded to the given encoding
`enc`.

The returned string:

*   Preserves:

    *   Characters `'*'`, `'.'`, `'-'`, and `'_'`.
    *   Character in ranges `'a'..'z'`, `'A'..'Z'`, and `'0'..'9'`.

    Example:

        URI.decode_www_form_component('*.-_azAZ09')
        # => "*.-_azAZ09"

*   Converts:

    *   Character `'+'` to character `' '`.
    *   Each "percent notation" to an ASCII character.

    Example:

        URI.decode_www_form_component('Here+are+some+punctuation+characters%3A+%2C%3B%3F%3A')
        # => "Here are some punctuation characters: ,;?:"

Related: URI.decode_uri_component (preserves `'+'`).
## encode_uri_component(str , enc nil) [](#method-c-encode_uri_component)
Like URI.encode_www_form_component, except that `' '` (space) is encoded as
`'%20'` (instead of `'+'`).
## encode_www_form(enum , enc nil) [](#method-c-encode_www_form)
Returns a URL-encoded string derived from the given
[Enumerable](rdoc-ref:Enumerable@Enumerable+in+Ruby+Classes) `enum`.

The result is suitable for use as form data for an HTTP request whose
`Content-Type` is `'application/x-www-form-urlencoded'`.

The returned string consists of the elements of `enum`, each converted to one
or more URL-encoded strings, and all joined with character `'&'`.

Simple examples:

    URI.encode_www_form([['foo', 0], ['bar', 1], ['baz', 2]])
    # => "foo=0&bar=1&baz=2"
    URI.encode_www_form({foo: 0, bar: 1, baz: 2})
    # => "foo=0&bar=1&baz=2"

The returned string is formed using method URI.encode_www_form_component,
which converts certain characters:

    URI.encode_www_form('f#o': '/', 'b-r': '$', 'b z': '@')
    # => "f%23o=%2F&b-r=%24&b+z=%40"

When `enum` is Array-like, each element `ele` is converted to a field:

*   If `ele` is an array of two or more elements, the field is formed from its
    first two elements (and any additional elements are ignored):

        name = URI.encode_www_form_component(ele[0], enc)
        value = URI.encode_www_form_component(ele[1], enc)
        "#{name}=#{value}"

    Examples:

        URI.encode_www_form([%w[foo bar], %w[baz bat bah]])
        # => "foo=bar&baz=bat"
        URI.encode_www_form([['foo', 0], ['bar', :baz, 'bat']])
        # => "foo=0&bar=baz"

*   If `ele` is an array of one element, the field is formed from `ele[0]`:

        URI.encode_www_form_component(ele[0])

    Example:

        URI.encode_www_form([['foo'], [:bar], [0]])
        # => "foo&bar&0"

*   Otherwise the field is formed from `ele`:

        URI.encode_www_form_component(ele)

    Example:

        URI.encode_www_form(['foo', :bar, 0])
        # => "foo&bar&0"

The elements of an Array-like `enum` may be mixture:

    URI.encode_www_form([['foo', 0], ['bar', 1, 2], ['baz'], :bat])
    # => "foo=0&bar=1&baz&bat"

When `enum` is Hash-like, each `key`/`value` pair is converted to one or more
fields:

*   If `value` is
    [Array-convertible](rdoc-ref:implicit_conversion.rdoc@Array-Convertible+Ob
    jects), each element `ele` in `value` is paired with `key` to form a
    field:

        name = URI.encode_www_form_component(key, enc)
        value = URI.encode_www_form_component(ele, enc)
        "#{name}=#{value}"

    Example:

        URI.encode_www_form({foo: [:bar, 1], baz: [:bat, :bam, 2]})
        # => "foo=bar&foo=1&baz=bat&baz=bam&baz=2"

*   Otherwise, `key` and `value` are paired to form a field:

        name = URI.encode_www_form_component(key, enc)
        value = URI.encode_www_form_component(value, enc)
        "#{name}=#{value}"

    Example:

        URI.encode_www_form({foo: 0, bar: 1, baz: 2})
        # => "foo=0&bar=1&baz=2"

The elements of a Hash-like `enum` may be mixture:

    URI.encode_www_form({foo: [0, 1], bar: 2})
    # => "foo=0&foo=1&bar=2"
## encode_www_form_component(str , enc nil) [](#method-c-encode_www_form_component)
Returns a URL-encoded string derived from the given string `str`.

The returned string:

*   Preserves:

    *   Characters `'*'`, `'.'`, `'-'`, and `'_'`.
    *   Character in ranges `'a'..'z'`, `'A'..'Z'`, and `'0'..'9'`.

    Example:

        URI.encode_www_form_component('*.-_azAZ09')
        # => "*.-_azAZ09"

*   Converts:

    *   Character `' '` to character `'+'`.
    *   Any other character to "percent notation"; the percent notation for
        character *c* is `'%%%X' % c.ord`.

    Example:

        URI.encode_www_form_component('Here are some punctuation characters: ,;?:')
        # => "Here+are+some+punctuation+characters%3A+%2C%3B%3F%3A"

Encoding:

*   If `str` has encoding Encoding::ASCII_8BIT, argument `enc` is ignored.
*   Otherwise `str` is converted first to Encoding::UTF_8 (with suitable
    character replacements), and then to encoding `enc`.

In either case, the returned string has forced encoding Encoding::US_ASCII.

Related: URI.encode_uri_component (encodes `' '` as `'%20'`).
## extract(str , schemes nil, &block ) [](#method-c-extract)
## Synopsis

    URI::extract(str[, schemes][,&blk])

## Args

`str`
:   String to extract URIs from.

`schemes`
:   Limit URI matching to specific schemes.


## Description

Extracts URIs from a string. If block given, iterates through all matched
URIs. Returns nil if block given or array with matches.

## Usage

    require "uri"

    URI.extract("text here http://foo.example.org/bla and here mailto:test@example.com and here also.")
    # => ["http://foo.example.com/bla", "mailto:test@example.com"]
## for(scheme , *arguments , default: Generic) [](#method-c-for)
Returns a new object constructed from the given `scheme`, `arguments`, and
`default`:

*   The new object is an instance of `URI.scheme_list[scheme.upcase]`.
*   The object is initialized by calling the class initializer using `scheme`
    and `arguments`. See URI::Generic.new.

Examples:

    values = ['john.doe', 'www.example.com', '123', nil, '/forum/questions/', nil, 'tag=networking&order=newest', 'top']
    URI.for('https', *values)
    # => #<URI::HTTPS https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top>
    URI.for('foo', *values, default: URI::HTTP)
    # => #<URI::HTTP foo://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top>
## join(*str ) [](#method-c-join)
Merges the given URI strings `str` per [RFC
2396](https://www.rfc-editor.org/rfc/rfc2396.html).

Each string in `str` is converted to an [RFC3986
URI](https://www.rfc-editor.org/rfc/rfc3986.html) before being merged.

Examples:

    URI.join("http://example.com/","main.rbx")
    # => #<URI::HTTP http://example.com/main.rbx>

    URI.join('http://example.com', 'foo')
    # => #<URI::HTTP http://example.com/foo>

    URI.join('http://example.com', '/foo', '/bar')
    # => #<URI::HTTP http://example.com/bar>

    URI.join('http://example.com', '/foo', 'bar')
    # => #<URI::HTTP http://example.com/bar>

    URI.join('http://example.com', '/foo/', 'bar')
    # => #<URI::HTTP http://example.com/foo/bar>
## open(name , *rest , &block ) [](#method-c-open)
Allows the opening of various resources including URIs.

If the first argument responds to the 'open' method, 'open' is called on it
with the rest of the arguments.

If the first argument is a string that begins with `(protocol)://`, it is
parsed by URI.parse.  If the parsed object responds to the 'open' method,
'open' is called on it with the rest of the arguments.

Otherwise, Kernel#open is called.

OpenURI::OpenRead#open provides URI::HTTP#open, URI::HTTPS#open and
URI::FTP#open, Kernel#open.

We can accept URIs and strings that begin with http://, https:// and ftp://.
In these cases, the opened file object is extended by OpenURI::Meta.
## parse(uri ) [](#method-c-parse)
Returns a new URI object constructed from the given string `uri`:

    URI.parse('https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top')
    # => #<URI::HTTPS https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top>
    URI.parse('http://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top')
    # => #<URI::HTTP http://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top>

It's recommended to first ::escape string `uri` if it may contain invalid URI
characters.
## parser=(parser RFC3986_PARSER) [](#method-c-parser=)
## regexp(schemes nil) [](#method-c-regexp)
## Synopsis

    URI::regexp([match_schemes])

## Args

`match_schemes`
:   Array of schemes. If given, resulting regexp matches to URIs whose scheme
    is one of the match_schemes.


## Description

Returns a Regexp object which matches to URI-like strings. The Regexp object
returned by this method includes arbitrary number of capture group
(parentheses).  Never rely on its number.

## Usage

    require 'uri'

    # extract first URI from html_string
    html_string.slice(URI.regexp)

    # remove ftp URIs
    html_string.sub(URI.regexp(['ftp']), '')

    # You should not rely on the number of parentheses
    html_string.scan(URI.regexp) do |*matches|
      p $&
    end
## register_scheme(scheme , klass ) [](#method-c-register_scheme)
Registers the given `klass` as the class to be instantiated when parsing a URI
with the given `scheme`:

    URI.register_scheme('MS_SEARCH', URI::Generic) # => URI::Generic
    URI.scheme_list['MS_SEARCH']                   # => URI::Generic

Note that after calling String#upcase on `scheme`, it must be a valid constant
name.
## scheme_list() [](#method-c-scheme_list)
Returns a hash of the defined schemes:

    URI.scheme_list
    # =>
    {"MAILTO"=>URI::MailTo,
     "LDAPS"=>URI::LDAPS,
     "WS"=>URI::WS,
     "HTTP"=>URI::HTTP,
     "HTTPS"=>URI::HTTPS,
     "LDAP"=>URI::LDAP,
     "FILE"=>URI::File,
     "FTP"=>URI::FTP}

Related: URI.register_scheme.
## split(uri ) [](#method-c-split)
Returns a 9-element array representing the parts of the URI formed from the
string `uri`; each array element is a string or `nil`:

    names = %w[scheme userinfo host port registry path opaque query fragment]
    values = URI.split('https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top')
    names.zip(values)
    # =>
    [["scheme", "https"],
     ["userinfo", "john.doe"],
     ["host", "www.example.com"],
     ["port", "123"],
     ["registry", nil],
     ["path", "/forum/questions/"],
     ["opaque", nil],
     ["query", "tag=networking&order=newest"],
     ["fragment", "top"]]

