# Class: SpecEvaluate
**Inherits:** Object
    
**Includes:** MSpecMatchers
  



# Class Methods
## desc() [](#method-c-desc)
## desc=(desc ) [](#method-c-desc=)

#Instance Methods
## define(&block) [](#method-i-define)

## format(ruby, newlinetrue) [](#method-i-format)
Formats the Ruby source code for reabable output in the -fs formatter option.
If the source contains no newline characters, wraps the source in single
quotes to set if off from the rest of the description string. If the source
does contain newline characters, sets the indent level to four characters.

## initialize(ruby, desc) [](#method-i-initialize)

**@return** [SpecEvaluate] a new instance of SpecEvaluate

