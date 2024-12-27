# Exception: Prism::Pattern::CompilationError
**Inherits:** StandardError
    

Raised when the query given to a pattern is either invalid Ruby syntax or is
using syntax that we don't yet support.



#Instance Methods
## initialize(repr) [](#method-i-initialize)
Create a new CompilationError with the given representation of the node that
caused the error.

**@return** [CompilationError] a new instance of CompilationError

