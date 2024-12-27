# Class: Lrama::States
**Inherits:** Object
  
**Extended by:** Forwardable
    
**Includes:** Lrama::Report::Duration
  

States is passed to a template file

"Efficient Computation of LALR(1) Look-Ahead Sets"
    https://dl.acm.org/doi/pdf/10.1145/69622.357187


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
## includes_relation[RW] [](#attribute-i-includes_relation)
Returns the value of attribute includes_relation.

## lookback_relation[RW] [](#attribute-i-lookback_relation)
Returns the value of attribute lookback_relation.

## reads_relation[RW] [](#attribute-i-reads_relation)
Returns the value of attribute reads_relation.

## states[RW] [](#attribute-i-states)
Returns the value of attribute states.


#Instance Methods
## compute() [](#method-i-compute)

## direct_read_sets() [](#method-i-direct_read_sets)

## follow_sets() [](#method-i-follow_sets)

## initialize(grammar, trace_state:false) [](#method-i-initialize)

**@return** [States] a new instance of States

## la() [](#method-i-la)

## read_sets() [](#method-i-read_sets)

## report_duration(method_name) [](#method-i-report_duration)

## reporter() [](#method-i-reporter)

## rr_conflicts_count() [](#method-i-rr_conflicts_count)

## sr_conflicts_count() [](#method-i-sr_conflicts_count)

## states_count() [](#method-i-states_count)

