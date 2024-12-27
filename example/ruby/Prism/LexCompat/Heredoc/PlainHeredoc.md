# Class: Prism::LexCompat::Heredoc::PlainHeredoc
**Inherits:** Object
    

Heredocs that are no dash or tilde heredocs are just a list of tokens. We need
to keep them around so that we can insert them in the correct order back into
the token stream and set the state of the last token to the state that the
heredoc was opened in.


# Attributes
## tokens[RW] [](#attribute-i-tokens)
:nodoc:


#Instance Methods
## <<(token) [](#method-i-<<)

## initialize() [](#method-i-initialize)

**@return** [PlainHeredoc] a new instance of PlainHeredoc

## to_a() [](#method-i-to_a)

