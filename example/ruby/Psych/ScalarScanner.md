# Class: Psych::ScalarScanner
**Inherits:** Object
    

Scan scalars for built in types


# Attributes
## class_loader[RW] [](#attribute-i-class_loader)
Returns the value of attribute class_loader.


#Instance Methods
## initialize(class_loader, strict_integer:false) [](#method-i-initialize)
Create a new scanner

**@return** [ScalarScanner] a new instance of ScalarScanner

## parse_int(string) [](#method-i-parse_int)
Parse and return an int from `string`

## parse_time(string) [](#method-i-parse_time)
Parse and return a Time from `string`

## tokenize(string) [](#method-i-tokenize)
Tokenize `string` returning the Ruby object

