# Class: XMP::StringInputMethod
**Inherits:** IRB::InputMethod
    

A custom InputMethod class used by XMP for evaluating string io.


# Attributes
## encoding[RW] [](#attribute-i-encoding)
Returns the encoding of last expression printed by #puts.


#Instance Methods
## eof?() [](#method-i-eof?)
Whether there are any expressions left in this printer.

**@return** [Boolean] 

## gets() [](#method-i-gets)
Reads the next expression from this printer.

See IO#gets for more information.

## initialize() [](#method-i-initialize)
Creates a new StringInputMethod object

**@return** [StringInputMethod] a new instance of StringInputMethod

## puts(exps) [](#method-i-puts)
Concatenates all expressions in this printer, separated by newlines.

An Encoding::CompatibilityError is raised of the given `exps`'s encoding
doesn't match the previous expression evaluated.

