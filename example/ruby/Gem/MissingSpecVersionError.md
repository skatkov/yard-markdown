# Exception: Gem::MissingSpecVersionError
**Inherits:** Gem::MissingSpecError
    

Raised when trying to activate a gem, and the gem exists on the system, but
not the requested version. Instead of rescuing from this class, make sure to
rescue from the superclass Gem::LoadError to catch all types of load errors.


# Attributes
## specs[RW] [](#attribute-i-specs)
Returns the value of attribute specs.


#Instance Methods
## initialize(name, requirement, specs) [](#method-i-initialize)

**@return** [MissingSpecVersionError] a new instance of MissingSpecVersionError

