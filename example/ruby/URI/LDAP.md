# Class: URI::LDAP
**Inherits:** URI::Generic
    

LDAP URI SCHEMA (described in RFC2255). --
[ldap://<host>/<dn>[?<attrs>[?<scope>[?<filter>](?<extensions>)]]] ++


# Class Methods
## build(args ) [](#method-c-build)
## Description

Creates a new URI::LDAP object from components, with syntax checking.

The components accepted are host, port, dn, attributes, scope, filter, and
extensions.

The components should be provided either as an Array, or as a Hash with keys
formed by preceding the component names with a colon.

If an Array is used, the components must be passed in the order `[host, port,
dn, attributes, scope, filter, extensions]`.

Example:

    uri = URI::LDAP.build({:host => 'ldap.example.com',
      :dn => '/dc=example'})

    uri = URI::LDAP.build(["ldap.example.com", nil,
      "/dc=example;dc=com", "query", nil, nil, nil])

#Instance Methods
## attributes() [](#method-i-attributes)
Returns attributes.

## attributes=(val) [](#method-i-attributes=)
Setter for attributes `val`.

## dn() [](#method-i-dn)
Returns dn.

## dn=(val) [](#method-i-dn=)
Setter for dn `val`.

## extensions() [](#method-i-extensions)
Returns extensions.

## extensions=(val) [](#method-i-extensions=)
Setter for extensions `val`.

## filter() [](#method-i-filter)
Returns filter.

## filter=(val) [](#method-i-filter=)
Setter for filter `val`.

## hierarchical?() [](#method-i-hierarchical?)
Checks if URI has a path. For URI::LDAP this will return `false`.

**@return** [Boolean] 

## initialize(*arg) [](#method-i-initialize)
## Description

Creates a new URI::LDAP object from generic URI components as per RFC 2396. No
LDAP-specific syntax checking is performed.

Arguments are `scheme`, `userinfo`, `host`, `port`, `registry`, `path`,
`opaque`, `query`, and `fragment`, in that order.

Example:

    uri = URI::LDAP.new("ldap", nil, "ldap.example.com", nil, nil,
      "/dc=example;dc=com", nil, "query", nil)

See also URI::Generic.new.

**@return** [LDAP] a new instance of LDAP

## scope() [](#method-i-scope)
Returns scope.

## scope=(val) [](#method-i-scope=)
Setter for scope `val`.

