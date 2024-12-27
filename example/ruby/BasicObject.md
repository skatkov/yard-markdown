# Class: BasicObject
**Inherits:** Qnil
    

`BasicObject` is the parent class of all classes in Ruby. In particular,
`BasicObject` is the parent class of class Object, which is itself the default
parent class of every Ruby class:

    class Foo; end
    Foo.superclass    # => Object
    Object.superclass # => BasicObject

`BasicObject` is the only class that has no parent:

    BasicObject.superclass # => nil

Class `BasicObject` can be used to create an object hierarchy (e.g., class
Delegator) that is independent of Ruby's object hierarchy. Such objects:

*   Do not have namespace "pollution" from the many methods provided in class
    Object and its included module Kernel.
*   Do not have definitions of common classes, and so references to such
    common classes must be fully qualified (`::String`, not `String`).

A variety of strategies can be used to provide useful portions of the Standard
Library in subclasses of `BasicObject`:

*   The immediate subclass could `include Kernel`, which would define methods
    such as `puts`, `exit`, etc.
*   A custom Kernel-like module could be created and included.
*   Delegation can be used via #method_missing:

        class MyObjectSystem < BasicObject
          DELEGATE = [:puts, :p]

          def method_missing(name, *args, &block)
            return super unless DELEGATE.include? name
            ::Kernel.send(name, *args, &block)
          end

          def respond_to_missing?(name, include_private = false)
            DELEGATE.include?(name)
          end
        end

### What's Here

These are the methods defined for BasicObject:

*   ::new: Returns a new BasicObject instance.
*   #!: Returns the boolean negation of `self`: `true` or `false`.
*   #!=: Returns whether `self` and the given object are *not* equal.
*   #==: Returns whether `self` and the given object are equivalent.
*   #__id__: Returns the integer object identifier for `self`.
*   #__send__: Calls the method identified by the given symbol.
*   #equal?: Returns whether `self` and the given object are the same object.
*   #instance_eval: Evaluates the given string or block in the context of
    `self`.
*   #instance_exec: Executes the given block in the context of `self`, passing
    the given arguments.
*   #method_missing: Called when `self` is called with a method it does not
    define.
*   #singleton_method_added: Called when a singleton method is added to
    `self`.
*   #singleton_method_removed: Called when a singleton method is removed from
    `self`.
*   #singleton_method_undefined: Called when a singleton method is undefined
    in `self`.



#Instance Methods
## !() [](#method-i-!)
Boolean negate.

**@overload** [] 

## !=(obj2) [](#method-i-!=)
Returns true if two objects are not-equal, otherwise false.

**@overload** [] 

## ==(obj2) [](#method-i-==)
Equality --- At the Object level, #== returns `true` only if `obj` and `other`
are the same object.  Typically, this method is overridden in descendant
classes to provide class-specific meaning.

Unlike #==, the #equal? method should never be overridden by subclasses as it
is used to determine object identity (that is, `a.equal?(b)` if and only if
`a` is the same object as `b`):

    obj = "a"
    other = obj.dup

    obj == other      #=> true
    obj.equal? other  #=> false
    obj.equal? obj    #=> true

The #eql? method returns `true` if `obj` and `other` refer to the same hash
key.  This is used by Hash to test members for equality.  For any pair of
objects where #eql? returns `true`, the #hash value of both objects must be
equal. So any subclass that overrides #eql? should also override #hash
appropriately.

For objects of class Object, #eql?  is synonymous with #==.  Subclasses
normally continue this tradition by aliasing #eql? to their overridden #==
method, but there are exceptions. Numeric types, for example, perform type
conversion across #==, but not across #eql?, so:

    1 == 1.0     #=> true
    1.eql? 1.0   #=> false

**@overload** [] 

**@overload** [] 

**@overload** [] 

## __id__() [](#method-i-__id__)
call-seq:
    obj.__id__       -> integer
    obj.object_id    -> integer

Returns an integer identifier for `obj`.

The same number will be returned on all calls to `object_id` for a given
object, and no two active objects will share an id.

Note: that some objects of builtin classes are reused for optimization. This
is the case for immediate values and frozen string literals.

BasicObject implements `__id__`, Kernel implements `object_id`.

Immediate values are not passed by reference but are passed by value: `nil`,
`true`, `false`, Fixnums, Symbols, and some Floats.

    Object.new.object_id  == Object.new.object_id  # => false
    (21 * 2).object_id    == (21 * 2).object_id    # => true
    "hello".object_id     == "hello".object_id     # => false
    "hi".freeze.object_id == "hi".freeze.object_id # => true

## __send__(*args) [](#method-i-__send__)
Invokes the method identified by *symbol*, passing it any
    arguments specified.
    When the method is identified by a string, the string is converted
    to a symbol.

    BasicObject implements +__send__+, Kernel implements +send+.
    <code>__send__</code> is safer than +send+
    when _obj_ has the same method name like <code>Socket</code>.
    See also <code>public_send</code>.

       class Klass
         def hello(*args)
           "Hello " + args.join(' ')
         end
       end
       k = Klass.new
       k.send :hello, "gentle", "readers"   #=> "Hello gentle readers"

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## equal?(obj2) [](#method-i-equal?)
Equality --- At the Object level, #== returns `true` only if `obj` and `other`
are the same object.  Typically, this method is overridden in descendant
classes to provide class-specific meaning.

Unlike #==, the #equal? method should never be overridden by subclasses as it
is used to determine object identity (that is, `a.equal?(b)` if and only if
`a` is the same object as `b`):

    obj = "a"
    other = obj.dup

    obj == other      #=> true
    obj.equal? other  #=> false
    obj.equal? obj    #=> true

The #eql? method returns `true` if `obj` and `other` refer to the same hash
key.  This is used by Hash to test members for equality.  For any pair of
objects where #eql? returns `true`, the #hash value of both objects must be
equal. So any subclass that overrides #eql? should also override #hash
appropriately.

For objects of class Object, #eql?  is synonymous with #==.  Subclasses
normally continue this tradition by aliasing #eql? to their overridden #==
method, but there are exceptions. Numeric types, for example, perform type
conversion across #==, but not across #eql?, so:

    1 == 1.0     #=> true
    1.eql? 1.0   #=> false

**@overload** [] 

**@overload** [] 

**@overload** [] 

## instance_eval(*args) [](#method-i-instance_eval)
Evaluates a string containing Ruby source code, or the given block, within the
context of the receiver (*obj*). In order to set the context, the variable
`self` is set to *obj* while the code is executing, giving the code access to
*obj*'s instance variables and private methods.

When `instance_eval` is given a block, *obj* is also passed in as the block's
only argument.

When `instance_eval` is given a `String`, the optional second and third
parameters supply a filename and starting line number that are used when
reporting compilation errors.

    class KlassWithSecret
      def initialize
        @secret = 99
      end
      private
      def the_secret
        "Ssssh! The secret is #{@secret}."
      end
    end
    k = KlassWithSecret.new
    k.instance_eval { @secret }          #=> 99
    k.instance_eval { the_secret }       #=> "Ssssh! The secret is 99."
    k.instance_eval {|obj| obj == self } #=> true

**@overload** [] 

**@overload** [] 

## instance_exec(*args) [](#method-i-instance_exec)
Executes the given block within the context of the receiver (*obj*). In order
to set the context, the variable `self` is set to *obj* while the code is
executing, giving the code access to *obj*'s instance variables.  Arguments
are passed as block parameters.

    class KlassWithSecret
      def initialize
        @secret = 99
      end
    end
    k = KlassWithSecret.new
    k.instance_exec(5) {|x| @secret+x }   #=> 104

**@overload** [] 

