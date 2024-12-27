# Class: Bundler::URI::FTP
**Inherits:** Bundler::URI::Generic
    

FTP Bundler::URI syntax is defined by RFC1738 section 3.2.

This class will be redesigned because of difference of implementations; the
structure of its path. draft-hoffman-ftp-uri-04 is a draft but it is a good
summary about the de facto spec.
https://datatracker.ietf.org/doc/html/draft-hoffman-ftp-uri-04


# Class Methods
## build(args ) [](#method-c-build)
## Description

Creates a new Bundler::URI::FTP object from components, with syntax checking.

The components accepted are `userinfo`, `host`, `port`, `path`, and
`typecode`.

The components should be provided either as an Array, or as a Hash with keys
formed by preceding the component names with a colon.

If an Array is used, the components must be passed in the order `[userinfo,
host, port, path, typecode]`.

If the path supplied is absolute, it will be escaped in order to make it
absolute in the Bundler::URI.

Examples:

    require 'bundler/vendor/uri/lib/uri'

    uri1 = Bundler::URI::FTP.build(['user:password', 'ftp.example.com', nil,
      '/path/file.zip', 'i'])
    uri1.to_s  # => "ftp://user:password@ftp.example.com/%2Fpath/file.zip;type=i"

    uri2 = Bundler::URI::FTP.build({:host => 'ftp.example.com',
      :path => 'ruby/src'})
    uri2.to_s  # => "ftp://ftp.example.com/ruby/src"
## new2(user , password , host , port , path , typecode nil, arg_check true) [](#method-c-new2)
# Attributes
## typecode[RW] [](#attribute-i-typecode)
typecode accessor.

See Bundler::URI::FTP::COMPONENT.


#Instance Methods
## initialize(scheme, userinfo, host, port, registry, path, opaque, query, fragment, parsernil, arg_checkfalse) [](#method-i-initialize)
## Description

Creates a new Bundler::URI::FTP object from generic URL components with no
syntax checking.

Unlike build(), this method does not escape the path component as required by
RFC1738; instead it is treated as per RFC2396.

Arguments are `scheme`, `userinfo`, `host`, `port`, `registry`, `path`,
`opaque`, `query`, and `fragment`, in that order.

**@raise** [InvalidURIError] 

**@return** [FTP] a new instance of FTP

## merge(oth) [](#method-i-merge)
:nodoc:

## path() [](#method-i-path)
Returns the path from an FTP Bundler::URI.

RFC 1738 specifically states that the path for an FTP Bundler::URI does not
include the / which separates the Bundler::URI path from the Bundler::URI
host. Example:

`ftp://ftp.example.com/pub/ruby`

The above Bundler::URI indicates that the client should connect to
ftp.example.com then cd to pub/ruby from the initial login directory.

If you want to cd to an absolute directory, you must include an escaped /
(%2F) in the path. Example:

`ftp://ftp.example.com/%2Fpub/ruby`

This method will then return "/pub/ruby".

## to_s() [](#method-i-to_s)
Returns a String representation of the Bundler::URI::FTP.

