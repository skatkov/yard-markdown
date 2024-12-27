# Class: IRB::EvalHistory
**Inherits:** Object
    

Represents history of results of previously evaluated commands.

Available via `__` variable, only if `IRB.conf[:EVAL_HISTORY]` or
`IRB::CurrentContext().eval_history` is non-nil integer value (by default it
is `nil`).

Example (in `irb`):

    # Initialize history
    IRB::CurrentContext().eval_history = 10
    # => 10

    # Perform some commands...
    1 + 2
    # => 3
    puts 'x'
    # x
    # => nil
    raise RuntimeError
    # ...error raised

    # Inspect history (format is "<item number> <evaluated value>":
    __
    # => 1 10
    # 2 3
    # 3 nil

    __[1]
    # => 10



#Instance Methods
## [](idx) [](#method-i-[])
Get one item of the content (both positive and negative indexes work).

## initialize(size16) [](#method-i-initialize)
:nodoc:

**@return** [EvalHistory] a new instance of EvalHistory

## inspect() [](#method-i-inspect)
:nodoc:

## push(no, val) [](#method-i-push)
:nodoc:

## real_inspect() [](#method-i-real_inspect)

## size(size) [](#method-i-size)
:nodoc:

