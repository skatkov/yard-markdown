# Class: DSL
**Inherits:** Object
    

Simple DSL implementation for Ripper code generation

input: /*% ripper: stmts_add!(stmts_new!, void_stmt!) %*/ output:
    VALUE v1, v2;
    v1 = dispatch0(stmts_new);
    v2 = dispatch0(void_stmt);
    $$ = dispatch2(stmts_add, v1, v2);

*   The code must be a single line.

*   The code is basically Ruby code, even if it appears like in C and the
    result will be processed as C. e.g., comments need to be in Ruby style.


# Class Methods
## comma_split(str ) [](#method-c-comma_split)
## const_missing(name ) [](#method-c-const_missing)
## line?(line , lineno nil, indent: nil) [](#method-c-line?)
**@return** [Boolean] 

# Attributes
## events[RW] [](#attribute-i-events)
Returns the value of attribute events.


#Instance Methods
## add_event(event, args) [](#method-i-add_event)

## dsl_binding(p"p") [](#method-i-dsl_binding)

## generate() [](#method-i-generate)

## initialize(code, options, linenonil, indent:"\t\t\t") [](#method-i-initialize)

**@return** [DSL] a new instance of DSL

## method_missing(event, *args) [](#method-i-method_missing)

