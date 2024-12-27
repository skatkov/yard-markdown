# Class: Prism::LexCompat::ParamToken
**Inherits:** Prism::LexCompat::Token
    

If we have an identifier that follows a method name like:

    def foo bar

then Ripper will mark bar as END|LABEL if there is a local in a parent scope
named bar because it hasn't pushed the local table yet. We do this more
accurately, so we need to allow comparing against both END and END|LABEL.



#Instance Methods
## ==(other) [](#method-i-==)
:nodoc:

