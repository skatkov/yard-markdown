# Class: SpecGuard
**Inherits:** Object
    



# Class Methods
## clear() [](#method-c-clear)
## clear_guards() [](#method-c-clear_guards)
## finish() [](#method-c-finish)
## guards() [](#method-c-guards)
## report() [](#method-c-report)
## ruby_version(which :minor) [](#method-c-ruby_version)
Returns a partial Ruby version string based on `which`. For example, if
RUBY_VERSION = 8.2.3:

    :major  => "8"
    :minor  => "8.2"
    :tiny   => "8.2.3"
    :teeny  => "8.2.3"
    :full   => "8.2.3"
# Attributes
## name[RW] [](#attribute-i-name)
Returns the value of attribute name.


#Instance Methods
## add(example) [](#method-i-add)

## initialize(*args) [](#method-i-initialize)

**@return** [SpecGuard] a new instance of SpecGuard

## match?() [](#method-i-match?)

**@return** [Boolean] 

## record(description) [](#method-i-record)

## report_key() [](#method-i-report_key)

## reporting?() [](#method-i-reporting?)

**@return** [Boolean] 

## run_if(name, &block) [](#method-i-run_if)

## run_unless(name, &block) [](#method-i-run_unless)

## unregister() [](#method-i-unregister)

## yield?(invertfalse) [](#method-i-yield?)

**@return** [Boolean] 

