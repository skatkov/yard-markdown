# Class: Prism::Translation::Parser::PrismDiagnostic
**Inherits:** Prism::Translation::Parser::Diagnostic
    

The parser gem has a list of diagnostics with a hard-coded set of error
messages. We create our own diagnostic class in order to set our own error
messages.


# Attributes
## message[RW] [](#attribute-i-message)
This is the cached message coming from prism.


#Instance Methods
## initialize(message, level, reason, location) [](#method-i-initialize)
Initialize a new diagnostic with the given message and location.

**@return** [PrismDiagnostic] a new instance of PrismDiagnostic

