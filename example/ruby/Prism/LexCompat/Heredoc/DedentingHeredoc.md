# Class: Prism::LexCompat::Heredoc::DedentingHeredoc
**Inherits:** Object
    

Heredocs that are dedenting heredocs are a little more complicated. Ripper
outputs on_ignored_sp tokens for the whitespace that is being removed from the
output. prism only modifies the node itself and keeps the token the same. This
simplifies prism, but makes comparing against Ripper much harder because there
is a length mismatch.

Fortunately, we already have to pull out the heredoc tokens in order to insert
them into the stream in the correct order. As such, we can do some extra
manipulation on the tokens to make them match Ripper's output by mirroring the
dedent logic that Ripper uses.


# Attributes
## dedent[RW] [](#attribute-i-dedent)
Returns the value of attribute dedent.

## dedent_next[RW] [](#attribute-i-dedent_next)
Returns the value of attribute dedent_next.

## embexpr_balance[RW] [](#attribute-i-embexpr_balance)
Returns the value of attribute embexpr_balance.

## tokens[RW] [](#attribute-i-tokens)
Returns the value of attribute tokens.


#Instance Methods
## <<(token) [](#method-i-<<)
As tokens are coming in, we track the minimum amount of common leading
whitespace on plain string content tokens. This allows us to later remove that
amount of whitespace from the beginning of each line.

## initialize() [](#method-i-initialize)

**@return** [DedentingHeredoc] a new instance of DedentingHeredoc

## to_a() [](#method-i-to_a)

