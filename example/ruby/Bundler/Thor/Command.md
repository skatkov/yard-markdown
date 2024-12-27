# Class: Bundler::Thor::Command
**Inherits:** Struct
    



# Attributes
## ancestor_name[RW] [](#attribute-i-ancestor_name)
Returns the value of attribute ancestor_name

**@return** [Object] the current value of ancestor_name

## description[RW] [](#attribute-i-description)
Returns the value of attribute description

**@return** [Object] the current value of description

## long_description[RW] [](#attribute-i-long_description)
Returns the value of attribute long_description

**@return** [Object] the current value of long_description

## name[RW] [](#attribute-i-name)
Returns the value of attribute name

**@return** [Object] the current value of name

## options[RW] [](#attribute-i-options)
Returns the value of attribute options

**@return** [Object] the current value of options

## options_relation[RW] [](#attribute-i-options_relation)
Returns the value of attribute options_relation

**@return** [Object] the current value of options_relation

## usage[RW] [](#attribute-i-usage)
Returns the value of attribute usage

**@return** [Object] the current value of usage

## wrap_long_description[RW] [](#attribute-i-wrap_long_description)
Returns the value of attribute wrap_long_description

**@return** [Object] the current value of wrap_long_description


#Instance Methods
## formatted_usage(klass, namespacetrue, subcommandfalse) [](#method-i-formatted_usage)
Returns the formatted usage by injecting given required arguments and required
options into the given usage.

## hidden?() [](#method-i-hidden?)

**@return** [Boolean] 

## initialize(name, description, long_description, wrap_long_description, usage, optionsnil, options_relationnil) [](#method-i-initialize)

**@return** [Command] a new instance of Command

## initialize_copy(other) [](#method-i-initialize_copy)
:nodoc:

## method_at_least_one_option_names() [](#method-i-method_at_least_one_option_names)
:nodoc:

## method_exclusive_option_names() [](#method-i-method_exclusive_option_names)
:nodoc:

## run(instance, args[]) [](#method-i-run)
By default, a command invokes a method in the thor class. You can change this
implementation to create custom commands.

