# Class: RubyVM::AbstractSyntaxTree::Location
**Inherits:** Object
    

RubyVM::AbstractSyntaxTree::Location instances are created by
RubyVM::AbstractSyntaxTree::Node#locations.

This class is MRI specific.



#Instance Methods
## first_column() [](#method-i-first_column)
call-seq:
       location.first_column -> integer

    The column number in the source code where this AST's text began.

## first_lineno() [](#method-i-first_lineno)
call-seq:
       location.first_lineno -> integer

    The line number in the source code where this AST's text began.

## inspect() [](#method-i-inspect)
call-seq:
       location.inspect -> string

    Returns debugging information about this location as a string.

## last_column() [](#method-i-last_column)
call-seq:
       location.last_column -> integer

    The column number in the source code where this AST's text ended.

## last_lineno() [](#method-i-last_lineno)
call-seq:
       location.last_lineno -> integer

    The line number in the source code where this AST's text ended.

