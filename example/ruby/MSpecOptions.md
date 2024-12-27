# Class: MSpecOptions
**Inherits:** Object
    

MSpecOptions provides a parser for command line options. It also provides a
composable set of options from which the runner scripts can select for their
particular functionality.


# Attributes
## latest[RW] [](#attribute-c-latest)
Returns the value of attribute latest.

## banner[RW] [](#attribute-i-banner)
Returns the value of attribute banner.

## config[RW] [](#attribute-i-config)
Returns the value of attribute config.

## options[RW] [](#attribute-i-options)
Returns the value of attribute options.

## width[RW] [](#attribute-i-width)
Returns the value of attribute width.


#Instance Methods
## action_filters() [](#method-i-action_filters)

## actions() [](#method-i-actions)

## add(short, long, arg, description, block) [](#method-i-add)
Adds documentation text for an option and adds an `MSpecOption` instance to
the list of registered options.

## all() [](#method-i-all)

## chdir() [](#method-i-chdir)

## configure(&block) [](#method-i-configure)
The methods below provide groups of options that are composed by the
particular runners to provide their functionality

## debug() [](#method-i-debug)

## doc(str) [](#method-i-doc)
Adds a string of documentation text inline in the text generated from the
options. See #on and #add.

## env() [](#method-i-env)

## filters() [](#method-i-filters)

## formatters() [](#method-i-formatters)

## help(&block) [](#method-i-help)
Convenience method for providing -h, --help options.

## initialize(banner"", width30, confignil) [](#method-i-initialize)

**@return** [MSpecOptions] a new instance of MSpecOptions

## interrupt() [](#method-i-interrupt)

## launchable() [](#method-i-launchable)

## match?(opt) [](#method-i-match?)
Searches all registered options to find a match for `opt`. Returns `nil` if no
registered options match.

**@return** [Boolean] 

## on(*args, &block) [](#method-i-on)
Registers an option. Acceptable formats for arguments are:

    on "-a", "description"
    on "-a", "--abdc", "description"
    on "-a", "ARG", "description"
    on "--abdc", "ARG", "description"
    on "-a", "--abdc", "ARG", "description"

If an block is passed, it will be invoked when the option is matched. Not
passing a block is permitted, but nonsensical.

**@raise** [OptionError] 

## on_extra(&block) [](#method-i-on_extra)
Stores a block that will be called with unrecognized options

## parse(argvARGV) [](#method-i-parse)
Parses an array of command line entries, calling blocks for registered
options.

## prefix() [](#method-i-prefix)

## pretend() [](#method-i-pretend)

## process(argv, entry, opt, arg) [](#method-i-process)
Processes an option. Calls the #on_extra block (or default) for unrecognized
options. For registered options, possibly fetches an argument and invokes the
option's block if it is not nil.

## randomize() [](#method-i-randomize)

## repeat() [](#method-i-repeat)

## split(str, n) [](#method-i-split)
Splits a string at `n` characters into the `opt` and the `rest`. The `arg` is
set to `nil` if `rest` is an empty string.

## targets() [](#method-i-targets)

## timeout() [](#method-i-timeout)

## to_s() [](#method-i-to_s)
Returns a string representation of the options and doc strings.

## unguarded() [](#method-i-unguarded)

## verbose() [](#method-i-verbose)

## verify() [](#method-i-verify)

## version(version, &block) [](#method-i-version)
Convenience method for providing -v, --version options.

