# Class: Prism::LexCompat::IdentToken
**Inherits:** Prism::LexCompat::Token
    

Ident tokens for the most part are exactly the same, except sometimes we know
an ident is a local when ripper doesn't (when they are introduced through
named captures in regular expressions). In that case we don't compare the
state.



#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

