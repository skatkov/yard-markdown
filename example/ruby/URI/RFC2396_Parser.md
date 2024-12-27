# Class: URI::RFC2396_Parser
**Inherits:** Object
    
**Includes:** URI::RFC2396_REGEXP
  

Class that parses String's into URI's.

It contains a Hash set of patterns and Regexp's that match and validate.


# Attributes
## pattern[RW] [](#attribute-i-pattern)
The Hash of patterns.

See also URI::Parser.initialize_pattern.

## regexp[RW] [](#attribute-i-regexp)
The Hash of Regexp.

See also URI::Parser.initialize_regexp.


#Instance Methods
## escape(str, unsafe) [](#method-i-escape)
:call-seq:
    escape( str )
    escape( str, unsafe )

## Args

`str`
:   String to make safe

`unsafe`
:   Regexp to apply. Defaults to `self.regexp[:UNSAFE]`


## Description

Constructs a safe String from `str`, removing unsafe characters, replacing
them with codes.

## extract(str, schemesnil) [](#method-i-extract)
:call-seq:
    extract( str )
    extract( str, schemes )
    extract( str, schemes ) {|item| block }

## Args

`str`
:   String to search

`schemes`
:   Patterns to apply to `str`


## Description

Attempts to parse and merge a set of URIs. If no `block` given, then returns
the result, else it calls `block` for each element in result.

See also URI::Parser.make_regexp.

## initialize(opts{}) [](#method-i-initialize)
## Synopsis

    URI::Parser.new([opts])

## Args

The constructor accepts a hash as options for parser. Keys of options are
pattern names of URI components and values of options are pattern strings. The
constructor generates set of regexps for parsing URIs.

You can use the following keys:

    * :ESCAPED (URI::PATTERN::ESCAPED in default)
    * :UNRESERVED (URI::PATTERN::UNRESERVED in default)
    * :DOMLABEL (URI::PATTERN::DOMLABEL in default)
    * :TOPLABEL (URI::PATTERN::TOPLABEL in default)
    * :HOSTNAME (URI::PATTERN::HOSTNAME in default)

## Examples

    p = URI::Parser.new(:ESCAPED => "(?:%[a-fA-F0-9]{2}|%u[a-fA-F0-9]{4})")
    u = p.parse("http://example.jp/%uABCD") #=> #<URI::HTTP http://example.jp/%uABCD>
    URI.parse(u.to_s) #=> raises URI::InvalidURIError

    s = "http://example.com/ABCD"
    u1 = p.parse(s) #=> #<URI::HTTP http://example.com/ABCD>
    u2 = URI.parse(s) #=> #<URI::HTTP http://example.com/ABCD>
    u1 == u2 #=> true
    u1.eql?(u2) #=> false

**@return** [RFC2396_Parser] a new instance of RFC2396_Parser

## inspect() [](#method-i-inspect)

## join(*uris) [](#method-i-join)
## Args

`uris`
:   an Array of Strings


## Description

Attempts to parse and merge a set of URIs.

## make_regexp(schemesnil) [](#method-i-make_regexp)
Returns Regexp that is default `self.regexp[:ABS_URI_REF]`, unless `schemes`
is provided. Then it is a Regexp.union with `self.pattern[:X_ABS_URI]`.

## parse(uri) [](#method-i-parse)
## Args

`uri`
:   String


## Description

Parses `uri` and constructs either matching URI scheme object (File, FTP,
HTTP, HTTPS, LDAP, LDAPS, or MailTo) or URI::Generic.

## Usage

    p = URI::Parser.new
    p.parse("ldap://ldap.example.com/dc=example?user=john")
    #=> #<URI::LDAP ldap://ldap.example.com/dc=example?user=john>

## split(uri) [](#method-i-split)
Returns a split URI against `regexp[:ABS_URI]`.

## unescape(str, escaped) [](#method-i-unescape)
:call-seq:
    unescape( str )
    unescape( str, escaped )

## Args

`str`
:   String to remove escapes from

`escaped`
:   Regexp to apply. Defaults to `self.regexp[:ESCAPED]`


## Description

Removes escapes from `str`.

