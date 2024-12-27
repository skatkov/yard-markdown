# Class: Lrama::Grammar::Code
**Inherits:** Object
  
**Extended by:** Forwardable
    



# Class Methods
## def_instance_delegator(accessor , method , ali method) [](#method-c-def_instance_delegator)
Define `method` as delegator instance method with an optional alias name
`ali`. Method calls to `ali` will be delegated to `accessor.method`. 
`accessor` should be a method name, instance variable name, or constant name. 
Use the full path to the constant if providing the constant name. Returns the
name of the method defined.

    class MyQueue
      CONST = 1
      extend Forwardable
      attr_reader :queue
      def initialize
        @queue = []
      end

      def_delegator :@queue, :push, :mypush
      def_delegator 'MyQueue::CONST', :to_i
    end

    q = MyQueue.new
    q.mypush 42
    q.queue    #=> [42]
    q.push 23  #=> NoMethodError
    q.to_i     #=> 1
## def_instance_delegators(accessor , *methods ) [](#method-c-def_instance_delegators)
Shortcut for defining multiple delegator methods, but with no provision for
using a different name.  The following two code samples have the same effect:

    def_delegators :@records, :size, :<<, :map

    def_delegator :@records, :size
    def_delegator :@records, :<<
    def_delegator :@records, :map
## instance_delegate(hash ) [](#method-c-instance_delegate)
Takes a hash as its argument.  The key is a symbol or an array of symbols. 
These symbols correspond to method names, instance variable names, or constant
names (see def_delegator).  The value is the accessor to which the methods
will be delegated.

:call-seq:
    delegate method => accessor
    delegate [method, method, ...] => accessor
# Attributes
## token_code[RW] [](#attribute-i-token_code)
Returns the value of attribute token_code.

## type[RW] [](#attribute-i-type)
Returns the value of attribute type.


#Instance Methods
## ==(other) [](#method-i-==)

## initialize(type:, token_code:) [](#method-i-initialize)

**@return** [Code] a new instance of Code

## translated_code() [](#method-i-translated_code)
$$, $n, @$, @n are translated to C code

