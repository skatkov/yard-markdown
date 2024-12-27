# Class: Class
**Inherits:** Module
    

Extends any Class to include *json_creatable?* method.


# Class Methods
## example_class_method_of_class() [](#method-c-example_class_method_of_class)
## example_class_method_of_singleton_class() [](#method-c-example_class_method_of_singleton_class)
## example_instance_method_of_singleton_class() [](#method-c-example_instance_method_of_singleton_class)

#Instance Methods
## allocate() [](#method-i-allocate)
Allocates space for a new object of *class*'s class and does not call
initialize on the new instance. The returned object must be an instance of
*class*.

    klass = Class.new do
      def initialize(*args)
        @initialized = true
      end

      def initialized?
        @initialized || false
      end
    end

    klass.allocate.initialized? #=> false

**@overload** [] 

## attached_object() [](#method-i-attached_object)
Returns the object for which the receiver is the singleton class.

Raises an TypeError if the class is not a singleton class.

    class Foo; end

    Foo.singleton_class.attached_object        #=> Foo
    Foo.attached_object                        #=> TypeError: `Foo' is not a singleton class
    Foo.new.singleton_class.attached_object    #=> #<Foo:0x000000010491a370>
    TrueClass.attached_object                  #=> TypeError: `TrueClass' is not a singleton class
    NilClass.attached_object                   #=> TypeError: `NilClass' is not a singleton class

**@overload** [] 

## example_instance_method_of_class() [](#method-i-example_instance_method_of_class)

## initialize(*args) [](#method-i-initialize)
Creates a new anonymous (unnamed) class with the given superclass (or Object
if no parameter is given). You can give a class a name by assigning the class
object to a constant.

If a block is given, it is passed the class object, and the block is evaluated
in the context of this class like #class_eval.

    fred = Class.new do
      def meth1
        "hello"
      end
      def meth2
        "bye"
      end
    end

    a = fred.new     #=> #<#<Class:0x100381890>:0x100376b98>
    a.meth1          #=> "hello"
    a.meth2          #=> "bye"

Assign the class to a constant (name starting uppercase) if you want to treat
it like a regular class.

**@overload** [] 

**@overload** [] 

## json_creatable?() [](#method-i-json_creatable?)
Returns true if this class can be used to create an instance from a serialised
JSON string. The class has to implement a class method *json_create* that
expects a hash as first parameter. The hash should include the required data.

**@return** [Boolean] 

## new(*args) [](#method-i-new)
Calls #allocate to create a new object of *class*'s class, then invokes that
object's #initialize method, passing it *args*.  This is the method that ends
up getting called whenever an object is constructed using `.new`.

**@overload** [] 

## subclasses() [](#method-i-subclasses)
Returns an array of classes where the receiver is the direct superclass of the
class, excluding singleton classes. The order of the returned array is not
defined.

    class A; end
    class B < A; end
    class C < B; end
    class D < A; end

    A.subclasses        #=> [D, B]
    B.subclasses        #=> [C]
    C.subclasses        #=> []

Anonymous subclasses (not associated with a constant) are returned, too:

    c = Class.new(A)
    A.subclasses        # => [#<Class:0x00007f003c77bd78>, D, B]

Note that the parent does not hold references to subclasses and doesn't
prevent them from being garbage collected. This means that the subclass might
disappear when all references to it are dropped:

    # drop the reference to subclass, it can be garbage-collected now
    c = nil

    A.subclasses
    # It can be
    #  => [#<Class:0x00007f003c77bd78>, D, B]
    # ...or just
    #  => [D, B]
    # ...depending on whether garbage collector was run

**@overload** [] 

## superclass() [](#method-i-superclass)
Returns the superclass of *class*, or `nil`.

    File.superclass          #=> IO
    IO.superclass            #=> Object
    Object.superclass        #=> BasicObject
    class Foo; end
    class Bar < Foo; end
    Bar.superclass           #=> Foo

Returns nil when the given class does not have a parent class:

    BasicObject.superclass   #=> nil

**@overload** [] 

