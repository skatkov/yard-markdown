# Class: Prism::LexCompat::Heredoc::DashHeredoc
**Inherits:** Object
    

Dash heredocs are a little more complicated. They are a list of tokens that
need to be split on "\\n" to mimic Ripper's behavior. We also need to keep
track of the state that the heredoc was opened in.


# Attributes
## split[RW] [](#attribute-i-split)
:nodoc:

## tokens[RW] [](#attribute-i-tokens)
:nodoc:


#Instance Methods
## <<(token) [](#method-i-<<)

## initialize(split) [](#method-i-initialize)

**@return** [DashHeredoc] a new instance of DashHeredoc

## to_a() [](#method-i-to_a)

