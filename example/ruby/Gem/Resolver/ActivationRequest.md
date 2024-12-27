# Class: Gem::Resolver::ActivationRequest
**Inherits:** Object
    

Specifies a Specification object that should be activated.  Also contains a
dependency that was used to introduce this activation.


# Attributes
## request[RW] [](#attribute-i-request)
The parent request for this activation request.

## spec[RW] [](#attribute-i-spec)
The specification to be activated.


#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

## development?() [](#method-i-development?)
Is this activation request for a development dependency?

**@return** [Boolean] 

## download(path) [](#method-i-download)
Downloads a gem at `path` and returns the file path.

## eql?(other) [](#method-i-eql?)

**@return** [Boolean] 

## full_name() [](#method-i-full_name)
The full name of the specification to be activated.

## full_spec() [](#method-i-full_spec)
The Gem::Specification for this activation request.

## hash() [](#method-i-hash)

## initialize(spec, request) [](#method-i-initialize)
Creates a new ActivationRequest that will activate `spec`.  The parent
`request` is used to provide diagnostics in case of conflicts.

**@return** [ActivationRequest] a new instance of ActivationRequest

## inspect() [](#method-i-inspect)
:nodoc:

## installed?() [](#method-i-installed?)
True if the requested gem has already been installed.

**@return** [Boolean] 

## name() [](#method-i-name)
The name of this activation request's specification

## parent() [](#method-i-parent)
Return the ActivationRequest that contained the dependency that we were
activated for.

## platform() [](#method-i-platform)
The platform of this activation request's specification

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## version() [](#method-i-version)
The version of this activation request's specification

