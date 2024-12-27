# Class: Refinement
**Inherits:** Module
    

*********************************************************************

    Refinement is a class of the +self+ (current context) inside +refine+
    statement. It allows to import methods from other modules, see #import_methods.



#Instance Methods
## target() [](#method-i-target)
Return the class or module refined by the receiver.

    module M
      refine String do
      end
    end

    M.refinements[0].target # => String

**@overload** [] 

