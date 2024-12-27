# Class: Racc::Parser
**Inherits:** Object
    



# Class Methods
## racc_runtime_type() [](#method-c-racc_runtime_type)
:nodoc:

#Instance Methods
## _racc_do_parse_rb(arg, in_debug) [](#method-i-_racc_do_parse_rb)

## _racc_do_reduce(arg, act) [](#method-i-_racc_do_reduce)

## _racc_evalact(act, arg) [](#method-i-_racc_evalact)
common

## _racc_init_sysvars() [](#method-i-_racc_init_sysvars)

## _racc_setup() [](#method-i-_racc_setup)

## _racc_yyparse_rb(recv, mid, arg, c_debug) [](#method-i-_racc_yyparse_rb)

## next_token() [](#method-i-next_token)
The method to fetch next token. If you use #do_parse method, you must
implement #next_token.

The format of return value is [TOKEN_SYMBOL, VALUE]. `token-symbol` is
represented by Ruby's symbol by default, e.g. :IDENT for 'IDENT'.  ";"
(String) for ';'.

The final symbol (End of file) must be false.

**@raise** [NotImplementedError] 

## on_error(t, val, vstack) [](#method-i-on_error)
This method is called when a parse error is found.

ERROR_TOKEN_ID is an internal ID of token which caused error. You can get
string representation of this ID by calling #token_to_str.

ERROR_VALUE is a value of error token.

value_stack is a stack of symbol values. DO NOT MODIFY this object.

This method raises ParseError by default.

If this method returns, parsers enter "error recovering mode".

**@raise** [ParseError] 

## racc_accept() [](#method-i-racc_accept)

## racc_e_pop(state, tstack, vstack) [](#method-i-racc_e_pop)

## racc_next_state(curstate, state) [](#method-i-racc_next_state)

## racc_print_stacks(t, v) [](#method-i-racc_print_stacks)

## racc_print_states(s) [](#method-i-racc_print_states)

## racc_read_token(t, tok, val) [](#method-i-racc_read_token)
For debugging output

## racc_reduce(toks, sim, tstack, vstack) [](#method-i-racc_reduce)

## racc_shift(tok, tstack, vstack) [](#method-i-racc_shift)

## racc_token2str(tok) [](#method-i-racc_token2str)

## token_to_str(t) [](#method-i-token_to_str)
Convert internal ID of token symbol to the string.

## yyaccept() [](#method-i-yyaccept)
Exit parser. Return value is `Symbol_Value_Stack[0]`.

## yyerrok() [](#method-i-yyerrok)
Leave error recovering mode.

## yyerror() [](#method-i-yyerror)
Enter error recovering mode. This method does not call #on_error.

