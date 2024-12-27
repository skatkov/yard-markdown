# Class: SyntaxSuggest::RipperErrors
**Inherits:** Ripper
    

Capture parse errors from Ripper

Prism returns the errors with their messages, but Ripper does not. To get them
we must make a custom subclass.

Example:

    puts RipperErrors.new(" def foo").call.errors
    # => ["syntax error, unexpected end-of-input, expecting ';' or '\\n'"]


# Attributes
## errors[RW] [](#attribute-i-errors)
Returns the value of attribute errors.


#Instance Methods
## call() [](#method-i-call)

## on_parse_error(msg) [](#method-i-on_parse_error)
Comes from ripper, called on every parse error, msg is a string

