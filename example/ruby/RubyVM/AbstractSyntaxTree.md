# Module: RubyVM::AbstractSyntaxTree
    

AbstractSyntaxTree provides methods to parse Ruby code into abstract syntax
trees. The nodes in the tree are instances of
RubyVM::AbstractSyntaxTree::Node.

This module is MRI specific as it exposes implementation details of the MRI
abstract syntax tree.

This module is experimental and its API is not stable, therefore it might
change without notice. As examples, the order of children nodes is not
guaranteed, the number of children nodes might change, there is no way to
access children nodes by name, etc.

If you are looking for a stable API or an API working under multiple Ruby
implementations, consider using the *prism* gem, which is the official Ruby
API to parse Ruby code.


# Class Methods
## node_id_for_backtrace_location(backtrace_location ) [](#method-c-node_id_for_backtrace_location)
call-seq:
      RubyVM::AbstractSyntaxTree.node_id_for_backtrace_location(backtrace_location)   -> integer

    Returns the node id for the given backtrace location.

      begin
        raise
      rescue =>  e
        loc = e.backtrace_locations.first
        RubyVM::AbstractSyntaxTree.node_id_for_backtrace_location(loc)
      end # => 0
## of(body , keep_script_lines: RubyVM.keep_script_lines, error_tolerant: false, keep_tokens: false) [](#method-c-of)
call-seq:
      RubyVM::AbstractSyntaxTree.of(proc, keep_script_lines: RubyVM.keep_script_lines, error_tolerant: false, keep_tokens: false)   -> RubyVM::AbstractSyntaxTree::Node
      RubyVM::AbstractSyntaxTree.of(method, keep_script_lines: RubyVM.keep_script_lines, error_tolerant: false, keep_tokens: false) -> RubyVM::AbstractSyntaxTree::Node

    Returns AST nodes of the given _proc_ or _method_.

      RubyVM::AbstractSyntaxTree.of(proc {1 + 2})
      # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:35-1:42>

      def hello
        puts "hello, world"
      end

      RubyVM::AbstractSyntaxTree.of(method(:hello))
      # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-3:3>

    See ::parse for explanation of keyword argument meaning and usage.
## parse(string , keep_script_lines: RubyVM.keep_script_lines, error_tolerant: false, keep_tokens: false) [](#method-c-parse)
call-seq:
       RubyVM::AbstractSyntaxTree.parse(string, keep_script_lines: RubyVM.keep_script_lines, error_tolerant: false, keep_tokens: false) -> RubyVM::AbstractSyntaxTree::Node

    Parses the given _string_ into an abstract syntax tree,
    returning the root node of that tree.

      RubyVM::AbstractSyntaxTree.parse("x = 1 + 2")
      # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-1:9>

    If <tt>keep_script_lines: true</tt> option is provided, the text of the parsed
    source is associated with nodes and is available via Node#script_lines.

    If <tt>keep_tokens: true</tt> option is provided, Node#tokens are populated.

    SyntaxError is raised if the given _string_ is invalid syntax. To overwrite this
    behavior, <tt>error_tolerant: true</tt> can be provided. In this case, the parser
    will produce a tree where expressions with syntax errors would be represented by
    Node with <tt>type=:ERROR</tt>.

       root = RubyVM::AbstractSyntaxTree.parse("x = 1; p(x; y=2")
       # <internal:ast>:33:in `parse': syntax error, unexpected ';', expecting ')' (SyntaxError)
       # x = 1; p(x; y=2
       #           ^

       root = RubyVM::AbstractSyntaxTree.parse("x = 1; p(x; y=2", error_tolerant: true)
       # (SCOPE@1:0-1:15
       #  tbl: [:x, :y]
       #  args: nil
       #  body: (BLOCK@1:0-1:15 (LASGN@1:0-1:5 :x (LIT@1:4-1:5 1)) (ERROR@1:7-1:11) (LASGN@1:12-1:15 :y (LIT@1:14-1:15 2))))
       root.children.last.children
       # [(LASGN@1:0-1:5 :x (LIT@1:4-1:5 1)),
       #  (ERROR@1:7-1:11),
       #  (LASGN@1:12-1:15 :y (LIT@1:14-1:15 2))]

    Note that parsing continues even after the errored expression.
## parse_file(pathname , keep_script_lines: RubyVM.keep_script_lines, error_tolerant: false, keep_tokens: false) [](#method-c-parse_file)
call-seq:
      RubyVM::AbstractSyntaxTree.parse_file(pathname, keep_script_lines: RubyVM.keep_script_lines, error_tolerant: false, keep_tokens: false) -> RubyVM::AbstractSyntaxTree::Node

    Reads the file from _pathname_, then parses it like ::parse,
    returning the root node of the abstract syntax tree.

    SyntaxError is raised if _pathname_'s contents are not
    valid Ruby syntax.

      RubyVM::AbstractSyntaxTree.parse_file("my-app/app.rb")
      # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-31:3>

    See ::parse for explanation of keyword argument meaning and usage.

