# Class: Gem::GemRunner
**Inherits:** Object
    

Run an instance of the gem program.

Gem::GemRunner is only intended for internal use by RubyGems itself.  It does
not form any public API and may change at any time for any reason.

If you would like to duplicate functionality of `gem` commands, use the
classes they call directly.



#Instance Methods
## extract_build_args(args) [](#method-i-extract_build_args)
Separates the build arguments (those following `--`) from the other arguments
in the list.

## initialize() [](#method-i-initialize)

**@return** [GemRunner] a new instance of GemRunner

## run(args) [](#method-i-run)
Run the gem command with the following arguments.

