# Module: Reline
  
**Extended by:** Forwardable, SingleForwardable
    



# Class Methods
## core() [](#method-c-core)
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
## def_single_delegator(accessor , method , ali method) [](#method-c-def_single_delegator)
:call-seq:
    def_single_delegator(accessor, method, new_name=method)

Defines a method *method* which delegates to *accessor* (i.e. it calls the
method of the same name in *accessor*).  If *new_name* is provided, it is used
as the name for the delegate method. Returns the name of the method defined.
## def_single_delegators(accessor , *methods ) [](#method-c-def_single_delegators)
Shortcut for defining multiple delegator methods, but with no provision for
using a different name.  The following two code samples have the same effect:

    def_delegators :@records, :size, :<<, :map

    def_delegator :@records, :size
    def_delegator :@records, :<<
    def_delegator :@records, :map
## encoding_system_needs() [](#method-c-encoding_system_needs)
## get_screen_size() [](#method-c-get_screen_size)
## insert_text(text ) [](#method-c-insert_text)
## instance_delegate(hash ) [](#method-c-instance_delegate)
Takes a hash as its argument.  The key is a symbol or an array of symbols. 
These symbols correspond to method names, instance variable names, or constant
names (see def_delegator).  The value is the accessor to which the methods
will be delegated.

:call-seq:
    delegate method => accessor
    delegate [method, method, ...] => accessor
## line_editor() [](#method-c-line_editor)
## single_delegate(hash ) [](#method-c-single_delegate)
Takes a hash as its argument.  The key is a symbol or an array of symbols. 
These symbols correspond to method names.  The value is the accessor to which
the methods will be delegated.

:call-seq:
    delegate method => accessor
    delegate [method, method, ...] => accessor
## test_mode(ansi: false) [](#method-c-test_mode)
## test_reset() [](#method-c-test_reset)
## test_rubybin() [](#method-c-test_rubybin)
Return a executable name to spawn Ruby process. In certain build
configuration, "ruby" may not be available.
## ungetc(c ) [](#method-c-ungetc)

