# Class: Gem::Requirement
**Inherits:** Object
    

A Requirement is a set of one or more version restrictions. It supports a few
(`=, !=, >, <, >=, <=, ~>`) different restriction operators.

See Gem::Version for a description on how versions and requirements work
together in RubyGems.


# Class Methods
## create(*inputs ) [](#method-c-create)
Factory method to create a Gem::Requirement object.  Input may be a Version, a
String, or nil.  Intended to simplify client code.

If the input is "weird", the default version requirement is returned.
## default() [](#method-c-default)
## default_prerelease() [](#method-c-default_prerelease)
## parse(obj ) [](#method-c-parse)
Parse `obj`, returning an `[op, version]` pair. `obj` can be a String or a
Gem::Version.

If `obj` is a String, it can be either a full requirement specification, like
`">= 1.2"`, or a simple version number, like `"1.2"`.

    parse("> 1.0")                 # => [">", Gem::Version.new("1.0")]
    parse("1.0")                   # => ["=", Gem::Version.new("1.0")]
    parse(Gem::Version.new("1.0")) # => ["=,  Gem::Version.new("1.0")]
## source_set() [](#method-c-source_set)
A source set requirement, used for Gemfiles and lockfiles
# Attributes
## requirements[RW] [](#attribute-i-requirements)
An array of requirement pairs. The first element of the pair is the op, and
the second is the Gem::Version.


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## as_list() [](#method-i-as_list)
:nodoc:

## concat(new) [](#method-i-concat)
Concatenates the `new` requirements onto this requirement.

## encode_with(coder) [](#method-i-encode_with)
:nodoc:

## exact?() [](#method-i-exact?)
true if the requirement is for only an exact version

**@return** [Boolean] 

## for_lockfile() [](#method-i-for_lockfile)
Formats this requirement for use in a Gem::RequestSet::Lockfile.

## hash() [](#method-i-hash)
:nodoc:

## init_with(coder) [](#method-i-init_with)
:nodoc:

## initialize(*requirements) [](#method-i-initialize)
Constructs a requirement from `requirements`. Requirements can be Strings,
Gem::Versions, or Arrays of those. `nil` and duplicate requirements are
ignored. An empty set of `requirements` is the same as `">= 0"`.

**@return** [Requirement] a new instance of Requirement

## marshal_dump() [](#method-i-marshal_dump)
:nodoc:

## marshal_load(array) [](#method-i-marshal_load)
:nodoc:

**@raise** [TypeError] 

## none?() [](#method-i-none?)
true if this gem has no requirements.

**@return** [Boolean] 

## prerelease?() [](#method-i-prerelease?)
A requirement is a prerelease if any of the versions inside of it are
prereleases

**@return** [Boolean] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## satisfied_by?(version) [](#method-i-satisfied_by?)
True if `version` satisfies this Requirement.

**@raise** [ArgumentError] 

**@return** [Boolean] 

## specific?() [](#method-i-specific?)
True if the requirement will not always match the latest version.

**@return** [Boolean] 

## to_s() [](#method-i-to_s)
:nodoc:

## yaml_initialize(tag, vals) [](#method-i-yaml_initialize)
:nodoc:

