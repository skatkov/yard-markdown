# Class: URI::File
**Inherits:** URI::Generic
    

The "file" URI is defined by RFC8089.


# Class Methods
## build(args ) [](#method-c-build)
## Description

Creates a new URI::File object from components, with syntax checking.

The components accepted are `host` and `path`.

The components should be provided either as an Array, or as a Hash with keys
formed by preceding the component names with a colon.

If an Array is used, the components must be passed in the order `[host,
path]`.

A path from e.g. the File class should be escaped before being passed.

Examples:

    require 'uri'

    uri1 = URI::File.build(['host.example.com', '/path/file.zip'])
    uri1.to_s  # => "file://host.example.com/path/file.zip"

    uri2 = URI::File.build({:host => 'host.example.com',
      :path => '/ruby/src'})
    uri2.to_s  # => "file://host.example.com/ruby/src"

    uri3 = URI::File.build({:path => URI::escape('/path/my file.txt')})
    uri3.to_s  # => "file:///path/my%20file.txt"

#Instance Methods
## check_password(user) [](#method-i-check_password)
raise InvalidURIError

**@raise** [URI::InvalidURIError] 

## check_user(user) [](#method-i-check_user)
raise InvalidURIError

**@raise** [URI::InvalidURIError] 

## check_userinfo(user) [](#method-i-check_userinfo)
raise InvalidURIError

**@raise** [URI::InvalidURIError] 

## set_host(v) [](#method-i-set_host)
Protected setter for the host component `v`.

See also URI::Generic.host=.

## set_password(v) [](#method-i-set_password)
do nothing

## set_port(v) [](#method-i-set_port)
do nothing

## set_user(v) [](#method-i-set_user)
do nothing

## set_userinfo(v) [](#method-i-set_userinfo)
do nothing

