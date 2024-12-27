# Class: SyntaxSuggest::Cli
**Inherits:** Object
    

All the logic of the exe/syntax_suggest CLI in one handy spot

    Cli.new(argv: ["--help"]).call
    Cli.new(argv: ["<path/to/file>.rb"]).call
    Cli.new(argv: ["<path/to/file>.rb", "--record=tmp"]).call
    Cli.new(argv: ["<path/to/file>.rb", "--terminal"]).call


# Attributes
## options[RW] [](#attribute-i-options)
Returns the value of attribute options.


#Instance Methods
## call() [](#method-i-call)

## initialize(argv:, exit_obj:Kernel, io:$stdout, env:ENV) [](#method-i-initialize)
ARGV is Everything passed to the executable, does not include executable name

All other intputs are dependency injection for testing

**@return** [Cli] a new instance of Cli

## parse() [](#method-i-parse)

## parser() [](#method-i-parser)

