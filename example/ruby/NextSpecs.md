# Class: NextSpecs
**Inherits:** Object
    



# Class Methods
## loop_next(arg ) [](#method-c-loop_next)
## loop_within_iter(arg ) [](#method-c-loop_within_iter)
## until_next(arg ) [](#method-c-until_next)
## until_within_iter(arg ) [](#method-c-until_within_iter)
## while_next(arg ) [](#method-c-while_next)
The methods below are defined to spec the behavior of the next statement while
specifically isolating whether the statement is in an Iter block or not. In a
normal spec example, the code is always nested inside a block. Rather than
rely on that implicit context in this case, the context is made explicit
because of the interaction of next in a loop nested inside an Iter block.
## while_within_iter(arg ) [](#method-c-while_within_iter)
## yielding() [](#method-c-yielding)
## yielding_method(expected ) [](#method-c-yielding_method)

