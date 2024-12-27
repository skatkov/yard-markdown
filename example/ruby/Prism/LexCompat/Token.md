# Class: Prism::LexCompat::Token
**Inherits:** SimpleDelegator
    

When we produce tokens, we produce the same arrays that Ripper does. However,
we add a couple of convenience methods onto them to make them a little easier
to work with. We delegate all other methods to the array.



#Instance Methods
## event() [](#method-i-event)
The type of the token.

## location() [](#method-i-location)
The location of the token in the source.

## state() [](#method-i-state)
The state of the lexer when this token was produced.

## value() [](#method-i-value)
The slice of the source that this token represents.

