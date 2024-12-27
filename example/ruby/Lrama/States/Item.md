# Class: Lrama::States::Item
**Inherits:** Struct
  
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
## position[RW] [](#attribute-i-position)
Returns the value of attribute position

**@return** [Object] the current value of position

## rule[RW] [](#attribute-i-rule)
Returns the value of attribute rule

**@return** [Object] the current value of rule


#Instance Methods
## beginning_of_rule?() [](#method-i-beginning_of_rule?)

**@return** [Boolean] 

## display_name() [](#method-i-display_name)

## display_rest() [](#method-i-display_rest)
Right after position

## empty_rule?() [](#method-i-empty_rule?)

**@return** [Boolean] 

## end_of_rule?() [](#method-i-end_of_rule?)

**@return** [Boolean] 

## hash() [](#method-i-hash)
Optimization for States#setup_state

## new_by_next_position() [](#method-i-new_by_next_position)

## next_next_sym() [](#method-i-next_next_sym)

## next_sym() [](#method-i-next_sym)

## number_of_rest_symbols() [](#method-i-number_of_rest_symbols)

## previous_sym() [](#method-i-previous_sym)

## rule_id() [](#method-i-rule_id)

## start_item?() [](#method-i-start_item?)

**@return** [Boolean] 

## symbols_after_dot() [](#method-i-symbols_after_dot)
steep:ignore

## symbols_before_dot() [](#method-i-symbols_before_dot)
steep:ignore

## to_s() [](#method-i-to_s)

