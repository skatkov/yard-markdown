# Class: SyntaxSuggest::ExplainSyntax
**Inherits:** Object
    

Explains syntax errors based on their source

example:

    source = "def foo; puts 'lol'" # Note missing end
    explain ExplainSyntax.new(
      code_lines: CodeLine.from_source(source)
    ).call
    explain.errors.first
    # => "Unmatched keyword, missing `end' ?"

When the error cannot be determined by lexical counting then the parser is run
against the input and the raw errors are returned.

Example:

    source = "1 * " # Note missing a second number
    explain ExplainSyntax.new(
      code_lines: CodeLine.from_source(source)
    ).call
    explain.errors.first
    # => "syntax error, unexpected end-of-input"



#Instance Methods
## call() [](#method-i-call)

## errors() [](#method-i-errors)
Returns an array of syntax error messages

If no missing pairs are found it falls back on the original error messages

## initialize(code_lines:) [](#method-i-initialize)

**@return** [ExplainSyntax] a new instance of ExplainSyntax

## missing() [](#method-i-missing)
Returns an array of missing elements

For example this:

    ExplainSyntax.new(code_lines: lines).missing
    # => ["}"]

Would indicate that the source is missing a `}` character in the source code

## why(miss) [](#method-i-why)
Converts a missing string to an human understandable explanation.

Example:

    explain.why("}")
    # => "Unmatched `{', missing `}' ?"

