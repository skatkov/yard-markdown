# Class: Module
**Inherits:** Object
    
**Includes:** MSpecMatchers, SingletonMethodsSpecs::Prepended
  

Expectations are sometimes used in a module body


# Class Methods
## constants(*args ) [](#method-c-constants)
In the first form, returns an array of the names of all constants accessible
from the point of call. This list includes the names of all modules and
classes defined in the global scope.

    Module.constants.first(4)
       # => [:ARGF, :ARGV, :ArgumentError, :Array]

    Module.constants.include?(:SEEK_SET)   # => false

    class IO
      Module.constants.include?(:SEEK_SET) # => true
    end

The second form calls the instance method `constants`.
**@overload** [] 

**@overload** [] 

## nesting() [](#method-c-nesting)
Returns the list of `Modules` nested at the point of call.

    module M1
      module M2
        $a = Module.nesting
      end
    end
    $a           #=> [M1::M2, M1]
    $a[0].name   #=> "M1::M2"
**@overload** [] 

## used_modules() [](#method-c-used_modules)
Returns an array of all modules used in the current scope. The ordering of
modules in the resulting array is not defined.

    module A
      refine Object do
      end
    end

    module B
      refine Object do
      end
    end

    using A
    using B
    p Module.used_modules

*produces:*

    [B, A]
**@overload** [] 

## used_refinements() [](#method-c-used_refinements)
Returns an array of all modules used in the current scope. The ordering of
modules in the resulting array is not defined.

    module A
      refine Object do
      end
    end

    module B
      refine Object do
      end
    end

    using A
    using B
    p Module.used_refinements

*produces:*

    [#<refinement:Object@B>, #<refinement:Object@A>]
**@overload** [] 


#Instance Methods
## <(arg) [](#method-i-<)
Returns true if *mod* is a subclass of *other*. Returns `false` if *mod* is
the same as *other* or *mod* is an ancestor of *other*. Returns `nil` if
there's no relationship between the two. (Think of the relationship in terms
of the class definition: "class A < B" implies "A < B".)

**@overload** [] 

## <=(arg) [](#method-i-<=)
Returns true if *mod* is a subclass of *other* or is the same as *other*.
Returns `nil` if there's no relationship between the two. (Think of the
relationship in terms of the class definition: "class A < B" implies "A < B".)

**@overload** [] 

## <=>(arg) [](#method-i-<=>)
Comparison---Returns -1, 0, +1 or nil depending on whether `module` includes
`other_module`, they are the same, or if `module` is included by
`other_module`.

Returns `nil` if `module` has no relationship with `other_module`, if
`other_module` is not a module, or if the two values are incomparable.

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

## ===(arg) [](#method-i-===)
Case Equality---Returns `true` if *obj* is an instance of *mod* or an instance
of one of *mod*'s descendants. Of limited use for modules, but can be used in
`case` statements to classify objects by class.

**@overload** [] 

## >(arg) [](#method-i->)
Returns true if *mod* is an ancestor of *other*. Returns `false` if *mod* is
the same as *other* or *mod* is a descendant of *other*. Returns `nil` if
there's no relationship between the two. (Think of the relationship in terms
of the class definition: "class A < B" implies "B > A".)

**@overload** [] 

## >=(arg) [](#method-i->=)
Returns true if *mod* is an ancestor of *other*, or the two modules are the
same. Returns `nil` if there's no relationship between the two. (Think of the
relationship in terms of the class definition: "class A < B" implies "B > A".)

**@overload** [] 

## alias_method(newname, oldname) [](#method-i-alias_method)
Makes *new_name* a new copy of the method *old_name*. This can be used to
retain access to methods that are overridden.

    module Mod
      alias_method :orig_exit, :exit #=> :orig_exit
      def exit(code=0)
        puts "Exiting with code #{code}"
        orig_exit(code)
      end
    end
    include Mod
    exit(99)

*produces:*

    Exiting with code 99

**@overload** [] 

## ancestors() [](#method-i-ancestors)
Returns a list of modules included/prepended in *mod* (including *mod*
itself).

    module Mod
      include Math
      include Comparable
      prepend Enumerable
    end

    Mod.ancestors        #=> [Enumerable, Mod, Comparable, Math]
    Math.ancestors       #=> [Math]
    Enumerable.ancestors #=> [Enumerable]

**@overload** [] 

## attr(*args) [](#method-i-attr)
The first form is equivalent to #attr_reader. The second form is equivalent to
`attr_accessor(name)` but deprecated. The last form is equivalent to
`attr_reader(name)` but deprecated. Returns an array of defined method names
as symbols.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## attr_accessor(*args) [](#method-i-attr_accessor)
Defines a named attribute for this module, where the name is
*symbol.*`id2name`, creating an instance variable (`@name`) and a
corresponding access method to read it. Also creates a method called `name=`
to set the attribute. String arguments are converted to symbols. Returns an
array of defined method names as symbols.

    module Mod
      attr_accessor(:one, :two) #=> [:one, :one=, :two, :two=]
    end
    Mod.instance_methods.sort   #=> [:one, :one=, :two, :two=]

**@overload** [] 

**@overload** [] 

## attr_reader(*args) [](#method-i-attr_reader)
Creates instance variables and corresponding methods that return the value of
each instance variable. Equivalent to calling ```attr`*:name*'' on each name
in turn. String arguments are converted to symbols. Returns an array of
defined method names as symbols.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## attr_writer(*args) [](#method-i-attr_writer)
Creates an accessor method to allow assignment to the attribute
*symbol*`.id2name`. String arguments are converted to symbols. Returns an
array of defined method names as symbols.

**@overload** [] 

**@overload** [] 

## autoload(sym, file) [](#method-i-autoload)
Registers *filename* to be loaded (using Kernel::require) the first time that
*const* (which may be a String or a symbol) is accessed in the namespace of
*mod*.

    module A
    end
    A.autoload(:B, "b")
    A::B.doit            # autoloads "b"

If *const* in *mod* is defined as autoload, the file name to be loaded is
replaced with *filename*.  If *const* is defined but not as autoload, does
nothing.

**@overload** [] 

## autoload?(*args) [](#method-i-autoload?)
Returns *filename* to be loaded if *name* is registered as `autoload` in the
namespace of *mod* or one of its ancestors.

    module A
    end
    A.autoload(:B, "b")
    A.autoload?(:B)            #=> "b"

If `inherit` is false, the lookup only checks the autoloads in the receiver:

    class A
      autoload :CONST, "const.rb"
    end

    class B < A
    end

    B.autoload?(:CONST)          #=> "const.rb", found in A (ancestor)
    B.autoload?(:CONST, false)   #=> nil, not found in B itself

**@overload** [] 

## class_eval(*args) [](#method-i-class_eval)
Evaluates the string or block in the context of *mod*, except that when a
block is given, constant/class variable lookup is not affected. This can be
used to add methods to a class. `module_eval` returns the result of evaluating
its argument. The optional *filename* and *lineno* parameters set the text for
error messages.

    class Thing
    end
    a = %q{def hello() "Hello there!" end}
    Thing.module_eval(a)
    puts Thing.new.hello()
    Thing.module_eval("invalid code", "dummy", 123)

*produces:*

    Hello there!
    dummy:123:in `module_eval': undefined local variable
        or method `code' for Thing:Class

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## class_exec(*args) [](#method-i-class_exec)
Evaluates the given block in the context of the class/module. The method
defined in the block will belong to the receiver. Any arguments passed to the
method will be passed to the block. This can be used if the block needs to
access instance variables.

    class Thing
    end
    Thing.class_exec{
      def hello() "Hello there!" end
    }
    puts Thing.new.hello()

*produces:*

    Hello there!

**@overload** [] 

**@overload** [] 

## class_variable_defined?(iv) [](#method-i-class_variable_defined?)
Returns `true` if the given class variable is defined in *obj*. String
arguments are converted to symbols.

    class Fred
      @@foo = 99
    end
    Fred.class_variable_defined?(:@@foo)    #=> true
    Fred.class_variable_defined?(:@@bar)    #=> false

**@overload** [] 

**@overload** [] 

## class_variable_get(iv) [](#method-i-class_variable_get)
Returns the value of the given class variable (or throws a NameError
exception). The `@@` part of the variable name should be included for regular
class variables. String arguments are converted to symbols.

    class Fred
      @@foo = 99
    end
    Fred.class_variable_get(:@@foo)     #=> 99

**@overload** [] 

**@overload** [] 

## class_variable_set(iv, val) [](#method-i-class_variable_set)
Sets the class variable named by *symbol* to the given object. If the class
variable name is passed as a string, that string is converted to a symbol.

    class Fred
      @@foo = 99
      def foo
        @@foo
      end
    end
    Fred.class_variable_set(:@@foo, 101)     #=> 101
    Fred.new.foo                             #=> 101

**@overload** [] 

**@overload** [] 

## class_variables() [](#method-i-class_variables)

## const_defined?(*args) [](#method-i-const_defined?)
Says whether *mod* or its ancestors have a constant with the given name:

    Float.const_defined?(:EPSILON)      #=> true, found in Float itself
    Float.const_defined?("String")      #=> true, found in Object (ancestor)
    BasicObject.const_defined?(:Hash)   #=> false

If *mod* is a `Module`, additionally `Object` and its ancestors are checked:

    Math.const_defined?(:String)   #=> true, found in Object

In each of the checked classes or modules, if the constant is not present but
there is an autoload for it, `true` is returned directly without autoloading:

    module Admin
      autoload :User, 'admin/user'
    end
    Admin.const_defined?(:User)   #=> true

If the constant is not found the callback `const_missing` is **not** called
and the method returns `false`.

If `inherit` is false, the lookup only checks the constants in the receiver:

    IO.const_defined?(:SYNC)          #=> true, found in File::Constants (ancestor)
    IO.const_defined?(:SYNC, false)   #=> false, not found in IO itself

In this case, the same logic for autoloading applies.

If the argument is not a valid constant name a `NameError` is raised with the
message "wrong constant name *name*":

    Hash.const_defined? 'foobar'   #=> NameError: wrong constant name foobar

**@overload** [] 

**@overload** [] 

## const_get(*args) [](#method-i-const_get)
Checks for a constant with the given name in *mod*. If `inherit` is set, the
lookup will also search the ancestors (and `Object` if *mod* is a `Module`).

The value of the constant is returned if a definition is found, otherwise a
`NameError` is raised.

    Math.const_get(:PI)   #=> 3.14159265358979

This method will recursively look up constant names if a namespaced class name
is provided.  For example:

    module Foo; class Bar; end end
    Object.const_get 'Foo::Bar'

The `inherit` flag is respected on each lookup.  For example:

    module Foo
      class Bar
        VAL = 10
      end

      class Baz < Bar; end
    end

    Object.const_get 'Foo::Baz::VAL'         # => 10
    Object.const_get 'Foo::Baz::VAL', false  # => NameError

If the argument is not a valid constant name a `NameError` will be raised with
a warning "wrong constant name".

Object.const_get 'foobar' #=> NameError: wrong constant name foobar

**@overload** [] 

**@overload** [] 

## const_missing() [](#method-i-const_missing)

## const_set(name, value) [](#method-i-const_set)
Sets the named constant to the given object, returning that object. Creates a
new constant if no constant with the given name previously existed.

    Math.const_set("HIGH_SCHOOL_PI", 22.0/7.0)   #=> 3.14285714285714
    Math::HIGH_SCHOOL_PI - Math::PI              #=> 0.00126448926734968

If `sym` or `str` is not a valid constant name a `NameError` will be raised
with a warning "wrong constant name".

Object.const_set('foobar', 42) #=> NameError: wrong constant name foobar

**@overload** [] 

**@overload** [] 

## const_source_location(*args) [](#method-i-const_source_location)
Returns the Ruby source filename and line number containing the definition of
the constant specified. If the named constant is not found, `nil` is returned.
If the constant is found, but its source location can not be extracted
(constant is defined in C code), empty array is returned.

*inherit* specifies whether to lookup in `mod.ancestors` (`true` by default).

    # test.rb:
    class A         # line 1
      C1 = 1
      C2 = 2
    end

    module M        # line 6
      C3 = 3
    end

    class B < A     # line 10
      include M
      C4 = 4
    end

    class A # continuation of A definition
      C2 = 8 # constant redefinition; warned yet allowed
    end

    p B.const_source_location('C4')           # => ["test.rb", 12]
    p B.const_source_location('C3')           # => ["test.rb", 7]
    p B.const_source_location('C1')           # => ["test.rb", 2]

    p B.const_source_location('C3', false)    # => nil  -- don't lookup in ancestors

    p A.const_source_location('C2')           # => ["test.rb", 16] -- actual (last) definition place

    p Object.const_source_location('B')       # => ["test.rb", 10] -- top-level constant could be looked through Object
    p Object.const_source_location('A')       # => ["test.rb", 1] -- class reopening is NOT considered new definition

    p B.const_source_location('A')            # => ["test.rb", 1]  -- because Object is in ancestors
    p M.const_source_location('A')            # => ["test.rb", 1]  -- Object is not ancestor, but additionally checked for modules

    p Object.const_source_location('A::C1')   # => ["test.rb", 2]  -- nesting is supported
    p Object.const_source_location('String')  # => []  -- constant is defined in C code

**@overload** [] 

**@overload** [] 

## constants() [](#method-i-constants)

## define_method(*args) [](#method-i-define_method)
Defines an instance method in the receiver. The *method* parameter can be a
`Proc`, a `Method` or an `UnboundMethod` object. If a block is specified, it
is used as the method body. If a block or the *method* parameter has
parameters, they're used as method parameters. This block is evaluated using
#instance_eval.

    class A
      def fred
        puts "In Fred"
      end
      def create_method(name, &block)
        self.class.define_method(name, &block)
      end
      define_method(:wilma) { puts "Charge it!" }
      define_method(:flint) {|name| puts "I'm #{name}!"}
    end
    class B < A
      define_method(:barney, instance_method(:fred))
    end
    a = B.new
    a.barney
    a.wilma
    a.flint('Dino')
    a.create_method(:betty) { p self }
    a.betty

*produces:*

    In Fred
    Charge it!
    I'm Dino!
    #<B:0x401b39e8>

**@overload** [] 

**@overload** [] 

## deprecate_constant() [](#method-i-deprecate_constant)

## freeze() [](#method-i-freeze)
Prevents further modifications to *mod*.

This method returns self.

**@overload** [] 

## include(*args) [](#method-i-include)
Invokes Module.append_features on each parameter in reverse order.

**@overload** [] 

## include?(mod2) [](#method-i-include?)
Returns `true` if *module* is included or prepended in *mod* or one of *mod*'s
ancestors.

    module A
    end
    class B
      include A
    end
    class C < B
    end
    B.include?(A)   #=> true
    C.include?(A)   #=> true
    A.include?(A)   #=> false

**@overload** [] 

## included_modules() [](#method-i-included_modules)
Returns the list of modules included or prepended in *mod* or one of *mod*'s
ancestors.

    module Sub
    end

    module Mixin
      prepend Sub
    end

    module Outer
      include Mixin
    end

    Mixin.included_modules   #=> [Sub]
    Outer.included_modules   #=> [Sub, Mixin]

**@overload** [] 

## initialize() [](#method-i-initialize)
Creates a new anonymous module. If a block is given, it is passed the module
object, and the block is evaluated in the context of this module like
#module_eval.

    fred = Module.new do
      def meth1
        "hello"
      end
      def meth2
        "bye"
      end
    end
    a = "my string"
    a.extend(fred)   #=> "my string"
    a.meth1          #=> "hello"
    a.meth2          #=> "bye"

Assign the module to a constant (name starting uppercase) if you want to treat
it like a regular module.

**@overload** [] 

**@overload** [] 

## initialize_clone(*args) [](#method-i-initialize_clone)
:nodoc:

## initialize_copy(orig) [](#method-i-initialize_copy)
:nodoc:

## instance_method(vid) [](#method-i-instance_method)
Returns an `UnboundMethod` representing the given instance method in *mod*.

    class Interpreter
      def do_a() print "there, "; end
      def do_d() print "Hello ";  end
      def do_e() print "!\n";     end
      def do_v() print "Dave";    end
      Dispatcher = {
        "a" => instance_method(:do_a),
        "d" => instance_method(:do_d),
        "e" => instance_method(:do_e),
        "v" => instance_method(:do_v)
      }
      def interpret(string)
        string.each_char {|b| Dispatcher[b].bind(self).call }
      end
    end

    interpreter = Interpreter.new
    interpreter.interpret('dave')

*produces:*

    Hello there, Dave!

**@overload** [] 

## instance_methods(*args) [](#method-i-instance_methods)
Returns an array containing the names of the public and protected instance
methods in the receiver. For a module, these are the public and protected
methods; for a class, they are the instance (not singleton) methods. If the
optional parameter is `false`, the methods of any ancestors are not included.

    module A
      def method1()  end
    end
    class B
      include A
      def method2()  end
    end
    class C < B
      def method3()  end
    end

    A.instance_methods(false)                   #=> [:method1]
    B.instance_methods(false)                   #=> [:method2]
    B.instance_methods(true).include?(:method1) #=> true
    C.instance_methods(false)                   #=> [:method3]
    C.instance_methods.include?(:method2)       #=> true

Note that method visibility changes in the current class, as well as aliases,
are considered as methods of the current class by this method:

    class C < B
      alias method4 method2
      protected :method2
    end
    C.instance_methods(false).sort               #=> [:method2, :method3, :method4]

**@overload** [] 

## method_defined?(*args) [](#method-i-method_defined?)
Returns `true` if the named method is defined by *mod*.  If *inherit* is set,
the lookup will also search *mod*'s ancestors. Public and protected methods
are matched. String arguments are converted to symbols.

    module A
      def method1()  end
      def protected_method1()  end
      protected :protected_method1
    end
    class B
      def method2()  end
      def private_method2()  end
      private :private_method2
    end
    class C < B
      include A
      def method3()  end
    end

    A.method_defined? :method1              #=> true
    C.method_defined? "method1"             #=> true
    C.method_defined? "method2"             #=> true
    C.method_defined? "method2", true       #=> true
    C.method_defined? "method2", false      #=> false
    C.method_defined? "method3"             #=> true
    C.method_defined? "protected_method1"   #=> true
    C.method_defined? "method4"             #=> false
    C.method_defined? "private_method2"     #=> false

**@overload** [] 

**@overload** [] 

## module_eval(*args) [](#method-i-module_eval)
Evaluates the string or block in the context of *mod*, except that when a
block is given, constant/class variable lookup is not affected. This can be
used to add methods to a class. `module_eval` returns the result of evaluating
its argument. The optional *filename* and *lineno* parameters set the text for
error messages.

    class Thing
    end
    a = %q{def hello() "Hello there!" end}
    Thing.module_eval(a)
    puts Thing.new.hello()
    Thing.module_eval("invalid code", "dummy", 123)

*produces:*

    Hello there!
    dummy:123:in `module_eval': undefined local variable
        or method `code' for Thing:Class

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## module_exec(*args) [](#method-i-module_exec)
Evaluates the given block in the context of the class/module. The method
defined in the block will belong to the receiver. Any arguments passed to the
method will be passed to the block. This can be used if the block needs to
access instance variables.

    class Thing
    end
    Thing.class_exec{
      def hello() "Hello there!" end
    }
    puts Thing.new.hello()

*produces:*

    Hello there!

**@overload** [] 

**@overload** [] 

## mspec_test_kernel_singleton_methods() [](#method-i-mspec_test_kernel_singleton_methods)

## name() [](#method-i-name)

## prepend(*args) [](#method-i-prepend)
Invokes Module.prepend_features on each parameter in reverse order.

**@overload** [] 

## private_class_method(*args) [](#method-i-private_class_method)
Makes existing class methods private. Often used to hide the default
constructor `new`.

String arguments are converted to symbols. An Array of Symbols and/or Strings
is also accepted.

    class SimpleSingleton  # Not thread safe
      private_class_method :new
      def SimpleSingleton.create(*args, &block)
        @me = new(*args, &block) if ! @me
        @me
      end
    end

**@overload** [] 

**@overload** [] 

**@overload** [] 

## private_constant() [](#method-i-private_constant)

## private_instance_methods(*args) [](#method-i-private_instance_methods)
Returns a list of the private instance methods defined in *mod*. If the
optional parameter is `false`, the methods of any ancestors are not included.

    module Mod
      def method1()  end
      private :method1
      def method2()  end
    end
    Mod.instance_methods           #=> [:method2]
    Mod.private_instance_methods   #=> [:method1]

**@overload** [] 

## private_method_defined?(*args) [](#method-i-private_method_defined?)
Returns `true` if the named private method is defined by *mod*.  If *inherit*
is set, the lookup will also search *mod*'s ancestors. String arguments are
converted to symbols.

    module A
      def method1()  end
    end
    class B
      private
      def method2()  end
    end
    class C < B
      include A
      def method3()  end
    end

    A.method_defined? :method1                   #=> true
    C.private_method_defined? "method1"          #=> false
    C.private_method_defined? "method2"          #=> true
    C.private_method_defined? "method2", true    #=> true
    C.private_method_defined? "method2", false   #=> false
    C.method_defined? "method2"                  #=> false

**@overload** [] 

**@overload** [] 

## protected_instance_methods(*args) [](#method-i-protected_instance_methods)
Returns a list of the protected instance methods defined in *mod*. If the
optional parameter is `false`, the methods of any ancestors are not included.

**@overload** [] 

## protected_method_defined?(*args) [](#method-i-protected_method_defined?)
Returns `true` if the named protected method is defined *mod*.  If *inherit*
is set, the lookup will also search *mod*'s ancestors. String arguments are
converted to symbols.

    module A
      def method1()  end
    end
    class B
      protected
      def method2()  end
    end
    class C < B
      include A
      def method3()  end
    end

    A.method_defined? :method1                    #=> true
    C.protected_method_defined? "method1"         #=> false
    C.protected_method_defined? "method2"         #=> true
    C.protected_method_defined? "method2", true   #=> true
    C.protected_method_defined? "method2", false  #=> false
    C.method_defined? "method2"                   #=> true

**@overload** [] 

**@overload** [] 

## public_class_method(*args) [](#method-i-public_class_method)
Makes a list of existing class methods public.

String arguments are converted to symbols. An Array of Symbols and/or Strings
is also accepted.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## public_constant() [](#method-i-public_constant)

## public_instance_method(vid) [](#method-i-public_instance_method)
Similar to *instance_method*, searches public method only.

**@overload** [] 

## public_instance_methods(*args) [](#method-i-public_instance_methods)
Returns a list of the public instance methods defined in *mod*. If the
optional parameter is `false`, the methods of any ancestors are not included.

**@overload** [] 

## public_method_defined?(*args) [](#method-i-public_method_defined?)
Returns `true` if the named public method is defined by *mod*.  If *inherit*
is set, the lookup will also search *mod*'s ancestors. String arguments are
converted to symbols.

    module A
      def method1()  end
    end
    class B
      protected
      def method2()  end
    end
    class C < B
      include A
      def method3()  end
    end

    A.method_defined? :method1                 #=> true
    C.public_method_defined? "method1"         #=> true
    C.public_method_defined? "method1", true   #=> true
    C.public_method_defined? "method1", false  #=> true
    C.public_method_defined? "method2"         #=> false
    C.method_defined? "method2"                #=> true

**@overload** [] 

**@overload** [] 

## refinements() [](#method-i-refinements)
Returns an array of `Refinement` defined within the receiver.

    module A
      refine Integer do
      end

      refine String do
      end
    end

    p A.refinements

*produces:*

    [#<refinement:Integer@A>, #<refinement:String@A>]

**@overload** [] 

## remove_class_variable() [](#method-i-remove_class_variable)

## remove_method(*args) [](#method-i-remove_method)
Removes the method identified by *symbol* from the current class. For an
example, see Module#undef_method. String arguments are converted to symbols.

**@overload** [] 

**@overload** [] 

## set_temporary_name() [](#method-i-set_temporary_name)

## singleton_class?() [](#method-i-singleton_class?)
Returns `true` if *mod* is a singleton class or `false` if it is an ordinary
class or module.

    class C
    end
    C.singleton_class?                  #=> false
    C.singleton_class.singleton_class?  #=> true

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns a string representing this module or class. For basic classes and
modules, this is the name. For singletons, we show information on the thing
we're attached to as well.

**@overload** [] 

## undef_method(*args) [](#method-i-undef_method)
Prevents the current class from responding to calls to the named method.
Contrast this with `remove_method`, which deletes the method from the
particular class; Ruby will still search superclasses and mixed-in modules for
a possible receiver. String arguments are converted to symbols.

    class Parent
      def hello
        puts "In parent"
      end
    end
    class Child < Parent
      def hello
        puts "In child"
      end
    end

    c = Child.new
    c.hello

    class Child
      remove_method :hello  # remove from child, still in parent
    end
    c.hello

    class Child
      undef_method :hello   # prevent any calls to 'hello'
    end
    c.hello

*produces:*

    In child
    In parent
    prog.rb:23: undefined method 'hello' for #<Child:0x401b3bb4> (NoMethodError)

**@overload** [] 

**@overload** [] 

## undefined_instance_methods() [](#method-i-undefined_instance_methods)
Returns a list of the undefined instance methods defined in *mod*. The
undefined methods of any ancestors are not included.

**@overload** [] 

