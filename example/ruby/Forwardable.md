# Module: Forwardable
    

:stopdoc:


# Class Methods
## _compile_method(src , file , line ) [](#method-c-_compile_method)
## _delegator_method(obj , accessor , method , ali ) [](#method-c-_delegator_method)
:nodoc:
## _valid_method?(method ) [](#method-c-_valid_method?)
:stopdoc:
**@return** [Boolean] 

# Attributes
## debug[RW] [](#attribute-c-debug)
ignored


#Instance Methods
## def_instance_delegator(accessor, method, alimethod) [](#method-i-def_instance_delegator)
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

## def_instance_delegators(accessor, *methods) [](#method-i-def_instance_delegators)
Shortcut for defining multiple delegator methods, but with no provision for
using a different name.  The following two code samples have the same effect:

    def_delegators :@records, :size, :<<, :map

    def_delegator :@records, :size
    def_delegator :@records, :<<
    def_delegator :@records, :map

## instance_delegate(hash) [](#method-i-instance_delegate)
Takes a hash as its argument.  The key is a symbol or an array of symbols. 
These symbols correspond to method names, instance variable names, or constant
names (see def_delegator).  The value is the accessor to which the methods
will be delegated.

:call-seq:
    delegate method => accessor
    delegate [method, method, ...] => accessor

