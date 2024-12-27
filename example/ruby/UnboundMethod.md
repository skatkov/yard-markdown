# Class: UnboundMethod
**Inherits:** Object
    

********************************************************************

    Ruby supports two forms of objectified methods. Class Method is
    used to represent methods that are associated with a particular
    object: these method objects are bound to that object. Bound
    method objects for an object can be created using Object#method.

    Ruby also supports unbound methods; methods objects that are not
    associated with a particular object. These can be created either
    by calling Module#instance_method or by calling #unbind on a bound
    method object. The result of both of these is an UnboundMethod
    object.

    Unbound methods can only be called after they are bound to an
    object. That object must be a kind_of? the method's original
    class.

       class Square
         def area
           @side * @side
         end
         def initialize(side)
           @side = side
         end
       end

       area_un = Square.instance_method(:area)

       s = Square.new(12)
       area = area_un.bind(s)
       area.call   #=> 144

    Unbound methods are a reference to the method at the time it was
    objectified: subsequent changes to the underlying class will not
    affect the unbound method.

       class Test
         def test
           :original
         end
       end
       um = Test.instance_method(:test)
       class Test
         def test
           :modified
         end
       end
       t = Test.new
       t.test            #=> :modified
       um.bind(t).call   #=> :original



#Instance Methods
## ==() [](#method-i-==)

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

## bind(recv) [](#method-i-bind)
Bind *umeth* to *obj*. If Klass was the class from which *umeth* was obtained,
`obj.kind_of?(Klass)` must be true.

    class A
      def test
        puts "In test, class = #{self.class}"
      end
    end
    class B < A
    end
    class C < B
    end

    um = B.instance_method(:test)
    bm = um.bind(C.new)
    bm.call
    bm = um.bind(B.new)
    bm.call
    bm = um.bind(A.new)
    bm.call

*produces:*

    In test, class = C
    In test, class = B
    prog.rb:16:in `bind': bind argument must be an instance of B (TypeError)
    	from prog.rb:16

**@overload** [] 

## bind_call(*args) [](#method-i-bind_call)
Bind *umeth* to *recv* and then invokes the method with the specified
arguments. This is semantically equivalent to `umeth.bind(recv).call(args,
...)`.

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

## dup() [](#method-i-dup)
:nodoc:

## eql?() [](#method-i-eql?)

**@return** [Boolean] 

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

## source_location() [](#method-i-source_location)
Returns the Ruby source filename and line number containing this method or nil
if this method was not defined in Ruby (i.e. native).

**@overload** [] 

## super_method() [](#method-i-super_method)
Returns a Method of superclass which would be called when super is used or nil
if there is no method on superclass.

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

