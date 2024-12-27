# Module: RDoc::Parser::RubyTools
    

Collection of methods for writing parsers



#Instance Methods
## add_token_listener(obj) [](#method-i-add_token_listener)
Adds a token listener `obj`, but you should probably use token_listener

## get_tk() [](#method-i-get_tk)
Fetches the next token from the scanner

## get_tk_until(*tokens) [](#method-i-get_tk_until)
Reads and returns all tokens up to one of `tokens`.  Leaves the matched token
in the token list.

## get_tkread() [](#method-i-get_tkread)
Retrieves a String representation of the read tokens

## peek_read() [](#method-i-peek_read)
Peek equivalent for get_tkread

## peek_tk() [](#method-i-peek_tk)
Peek at the next token, but don't remove it from the stream

## remove_token_listener(obj) [](#method-i-remove_token_listener)
Removes the token listener `obj`

## reset() [](#method-i-reset)
Resets the tools

## skip_tkspace() [](#method-i-skip_tkspace)
Skips whitespace tokens including newlines

## skip_tkspace_without_nl() [](#method-i-skip_tkspace_without_nl)
Skips whitespace tokens excluding newlines

## token_listener(obj) [](#method-i-token_listener)
Has `obj` listen to tokens

## unget_tk(tk) [](#method-i-unget_tk)
Returns `tk` to the scanner

