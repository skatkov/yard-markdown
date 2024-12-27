# Class: Bundler::Thor::Actions::EmptyDirectory
**Inherits:** Object
    

Class which holds create directory logic. This is the base class for other
actions like create_file and directory.

This implementation is based in Templater actions, created by Jonas Nicklas
and Michael S. Klishin under MIT LICENSE.


# Attributes
## base[RW] [](#attribute-i-base)
:nodoc:

## config[RW] [](#attribute-i-config)
:nodoc:

## destination[RW] [](#attribute-i-destination)
:nodoc:

## given_destination[RW] [](#attribute-i-given_destination)
:nodoc:

## relative_destination[RW] [](#attribute-i-relative_destination)
:nodoc:


#Instance Methods
## exists?() [](#method-i-exists?)
Checks if the destination file already exists.

#### Returns
Boolean
:   true if the file exists, false otherwise.


**@return** [Boolean] 

## initialize(base, destination, config{}) [](#method-i-initialize)
Initializes given the source and destination.

#### Parameters
base<Bundler::Thor::Base>
:   A Bundler::Thor::Base instance

source<String>
:   Relative path to the source of this file

destination<String>
:   Relative path to the destination of this file

config<Hash>
:   give :verbose => false to not log the status.


**@return** [EmptyDirectory] a new instance of EmptyDirectory

## invoke!() [](#method-i-invoke!)

## revoke!() [](#method-i-revoke!)

