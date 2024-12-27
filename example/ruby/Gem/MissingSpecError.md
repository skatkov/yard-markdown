# Exception: Gem::MissingSpecError
**Inherits:** Gem::LoadError
    

Raised when trying to activate a gem, and that gem does not exist on the
system.  Instead of rescuing from this class, make sure to rescue from the
superclass Gem::LoadError to catch all types of load errors.



#Instance Methods
## initialize(name, requirement, extra_messagenil) [](#method-i-initialize)

**@return** [MissingSpecError] a new instance of MissingSpecError

## message() [](#method-i-message)
:nodoc:

