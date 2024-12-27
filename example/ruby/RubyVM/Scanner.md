# Class: RubyVM::Scanner
**Inherits:** Object
    

Poor man's StringScanner. Sadly  https://bugs.ruby-lang.org/issues/8343 is 
not backported  to 2.0.  We have to do it by hand.


# Attributes
## __FILE__[RW] [](#attribute-i-__FILE__)
Returns the value of attribute __FILE__.

## __LINE__[RW] [](#attribute-i-__LINE__)
Returns the value of attribute __LINE__.


#Instance Methods
## [](key) [](#method-i-[])

## eos?() [](#method-i-eos?)

**@return** [Boolean] 

## initialize(path) [](#method-i-initialize)

**@return** [Scanner] a new instance of Scanner

## scan(re) [](#method-i-scan)

## scan!(re) [](#method-i-scan!)

