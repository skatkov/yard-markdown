# Class: Method
**Inherits:** Object
    

********************************************************************

    Method objects are created by Object#method, and are associated
    with a particular object (not just with a class).  They may be
    used to invoke the method within the object, and as a block
    associated with an iterator.  They may also be unbound from one
    object (creating an UnboundMethod) and bound to another.

       class Thing
         def square(n)
           n*n
         end
       end
       thing = Thing.new
       meth  = thing.method(:square)

       meth.call(9)                 #=> 81
       [ 1, 2, 3 ].collect(&meth)   #=> [1, 4, 9]

       [ 1, 2, 3 ].each(&method(:puts)) #=> prints 1, 2, 3

       require 'date'
       %w[2017-03-01 2017-03-02].collect(&Date.method(:parse))
       #=> [#<Date: 2017-03-01 ((2457814j,0s,0n),+0s,2299161j)>, #<Date: 2017-03-02 ((2457815j,0s,0n),+0s,2299161j)>]



#Instance Methods
## <<(g) [](#method-i-<<)
Returns a proc that is the composition of this method and the given *g*. The
returned proc takes a variable number of arguments, calls *g* with them then
calls this method with the result.

    def f(x)
      x * x
    end

    f = self.method(:f)
    g = proc {|x| x + x }
    p (f << g).call(2) #=> 16

**@overload** [] 

## ==(other) [](#method-i-==)
Two method objects are equal if they are bound to the same object and refer to
the same method definition and the classes defining the methods are the same
class or module.

**@overload** [] 

**@overload** [] 

## ===(*args) [](#method-i-===)
Invokes the *meth* with the specified arguments, returning the method's return
value.

    m = 12.method("+")
    m.call(3)    #=> 15
    m.call(20)   #=> 32

**@overload** [] 

## >>(g) [](#method-i->>)
Returns a proc that is the composition of this method and the given *g*. The
returned proc takes a variable number of arguments, calls this method with
them then calls *g* with the result.

    def f(x)
      x * x
    end

    f = self.method(:f)
    g = proc {|x| x + x }
    p (f >> g).call(2) #=> 8

**@overload** [] 

## [](*args) [](#method-i-[])
Invokes the *meth* with the specified arguments, returning the method's return
value.

    m = 12.method("+")
    m.call(3)    #=> 15
    m.call(20)   #=> 32

**@overload** [] 

## arity() [](#method-i-arity)
Returns an indication of the number of arguments accepted by a method. Returns
a nonnegative integer for methods that take a fixed number of arguments. For
Ruby methods that take a variable number of arguments, returns -n-1, where n
is the number of required arguments. Keyword arguments will be considered as a
single additional argument, that argument being mandatory if any keyword
argument is mandatory. For methods written in C, returns -1 if the call takes
a variable number of arguments.

    class C
      def one;    end
      def two(a); end
      def three(*a);  end
      def four(a, b); end
      def five(a, b, *c);    end
      def six(a, b, *c, &d); end
      def seven(a, b, x:0); end
      def eight(x:, y:); end
      def nine(x:, y:, **z); end
      def ten(*a, x:, y:); end
    end
    c = C.new
    c.method(:one).arity     #=> 0
    c.method(:two).arity     #=> 1
    c.method(:three).arity   #=> -1
    c.method(:four).arity    #=> 2
    c.method(:five).arity    #=> -3
    c.method(:six).arity     #=> -3
    c.method(:seven).arity   #=> -3
    c.method(:eight).arity   #=> 1
    c.method(:nine).arity    #=> 1
    c.method(:ten).arity     #=> -2

    "cat".method(:size).arity      #=> 0
    "cat".method(:replace).arity   #=> 1
    "cat".method(:squeeze).arity   #=> -1
    "cat".method(:count).arity     #=> -1

**@overload** [] 

## call(*args) [](#method-i-call)
Invokes the *meth* with the specified arguments, returning the method's return
value.

    m = 12.method("+")
    m.call(3)    #=> 15
    m.call(20)   #=> 32

**@overload** [] 

## clone() [](#method-i-clone)
Returns a clone of this method.

    class A
      def foo
        return "bar"
      end
    end

    m = A.new.method(:foo)
    m.call # => "bar"
    n = m.clone.call # => "bar"

**@overload** [] 

## curry(*args) [](#method-i-curry)
Returns a curried proc based on the method. When the proc is called with a
number of arguments that is lower than the method's arity, then another
curried proc is returned. Only when enough arguments have been supplied to
satisfy the method signature, will the method actually be called.

The optional *arity* argument should be supplied when currying methods with
variable arguments to determine how many arguments are needed before the
method is called.

    def foo(a,b,c)
      [a, b, c]
    end

    proc  = self.method(:foo).curry
    proc2 = proc.call(1, 2)          #=> #<Proc>
    proc2.call(3)                    #=> [1,2,3]

    def vararg(*args)
      args
    end

    proc = self.method(:vararg).curry(4)
    proc2 = proc.call(:x)      #=> #<Proc>
    proc3 = proc2.call(:y, :z) #=> #<Proc>
    proc3.call(:a)             #=> [:x, :y, :z, :a]

**@overload** [] 

**@overload** [] 

## dup() [](#method-i-dup)
:nodoc:

## eql?(other) [](#method-i-eql?)
Two method objects are equal if they are bound to the same object and refer to
the same method definition and the classes defining the methods are the same
class or module.

**@overload** [] 

**@overload** [] 

## hash() [](#method-i-hash)
Returns a hash value corresponding to the method object.

See also Object#hash.

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a human-readable description of the underlying method.

    "cat".method(:count).inspect   #=> "#<Method: String#count(*)>"
    (1..3).method(:map).inspect    #=> "#<Method: Range(Enumerable)#map()>"

In the latter case, the method description includes the "owner" of the
original method (`Enumerable` module, which is included into `Range`).

`inspect` also provides, when possible, method argument names (call sequence)
and source location.

    require 'net/http'
    Net::HTTP.method(:get).inspect
    #=> "#<Method: Net::HTTP.get(uri_or_host, path=..., port=...) <skip>/lib/ruby/2.7.0/net/http.rb:457>"

`...` in argument definition means argument is optional (has some default
value).

For methods defined in C (language core and extensions), location and argument
names can't be extracted, and only generic information is provided in form of
`*` (any number of arguments) or `_` (some positional argument).

    "cat".method(:count).inspect   #=> "#<Method: String#count(*)>"
    "cat".method(:+).inspect       #=> "#<Method: String#+(_)>""

**@overload** [] 

**@overload** [] 

## name() [](#method-i-name)
Returns the name of the method.

**@overload** [] 

## original_name() [](#method-i-original_name)
Returns the original name of the method.

    class C
      def foo; end
      alias bar foo
    end
    C.instance_method(:bar).original_name # => :foo

**@overload** [] 

## owner() [](#method-i-owner)
Returns the class or module on which this method is defined. In other words,

    meth.owner.instance_methods(false).include?(meth.name) # => true

holds as long as the method is not removed/undefined/replaced, (with
private_instance_methods instead of instance_methods if the method is
private).

See also Method#receiver.

    (1..3).method(:map).owner #=> Enumerable

**@overload** [] 

## parameters() [](#method-i-parameters)
Returns the parameter information of this method.

    def foo(bar); end
    method(:foo).parameters #=> [[:req, :bar]]

    def foo(bar, baz, bat, &blk); end
    method(:foo).parameters #=> [[:req, :bar], [:req, :baz], [:req, :bat], [:block, :blk]]

    def foo(bar, *args); end
    method(:foo).parameters #=> [[:req, :bar], [:rest, :args]]

    def foo(bar, baz, *args, &blk); end
    method(:foo).parameters #=> [[:req, :bar], [:req, :baz], [:rest, :args], [:block, :blk]]

**@overload** [] 

## receiver() [](#method-i-receiver)
Returns the bound receiver of the method object.

    (1..3).method(:map).receiver # => 1..3

**@overload** [] 

## source_location() [](#method-i-source_location)
Returns the Ruby source filename and line number containing this method or nil
if this method was not defined in Ruby (i.e. native).

**@overload** [] 

## super_method() [](#method-i-super_method)
Returns a Method of superclass which would be called when super is used or nil
if there is no method on superclass.

**@overload** [] 

## to_proc() [](#method-i-to_proc)
Returns a Proc object corresponding to this method.

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns a human-readable description of the underlying method.

    "cat".method(:count).inspect   #=> "#<Method: String#count(*)>"
    (1..3).method(:map).inspect    #=> "#<Method: Range(Enumerable)#map()>"

In the latter case, the method description includes the "owner" of the
original method (`Enumerable` module, which is included into `Range`).

`inspect` also provides, when possible, method argument names (call sequence)
and source location.

    require 'net/http'
    Net::HTTP.method(:get).inspect
    #=> "#<Method: Net::HTTP.get(uri_or_host, path=..., port=...) <skip>/lib/ruby/2.7.0/net/http.rb:457>"

`...` in argument definition means argument is optional (has some default
value).

For methods defined in C (language core and extensions), location and argument
names can't be extracted, and only generic information is provided in form of
`*` (any number of arguments) or `_` (some positional argument).

    "cat".method(:count).inspect   #=> "#<Method: String#count(*)>"
    "cat".method(:+).inspect       #=> "#<Method: String#+(_)>""

**@overload** [] 

**@overload** [] 

## unbind() [](#method-i-unbind)
Dissociates *meth* from its current receiver. The resulting UnboundMethod can
subsequently be bound to a new object of the same class (see UnboundMethod).

**@overload** [] 

