# Module: Gem::URI
    

--
# uri/common.rb

Author
:   Akira Yamada <akira@ruby-lang.org>

License
:   You can redistribute it and/or modify it under the same term as Ruby.


See Gem::URI for general documentation


# Class Methods
## const_missing(const ) [](#method-c-const_missing)
## decode_uri_component(str , enc Encoding::UTF_8) [](#method-c-decode_uri_component)
Like Gem::URI.decode_www_form_component, except that `'+'` is preserved.
## decode_www_form(str , enc Encoding::UTF_8, separator: '&', use__charset_: false, isindex: false) [](#method-c-decode_www_form)
Returns name/value pairs derived from the given string `str`, which must be an
ASCII string.

The method may be used to decode the body of Net::HTTPResponse object `res`
for which `res['Content-Type']` is `'application/x-www-form-urlencoded'`.

The returned data is an array of 2-element subarrays; each subarray is a
name/value pair (both are strings). Each returned string has encoding `enc`,
and has had invalid characters removed via
[String#scrub](https://docs.ruby-lang.org/en/master/String.html#method-i-scrub
).

A simple example:

    Gem::URI.decode_www_form('foo=0&bar=1&baz')
    # => [["foo", "0"], ["bar", "1"], ["baz", ""]]

The returned strings have certain conversions, similar to those performed in
Gem::URI.decode_www_form_component:

    Gem::URI.decode_www_form('f%23o=%2F&b-r=%24&b+z=%40')
    # => [["f#o", "/"], ["b-r", "$"], ["b z", "@"]]

The given string may contain consecutive separators:

    Gem::URI.decode_www_form('foo=0&&bar=1&&baz=2')
    # => [["foo", "0"], ["", ""], ["bar", "1"], ["", ""], ["baz", "2"]]

A different separator may be specified:

    Gem::URI.decode_www_form('foo=0--bar=1--baz', separator: '--')
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

        Gem::URI.decode_www_form_component('*.-_azAZ09')
        # => "*.-_azAZ09"

*   Converts:

    *   Character `'+'` to character `' '`.
    *   Each "percent notation" to an ASCII character.

    Example:

        Gem::URI.decode_www_form_component('Here+are+some+punctuation+characters%3A+%2C%3B%3F%3A')
        # => "Here are some punctuation characters: ,;?:"

Related: Gem::URI.decode_uri_component (preserves `'+'`).
## encode_uri_component(str , enc nil) [](#method-c-encode_uri_component)
Like Gem::URI.encode_www_form_component, except that `' '` (space) is encoded
as `'%20'` (instead of `'+'`).
## encode_www_form(enum , enc nil) [](#method-c-encode_www_form)
Returns a URL-encoded string derived from the given
[Enumerable](https://docs.ruby-lang.org/en/master/Enumerable.html#module-Enume
rable-label-Enumerable+in+Ruby+Classes) `enum`.

The result is suitable for use as form data for an HTTP request whose
`Content-Type` is `'application/x-www-form-urlencoded'`.

The returned string consists of the elements of `enum`, each converted to one
or more URL-encoded strings, and all joined with character `'&'`.

Simple examples:

    Gem::URI.encode_www_form([['foo', 0], ['bar', 1], ['baz', 2]])
    # => "foo=0&bar=1&baz=2"
    Gem::URI.encode_www_form({foo: 0, bar: 1, baz: 2})
    # => "foo=0&bar=1&baz=2"

The returned string is formed using method Gem::URI.encode_www_form_component,
which converts certain characters:

    Gem::URI.encode_www_form('f#o': '/', 'b-r': '$', 'b z': '@')
    # => "f%23o=%2F&b-r=%24&b+z=%40"

When `enum` is Array-like, each element `ele` is converted to a field:

*   If `ele` is an array of two or more elements, the field is formed from its
    first two elements (and any additional elements are ignored):

        name = Gem::URI.encode_www_form_component(ele[0], enc)
        value = Gem::URI.encode_www_form_component(ele[1], enc)
        "#{name}=#{value}"

    Examples:

        Gem::URI.encode_www_form([%w[foo bar], %w[baz bat bah]])
        # => "foo=bar&baz=bat"
        Gem::URI.encode_www_form([['foo', 0], ['bar', :baz, 'bat']])
        # => "foo=0&bar=baz"

*   If `ele` is an array of one element, the field is formed from `ele[0]`:

        Gem::URI.encode_www_form_component(ele[0])

    Example:

        Gem::URI.encode_www_form([['foo'], [:bar], [0]])
        # => "foo&bar&0"

*   Otherwise the field is formed from `ele`:

        Gem::URI.encode_www_form_component(ele)

    Example:

        Gem::URI.encode_www_form(['foo', :bar, 0])
        # => "foo&bar&0"

The elements of an Array-like `enum` may be mixture:

    Gem::URI.encode_www_form([['foo', 0], ['bar', 1, 2], ['baz'], :bat])
    # => "foo=0&bar=1&baz&bat"

When `enum` is Hash-like, each `key`/`value` pair is converted to one or more
fields:

*   If `value` is
    [Array-convertible](https://docs.ruby-lang.org/en/master/implicit_conversi
    on_rdoc.html#label-Array-Convertible+Objects), each element `ele` in
    `value` is paired with `key` to form a field:

        name = Gem::URI.encode_www_form_component(key, enc)
        value = Gem::URI.encode_www_form_component(ele, enc)
        "#{name}=#{value}"

    Example:

        Gem::URI.encode_www_form({foo: [:bar, 1], baz: [:bat, :bam, 2]})
        # => "foo=bar&foo=1&baz=bat&baz=bam&baz=2"

*   Otherwise, `key` and `value` are paired to form a field:

        name = Gem::URI.encode_www_form_component(key, enc)
        value = Gem::URI.encode_www_form_component(value, enc)
        "#{name}=#{value}"

    Example:

        Gem::URI.encode_www_form({foo: 0, bar: 1, baz: 2})
        # => "foo=0&bar=1&baz=2"

The elements of a Hash-like `enum` may be mixture:

    Gem::URI.encode_www_form({foo: [0, 1], bar: 2})
    # => "foo=0&foo=1&bar=2"
## encode_www_form_component(str , enc nil) [](#method-c-encode_www_form_component)
Returns a URL-encoded string derived from the given string `str`.

The returned string:

*   Preserves:

    *   Characters `'*'`, `'.'`, `'-'`, and `'_'`.
    *   Character in ranges `'a'..'z'`, `'A'..'Z'`, and `'0'..'9'`.

    Example:

        Gem::URI.encode_www_form_component('*.-_azAZ09')
        # => "*.-_azAZ09"

*   Converts:

    *   Character `' '` to character `'+'`.
    *   Any other character to "percent notation"; the percent notation for
        character *c* is `'%%%X' % c.ord`.

    Example:

        Gem::URI.encode_www_form_component('Here are some punctuation characters: ,;?:')
        # => "Here+are+some+punctuation+characters%3A+%2C%3B%3F%3A"

Encoding:

*   If `str` has encoding Encoding::ASCII_8BIT, argument `enc` is ignored.
*   Otherwise `str` is converted first to Encoding::UTF_8 (with suitable
    character replacements), and then to encoding `enc`.

In either case, the returned string has forced encoding Encoding::US_ASCII.

Related: Gem::URI.encode_uri_component (encodes `' '` as `'%20'`).
## extract(str , schemes nil, &block ) [](#method-c-extract)
## Synopsis

    Gem::URI::extract(str[, schemes][,&blk])

## Args

`str`
:   String to extract URIs from.

`schemes`
:   Limit Gem::URI matching to specific schemes.


## Description

Extracts URIs from a string. If block given, iterates through all matched
URIs. Returns nil if block given or array with matches.

## Usage

    require "rubygems/vendor/uri/lib/uri"

    Gem::URI.extract("text here http://foo.example.org/bla and here mailto:test@example.com and here also.")
    # => ["http://foo.example.com/bla", "mailto:test@example.com"]
## for(scheme , *arguments , default: Generic) [](#method-c-for)
Returns a new object constructed from the given `scheme`, `arguments`, and
`default`:

*   The new object is an instance of `Gem::URI.scheme_list[scheme.upcase]`.
*   The object is initialized by calling the class initializer using `scheme`
    and `arguments`. See Gem::URI::Generic.new.

Examples:

    values = ['john.doe', 'www.example.com', '123', nil, '/forum/questions/', nil, 'tag=networking&order=newest', 'top']
    Gem::URI.for('https', *values)
    # => #<Gem::URI::HTTPS https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top>
    Gem::URI.for('foo', *values, default: Gem::URI::HTTP)
    # => #<Gem::URI::HTTP foo://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top>
## join(*str ) [](#method-c-join)
Merges the given Gem::URI strings `str` per [RFC
2396](https://www.rfc-editor.org/rfc/rfc2396.html).

Each string in `str` is converted to an [RFC3986
Gem::URI](https://www.rfc-editor.org/rfc/rfc3986.html) before being merged.

Examples:

    Gem::URI.join("http://example.com/","main.rbx")
    # => #<Gem::URI::HTTP http://example.com/main.rbx>

    Gem::URI.join('http://example.com', 'foo')
    # => #<Gem::URI::HTTP http://example.com/foo>

    Gem::URI.join('http://example.com', '/foo', '/bar')
    # => #<Gem::URI::HTTP http://example.com/bar>

    Gem::URI.join('http://example.com', '/foo', 'bar')
    # => #<Gem::URI::HTTP http://example.com/bar>

    Gem::URI.join('http://example.com', '/foo/', 'bar')
    # => #<Gem::URI::HTTP http://example.com/foo/bar>
## parse(uri ) [](#method-c-parse)
Returns a new Gem::URI object constructed from the given string `uri`:

    Gem::URI.parse('https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top')
    # => #<Gem::URI::HTTPS https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top>
    Gem::URI.parse('http://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top')
    # => #<Gem::URI::HTTP http://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top>

It's recommended to first ::escape string `uri` if it may contain invalid
Gem::URI characters.
## parser=(parser RFC3986_PARSER) [](#method-c-parser=)
## regexp(schemes nil) [](#method-c-regexp)
## Synopsis

    Gem::URI::regexp([match_schemes])

## Args

`match_schemes`
:   Array of schemes. If given, resulting regexp matches to URIs whose scheme
    is one of the match_schemes.


## Description

Returns a Regexp object which matches to Gem::URI-like strings. The Regexp
object returned by this method includes arbitrary number of capture group
(parentheses).  Never rely on its number.

## Usage

    require 'rubygems/vendor/uri/lib/uri'

    # extract first Gem::URI from html_string
    html_string.slice(Gem::URI.regexp)

    # remove ftp URIs
    html_string.sub(Gem::URI.regexp(['ftp']), '')

    # You should not rely on the number of parentheses
    html_string.scan(Gem::URI.regexp) do |*matches|
      p $&
    end
## register_scheme(scheme , klass ) [](#method-c-register_scheme)
Registers the given `klass` as the class to be instantiated when parsing a
Gem::URI with the given `scheme`:

    Gem::URI.register_scheme('MS_SEARCH', Gem::URI::Generic) # => Gem::URI::Generic
    Gem::URI.scheme_list['MS_SEARCH']                   # => Gem::URI::Generic

Note that after calling String#upcase on `scheme`, it must be a valid constant
name.
## scheme_list() [](#method-c-scheme_list)
Returns a hash of the defined schemes:

    Gem::URI.scheme_list
    # =>
    {"MAILTO"=>Gem::URI::MailTo,
     "LDAPS"=>Gem::URI::LDAPS,
     "WS"=>Gem::URI::WS,
     "HTTP"=>Gem::URI::HTTP,
     "HTTPS"=>Gem::URI::HTTPS,
     "LDAP"=>Gem::URI::LDAP,
     "FILE"=>Gem::URI::File,
     "FTP"=>Gem::URI::FTP}

Related: Gem::URI.register_scheme.
## split(uri ) [](#method-c-split)
Returns a 9-element array representing the parts of the Gem::URI formed from
the string `uri`; each array element is a string or `nil`:

    names = %w[scheme userinfo host port registry path opaque query fragment]
    values = Gem::URI.split('https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top')
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

