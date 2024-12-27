# Module: ObjectSpace
    

The objspace library extends the ObjectSpace module and adds several methods
to get internal statistic information about object/memory management.

You need to `require 'objspace'` to use this extension module.

Generally, you **SHOULD** **NOT** use this library if you do not know about
the MRI implementation.  Mainly, this library is for (memory) profiler
developers and MRI developers who need to know about MRI memory usage.


# Class Methods
## _dump(obj , output ) [](#method-c-_dump)
:nodoc:
## _dump_all(output , full , since , shapes ) [](#method-c-_dump_all)
:nodoc:
## _dump_shapes(output , shapes ) [](#method-c-_dump_shapes)
:nodoc:
## _id2ref(objid ) [](#method-c-_id2ref)
:nodoc:
## allocation_class_path(obj ) [](#method-c-allocation_class_path)
Returns the class for the given `object`.

class A
    def foo
      ObjectSpace::trace_object_allocations do
        obj = Object.new
        p "#{ObjectSpace::allocation_class_path(obj)}"
      end
    end

end

A.new.foo #=> "Class"

See ::trace_object_allocations for more information and examples.
**@overload** [] 

## allocation_generation(obj ) [](#method-c-allocation_generation)
Returns garbage collector generation for the given `object`.

class B
    include ObjectSpace

    def foo
      trace_object_allocations do
        obj = Object.new
        p "Generation is #{allocation_generation(obj)}"
      end
    end

end

B.new.foo #=> "Generation is 3"

See ::trace_object_allocations for more information and examples.
**@overload** [] 

## allocation_method_id(obj ) [](#method-c-allocation_method_id)
Returns the method identifier for the given `object`.

class A
    include ObjectSpace

    def foo
      trace_object_allocations do
        obj = Object.new
        p "#{allocation_class_path(obj)}##{allocation_method_id(obj)}"
      end
    end

end

A.new.foo #=> "Class#new"

See ::trace_object_allocations for more information and examples.
**@overload** [] 

## allocation_sourcefile(obj ) [](#method-c-allocation_sourcefile)
Returns the source file origin from the given `object`.

See ::trace_object_allocations for more information and examples.
**@overload** [] 

## allocation_sourceline(obj ) [](#method-c-allocation_sourceline)
Returns the original line from source for from the given `object`.

See ::trace_object_allocations for more information and examples.
**@overload** [] 

## class_name_of(klass ) [](#method-c-class_name_of)
## count_imemo_objects(*args ) [](#method-c-count_imemo_objects)
Counts objects for each `T_IMEMO` type.

This method is only for MRI developers interested in performance and memory
usage of Ruby programs.

It returns a hash as:

    {:imemo_ifunc=>8,
     :imemo_svar=>7,
     :imemo_cref=>509,
     :imemo_memo=>1,
     :imemo_throw_data=>1}

If the optional argument, result_hash, is given, it is overwritten and
returned. This is intended to avoid probe effect.

The contents of the returned hash is implementation specific and may change in
the future.

In this version, keys are symbol objects.

This method is only expected to work with C Ruby.
**@overload** [] 

## count_nodes(*args ) [](#method-c-count_nodes)
Counts nodes for each node type.

This method is only for MRI developers interested in performance and memory
usage of Ruby programs.

It returns a hash as:

{:NODE_METHOD=>2027, :NODE_FBODY=>1927, :NODE_CFUNC=>1798, ...}

If the optional argument, result_hash, is given, it is overwritten and
returned. This is intended to avoid probe effect.

Note: The contents of the returned hash is implementation defined. It may be
changed in future.

This method is only expected to work with C Ruby.
**@overload** [] 

## count_objects(*args ) [](#method-c-count_objects)
Counts all objects grouped by type.

It returns a hash, such as: {
    :TOTAL=>10000,
    :FREE=>3011,
    :T_OBJECT=>6,
    :T_CLASS=>404,
    # ...

}

The contents of the returned hash are implementation specific. It may be
changed in future.

The keys starting with `:T_` means live objects. For example, `:T_ARRAY` is
the number of arrays. `:FREE` means object slots which is not used now.
`:TOTAL` means sum of above.

If the optional argument `result_hash` is given, it is overwritten and
returned. This is intended to avoid probe effect.

    h = {}
    ObjectSpace.count_objects(h)
    puts h
    # => { :TOTAL=>10000, :T_CLASS=>158280, :T_MODULE=>20672, :T_STRING=>527249 }

This method is only expected to work on C Ruby.
**@overload** [] 

## count_objects_size(*args ) [](#method-c-count_objects_size)
Counts objects size (in bytes) for each type.

Note that this information is incomplete.  You need to deal with this
information as only a **HINT**.  Especially, total size of T_DATA may be
wrong.

It returns a hash as:
    {:TOTAL=>1461154, :T_CLASS=>158280, :T_MODULE=>20672, :T_STRING=>527249, ...}

If the optional argument, result_hash, is given, it is overwritten and
returned. This is intended to avoid probe effect.

The contents of the returned hash is implementation defined. It may be changed
in future.

This method is only expected to work with C Ruby.
**@overload** [] 

## count_symbols(*args ) [](#method-c-count_symbols)
Counts symbols for each Symbol type.

This method is only for MRI developers interested in performance and memory
usage of Ruby programs.

If the optional argument, result_hash, is given, it is overwritten and
returned. This is intended to avoid probe effect.

Note: The contents of the returned hash is implementation defined. It may be
changed in future.

This method is only expected to work with C Ruby.

On this version of MRI, they have 3 types of Symbols (and 1 total counts).

    * mortal_dynamic_symbol: GC target symbols (collected by GC)
    * immortal_dynamic_symbol: Immortal symbols promoted from dynamic symbols (do not collected by GC)
    * immortal_static_symbol: Immortal symbols (do not collected by GC)
    * immortal_symbol: total immortal symbols (immortal_dynamic_symbol+immortal_static_symbol)
**@overload** [] 

## count_tdata_objects(*args ) [](#method-c-count_tdata_objects)
Counts objects for each `T_DATA` type.

This method is only for MRI developers interested in performance and memory
usage of Ruby programs.

It returns a hash as:

{RubyVM::InstructionSequence=>504, :parser=>5, :barrier=>6, 	 :mutex=>6,
Proc=>60, RubyVM::Env=>57, Mutex=>1, Encoding=>99, 	 ThreadGroup=>1,
Binding=>1, Thread=>1, RubyVM=>1, :iseq=>1, 	 Random=>1, ARGF.class=>1,
Data=>1, :autoload=>3, Time=>2} 	# T_DATA objects existing at startup on
r32276.

If the optional argument, result_hash, is given, it is overwritten and
returned. This is intended to avoid probe effect.

The contents of the returned hash is implementation specific and may change in
the future.

In this version, keys are Class object or Symbol object.

If object is kind of normal (accessible) object, the key is Class object. If
object is not a kind of normal (internal) object, the key is symbol name,
registered by rb_data_type_struct.

This method is only expected to work with C Ruby.
**@overload** [] 

## define_finalizer(*args ) [](#method-c-define_finalizer)
Adds *aProc* as a finalizer, to be called after *obj* was destroyed. The
object ID of the *obj* will be passed as an argument to *aProc*. If *aProc* is
a lambda or method, make sure it can be called with a single argument.

The return value is an array `[0, aProc]`.

The two recommended patterns are to either create the finaliser proc in a
non-instance method where it can safely capture the needed state, or to use a
custom callable object that stores the needed state explicitly as instance
variables.

    class Foo
      def initialize(data_needed_for_finalization)
        ObjectSpace.define_finalizer(self, self.class.create_finalizer(data_needed_for_finalization))
      end

      def self.create_finalizer(data_needed_for_finalization)
        proc {
          puts "finalizing #{data_needed_for_finalization}"
        }
      end
    end

    class Bar
     class Remover
        def initialize(data_needed_for_finalization)
          @data_needed_for_finalization = data_needed_for_finalization
        end

        def call(id)
          puts "finalizing #{@data_needed_for_finalization}"
        end
      end

      def initialize(data_needed_for_finalization)
        ObjectSpace.define_finalizer(self, Remover.new(data_needed_for_finalization))
      end
    end

Note that if your finalizer references the object to be finalized it will
never be run on GC, although it will still be run at exit. You will get a
warning if you capture the object to be finalized as the receiver of the
finalizer.

    class CapturesSelf
      def initialize(name)
        ObjectSpace.define_finalizer(self, proc {
          # this finalizer will only be run on exit
          puts "finalizing #{name}"
        })
      end
    end

Also note that finalization can be unpredictable and is never guaranteed to be
run except on exit.
**@overload** [] 

## dump(obj , output: :string) [](#method-c-dump)
Dump the contents of a ruby object as JSON.

*output* can be one of: `:stdout`, `:file`, `:string`, or IO object.

*   `:file` means dumping to a tempfile and returning corresponding File
    object;
*   `:stdout` means printing the dump and returning `nil`;
*   `:string` means returning a string with the dump;
*   if an instance of IO object is provided, the output goes there, and the
    object is returned.

This method is only expected to work with C Ruby. This is an experimental
method and is subject to change. In particular, the function signature and
output format are not guaranteed to be compatible in future versions of ruby.
## dump_all(output: :file, full: false, since: nil, shapes: true) [](#method-c-dump_all)
Dump the contents of the ruby heap as JSON.

*output* argument is the same as for #dump.

*full* must be a boolean. If true, all heap slots are dumped including the
empty ones (`T_NONE`).

*since* must be a non-negative integer or `nil`.

If *since* is a positive integer, only objects of that generation and newer
generations are dumped. The current generation can be accessed using
GC::count. Objects that were allocated without object allocation tracing
enabled are ignored. See ::trace_object_allocations for more information and
examples.

If *since* is omitted or is `nil`, all objects are dumped.

*shapes* must be a boolean or a non-negative integer.

If *shapes* is a positive integer, only shapes newer than the provided shape
id are dumped. The current shape_id can be accessed using
`RubyVM.stat(:next_shape_id)`.

If *shapes* is `false`, no shapes are dumped.

To only dump objects allocated past a certain point you can combine *since*
and *shapes*:
    ObjectSpace.trace_object_allocations
    GC.start
    gc_generation = GC.count
    shape_generation = RubyVM.stat(:next_shape_id)
    call_method_to_instrument
    ObjectSpace.dump_all(since: gc_generation, shapes: shape_generation)

This method is only expected to work with C Ruby. This is an experimental
method and is subject to change. In particular, the function signature and
output format are not guaranteed to be compatible in future versions of ruby.
## dump_shapes(output: :file, since: 0) [](#method-c-dump_shapes)
Dump the contents of the ruby shape tree as JSON.

    _output_ argument is the same as for #dump.

    If _since_ is a positive integer, only shapes newer than the provided
    shape id are dumped. The current shape_id can be accessed using <tt>RubyVM.stat(:next_shape_id)</tt>.

    This method is only expected to work with C Ruby.
    This is an experimental method and is subject to change.
    In particular, the function signature and output format are
    not guaranteed to be compatible in future versions of ruby.
## each_object(*args ) [](#method-c-each_object)
Calls the block once for each living, nonimmediate object in this Ruby
process. If *module* is specified, calls the block for only those classes or
modules that match (or are a subclass of) *module*. Returns the number of
objects found. Immediate objects (`Fixnum`s, `Symbol`s `true`, `false`, and
`nil`) are never returned. In the example below, #each_object returns both the
numbers we defined and several constants defined in the Math module.

If no block is given, an enumerator is returned instead.

    a = 102.7
    b = 95       # Won't be returned
    c = 12345678987654321
    count = ObjectSpace.each_object(Numeric) {|x| p x }
    puts "Total count: #{count}"

*produces:*

    12345678987654321
    102.7
    2.71828182845905
    3.14159265358979
    2.22044604925031e-16
    1.7976931348623157e+308
    2.2250738585072e-308
    Total count: 7
**@overload** [] 

**@overload** [] 

## garbage_collect(full_mark: true, immediate_mark: true, immediate_sweep: true) [](#method-c-garbage_collect)
Alias of GC.start
## internal_class_of(obj ) [](#method-c-internal_class_of)
MRI specific feature
:   Return internal class of obj.

obj can be an instance of InternalObjectWrapper.

Note that you should not use this method in your application.
**@overload** [] 

## internal_super_of(obj ) [](#method-c-internal_super_of)
MRI specific feature
:   Return internal super class of cls (Class or Module).

obj can be an instance of InternalObjectWrapper.

Note that you should not use this method in your application.
**@overload** [] 

## memsize_of(obj ) [](#method-c-memsize_of)
Return consuming memory size of obj in bytes.

Note that the return size is incomplete.  You need to deal with this
information as only a **HINT**. Especially, the size of `T_DATA` may not be
correct.

This method is only expected to work with C Ruby.

From Ruby 2.2, memsize_of(obj) returns a memory size includes sizeof(RVALUE).
**@overload** [] 

## memsize_of_all(*args ) [](#method-c-memsize_of_all)
Return consuming memory size of all living objects in bytes.

If `klass` (should be Class object) is given, return the total memory size of
instances of the given class.

Note that the returned size is incomplete. You need to deal with this
information as only a **HINT**. Especially, the size of `T_DATA` may not be
correct.

Note that this method does **NOT** return total malloc'ed memory size.

This method can be defined by the following Ruby code:

def memsize_of_all klass = false 	  total = 0 	  ObjectSpace.each_object{|e| 	
   total += ObjectSpace.memsize_of(e) if klass == false || e.kind_of?(klass) 	
 } 	  total 	end

This method is only expected to work with C Ruby.
**@overload** [] 

## module_refenreces(klass ) [](#method-c-module_refenreces)
## module_refenreces_dot(klass ) [](#method-c-module_refenreces_dot)
## module_refenreces_image(klass , file ) [](#method-c-module_refenreces_image)
## object_id_of(obj ) [](#method-c-object_id_of)
## reachable_objects_from(obj ) [](#method-c-reachable_objects_from)
MRI specific feature
:   Return all reachable objects from `obj'.


This method returns all reachable objects from `obj'.

If `obj' has two or more references to the same object `x', then returned
array only includes one `x' object.

If `obj' is a non-markable (non-heap management) object such as true, false,
nil, symbols and Fixnums (and Flonum) then it simply returns nil.

If `obj' has references to an internal object, then it returns instances of
ObjectSpace::InternalObjectWrapper class. This object contains a reference to
an internal object and you can check the type of internal object with `type'
method.

If `obj' is instance of ObjectSpace::InternalObjectWrapper class, then this
method returns all reachable object from an internal object, which is pointed
by `obj'.

With this method, you can find memory leaks.

This method is only expected to work with C Ruby.

Example:
    ObjectSpace.reachable_objects_from(['a', 'b', 'c'])
    #=> [Array, 'a', 'b', 'c']

    ObjectSpace.reachable_objects_from(['a', 'a', 'a'])
    #=> [Array, 'a', 'a', 'a'] # all 'a' strings have different object id

    ObjectSpace.reachable_objects_from([v = 'a', v, v])
    #=> [Array, 'a']

    ObjectSpace.reachable_objects_from(1)
    #=> nil # 1 is not markable (heap managed) object
**@overload** [] 

## reachable_objects_from_root() [](#method-c-reachable_objects_from_root)
MRI specific feature
:   Return all reachable objects from root.

**@overload** [] 

## trace_object_allocations() [](#method-c-trace_object_allocations)
Starts tracing object allocations from the ObjectSpace extension module.

For example:

require 'objspace'

class C
    include ObjectSpace

    def foo
      trace_object_allocations do
        obj = Object.new
        p "#{allocation_sourcefile(obj)}:#{allocation_sourceline(obj)}"
      end
    end

end

C.new.foo #=> "objtrace.rb:8"

This example has included the ObjectSpace module to make it easier to read,
but you can also use the ::trace_object_allocations notation (recommended).

Note that this feature introduces a huge performance decrease and huge memory
consumption.
**@overload** [] 

## trace_object_allocations_clear() [](#method-c-trace_object_allocations_clear)
Clear recorded tracing information.
**@overload** [] 

## trace_object_allocations_debug_start() [](#method-c-trace_object_allocations_debug_start)
## trace_object_allocations_start() [](#method-c-trace_object_allocations_start)
Starts tracing object allocations.
**@overload** [] 

## trace_object_allocations_stop() [](#method-c-trace_object_allocations_stop)
Stop tracing object allocations.

Note that if ::trace_object_allocations_start is called n-times, then tracing
will stop after calling ::trace_object_allocations_stop n-times.
**@overload** [] 

## undefine_finalizer(obj ) [](#method-c-undefine_finalizer)
Removes all finalizers for *obj*.
**@overload** [] 


