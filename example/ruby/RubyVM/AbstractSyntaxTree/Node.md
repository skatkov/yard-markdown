# Class: RubyVM::AbstractSyntaxTree::Node
**Inherits:** Object
    

:nodoc:



#Instance Methods
## all_tokens() [](#method-i-all_tokens)
call-seq:
       node.all_tokens -> array

    Returns all tokens for the input script regardless the receiver node.
    Returns +nil+ if +keep_tokens+ is not enabled when #parse method is called.

      root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
      root.all_tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
      root.children[-1].all_tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]

## beg_pos() [](#method-i-beg_pos)

## children() [](#method-i-children)
call-seq:
       node.children -> array

    Returns AST nodes under this one.  Each kind of node
    has different children, depending on what kind of node it is.

    The returned array may contain other nodes or <code>nil</code>.

## end_pos() [](#method-i-end_pos)

## first_column() [](#method-i-first_column)
call-seq:
       node.first_column -> integer

    The column number in the source code where this AST's text began.

## first_lineno() [](#method-i-first_lineno)
call-seq:
       node.first_lineno -> integer

    The line number in the source code where this AST's text began.

## inspect() [](#method-i-inspect)
call-seq:
       node.inspect -> string

    Returns debugging information about this node as a string.

## last_column() [](#method-i-last_column)
call-seq:
       node.last_column -> integer

    The column number in the source code where this AST's text ended.

## last_lineno() [](#method-i-last_lineno)
call-seq:
       node.last_lineno -> integer

    The line number in the source code where this AST's text ended.

## locations() [](#method-i-locations)
call-seq:
       node.locations -> array

    Returns location objects associated with the AST node.
    The returned array contains RubyVM::AbstractSyntaxTree::Location.

## node_id() [](#method-i-node_id)
call-seq:
       node.node_id -> integer

    Returns an internal node_id number.
    Note that this is an API for ruby internal use, debugging,
    and research. Do not use this for any other purpose.
    The compatibility is not guaranteed.

## pretty_print(q) [](#method-i-pretty_print)

## pretty_print_children(q, names[]) [](#method-i-pretty_print_children)

## script_lines() [](#method-i-script_lines)
call-seq:
       node.script_lines -> array

    Returns the original source code as an array of lines.

    Note that this is an API for ruby internal use, debugging,
    and research. Do not use this for any other purpose.
    The compatibility is not guaranteed.

## source() [](#method-i-source)
call-seq:
       node.source -> string

    Returns the code fragment that corresponds to this AST.

    Note that this is an API for ruby internal use, debugging,
    and research. Do not use this for any other purpose.
    The compatibility is not guaranteed.

    Also note that this API may return an incomplete code fragment
    that does not parse; for example, a here document following
    an expression may be dropped.

## tokens() [](#method-i-tokens)
call-seq:
       node.tokens -> array

    Returns tokens corresponding to the location of the node.
    Returns +nil+ if +keep_tokens+ is not enabled when #parse method is called.

      root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
      root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
      root.tokens.map{_1[2]}.join # => "x = 1 + 2"

    Token is an array of:

    - id
    - token type
    - source code text
    - location [ first_lineno, first_column, last_lineno, last_column ]

## type() [](#method-i-type)
call-seq:
       node.type -> symbol

    Returns the type of this node as a symbol.

      root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2")
      root.type # => :SCOPE
      lasgn = root.children[2]
      lasgn.type # => :LASGN
      call = lasgn.children[1]
      call.type # => :OPCALL

