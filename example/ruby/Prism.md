# Module: Prism
    

This file is organized to match itemization in
https://github.com/ruby/prism/issues/1335


# Class Methods
## dump(*args ) [](#method-c-dump)
Dump the AST corresponding to the given string to a string. For supported
options, see Prism::parse.
**@overload** [] 

## dump_file(*args ) [](#method-c-dump_file)
Dump the AST corresponding to the given file to a string. For supported
options, see Prism::parse.
**@overload** [] 

## lex(*args ) [](#method-c-lex)
Return a LexResult instance that contains an array of Token instances
corresponding to the given string. For supported options, see Prism::parse.
**@overload** [] 

## lex_compat(source , **options ) [](#method-c-lex_compat)
:call-seq:
    Prism::lex_compat(source, **options) -> LexCompat::Result

Returns a parse result whose value is an array of tokens that closely
resembles the return value of Ripper::lex. The main difference is that the
`:on_sp` token is not emitted.

For supported options, see Prism::parse.
## lex_file(*args ) [](#method-c-lex_file)
Return a LexResult instance that contains an array of Token instances
corresponding to the given file. For supported options, see Prism::parse.
**@overload** [] 

## lex_ripper(source ) [](#method-c-lex_ripper)
:call-seq:
    Prism::lex_ripper(source) -> Array

This lexes with the Ripper lex. It drops any space events but otherwise
returns the same tokens. Raises SyntaxError if the syntax in source is
invalid.
## load(source , serialized ) [](#method-c-load)
:call-seq:
    Prism::load(source, serialized) -> ParseResult

Load the serialized AST using the source as a reference into a tree.
## parse(*args ) [](#method-c-parse)
Parse the given string and return a ParseResult instance. The options that are
supported are:

*   `command_line` - either nil or a string of the various options that were
        set on the command line. Valid values are combinations of "a", "l",
        "n", "p", and "x".

*   `encoding` - the encoding of the source being parsed. This should be an
        encoding or nil.

*   `filepath` - the filepath of the source being parsed. This should be a
        string or nil.

*   `frozen_string_literal` - whether or not the frozen string literal pragma
        has been set. This should be a boolean or nil.

*   `line` - the line number that the parse starts on. This should be an
        integer or nil. Note that this is 1-indexed.

*   `main_script` - a boolean indicating whether or not the source being
    parsed
        is the main script being run by the interpreter. This controls whether
        or not shebangs are parsed for additional flags and whether or not the
        parser will attempt to find a matching shebang if the first one does
        not contain the word "ruby".

*   `partial_script` - when the file being parsed is considered a "partial"
        script, jumps will not be marked as errors if they are not contained
        within loops/blocks. This is used in the case that you're parsing a
        script that you know will be embedded inside another script later, but
        you do not have that context yet. For example, when parsing an ERB
        template that will be evaluated inside another script.

*   `scopes` - the locals that are in scope surrounding the code that is being
        parsed. This should be an array of arrays of symbols or nil. Scopes are
        ordered from the outermost scope to the innermost one.

*   `version` - the version of Ruby syntax that prism should used to parse
    Ruby
        code. By default prism assumes you want to parse with the latest version
        of Ruby syntax (which you can trigger with `nil` or `"latest"`). You
        may also restrict the syntax to a specific version of Ruby, e.g., with `"3.3.0"`.
        To parse with the same syntax version that the current Ruby is running
        use `version: RUBY_VERSION`. Raises ArgumentError if the version is not
        currently supported by Prism.
**@overload** [] 

## parse_comments(*args ) [](#method-c-parse_comments)
Parse the given string and return an array of Comment objects. For supported
options, see Prism::parse.
**@overload** [] 

## parse_failure?(*args ) [](#method-c-parse_failure?)
Parse the given string and return true if it parses with errors. For supported
options, see Prism::parse.
**@overload** [] 

## parse_file(*args ) [](#method-c-parse_file)
Parse the given file and return a ParseResult instance. For supported options,
see Prism::parse.
**@overload** [] 

## parse_file_comments(*args ) [](#method-c-parse_file_comments)
Parse the given file and return an array of Comment objects. For supported
options, see Prism::parse.
**@overload** [] 

## parse_file_failure?(*args ) [](#method-c-parse_file_failure?)
Parse the given file and return true if it parses with errors. For supported
options, see Prism::parse.
**@overload** [] 

## parse_file_success?(*args ) [](#method-c-parse_file_success?)
Parse the given file and return true if it parses without errors. For
supported options, see Prism::parse.
**@overload** [] 

## parse_lex(*args ) [](#method-c-parse_lex)
Parse the given string and return a ParseLexResult instance that contains a
2-element array, where the first element is the AST and the second element is
an array of Token instances.

This API is only meant to be used in the case where you need both the AST and
the tokens. If you only need one or the other, use either Prism::parse or
Prism::lex.

For supported options, see Prism::parse.
**@overload** [] 

## parse_lex_file(*args ) [](#method-c-parse_lex_file)
Parse the given file and return a ParseLexResult instance that contains a
2-element array, where the first element is the AST and the second element is
an array of Token instances.

This API is only meant to be used in the case where you need both the AST and
the tokens. If you only need one or the other, use either Prism::parse_file or
Prism::lex_file.

For supported options, see Prism::parse.
**@overload** [] 

## parse_statement(source , **options ) [](#method-c-parse_statement)
A convenience method for retrieving the first statement in the source string
parsed by Prism.
## parse_stream(*args ) [](#method-c-parse_stream)
Parse the given object that responds to `gets` and return a ParseResult
instance. The options that are supported are the same as Prism::parse.
**@overload** [] 

## parse_success?(*args ) [](#method-c-parse_success?)
Parse the given string and return true if it parses without errors. For
supported options, see Prism::parse.
**@overload** [] 

## profile(*args ) [](#method-c-profile)
Parse the given string and return nothing. This method is meant to allow
profilers to avoid the overhead of reifying the AST to Ruby. For supported
options, see Prism::parse.
**@overload** [] 

## profile_file(*args ) [](#method-c-profile_file)
Parse the given file and return nothing. This method is meant to allow
profilers to avoid the overhead of reifying the AST to Ruby. For supported
options, see Prism::parse.
**@overload** [] 


