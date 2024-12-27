# Exception: Gem::SpecificGemNotFoundException
**Inherits:** Gem::GemNotFoundException
    



# Attributes
## errors[RW] [](#attribute-i-errors)
Errors encountered attempting to find the gem.

## name[RW] [](#attribute-i-name)
The name of the gem that could not be found.

## version[RW] [](#attribute-i-version)
The version of the gem that could not be found.


#Instance Methods
## initialize(name, version, errorsnil) [](#method-i-initialize)
Creates a new SpecificGemNotFoundException for a gem with the given `name` and
`version`.  Any `errors` encountered when attempting to find the gem are also
stored.

**@return** [SpecificGemNotFoundException] a new instance of SpecificGemNotFoundException

