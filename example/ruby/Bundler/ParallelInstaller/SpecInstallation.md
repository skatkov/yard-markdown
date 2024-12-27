# Class: Bundler::ParallelInstaller::SpecInstallation
**Inherits:** Object
    



# Attributes
## error[RW] [](#attribute-i-error)
Returns the value of attribute error.

## full_name[RW] [](#attribute-i-full_name)
Returns the value of attribute full_name.

## name[RW] [](#attribute-i-name)
Returns the value of attribute name.

## post_install_message[RW] [](#attribute-i-post_install_message)
Returns the value of attribute post_install_message.

## spec[RW] [](#attribute-i-spec)
Returns the value of attribute spec.

## state[RW] [](#attribute-i-state)
Returns the value of attribute state.


#Instance Methods
## all_dependencies() [](#method-i-all_dependencies)
Represents all dependencies

## dependencies() [](#method-i-dependencies)
Represents only the non-development dependencies, the ones that are itself and
are in the total list.

## dependencies_installed?(installed_specs) [](#method-i-dependencies_installed?)
Checks installed dependencies against spec's dependencies to make sure needed
dependencies have been installed.

**@return** [Boolean] 

## enqueued?() [](#method-i-enqueued?)

**@return** [Boolean] 

## failed?() [](#method-i-failed?)

**@return** [Boolean] 

## has_post_install_message?() [](#method-i-has_post_install_message?)

**@return** [Boolean] 

## ignorable_dependency?(dep) [](#method-i-ignorable_dependency?)

**@return** [Boolean] 

## initialize(spec) [](#method-i-initialize)

**@return** [SpecInstallation] a new instance of SpecInstallation

## installed?() [](#method-i-installed?)

**@return** [Boolean] 

## ready_to_enqueue?() [](#method-i-ready_to_enqueue?)

**@return** [Boolean] 

## to_s() [](#method-i-to_s)

