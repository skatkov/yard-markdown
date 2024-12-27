# Class: Prism::Pattern
**Inherits:** Object
    

A pattern is an object that wraps a Ruby pattern matching expression. The
expression would normally be passed to an `in` clause within a `case`
expression or a rightward assignment expression. For example, in the following
snippet:

    case node
    in ConstantPathNode[ConstantReadNode[name: :Prism], ConstantReadNode[name: :Pattern]]
    end

the pattern is the `ConstantPathNode[...]` expression.

The pattern gets compiled into an object that responds to #call by running the
#compile method. This method itself will run back through Prism to parse the
expression into a tree, then walk the tree to generate the necessary callable
objects. For example, if you wanted to compile the expression above into a
callable, you would:

    callable = Prism::Pattern.new("ConstantPathNode[ConstantReadNode[name: :Prism], ConstantReadNode[name: :Pattern]]").compile
    callable.call(node)

The callable object returned by #compile is guaranteed to respond to #call
with a single argument, which is the node to match against. It also is
guaranteed to respond to #===, which means it itself can be used in a `case`
expression, as in:

    case node
    when callable
    end

If the query given to the initializer cannot be compiled into a valid matcher
(either because of a syntax error or because it is using syntax we do not yet
support) then a Prism::Pattern::CompilationError will be raised.


# Attributes
## query[RW] [](#attribute-i-query)
The query that this pattern was initialized with.


#Instance Methods
## compile() [](#method-i-compile)
Compile the query into a callable object that can be used to match against
nodes.

**@raise** [CompilationError] 

## initialize(query) [](#method-i-initialize)
Create a new pattern with the given query. The query should be a string
containing a Ruby pattern matching expression.

**@return** [Pattern] a new instance of Pattern

## scan(root) [](#method-i-scan)
Scan the given node and all of its children for nodes that match the pattern.
If a block is given, it will be called with each node that matches the
pattern. If no block is given, an enumerator will be returned that will yield
each node that matches the pattern.

