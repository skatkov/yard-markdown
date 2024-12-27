# Class: Bundler::Thor::Options
**Inherits:** Bundler::Thor::Arguments
    

:nodoc:


# Class Methods
## to_switches(options ) [](#method-c-to_switches)
Receives a hash and makes it switches.

#Instance Methods
## check_at_least_one!() [](#method-i-check_at_least_one!)

## check_exclusive!() [](#method-i-check_exclusive!)

## check_unknown!() [](#method-i-check_unknown!)

**@raise** [UnknownArgumentError] 

## initialize(hash_options{}, defaults{}, stop_on_unknownfalse, disable_required_checkfalse, relations{}) [](#method-i-initialize)
Takes a hash of Bundler::Thor::Option and a hash with defaults.

If `stop_on_unknown` is true, #parse will stop as soon as it encounters an
unknown option or a regular argument.

**@return** [Options] a new instance of Options

## parse(args) [](#method-i-parse)
rubocop:disable Metrics/MethodLength

## peek() [](#method-i-peek)

## remaining() [](#method-i-remaining)

## shift() [](#method-i-shift)

## unshift(arg, is_value:false) [](#method-i-unshift)

