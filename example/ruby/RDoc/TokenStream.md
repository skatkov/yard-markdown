# Module: RDoc::TokenStream
    

A TokenStream is a list of tokens, gathered during the parse of some entity
(say a method). Entities populate these streams by being registered with the
lexer. Any class can collect tokens by including TokenStream. From the
outside, you use such an object by calling the start_collecting_tokens method,
followed by calls to add_token and pop_token.


# Class Methods
## to_html(token_stream ) [](#method-c-to_html)
Converts `token_stream` to HTML wrapping various tokens with `<span>`
elements. Some tokens types are wrapped in spans with the given class names.
Other token types are not wrapped in spans.

#Instance Methods
## add_token(token) [](#method-i-add_token)
Adds one `token` to the collected tokens

## add_tokens(tokens) [](#method-i-add_tokens)
Adds `tokens` to the collected tokens

## collect_tokens() [](#method-i-collect_tokens)
Starts collecting tokens

## pop_token() [](#method-i-pop_token)
Remove the last token from the collected tokens

## token_stream() [](#method-i-token_stream)
Current token stream

## tokens_to_s() [](#method-i-tokens_to_s)
Returns a string representation of the token stream

