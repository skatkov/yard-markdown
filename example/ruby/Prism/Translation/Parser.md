# Class: Prism::Translation::Parser
**Inherits:** Parser::Base
    

This class is the entry-point for converting a prism syntax tree into the
whitequark/parser gem's syntax tree. It inherits from the base parser for the
parser gem, and overrides the parse* methods to parse with prism and then
translate.



#Instance Methods
## default_encoding() [](#method-i-default_encoding)
The default encoding for Ruby files is UTF-8.

## parse(source_buffer) [](#method-i-parse)
Parses a source buffer and returns the AST.

## parse_with_comments(source_buffer) [](#method-i-parse_with_comments)
Parses a source buffer and returns the AST and the source code comments.

## tokenize(source_buffer, recoverfalse) [](#method-i-tokenize)
Parses a source buffer and returns the AST, the source code comments, and the
tokens emitted by the lexer.

## try_declare_numparam(node) [](#method-i-try_declare_numparam)
Since prism resolves num params for us, we don't need to support this kind of
logic here.

## version() [](#method-i-version)
:nodoc:

## yyerror() [](#method-i-yyerror)
:nodoc:

