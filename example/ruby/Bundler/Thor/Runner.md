# Class: Bundler::Thor::Runner
**Inherits:** Bundler::Thor
    

:nodoc:


# Class Methods
## banner(command , all false, subcommand false) [](#method-c-banner)
## exit_on_failure?() [](#method-c-exit_on_failure?)
**@return** [Boolean] 


#Instance Methods
## help(methnil) [](#method-i-help)
Override Bundler::Thor#help so it can give information about any class and any
method.

## install(name) [](#method-i-install)
rubocop:disable Metrics/MethodLength

## installed() [](#method-i-installed)

## list(search"") [](#method-i-list)

## method_missing(meth, *args) [](#method-i-method_missing)
If a command is not found on Bundler::Thor::Runner, method missing is invoked
and Bundler::Thor::Runner is then responsible for finding the command in all
classes.

## uninstall(name) [](#method-i-uninstall)

**@raise** [Error] 

## update(name) [](#method-i-update)

**@raise** [Error] 

## version() [](#method-i-version)

