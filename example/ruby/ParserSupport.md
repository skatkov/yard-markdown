# Module: ParserSupport
    



# Class Methods
## prism_enabled?() [](#method-c-prism_enabled?)
Determines whether or not Prism is being used in the current process. This
would have been determined by `--parser=prism` on either the command line or
from within various environment variables.
**@return** [Boolean] 

## prism_enabled_in_subprocess?() [](#method-c-prism_enabled_in_subprocess?)
Determines whether or not Prism would be used by a subprocess. This is
necessary because some tests run in subprocesses, and we need to know if we
expect Prism to be used by those tests. This happens if Prism is configured as
the default parser.
**@return** [Boolean] 


