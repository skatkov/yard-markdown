# Class: Bundler::Thor::Option
**Inherits:** Bundler::Thor::Argument
    

:nodoc:


# Class Methods
## parse(key , value ) [](#method-c-parse)
This parse quick options given as method_options. It makes several
assumptions, but you can be more specific using the option method.

    parse :foo => "bar"
    #=> Option foo with default value bar

    parse [:foo, :baz] => "bar"
    #=> Option foo with default value bar and alias :baz

    parse :foo => :required
    #=> Required option foo without default value

    parse :foo => 2
    #=> Option foo with default value 2 and type numeric

    parse :foo => :numeric
    #=> Option foo without default value and type numeric

    parse :foo => true
    #=> Option foo with default value true and type boolean

The valid types are :boolean, :numeric, :hash, :array and :string. If none is
given a default type is assumed. This default type accepts arguments as string
(--foo=value) or booleans (just --foo).

By default all options are optional, unless :required is given.
# Attributes
## aliases[RW] [](#attribute-i-aliases)
Returns the value of attribute aliases.

## group[RW] [](#attribute-i-group)
Returns the value of attribute group.

## hide[RW] [](#attribute-i-hide)
Returns the value of attribute hide.

## lazy_default[RW] [](#attribute-i-lazy_default)
Returns the value of attribute lazy_default.

## repeatable[RW] [](#attribute-i-repeatable)
Returns the value of attribute repeatable.


#Instance Methods
## aliases_for_usage() [](#method-i-aliases_for_usage)

## human_name() [](#method-i-human_name)

## initialize(name, options{}) [](#method-i-initialize)

**@return** [Option] a new instance of Option

## show_default?() [](#method-i-show_default?)

**@return** [Boolean] 

## switch_name() [](#method-i-switch_name)

## usage(padding0) [](#method-i-usage)

