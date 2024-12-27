# Class: Bundler::URI::Generic
**Inherits:** Object
    
**Includes:** Bundler::URI
  

Base class for all Bundler::URI classes. Implements generic Bundler::URI
syntax as per RFC 2396.


# Class Methods
## build(args ) [](#method-c-build)
## Synopsis

See ::new.

## Description

Creates a new Bundler::URI::Generic instance from components of
Bundler::URI::Generic with check.  Components are: scheme, userinfo, host,
port, registry, path, opaque, query, and fragment. You can provide arguments
either by an Array or a Hash. See ::new for hash keys to use or for order of
array items.
## build2(args ) [](#method-c-build2)
## Synopsis

See ::new.

## Description

At first, tries to create a new Bundler::URI::Generic instance using
Bundler::URI::Generic::build. But, if exception
Bundler::URI::InvalidComponentError is raised, then it does
Bundler::URI::Escape.escape all Bundler::URI components and tries again.
## component() [](#method-c-component)
Components of the Bundler::URI in the order.
## default_port() [](#method-c-default_port)
Returns default port.
## use_proxy?(hostname , addr , port , no_proxy ) [](#method-c-use_proxy?)
:nodoc:
**@return** [Boolean] 

## use_registry() [](#method-c-use_registry)
:nodoc:
# Attributes
## fragment[RW] [](#attribute-i-fragment)
Returns the fragment component of the Bundler::URI.

    Bundler::URI("http://foo/bar/baz?search=FooBar#ponies").fragment #=> "ponies"

## host[RW] [](#attribute-i-host)
Returns the host component of the Bundler::URI.

    Bundler::URI("http://foo/bar/baz").host #=> "foo"

It returns nil if no host component exists.

    Bundler::URI("mailto:foo@example.org").host #=> nil

The component does not contain the port number.

    Bundler::URI("http://foo:8080/bar/baz").host #=> "foo"

Since IPv6 addresses are wrapped with brackets in URIs, this method returns
IPv6 addresses wrapped with brackets. This form is not appropriate to pass to
socket methods such as TCPSocket.open. If unwrapped host names are required,
use the #hostname method.

    Bundler::URI("http://[::1]/bar/baz").host     #=> "[::1]"
    Bundler::URI("http://[::1]/bar/baz").hostname #=> "::1"

## opaque[RW] [](#attribute-i-opaque)
Returns the opaque part of the Bundler::URI.

    Bundler::URI("mailto:foo@example.org").opaque #=> "foo@example.org"
    Bundler::URI("http://foo/bar/baz").opaque     #=> nil

The portion of the path that does not make use of the slash '/'. The path
typically refers to an absolute path or an opaque part. (See RFC2396 Section 3
and 5.2.)

## path[RW] [](#attribute-i-path)
Returns the path component of the Bundler::URI.

    Bundler::URI("http://foo/bar/baz").path #=> "/bar/baz"

## port[RW] [](#attribute-i-port)
Returns the port component of the Bundler::URI.

    Bundler::URI("http://foo/bar/baz").port      #=> 80
    Bundler::URI("http://foo:8080/bar/baz").port #=> 8080

## query[RW] [](#attribute-i-query)
Returns the query component of the Bundler::URI.

    Bundler::URI("http://foo/bar/baz?search=FooBar").query #=> "search=FooBar"

## scheme[RW] [](#attribute-i-scheme)
Returns the scheme component of the Bundler::URI.

    Bundler::URI("http://foo/bar/baz").scheme #=> "http"


#Instance Methods
## ==(oth) [](#method-i-==)
Compares two URIs.

## absolute?() [](#method-i-absolute?)
Returns true if Bundler::URI has a scheme (e.g. http:// or https://)
specified.

**@return** [Boolean] 

## coerce(oth) [](#method-i-coerce)
## Args

`v`
:   Bundler::URI or String


## Description

Attempts to parse other Bundler::URI `oth`, returns [parsed_oth, self].

## Usage

    require 'bundler/vendor/uri/lib/uri'

    uri = Bundler::URI.parse("http://my.example.com")
    uri.coerce("http://foo.com")
    #=> [#<Bundler::URI::HTTP http://foo.com>, #<Bundler::URI::HTTP http://my.example.com>]

## component() [](#method-i-component)
Components of the Bundler::URI in the order.

## decoded_password() [](#method-i-decoded_password)
Returns the password component after Bundler::URI decoding.

## decoded_user() [](#method-i-decoded_user)
Returns the user component after Bundler::URI decoding.

## default_port() [](#method-i-default_port)
Returns default port.

## eql?(oth) [](#method-i-eql?)

**@return** [Boolean] 

## find_proxy(envENV) [](#method-i-find_proxy)
Returns a proxy Bundler::URI. The proxy Bundler::URI is obtained from
environment variables such as http_proxy, ftp_proxy, no_proxy, etc. If there
is no proper proxy, nil is returned.

If the optional parameter `env` is specified, it is used instead of ENV.

Note that capitalized variables (HTTP_PROXY, FTP_PROXY, NO_PROXY, etc.) are
examined, too.

But http_proxy and HTTP_PROXY is treated specially under CGI environment. It's
because HTTP_PROXY may be set by Proxy: header. So HTTP_PROXY is not used.
http_proxy is not used too if the variable is case insensitive. CGI_HTTP_PROXY
can be used instead.

**@raise** [BadURIError] 

## hash() [](#method-i-hash)

## hierarchical?() [](#method-i-hierarchical?)
Returns true if Bundler::URI is hierarchical.

## Description

Bundler::URI has components listed in order of decreasing significance from
left to right, see RFC3986 https://www.rfc-editor.org/rfc/rfc3986 1.2.3.

## Usage

    require 'bundler/vendor/uri/lib/uri'

    uri = Bundler::URI.parse("http://my.example.com/")
    uri.hierarchical?
    #=> true
    uri = Bundler::URI.parse("mailto:joe@example.com")
    uri.hierarchical?
    #=> false

**@return** [Boolean] 

## hostname() [](#method-i-hostname)
Extract the host part of the Bundler::URI and unwrap brackets for IPv6
addresses.

This method is the same as Bundler::URI::Generic#host except brackets for IPv6
(and future IP) addresses are removed.

    uri = Bundler::URI("http://[::1]/bar")
    uri.hostname      #=> "::1"
    uri.host          #=> "[::1]"

## hostname=(v) [](#method-i-hostname=)
Sets the host part of the Bundler::URI as the argument with brackets for IPv6
addresses.

This method is the same as Bundler::URI::Generic#host= except the argument can
be a bare IPv6 address.

    uri = Bundler::URI("http://foo/bar")
    uri.hostname = "::1"
    uri.to_s  #=> "http://[::1]/bar"

If the argument seems to be an IPv6 address, it is wrapped with brackets.

## initialize(scheme, userinfo, host, port, registry, path, opaque, query, fragment, parserDEFAULT_PARSER, arg_checkfalse) [](#method-i-initialize)
## Args

`scheme`
:   Protocol scheme, i.e. 'http','ftp','mailto' and so on.

`userinfo`
:   User name and password, i.e. 'sdmitry:bla'.

`host`
:   Server host name.

`port`
:   Server port.

`registry`
:   Registry of naming authorities.

`path`
:   Path on server.

`opaque`
:   Opaque part.

`query`
:   Query data.

`fragment`
:   Part of the Bundler::URI after '#' character.

`parser`
:   Parser for internal use [Bundler::URI::DEFAULT_PARSER by default].

`arg_check`
:   Check arguments [false by default].


## Description

Creates a new Bundler::URI::Generic instance from ``generic'' components
without check.

**@return** [Generic] a new instance of Generic

## inspect() [](#method-i-inspect)

## merge(oth) [](#method-i-merge)
## Args

`oth`
:   Bundler::URI or String


## Description

Merges two URIs.

## Usage

    require 'bundler/vendor/uri/lib/uri'

    uri = Bundler::URI.parse("http://my.example.com")
    uri.merge("/main.rbx?page=1")
    # => "http://my.example.com/main.rbx?page=1"

## merge!(oth) [](#method-i-merge!)
## Args

`oth`
:   Bundler::URI or String


## Description

Destructive form of #merge.

## Usage

    require 'bundler/vendor/uri/lib/uri'

    uri = Bundler::URI.parse("http://my.example.com")
    uri.merge!("/main.rbx?page=1")
    uri.to_s  # => "http://my.example.com/main.rbx?page=1"

## normalize() [](#method-i-normalize)
Returns normalized Bundler::URI.

    require 'bundler/vendor/uri/lib/uri'

    Bundler::URI("HTTP://my.EXAMPLE.com").normalize
    #=> #<Bundler::URI::HTTP http://my.example.com/>

Normalization here means:

*   scheme and host are converted to lowercase,
*   an empty path component is set to "/".

## normalize!() [](#method-i-normalize!)
Destructive version of #normalize.

## parser() [](#method-i-parser)
Returns the parser to be used.

Unless a Bundler::URI::Parser is defined, DEFAULT_PARSER is used.

## password() [](#method-i-password)
Returns the password component (without Bundler::URI decoding).

## password=(password) [](#method-i-password=)
## Args

`v`
:   String


## Description

Public setter for the `password` component (with validation).

See also Bundler::URI::Generic.check_password.

## Usage

    require 'bundler/vendor/uri/lib/uri'

    uri = Bundler::URI.parse("http://john:S3nsit1ve@my.example.com")
    uri.password = "V3ry_S3nsit1ve"
    uri.to_s  #=> "http://john:V3ry_S3nsit1ve@my.example.com"

## registry() [](#method-i-registry)
:nodoc:

## registry=(v) [](#method-i-registry=)

**@raise** [InvalidURIError] 

## relative?() [](#method-i-relative?)
Returns true if Bundler::URI does not have a scheme (e.g. http:// or https://)
specified.

**@return** [Boolean] 

## route_from(oth) [](#method-i-route_from)
## Args

`oth`
:   Bundler::URI or String


## Description

Calculates relative path from oth to self.

## Usage

    require 'bundler/vendor/uri/lib/uri'

    uri = Bundler::URI.parse('http://my.example.com/main.rbx?page=1')
    uri.route_from('http://my.example.com')
    #=> #<Bundler::URI::Generic /main.rbx?page=1>

## route_to(oth) [](#method-i-route_to)
## Args

`oth`
:   Bundler::URI or String


## Description

Calculates relative path to oth from self.

## Usage

    require 'bundler/vendor/uri/lib/uri'

    uri = Bundler::URI.parse('http://my.example.com')
    uri.route_to('http://my.example.com/main.rbx?page=1')
    #=> #<Bundler::URI::Generic /main.rbx?page=1>

## select(*components) [](#method-i-select)
## Args

`components`
:   Multiple Symbol arguments defined in Bundler::URI::HTTP.


## Description

Selects specified components from Bundler::URI.

## Usage

    require 'bundler/vendor/uri/lib/uri'

    uri = Bundler::URI.parse('http://myuser:mypass@my.example.com/test.rbx')
    uri.select(:userinfo, :host, :path)
    # => ["myuser:mypass", "my.example.com", "/test.rbx"]

## to_s() [](#method-i-to_s)
Constructs String from Bundler::URI.

## user() [](#method-i-user)
Returns the user component (without Bundler::URI decoding).

## user=(user) [](#method-i-user=)
## Args

`v`
:   String


## Description

Public setter for the `user` component (with validation).

See also Bundler::URI::Generic.check_user.

## Usage

    require 'bundler/vendor/uri/lib/uri'

    uri = Bundler::URI.parse("http://john:S3nsit1ve@my.example.com")
    uri.user = "sam"
    uri.to_s  #=> "http://sam:V3ry_S3nsit1ve@my.example.com"

## userinfo() [](#method-i-userinfo)
Returns the userinfo, either as 'user' or 'user:password'.

## userinfo=(userinfo) [](#method-i-userinfo=)
Sets userinfo, argument is string like 'name:pass'.

