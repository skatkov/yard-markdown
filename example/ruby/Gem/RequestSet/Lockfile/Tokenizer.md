# Class: Gem::RequestSet::Lockfile::Tokenizer
**Inherits:** Object
    



# Class Methods
## from_file(file ) [](#method-c-from_file)

#Instance Methods
## empty?() [](#method-i-empty?)

**@return** [Boolean] 

## initialize(input, filenamenil, line0, pos0) [](#method-i-initialize)

**@return** [Tokenizer] a new instance of Tokenizer

## make_parser(set, platforms) [](#method-i-make_parser)

## next_token() [](#method-i-next_token)

## peek() [](#method-i-peek)

## skip(type) [](#method-i-skip)

## to_a() [](#method-i-to_a)

## token_pos(byte_offset) [](#method-i-token_pos)
Calculates the column (by byte) and the line of the current token based on
`byte_offset`.

## unshift(token) [](#method-i-unshift)

