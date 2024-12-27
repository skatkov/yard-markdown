# Exception: Math::DomainError
**Inherits:** StandardError
    

Raised when a mathematical function is evaluated outside of its domain of
definition.

For example, since `cos` returns values in the range -1..1, its inverse
function `acos` is only defined on that interval:

    Math.acos(42)

*produces:*

    Math::DomainError: Numerical argument is out of domain - "acos"



