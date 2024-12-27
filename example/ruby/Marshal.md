# Module: Marshal
    



# Class Methods
## dump(*args ) [](#method-c-dump)
Serializes obj and all descendant objects. If anIO is specified, the
serialized data will be written to it, otherwise the data will be returned as
a String. If limit is specified, the traversal of subobjects will be limited
to that depth. If limit is negative, no checking of depth will be performed.

    class Klass
      def initialize(str)
        @str = str
      end
      def say_hello
        @str
      end
    end

(produces no output)

    o = Klass.new("hello\n")
    data = Marshal.dump(o)
    obj = Marshal.load(data)
    obj.say_hello  #=> "hello\n"

Marshal can't dump following objects:
*   anonymous Class/Module.
*   objects which are related to system (ex: Dir, File::Stat, IO, File, Socket
    and so on)
*   an instance of MatchData, Data, Method, UnboundMethod, Proc, Thread,
    ThreadGroup, Continuation
*   objects which define singleton methods
**@overload** [] 

## load(source , proc nil, freeze: false) [](#method-c-load)
call-seq:
    load(source, proc = nil, freeze: false) -> obj
    restore(source, proc = nil, freeze: false) -> obj

Returns the result of converting the serialized data in source into a Ruby
object (possibly with associated subordinate objects). source may be either an
instance of IO or an object that responds to to_str. If proc is specified,
each object will be passed to the proc, as the object is being deserialized.

Never pass untrusted data (including user supplied input) to this method.
Please see the overview for further details.

If the `freeze: true` argument is passed, deserialized object would be deeply
frozen. Note that it may lead to more efficient memory usage due to frozen
strings deduplication:

    serialized = Marshal.dump(['value1', 'value2', 'value1', 'value2'])

    deserialized = Marshal.load(serialized)
    deserialized.map(&:frozen?)
    # => [false, false, false, false]
    deserialized.map(&:object_id)
    # => [1023900, 1023920, 1023940, 1023960] -- 4 different objects

    deserialized = Marshal.load(serialized, freeze: true)
    deserialized.map(&:frozen?)
    # => [true, true, true, true]
    deserialized.map(&:object_id)
    # => [1039360, 1039380, 1039360, 1039380] -- only 2 different objects, object_ids repeating

