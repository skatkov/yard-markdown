# Class: Object
**Inherits:** BasicObject
    
**Includes:** Kernel, ModuleSpecs::IncludedInObject, PP::ObjectMixin
  

https://github.com/seattlerb/minitest/blob/13c48a03d84a2a87855a4de0c959f968001
00357/lib/minitest/mock.rb#L192


# Class Methods
## const_missing(c ) [](#method-c-const_missing)
**@raise** [NameError] 

## example_class_method_of_object() [](#method-c-example_class_method_of_object)
## yaml_tag(url ) [](#method-c-yaml_tag)

#Instance Methods
## !~(obj2) [](#method-i-!~)
Returns true if two objects do not match (using the *=~* method), otherwise
false.

**@overload** [] 

## <=>(obj2) [](#method-i-<=>)
Returns 0 if `obj` and `other` are the same object or `obj == other`,
otherwise nil.

The #<=> is used by various methods to compare objects, for example
Enumerable#sort, Enumerable#max etc.

Your implementation of #<=> should return one of the following values: -1, 0,
1 or nil. -1 means self is smaller than other. 0 means self is equal to other.
1 means self is bigger than other. Nil means the two values could not be
compared.

When you define #<=>, you can include Comparable to gain the methods #<=, #<,
#==, #>=, #> and #between?.

**@overload** [] 

## ===() [](#method-i-===)

## Array(arg) [](#method-i-Array)
Returns an array converted from `object`.

Tries to convert `object` to an array using `to_ary` first and `to_a` second:

    Array([0, 1, 2])        # => [0, 1, 2]
    Array({foo: 0, bar: 1}) # => [[:foo, 0], [:bar, 1]]
    Array(0..4)             # => [0, 1, 2, 3, 4]

Returns `object` in an array, `[object]`, if `object` cannot be converted:

    Array(:foo)             # => [:foo]

**@overload** [] 

## Complex(*args) [](#method-i-Complex)
Returns a new Complex object if the arguments are valid; otherwise raises an
exception if `exception` is `true`; otherwise returns `nil`.

With Numeric arguments `real` and `imag`, returns `Complex.rect(real, imag)`
if the arguments are valid.

With string argument `s`, returns a new Complex object if the argument is
valid; the string may have:

*   One or two numeric substrings, each of which specifies a Complex, Float,
    Integer, Numeric, or Rational value, specifying [rectangular
    coordinates](rdoc-ref:Complex@Rectangular+Coordinates):

    *   Sign-separated real and imaginary numeric substrings (with trailing
        character `'i'`):

            Complex('1+2i')  # => (1+2i)
            Complex('+1+2i') # => (1+2i)
            Complex('+1-2i') # => (1-2i)
            Complex('-1+2i') # => (-1+2i)
            Complex('-1-2i') # => (-1-2i)

    *   Real-only numeric string (without trailing character `'i'`):

            Complex('1')  # => (1+0i)
            Complex('+1') # => (1+0i)
            Complex('-1') # => (-1+0i)

    *   Imaginary-only numeric string (with trailing character `'i'`):

            Complex('1i')  # => (0+1i)
            Complex('+1i') # => (0+1i)
            Complex('-1i') # => (0-1i)

*   At-sign separated real and imaginary rational substrings, each of which
    specifies a Rational value, specifying [polar
    coordinates](rdoc-ref:Complex@Polar+Coordinates):

        Complex('1/2@3/4')   # => (0.36584443443691045+0.34081938001166706i)
        Complex('+1/2@+3/4') # => (0.36584443443691045+0.34081938001166706i)
        Complex('+1/2@-3/4') # => (0.36584443443691045-0.34081938001166706i)
        Complex('-1/2@+3/4') # => (-0.36584443443691045-0.34081938001166706i)
        Complex('-1/2@-3/4') # => (-0.36584443443691045+0.34081938001166706i)

**@overload** [] 

**@overload** [] 

## Hash(arg) [](#method-i-Hash)
Returns a hash converted from `object`.

*   If `object` is:

    *   A hash, returns `object`.
    *   An empty array or `nil`, returns an empty hash.

*   Otherwise, if `object.to_hash` returns a hash, returns that hash.
*   Otherwise, returns TypeError.

Examples:

    Hash({foo: 0, bar: 1}) # => {:foo=>0, :bar=>1}
    Hash(nil)              # => {}
    Hash([])               # => {}

**@overload** [] 

## Pathname(str) [](#method-i-Pathname)
:call-seq:
    Pathname(path)  -> pathname

Creates a new Pathname object from the given string, `path`, and returns
pathname object.

In order to use this constructor, you must first require the Pathname standard
library extension.

require 'pathname' Pathname("/home/zzak") #=> #<Pathname:/home/zzak>

See also Pathname::new for more information.

## Rational(*args) [](#method-i-Rational)
Returns `x/y` or `arg` as a Rational.

    Rational(2, 3)   #=> (2/3)
    Rational(5)      #=> (5/1)
    Rational(0.5)    #=> (1/2)
    Rational(0.3)    #=> (5404319552844595/18014398509481984)

    Rational("2/3")  #=> (2/3)
    Rational("0.3")  #=> (3/10)

    Rational("10 cents")  #=> ArgumentError
    Rational(nil)         #=> TypeError
    Rational(1, nil)      #=> TypeError

    Rational("10 cents", exception: false)  #=> nil

Syntax of the string form:

    string form = extra spaces , rational , extra spaces ;
    rational = [ sign ] , unsigned rational ;
    unsigned rational = numerator | numerator , "/" , denominator ;
    numerator = integer part | fractional part | integer part , fractional part ;
    denominator = digits ;
    integer part = digits ;
    fractional part = "." , digits , [ ( "e" | "E" ) , [ sign ] , digits ] ;
    sign = "-" | "+" ;
    digits = digit , { digit | "_" , digit } ;
    digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
    extra spaces = ? \s* ? ;

See also String#to_r.

**@overload** [] 

**@overload** [] 

## String(arg) [](#method-i-String)
Returns a string converted from `object`.

Tries to convert `object` to a string using `to_str` first and `to_s` second:

    String([0, 1, 2])        # => "[0, 1, 2]"
    String(0..5)             # => "0..5"
    String({foo: 0, bar: 1}) # => "{foo: 0, bar: 1}"

Raises `TypeError` if `object` cannot be converted to a string.

**@overload** [] 

## __callee__() [](#method-i-__callee__)
Returns the called name of the current method as a Symbol. If called outside
of a method, it returns `nil`.

**@overload** [] 

## __dir__() [](#method-i-__dir__)
Returns the canonicalized absolute path of the directory of the file from
which this method is called. It means symlinks in the path is resolved. If
`__FILE__` is `nil`, it returns `nil`. The return value equals to
`File.dirname(File.realpath(__FILE__))`.

**@overload** [] 

## __method__() [](#method-i-__method__)
Returns the name at the definition of the current method as a Symbol. If
called outside of a method, it returns `nil`.

**@overload** [] 

## `(str) [](#method-i-`)
Returns the `$stdout` output from running `command` in a subshell; sets global
variable `$?` to the process status.

This method has potential security vulnerabilities if called with untrusted
input; see [Command Injection](rdoc-ref:command_injection.rdoc).

Examples:

    $ `date`                 # => "Wed Apr  9 08:56:30 CDT 2003\n"
    $ `echo oops && exit 99` # => "oops\n"
    $ $?                     # => #<Process::Status: pid 17088 exit 99>
    $ $?.status              # => 99>

The built-in syntax `%x{...}` uses this method.

**@overload** [] 

## abort(*a, _) [](#method-i-abort)
Terminates execution immediately, effectively by calling `Kernel.exit(false)`.

If string argument `msg` is given, it is written to STDERR prior to
termination; otherwise, if an exception was raised, prints its message and
backtrace.

**@overload** [] 

**@overload** [] 

## arg1(arg1) [](#method-i-arg1)

## argm1(*args) [](#method-i-argm1)

## at_exit() [](#method-i-at_exit)
Converts *block* to a `Proc` object (and therefore binds it at the point of
call) and registers it for execution when the program exits. If multiple
handlers are registered, they are executed in reverse order of registration.

    def do_at_exit(str1)
      at_exit { print str1 }
    end
    at_exit { puts "cruel world" }
    do_at_exit("goodbye ")
    exit

*produces:*

    goodbye cruel world

**@overload** [] 

## autoload(sym, file) [](#method-i-autoload)
Registers *filename* to be loaded (using Kernel::require) the first time that
*const* (which may be a String or a symbol) is accessed.

    autoload(:MyModule, "/usr/local/lib/modules/my_module.rb")

If *const* is defined as autoload, the file name to be loaded is replaced with
*filename*.  If *const* is defined but not as autoload, does nothing.

**@overload** [] 

## autoload?(*args) [](#method-i-autoload?)
Returns *filename* to be loaded if *name* is registered as `autoload` in the
current namespace or one of its ancestors.

    autoload(:B, "b")
    autoload?(:B)            #=> "b"

    module C
      autoload(:D, "d")
      autoload?(:D)          #=> "d"
      autoload?(:B)          #=> nil
    end

    class E
      autoload(:F, "f")
      autoload?(:F)          #=> "f"
      autoload?(:B)          #=> "b"
    end

**@overload** [] 

## be_close_to_matrix(expected, toleranceTOLERANCE) [](#method-i-be_close_to_matrix)

## binding() [](#method-i-binding)
Returns a Binding object, describing the variable and method bindings at the
point of call. This object can be used when calling Binding#eval to execute
the evaluated command in this environment, or extracting its local variables.

    class User
      def initialize(name, position)
        @name = name
        @position = position
      end

      def get_binding
        binding
      end
    end

    user = User.new('Joan', 'manager')
    template = '{name: @name, position: @position}'

    # evaluate template in context of the object
    eval(template, user.get_binding)
    #=> {:name=>"Joan", :position=>"manager"}

Binding#local_variable_get can be used to access the variables whose names are
reserved Ruby keywords:

    # This is valid parameter declaration, but `if` parameter can't
    # be accessed by name, because it is a reserved word.
    def validate(field, validation, if: nil)
      condition = binding.local_variable_get('if')
      return unless condition

      # ...Some implementation ...
    end

    validate(:name, :empty?, if: false) # skips validation
    validate(:name, :empty?, if: true) # performs validation

**@overload** [] 

## block_given?() [](#method-i-block_given?)
Returns `true` if `yield` would execute a block in the current context. The
`iterator?` form is mildly deprecated.

    def try
      if block_given?
        yield
      else
        "no block"
      end
    end
    try                  #=> "no block"
    try { "hello" }      #=> "hello"
    try do "hello" end   #=> "hello"

**@overload** [] 

## callable_methods() [](#method-i-callable_methods)

## callcc() [](#method-i-callcc)
Generates a Continuation object, which it passes to the associated block. You
need to `require 'continuation'` before using this method. Performing a
*cont*`.call` will cause the #callcc to return (as will falling through the
end of the block). The value returned by the #callcc is the value of the
block, or the value passed to *cont*`.call`. See class Continuation for more
details. Also see Kernel#throw for an alternative mechanism for unwinding a
call stack.

**@overload** [] 

## caller(*args) [](#method-i-caller)
Returns the current execution stack---an array containing strings in the form
`file:line` or `file:line: in `method'`.

The optional *start* parameter determines the number of initial stack entries
to omit from the top of the stack.

A second optional `length` parameter can be used to limit how many entries are
returned from the stack.

Returns `nil` if *start* is greater than the size of current execution stack.

Optionally you can pass a range, which will return an array containing the
entries within the specified range.

    def a(skip)
      caller(skip)
    end
    def b(skip)
      a(skip)
    end
    def c(skip)
      b(skip)
    end
    c(0)   #=> ["prog:2:in `a'", "prog:5:in `b'", "prog:8:in `c'", "prog:10:in `<main>'"]
    c(1)   #=> ["prog:5:in `b'", "prog:8:in `c'", "prog:11:in `<main>'"]
    c(2)   #=> ["prog:8:in `c'", "prog:12:in `<main>'"]
    c(3)   #=> ["prog:13:in `<main>'"]
    c(4)   #=> []
    c(5)   #=> nil

**@overload** [] 

**@overload** [] 

## caller_locations(*args) [](#method-i-caller_locations)
Returns the current execution stack---an array containing backtrace location
objects.

See Thread::Backtrace::Location for more information.

The optional *start* parameter determines the number of initial stack entries
to omit from the top of the stack.

A second optional `length` parameter can be used to limit how many entries are
returned from the stack.

Returns `nil` if *start* is greater than the size of current execution stack.

Optionally you can pass a range, which will return an array containing the
entries within the specified range.

**@overload** [] 

**@overload** [] 

## catch(*args) [](#method-i-catch)
`catch` executes its block. If `throw` is not called, the block executes
normally, and `catch` returns the value of the last expression evaluated.

    catch(1) { 123 }            # => 123

If `throw(tag2, val)` is called, Ruby searches up its stack for a `catch`
block whose `tag` has the same `object_id` as *tag2*. When found, the block
stops executing and returns *val* (or `nil` if no second argument was given to
`throw`).

    catch(1) { throw(1, 456) }  # => 456
    catch(1) { throw(1) }       # => nil

When `tag` is passed as the first argument, `catch` yields it as the parameter
of the block.

    catch(1) {|x| x + 2 }       # => 3

When no `tag` is given, `catch` yields a new unique object (as from
`Object.new`) as the block parameter. This object can then be used as the
argument to `throw`, and will match the correct `catch` block.

    catch do |obj_A|
      catch do |obj_B|
        throw(obj_B, 123)
        puts "This puts is not reached"
      end

      puts "This puts is displayed"
      456
    end

    # => 456

    catch do |obj_A|
      catch do |obj_B|
        throw(obj_A, 123)
        puts "This puts is still not reached"
      end

      puts "Now this puts is also not reached"
      456
    end

    # => 123

**@overload** [] 

## chomp(*args) [](#method-i-chomp)
Equivalent to `$_ = $_.chomp(*string*)`. See String#chomp. Available only when
-p/-n command line option specified.

**@overload** [] 

**@overload** [] 

## chop() [](#method-i-chop)
Equivalent to `($_.dup).chop!`, except `nil` is never returned. See
String#chop!. Available only when -p/-n command line option specified.

**@overload** [] 

## class() [](#method-i-class)
call-seq:
       obj.class    -> class

    Returns the class of <i>obj</i>. This method must always be called
    with an explicit receiver, as #class is also a reserved word in
    Ruby.

       1.class      #=> Integer
       self.class   #=> Object

-- Equivalent to c Object#class in Ruby.

Returns the class of c obj, skipping singleton classes or module inclusions.
++

## clone(freeze:nil) [](#method-i-clone)
call-seq:
       obj.clone(freeze: nil) -> an_object

    Produces a shallow copy of <i>obj</i>---the instance variables of
    <i>obj</i> are copied, but not the objects they reference.
    #clone copies the frozen value state of <i>obj</i>, unless the
    +:freeze+ keyword argument is given with a false or true value.
    See also the discussion under Object#dup.

       class Klass
          attr_accessor :str
       end
       s1 = Klass.new      #=> #<Klass:0x401b3a38>
       s1.str = "Hello"    #=> "Hello"
       s2 = s1.clone       #=> #<Klass:0x401b3998 @str="Hello">
       s2.str[1,4] = "i"   #=> "i"
       s1.inspect          #=> "#<Klass:0x401b3a38 @str=\"Hi\">"
       s2.inspect          #=> "#<Klass:0x401b3998 @str=\"Hi\">"

    This method may have class-specific behavior. If so, that
    behavior will be documented under the #+initialize_copy+ method of
    the class.

## define_singleton_method(*args) [](#method-i-define_singleton_method)
Defines a public singleton method in the receiver. The *method* parameter can
be a `Proc`, a `Method` or an `UnboundMethod` object. If a block is specified,
it is used as the method body. If a block or a method has parameters, they're
used as method parameters.

    class A
      class << self
        def class_name
          to_s
        end
      end
    end
    A.define_singleton_method(:who_am_i) do
      "I am: #{class_name}"
    end
    A.who_am_i   # ==> "I am: A"

    guy = "Bob"
    guy.define_singleton_method(:hello) { "#{self}: Hello there!" }
    guy.hello    #=>  "Bob: Hello there!"

    chris = "Chris"
    chris.define_singleton_method(:greet) {|greeting| "#{greeting}, I'm Chris!" }
    chris.greet("Hi") #=> "Hi, I'm Chris!"

**@overload** [] 

**@overload** [] 

## defined_specs_method() [](#method-i-defined_specs_method)

## defined_specs_receiver() [](#method-i-defined_specs_receiver)

## display(*args) [](#method-i-display)
Writes `self` on the given port:

    1.display
    "cat".display
    [ 4, 5, 6 ].display
    puts

Output:

    1cat[4, 5, 6]

**@overload** [] 

## dup() [](#method-i-dup)
Produces a shallow copy of *obj*---the instance variables of *obj* are copied,
but not the objects they reference.

This method may have class-specific behavior.  If so, that behavior will be
documented under the #`initialize_copy` method of the class.

### on dup vs clone

In general, #clone and #dup may have different semantics in descendant
classes. While #clone is used to duplicate an object, including its internal
state, #dup typically uses the class of the descendant object to create the
new instance.

When using #dup, any modules that the object has been extended with will not
be copied.

class Klass
    attr_accessor :str

end

module Foo
    def foo; 'foo'; end

end

s1 = Klass.new #=> #<Klass:0x401b3a38> s1.extend(Foo) #=> #<Klass:0x401b3a38>
s1.foo #=> "foo"

s2 = s1.clone #=> #<Klass:0x401be280> s2.foo #=> "foo"

s3 = s1.dup #=> #<Klass:0x401c1084> s3.foo #=> NoMethodError: undefined method
`foo' for #<Klass:0x401c1084>

**@overload** [] 

## enum_for(*args) [](#method-i-enum_for)
Creates a new Enumerator which will enumerate by calling `method` on `obj`,
passing `args` if any. What was *yielded* by method becomes values of
enumerator.

If a block is given, it will be used to calculate the size of the enumerator
without the need to iterate it (see Enumerator#size).

### Examples

    str = "xyz"

    enum = str.enum_for(:each_byte)
    enum.each { |b| puts b }
    # => 120
    # => 121
    # => 122

    # protect an array from being modified by some_method
    a = [1, 2, 3]
    some_method(a.to_enum)

    # String#split in block form is more memory-effective:
    very_large_string.split("|") { |chunk| return chunk if chunk.include?('DATE') }
    # This could be rewritten more idiomatically with to_enum:
    very_large_string.to_enum(:split, "|").lazy.grep(/DATE/).first

It is typical to call to_enum when defining methods for a generic Enumerable,
in case no block is passed.

Here is such an example, with parameter passing and a sizing block:

    module Enumerable
      # a generic method to repeat the values of any enumerable
      def repeat(n)
        raise ArgumentError, "#{n} is negative!" if n < 0
        unless block_given?
          return to_enum(__method__, n) do # __method__ is :repeat here
            sz = size     # Call size and multiply by n...
            sz * n if sz  # but return nil if size itself is nil
          end
        end
        each do |*val|
          n.times { yield *val }
        end
      end
    end

    %i[hello world].repeat(2) { |w| puts w }
      # => Prints 'hello', 'hello', 'world', 'world'
    enum = (1..14).repeat(3)
      # => returns an Enumerator when called without a block
    enum.first(4) # => [1, 1, 1, 2]
    enum.size # => 42

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## eql?(obj2) [](#method-i-eql?)
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

## eval(*args) [](#method-i-eval)
Evaluates the Ruby expression(s) in *string*. If *binding* is given, which
must be a Binding object, the evaluation is performed in its context. If the
optional *filename* and *lineno* parameters are present, they will be used
when reporting syntax errors.

    def get_binding(str)
      return binding
    end
    str = "hello"
    eval "str + ' Fred'"                      #=> "hello Fred"
    eval "str + ' Fred'", get_binding("bye")  #=> "bye Fred"

**@overload** [] 

## example_instance_method_of_object() [](#method-i-example_instance_method_of_object)

## exec(*a, _) [](#method-i-exec)
Replaces the current process by doing one of the following:

*   Passing string `command_line` to the shell.
*   Invoking the executable at `exe_path`.

This method has potential security vulnerabilities if called with untrusted
input; see [Command Injection](rdoc-ref:command_injection.rdoc).

The new process is created using the [exec system
call](https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/e
xecve.html); it may inherit some of its environment from the calling program
(possibly including open file descriptors).

Argument `env`, if given, is a hash that affects `ENV` for the new process;
see [Execution Environment](rdoc-ref:Process@Execution+Environment).

Argument `options` is a hash of options for the new process; see [Execution
Options](rdoc-ref:Process@Execution+Options).

The first required argument is one of the following:

*   `command_line` if it is a string, and if it begins with a shell reserved
    word or special built-in, or if it contains one or more meta characters.
*   `exe_path` otherwise.

**Argument `command_line`**

String argument `command_line` is a command line to be passed to a shell; it
must begin with a shell reserved word, begin with a special built-in, or
contain meta characters:

    exec('if true; then echo "Foo"; fi') # Shell reserved word.
    exec('exit')                         # Built-in.
    exec('date > date.tmp')              # Contains meta character.

The command line may also contain arguments and options for the command:

    exec('echo "Foo"')

Output:

    Foo

See [Execution Shell](rdoc-ref:Process@Execution+Shell) for details about the
shell.

Raises an exception if the new process could not execute.

**Argument `exe_path`**

Argument `exe_path` is one of the following:

*   The string path to an executable to be called.
*   A 2-element array containing the path to an executable and the string to
    be used as the name of the executing process.

Example:

    exec('/usr/bin/date')

Output:

    Sat Aug 26 09:38:00 AM CDT 2023

Ruby invokes the executable directly. This form does not use the shell; see
[Arguments args](rdoc-ref:Process@Arguments+args) for caveats.

    exec('doesnt_exist') # Raises Errno::ENOENT

If one or more `args` is given, each is an argument or option to be passed to
the executable:

    exec('echo', 'C*')
    exec('echo', 'hello', 'world')

Output:

    C*
    hello world

Raises an exception if the new process could not execute.

**@overload** [] 

**@overload** [] 

## exit(*a, _) [](#method-i-exit)
Initiates termination of the Ruby script by raising SystemExit; the exception
may be caught. Returns exit status `status` to the underlying operating
system.

Values `true` and `false` for argument `status` indicate, respectively,
success and failure; The meanings of integer values are system-dependent.

Example:

    begin
      exit
      puts 'Never get here.'
    rescue SystemExit
      puts 'Rescued a SystemExit exception.'
    end
    puts 'After begin block.'

Output:

    Rescued a SystemExit exception.
    After begin block.

Just prior to final termination, Ruby executes any at-exit procedures (see
Kernel::at_exit) and any object finalizers (see
ObjectSpace::define_finalizer).

Example:

    at_exit { puts 'In at_exit function.' }
    ObjectSpace.define_finalizer('string', proc { puts 'In finalizer.' })
    exit

Output:

    In at_exit function.
    In finalizer.

**@overload** [] 

**@overload** [] 

## exit!(*args) [](#method-i-exit!)
Exits the process immediately; no exit handlers are called. Returns exit
status `status` to the underlying operating system.

    Process.exit!(true)

Values `true` and `false` for argument `status` indicate, respectively,
success and failure; The meanings of integer values are system-dependent.

**@overload** [] 

**@overload** [] 

## extend(*args) [](#method-i-extend)
Adds to *obj* the instance methods from each module given as a parameter.

    module Mod
      def hello
        "Hello from Mod.\n"
      end
    end

    class Klass
      def hello
        "Hello from Klass.\n"
      end
    end

    k = Klass.new
    k.hello         #=> "Hello from Klass.\n"
    k.extend(Mod)   #=> #<Klass:0x401b3bc8>
    k.hello         #=> "Hello from Mod.\n"

**@overload** [] 

## fail(*v, _) [](#method-i-fail)
Raises an exception; see [Exceptions](rdoc-ref:exceptions.md).

Argument `exception` sets the class of the new exception; it should be class
Exception or one of its subclasses (most commonly, RuntimeError or
StandardError), or an instance of one of those classes:

    begin
      raise(StandardError)
    rescue => x
      p x.class
    end
    # => StandardError

Argument `message` sets the stored message in the new exception, which may be
retrieved by method Exception#message; the message must be a
[string-convertible
object](rdoc-ref:implicit_conversion.rdoc@String-Convertible+Objects) or
`nil`:

    begin
      raise(StandardError, 'Boom')
    rescue => x
      p x.message
    end
    # => "Boom"

If argument `message` is not given, the message is the exception class name.

See [Messages](rdoc-ref:exceptions.md@Messages).

Argument `backtrace` might be used to modify the backtrace of the new
exception, as reported by Exception#backtrace and
Exception#backtrace_locations; the backtrace must be an array of
Thread::Backtrace::Location, an array of strings, a single string, or `nil`.

Using the array of Thread::Backtrace::Location instances is the most
consistent option and should be preferred when possible. The necessary value
might be obtained from #caller_locations, or copied from
Exception#backtrace_locations of another error:

    begin
      do_some_work()
    rescue ZeroDivisionError => ex
      raise(LogicalError, "You have an error in your math", ex.backtrace_locations)
    end

The ways, both Exception#backtrace and Exception#backtrace_locations of the
raised error are set to the same backtrace.

When the desired stack of locations is not available and should be constructed
from scratch, an array of strings or a singular string can be used. In this
case, only Exception#backtrace is set:

    begin
      raise(StandardError, 'Boom', %w[dsl.rb:3 framework.rb:1])
    rescue => ex
      p ex.backtrace
      # => ["dsl.rb:3", "framework.rb:1"]
      p ex.backtrace_locations
      # => nil
    end

If argument `backtrace` is not given, the backtrace is set according to an
array of Thread::Backtrace::Location objects, as derived from the call stack.

See [Backtraces](rdoc-ref:exceptions.md@Backtraces).

Keyword argument `cause` sets the stored cause in the new exception, which may
be retrieved by method Exception#cause; the cause must be an exception object
(Exception or one of its subclasses), or `nil`:

    begin
      raise(StandardError, cause: RuntimeError.new)
    rescue => x
      p x.cause
    end
    # => #<RuntimeError: RuntimeError>

If keyword argument `cause` is not given, the cause is the value of `$!`.

See [Cause](rdoc-ref:exceptions.md@Cause).

In the alternate calling sequence, where argument `exception` *not* given,
raises a new exception of the class given by `$!`, or of class RuntimeError if
`$!` is `nil`:

    begin
      raise
    rescue => x
      p x
    end
    # => RuntimeError

With argument `exception` not given, argument `message` and keyword argument
`cause` may be given, but argument `backtrace` may not be given.

**@overload** [] 

**@overload** [] 

## fork() [](#method-i-fork)
Creates a child process.

With a block given, runs the block in the child process; on block exit, the
child terminates with a status of zero:

    puts "Before the fork: #{Process.pid}"
    fork do
      puts "In the child process: #{Process.pid}"
    end                   # => 382141
    puts "After the fork: #{Process.pid}"

Output:

    Before the fork: 420496
    After the fork: 420496
    In the child process: 420520

With no block given, the `fork` call returns twice:

*   Once in the parent process, returning the pid of the child process.
*   Once in the child process, returning `nil`.

Example:

    puts "This is the first line before the fork (pid #{Process.pid})"
    puts fork
    puts "This is the second line after the fork (pid #{Process.pid})"

Output:

    This is the first line before the fork (pid 420199)
    420223
    This is the second line after the fork (pid 420199)

    This is the second line after the fork (pid 420223)

In either case, the child process may exit using Kernel.exit! to avoid the
call to Kernel#at_exit.

To avoid zombie processes, the parent process should call either:

*   Process.wait, to collect the termination statuses of its children.
*   Process.detach, to register disinterest in their status.

The thread calling `fork` is the only thread in the created child process;
`fork` doesn't copy other threads.

Note that method `fork` is available on some platforms, but not on others:

    Process.respond_to?(:fork) # => true # Would be false on some.

If not, you may use ::spawn instead of `fork`.

**@overload** [] 

**@overload** [] 

## format(*v, _) [](#method-i-format)
Returns the string resulting from formatting `objects` into `format_string`.

For details on `format_string`, see [Format
Specifications](rdoc-ref:format_specifications.rdoc).

**@overload** [] 

## freeze() [](#method-i-freeze)
Prevents further modifications to *obj*. A FrozenError will be raised if
modification is attempted. There is no way to unfreeze a frozen object. See
also Object#frozen?.

This method returns self.

    a = [ "a", "b", "c" ]
    a.freeze
    a << "z"

*produces:*

    prog.rb:3:in `<<': can't modify frozen Array (FrozenError)
    	from prog.rb:3

Objects of the following classes are always frozen: Integer, Float, Symbol.

**@overload** [] 

## frozen?() [](#method-i-frozen?)
call-seq:
       obj.frozen?    -> true or false

    Returns the freeze status of <i>obj</i>.

       a = [ "a", "b", "c" ]
       a.freeze    #=> ["a", "b", "c"]
       a.frozen?   #=> true

-- Determines if the object is frozen. Equivalent to `Object#frozen?` in Ruby.
@[param](in) obj  the object to be determines ++

**@return** [Boolean] 

## gets(*args) [](#method-i-gets)
Returns (and assigns to `$_`) the next line from the list of files in `ARGV`
(or `$*`), or from standard input if no files are present on the command line.
Returns `nil` at end of file. The optional argument specifies the record
separator. The separator is included with the contents of each record. A
separator of `nil` reads the entire contents, and a zero-length separator
reads the input one paragraph at a time, where paragraphs are divided by two
consecutive newlines.  If the first argument is an integer, or optional second
argument is given, the returning string would not be longer than the given
value in bytes.  If multiple filenames are present in `ARGV`, `gets(nil)` will
read the contents one file at a time.

    ARGV << "testfile"
    print while gets

*produces:*

    This is line one
    This is line two
    This is line three
    And so on...

The style of programming using `$_` as an implicit parameter is gradually
losing favor in the Ruby community.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## global_variables() [](#method-i-global_variables)
Returns an array of the names of global variables. This includes special
regexp global variables such as `$~` and `$+`, but does not include the
numbered regexp global variables (`$1`, `$2`, etc.).

    global_variables.grep /std/   #=> [:$stdin, :$stdout, :$stderr]

**@overload** [] 

## gsub(*args) [](#method-i-gsub)
Equivalent to `$_.gsub...`, except that `$_` will be updated if substitution
occurs. Available only when -p/-n command line option specified.

**@overload** [] 

**@overload** [] 

## hash() [](#method-i-hash)

## initialize_clone(*args) [](#method-i-initialize_clone)
:nodoc:

## initialize_copy(orig) [](#method-i-initialize_copy)
:nodoc:

## initialize_dup(orig) [](#method-i-initialize_dup)
:nodoc:

## inspect() [](#method-i-inspect)
Returns a string containing a human-readable representation of *obj*. The
default #inspect shows the object's class name, an encoding of its memory
address, and a list of the instance variables and their values (by calling
#inspect on each of them).  User defined classes should override this method
to provide a better representation of *obj*.  When overriding this method, it
should return a string whose encoding is compatible with the default external
encoding.

    [ 1, 2, 3..4, 'five' ].inspect   #=> "[1, 2, 3..4, \"five\"]"
    Time.new.inspect                 #=> "2008-03-08 19:43:39 +0900"

    class Foo
    end
    Foo.new.inspect                  #=> "#<Foo:0x0300c868>"

    class Bar
      def initialize
        @bar = 1
      end
    end
    Bar.new.inspect                  #=> "#<Bar:0x0300c868 @bar=1>"

**@overload** [] 

## instance_of?(c) [](#method-i-instance_of?)
Returns `true` if *obj* is an instance of the given class. See also
Object#kind_of?.

    class A;     end
    class B < A; end
    class C < B; end

    b = B.new
    b.instance_of? A   #=> false
    b.instance_of? B   #=> true
    b.instance_of? C   #=> false

**@overload** [] 

## instance_variable_defined?(iv) [](#method-i-instance_variable_defined?)
Returns `true` if the given instance variable is defined in *obj*. String
arguments are converted to symbols.

    class Fred
      def initialize(p1, p2)
        @a, @b = p1, p2
      end
    end
    fred = Fred.new('cat', 99)
    fred.instance_variable_defined?(:@a)    #=> true
    fred.instance_variable_defined?("@b")   #=> true
    fred.instance_variable_defined?("@c")   #=> false

**@overload** [] 

**@overload** [] 

## instance_variable_get(iv) [](#method-i-instance_variable_get)
Returns the value of the given instance variable, or nil if the instance
variable is not set. The `@` part of the variable name should be included for
regular instance variables. Throws a NameError exception if the supplied
symbol is not valid as an instance variable name. String arguments are
converted to symbols.

    class Fred
      def initialize(p1, p2)
        @a, @b = p1, p2
      end
    end
    fred = Fred.new('cat', 99)
    fred.instance_variable_get(:@a)    #=> "cat"
    fred.instance_variable_get("@b")   #=> 99

**@overload** [] 

**@overload** [] 

## instance_variable_set(iv, val) [](#method-i-instance_variable_set)
Sets the instance variable named by *symbol* to the given object. This may
circumvent the encapsulation intended by the author of the class, so it should
be used with care. The variable does not have to exist prior to this call. If
the instance variable name is passed as a string, that string is converted to
a symbol.

    class Fred
      def initialize(p1, p2)
        @a, @b = p1, p2
      end
    end
    fred = Fred.new('cat', 99)
    fred.instance_variable_set(:@a, 'dog')   #=> "dog"
    fred.instance_variable_set(:@c, 'cat')   #=> "cat"
    fred.inspect                             #=> "#<Fred:0x401b3da8 @a=\"dog\", @b=99, @c=\"cat\">"

**@overload** [] 

**@overload** [] 

## instance_variables() [](#method-i-instance_variables)

## is_a?(c) [](#method-i-is_a?)
Returns `true` if *class* is the class of *obj*, or if *class* is one of the
superclasses of *obj* or modules included in *obj*.

    module M;    end
    class A
      include M
    end
    class B < A; end
    class C < B; end

    b = B.new
    b.is_a? A          #=> true
    b.is_a? B          #=> true
    b.is_a? C          #=> false
    b.is_a? M          #=> true

    b.kind_of? A       #=> true
    b.kind_of? B       #=> true
    b.kind_of? C       #=> false
    b.kind_of? M       #=> true

**@overload** [] 

**@overload** [] 

## iterator?() [](#method-i-iterator?)
Deprecated.  Use block_given? instead.

**@overload** [] 

## itself() [](#method-i-itself)
Returns the receiver.

    string = "my string"
    string.itself.object_id == string.object_id   #=> true

**@overload** [] 

## kind_of?(c) [](#method-i-kind_of?)
Returns `true` if *class* is the class of *obj*, or if *class* is one of the
superclasses of *obj* or modules included in *obj*.

    module M;    end
    class A
      include M
    end
    class B < A; end
    class C < B; end

    b = B.new
    b.is_a? A          #=> true
    b.is_a? B          #=> true
    b.is_a? C          #=> false
    b.is_a? M          #=> true

    b.kind_of? A       #=> true
    b.kind_of? B       #=> true
    b.kind_of? C       #=> false
    b.kind_of? M       #=> true

**@overload** [] 

**@overload** [] 

## lambda() [](#method-i-lambda)
Equivalent to Proc.new, except the resulting Proc objects check the number of
parameters passed when called.

**@overload** [] 

## local_variables() [](#method-i-local_variables)
Returns the names of the current local variables.

    fred = 1
    for i in 1..10
       # ...
    end
    local_variables   #=> [:fred, :i]

**@overload** [] 

## matching_methods(s'', mcallable_methods) [](#method-i-matching_methods)

## method(vid) [](#method-i-method)
Looks up the named method as a receiver in *obj*, returning a Method object
(or raising NameError). The Method object acts as a closure in *obj*'s object
instance, so instance variables and the value of `self` remain available.

    class Demo
      def initialize(n)
        @iv = n
      end
      def hello()
        "Hello, @iv = #{@iv}"
      end
    end

    k = Demo.new(99)
    m = k.method(:hello)
    m.call   #=> "Hello, @iv = 99"

    l = Demo.new('Fred')
    m = l.method("hello")
    m.call   #=> "Hello, @iv = Fred"

Note that Method implements `to_proc` method, which means it can be used with
iterators.

    [ 1, 2, 3 ].each(&method(:puts)) # => prints 3 lines to stdout

    out = File.open('test.txt', 'w')
    [ 1, 2, 3 ].each(&out.method(:puts)) # => prints 3 lines to file

    require 'date'
    %w[2017-03-01 2017-03-02].collect(&Date.method(:parse))
    #=> [#<Date: 2017-03-01 ((2457814j,0s,0n),+0s,2299161j)>, #<Date: 2017-03-02 ((2457815j,0s,0n),+0s,2299161j)>]

**@overload** [] 

## method_missing(m, *a, &b) [](#method-i-method_missing)

## methods(*args) [](#method-i-methods)
Returns a list of the names of public and protected methods of *obj*. This
will include all the methods accessible in *obj*'s ancestors. If the optional
parameter is `false`, it returns an array of *obj*'s public and protected
singleton methods, the array will not include methods in modules included in
*obj*.

    class Klass
      def klass_method()
      end
    end
    k = Klass.new
    k.methods[0..9]    #=> [:klass_method, :nil?, :===,
                       #    :==~, :!, :eql?
                       #    :hash, :<=>, :class, :singleton_class]
    k.methods.length   #=> 56

    k.methods(false)   #=> []
    def k.singleton_method; end
    k.methods(false)   #=> [:singleton_method]

    module M123; def m123; end end
    k.extend M123
    k.methods(false)   #=> [:singleton_method]

**@overload** [] 

## module_specs_protected_method_on_object() [](#method-i-module_specs_protected_method_on_object)

## module_specs_public_method_on_kernel() [](#method-i-module_specs_public_method_on_kernel)

## module_specs_public_method_on_object() [](#method-i-module_specs_public_method_on_object)

## module_specs_public_method_on_object_for_kernel_private() [](#method-i-module_specs_public_method_on_object_for_kernel_private)

## module_specs_public_method_on_object_for_kernel_protected() [](#method-i-module_specs_public_method_on_object_for_kernel_protected)

## nil?() [](#method-i-nil?)
Only the object *nil* responds `true` to `nil?`.

    Object.new.nil?   #=> false
    nil.nil?          #=> true

**@overload** [] 

## object_id() [](#method-i-object_id)
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

## open(*args) [](#method-i-open)
Creates an IO object connected to the given file.

This method has potential security vulnerabilities if called with untrusted
input; see [Command Injection](rdoc-ref:command_injection.rdoc).

With no block given, file stream is returned:

    open('t.txt') # => #<File:t.txt>

With a block given, calls the block with the open file stream, then closes the
stream:

    open('t.txt') {|f| p f } # => #<File:t.txt (closed)>

Output:

    #<File:t.txt>

See File.open for details.

**@overload** [] 

**@overload** [] 

## p(*args) [](#method-i-p)
For each object `obj`, executes:

    $stdout.write(obj.inspect, "\n")

With one object given, returns the object; with multiple objects given,
returns an array containing the objects; with no object given, returns `nil`.

Examples:

    r = Range.new(0, 4)
    p r                 # => 0..4
    p [r, r, r]         # => [0..4, 0..4, 0..4]
    p                   # => nil

Output:

    0..4
    [0..4, 0..4, 0..4]

Kernel#p is designed for debugging purposes. Ruby implementations may define
Kernel#p to be uninterruptible in whole or in part. On CRuby, Kernel#p's
writing of data is uninterruptible.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## pack_format(countnil, repeatnil) [](#method-i-pack_format)
This helper is defined here rather than in MSpec because it is only used in
#pack specs.

## pretty_inspect() [](#method-i-pretty_inspect)
Returns a pretty printed object as a string.

See the PP module for more information.

## pretty_print(q) [](#method-i-pretty_print)
A default pretty printing method for general objects. It calls
#pretty_print_instance_variables to list instance variables.

If `self` has a customized (redefined) #inspect method, the result of
self.inspect is used but it obviously has no line break hints.

This module provides predefined #pretty_print methods for some of the most
commonly used built-in classes for convenience.

## pretty_print_cycle(q) [](#method-i-pretty_print_cycle)
A default pretty printing method for general objects that are detected as part
of a cycle.

## pretty_print_inspect() [](#method-i-pretty_print_inspect)
Is #inspect implementation using #pretty_print. If you implement
#pretty_print, it can be used as follows.

    alias inspect pretty_print_inspect

However, doing this requires that every class that #inspect is called on
implement #pretty_print, or a RuntimeError will be raised.

## pretty_print_instance_variables() [](#method-i-pretty_print_instance_variables)
Returns a sorted array of instance variable names.

This method should return an array of names of instance variables as symbols
or strings as: +[:@a, :@b]+.

## print(*args) [](#method-i-print)
Equivalent to `$stdout.print(*objects)`, this method is the straightforward
way to write to `$stdout`.

Writes the given objects to `$stdout`; returns `nil`. Appends the output
record separator `$OUTPUT_RECORD_SEPARATOR` `$\`), if it is not `nil`.

With argument `objects` given, for each object:

*   Converts via its method `to_s` if not a string.
*   Writes to `stdout`.
*   If not the last object, writes the output field separator
    `$OUTPUT_FIELD_SEPARATOR` (`$,` if it is not `nil`.

With default separators:

    objects = [0, 0.0, Rational(0, 1), Complex(0, 0), :zero, 'zero']
    $OUTPUT_RECORD_SEPARATOR
    $OUTPUT_FIELD_SEPARATOR
    print(*objects)

Output:

    nil
    nil
    00.00/10+0izerozero

With specified separators:

    $OUTPUT_RECORD_SEPARATOR = "\n"
    $OUTPUT_FIELD_SEPARATOR = ','
    print(*objects)

Output:

    0,0.0,0/1,0+0i,zero,zero

With no argument given, writes the content of `$_` (which is usually the most
recent user input):

    gets  # Sets $_ to the most recent user input.
    print # Prints $_.

**@overload** [] 

## printf(*args) [](#method-i-printf)
Equivalent to:

    io.write(sprintf(format_string, *objects))

For details on `format_string`, see [Format
Specifications](rdoc-ref:format_specifications.rdoc).

With the single argument `format_string`, formats `objects` into the string,
then writes the formatted string to $stdout:

    printf('%4.4d %10s %2.2f', 24, 24, 24.0)

Output (on $stdout):

    0024         24 24.00#

With arguments `io` and `format_string`, formats `objects` into the string,
then writes the formatted string to `io`:

    printf($stderr, '%4.4d %10s %2.2f', 24, 24, 24.0)

Output (on $stderr):

    0024         24 24.00# => nil

With no arguments, does nothing.

**@overload** [] 

**@overload** [] 

## private_methods(*args) [](#method-i-private_methods)
Returns the list of private methods accessible to *obj*. If the *all*
parameter is set to `false`, only those methods in the receiver will be
listed.

**@overload** [] 

## proc() [](#method-i-proc)
Equivalent to Proc.new.

**@overload** [] 

## protected_methods(*args) [](#method-i-protected_methods)
Returns the list of protected methods accessible to *obj*. If the *all*
parameter is set to `false`, only those methods in the receiver will be
listed.

**@overload** [] 

## public_method(vid) [](#method-i-public_method)
Similar to *method*, searches public method only.

**@overload** [] 

## public_methods(*args) [](#method-i-public_methods)
Returns the list of public methods accessible to *obj*. If the *all* parameter
is set to `false`, only those methods in the receiver will be listed.

**@overload** [] 

## public_send(*args) [](#method-i-public_send)
Invokes the method identified by *symbol*, passing it any arguments specified.
Unlike send, public_send calls public methods only. When the method is
identified by a string, the string is converted to a symbol.

    1.public_send(:puts, "hello")  # causes NoMethodError

**@overload** [] 

**@overload** [] 

## putc(ch) [](#method-i-putc)
Equivalent to:

    $stdout.putc(int)

See IO#putc for important information regarding multi-byte characters.

**@overload** [] 

## puts(*args) [](#method-i-puts)
Equivalent to

    $stdout.puts(objects)

**@overload** [] 

## raise(*v, _) [](#method-i-raise)
Raises an exception; see [Exceptions](rdoc-ref:exceptions.md).

Argument `exception` sets the class of the new exception; it should be class
Exception or one of its subclasses (most commonly, RuntimeError or
StandardError), or an instance of one of those classes:

    begin
      raise(StandardError)
    rescue => x
      p x.class
    end
    # => StandardError

Argument `message` sets the stored message in the new exception, which may be
retrieved by method Exception#message; the message must be a
[string-convertible
object](rdoc-ref:implicit_conversion.rdoc@String-Convertible+Objects) or
`nil`:

    begin
      raise(StandardError, 'Boom')
    rescue => x
      p x.message
    end
    # => "Boom"

If argument `message` is not given, the message is the exception class name.

See [Messages](rdoc-ref:exceptions.md@Messages).

Argument `backtrace` might be used to modify the backtrace of the new
exception, as reported by Exception#backtrace and
Exception#backtrace_locations; the backtrace must be an array of
Thread::Backtrace::Location, an array of strings, a single string, or `nil`.

Using the array of Thread::Backtrace::Location instances is the most
consistent option and should be preferred when possible. The necessary value
might be obtained from #caller_locations, or copied from
Exception#backtrace_locations of another error:

    begin
      do_some_work()
    rescue ZeroDivisionError => ex
      raise(LogicalError, "You have an error in your math", ex.backtrace_locations)
    end

The ways, both Exception#backtrace and Exception#backtrace_locations of the
raised error are set to the same backtrace.

When the desired stack of locations is not available and should be constructed
from scratch, an array of strings or a singular string can be used. In this
case, only Exception#backtrace is set:

    begin
      raise(StandardError, 'Boom', %w[dsl.rb:3 framework.rb:1])
    rescue => ex
      p ex.backtrace
      # => ["dsl.rb:3", "framework.rb:1"]
      p ex.backtrace_locations
      # => nil
    end

If argument `backtrace` is not given, the backtrace is set according to an
array of Thread::Backtrace::Location objects, as derived from the call stack.

See [Backtraces](rdoc-ref:exceptions.md@Backtraces).

Keyword argument `cause` sets the stored cause in the new exception, which may
be retrieved by method Exception#cause; the cause must be an exception object
(Exception or one of its subclasses), or `nil`:

    begin
      raise(StandardError, cause: RuntimeError.new)
    rescue => x
      p x.cause
    end
    # => #<RuntimeError: RuntimeError>

If keyword argument `cause` is not given, the cause is the value of `$!`.

See [Cause](rdoc-ref:exceptions.md@Cause).

In the alternate calling sequence, where argument `exception` *not* given,
raises a new exception of the class given by `$!`, or of class RuntimeError if
`$!` is `nil`:

    begin
      raise
    rescue => x
      p x
    end
    # => RuntimeError

With argument `exception` not given, argument `message` and keyword argument
`cause` may be given, but argument `backtrace` may not be given.

**@overload** [] 

**@overload** [] 

## rand(*args) [](#method-i-rand)
If called without an argument, or if `max.to_i.abs == 0`, rand returns a
pseudo-random floating point number between 0.0 and 1.0, including 0.0 and
excluding 1.0.

    rand        #=> 0.2725926052826416

When `max.abs` is greater than or equal to 1, `rand` returns a pseudo-random
integer greater than or equal to 0 and less than `max.to_i.abs`.

    rand(100)   #=> 12

When `max` is a Range, `rand` returns a random number where
`range.member?(number) == true`.

Negative or floating point values for `max` are allowed, but may give
surprising results.

    rand(-100) # => 87
    rand(-0.5) # => 0.8130921818028143
    rand(1.9)  # equivalent to rand(1), which is always 0

Kernel.srand may be used to ensure that sequences of random numbers are
reproducible between different runs of a program.

See also Random.rand.

**@overload** [] 

## rb_eval_string(str) [](#method-i-rb_eval_string)

## readline(*args) [](#method-i-readline)
Equivalent to method Kernel#gets, except that it raises an exception if called
at end-of-stream:

    $ cat t.txt | ruby -e "p readlines; readline"
    ["First line\n", "Second line\n", "\n", "Fourth line\n", "Fifth line\n"]
    in `readline': end of file reached (EOFError)

Optional keyword argument `chomp` specifies whether line separators are to be
omitted.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## readlines(*args) [](#method-i-readlines)
Returns an array containing the lines returned by calling Kernel#gets until
the end-of-stream is reached; (see [Line IO](rdoc-ref:IO@Line+IO)).

With only string argument `sep` given, returns the remaining lines as
determined by line separator `sep`, or `nil` if none; see [Line
Separator](rdoc-ref:IO@Line+Separator):

    # Default separator.
    $ cat t.txt | ruby -e "p readlines"
    ["First line\n", "Second line\n", "\n", "Fourth line\n", "Fifth line\n"]

    # Specified separator.
    $ cat t.txt | ruby -e "p readlines 'li'"
    ["First li", "ne\nSecond li", "ne\n\nFourth li", "ne\nFifth li", "ne\n"]

    # Get-all separator.
    $ cat t.txt | ruby -e "p readlines nil"
    ["First line\nSecond line\n\nFourth line\nFifth line\n"]

    # Get-paragraph separator.
    $ cat t.txt | ruby -e "p readlines ''"
    ["First line\nSecond line\n\n", "Fourth line\nFifth line\n"]

With only integer argument `limit` given, limits the number of bytes in the
line; see [Line Limit](rdoc-ref:IO@Line+Limit):

    $cat t.txt | ruby -e "p readlines 10"
    ["First line", "\n", "Second lin", "e\n", "\n", "Fourth lin", "e\n", "Fifth line", "\n"]

    $cat t.txt | ruby -e "p readlines 11"
    ["First line\n", "Second line", "\n", "\n", "Fourth line", "\n", "Fifth line\n"]

    $cat t.txt | ruby -e "p readlines 12"
    ["First line\n", "Second line\n", "\n", "Fourth line\n", "Fifth line\n"]

With arguments `sep` and `limit` given, combines the two behaviors (see [Line
Separator and Line Limit](rdoc-ref:IO@Line+Separator+and+Line+Limit)).

Optional keyword argument `chomp` specifies whether line separators are to be
omitted:

    $ cat t.txt | ruby -e "p readlines(chomp: true)"
    ["First line", "Second line", "", "Fourth line", "Fifth line"]

Optional keyword arguments `enc_opts` specify encoding options; see [Encoding
options](rdoc-ref:encodings.rdoc@Encoding+Options).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## register_sample_bug_reporter(obj) [](#method-i-register_sample_bug_reporter)

## remove_instance_variable() [](#method-i-remove_instance_variable)

## respond_to?(*args) [](#method-i-respond_to?)
Returns `true` if *obj* responds to the given method.  Private and protected
methods are included in the search only if the optional second parameter
evaluates to `true`.

If the method is not implemented, as Process.fork on Windows, File.lchmod on
GNU/Linux, etc., false is returned.

If the method is not defined, `respond_to_missing?` method is called and the
result is returned.

When the method name parameter is given as a string, the string is converted
to a symbol.

**@overload** [] 

**@overload** [] 

## respond_to_missing?(mid, priv) [](#method-i-respond_to_missing?)
DO NOT USE THIS DIRECTLY.

Hook method to return whether the *obj* can respond to *id* method or not.

When the method name parameter is given as a string, the string is converted
to a symbol.

See #respond_to?, and the example of BasicObject.

**@overload** [] 

**@overload** [] 

## select(*args) [](#method-i-select)
Invokes system call [select(2)](https://linux.die.net/man/2/select), which
monitors multiple file descriptors, waiting until one or more of the file
descriptors becomes ready for some class of I/O operation.

Not implemented on all platforms.

Each of the arguments `read_ios`, `write_ios`, and `error_ios` is an array of
IO objects.

Argument `timeout` is a numeric value (such as integer or float) timeout
interval in seconds.

The method monitors the IO objects given in all three arrays, waiting for some
to be ready; returns a 3-element array whose elements are:

*   An array of the objects in `read_ios` that are ready for reading.
*   An array of the objects in `write_ios` that are ready for writing.
*   An array of the objects in `error_ios` have pending exceptions.

If no object becomes ready within the given `timeout`, `nil` is returned.

IO.select peeks the buffer of IO objects for testing readability. If the IO
buffer is not empty, IO.select immediately notifies readability.  This "peek"
only happens for IO objects.  It does not happen for IO-like objects such as
OpenSSL::SSL::SSLSocket.

The best way to use IO.select is invoking it after non-blocking methods such
as #read_nonblock, #write_nonblock, etc.  The methods raise an exception which
is extended by IO::WaitReadable or IO::WaitWritable.  The modules notify how
the caller should wait with IO.select.  If IO::WaitReadable is raised, the
caller should wait for reading.  If IO::WaitWritable is raised, the caller
should wait for writing.

So, blocking read (#readpartial) can be emulated using #read_nonblock and
IO.select as follows:

    begin
      result = io_like.read_nonblock(maxlen)
    rescue IO::WaitReadable
      IO.select([io_like])
      retry
    rescue IO::WaitWritable
      IO.select(nil, [io_like])
      retry
    end

Especially, the combination of non-blocking methods and IO.select is preferred
for IO like objects such as OpenSSL::SSL::SSLSocket.  It has #to_io method to
return underlying IO object.  IO.select calls #to_io to obtain the file
descriptor to wait.

This means that readability notified by IO.select doesn't mean readability
from OpenSSL::SSL::SSLSocket object.

The most likely situation is that OpenSSL::SSL::SSLSocket buffers some data. 
IO.select doesn't see the buffer.  So IO.select can block when
OpenSSL::SSL::SSLSocket#readpartial doesn't block.

However, several more complicated situations exist.

SSL is a protocol which is sequence of records. The record consists of
multiple bytes. So, the remote side of SSL sends a partial record, IO.select
notifies readability but OpenSSL::SSL::SSLSocket cannot decrypt a byte and
OpenSSL::SSL::SSLSocket#readpartial will block.

Also, the remote side can request SSL renegotiation which forces the local SSL
engine to write some data. This means OpenSSL::SSL::SSLSocket#readpartial may
invoke #write system call and it can block. In such a situation,
OpenSSL::SSL::SSLSocket#read_nonblock raises IO::WaitWritable instead of
blocking. So, the caller should wait for ready for writability as above
example.

The combination of non-blocking methods and IO.select is also useful for
streams such as tty, pipe socket socket when multiple processes read from a
stream.

Finally, Linux kernel developers don't guarantee that readability of select(2)
means readability of following read(2) even for a single process; see
[select(2)](https://linux.die.net/man/2/select)

Invoking IO.select before IO#readpartial works well as usual. However it is
not the best way to use IO.select.

The writability notified by select(2) doesn't show how many bytes are
writable. IO#write method blocks until given whole string is written. So,
`IO#write(two or more bytes)` can block after writability is notified by
IO.select.  IO#write_nonblock is required to avoid the blocking.

Blocking write (#write) can be emulated using #write_nonblock and IO.select as
follows: IO::WaitReadable should also be rescued for SSL renegotiation in
OpenSSL::SSL::SSLSocket.

    while 0 < string.bytesize
      begin
        written = io_like.write_nonblock(string)
      rescue IO::WaitReadable
        IO.select([io_like])
        retry
      rescue IO::WaitWritable
        IO.select(nil, [io_like])
        retry
      end
      string = string.byteslice(written..-1)
    end

Example:

    rp, wp = IO.pipe
    mesg = "ping "
    100.times {
      # IO.select follows IO#read.  Not the best way to use IO.select.
      rs, ws, = IO.select([rp], [wp])
      if r = rs[0]
        ret = r.read(5)
        print ret
        case ret
        when /ping/
          mesg = "pong\n"
        when /pong/
          mesg = "ping "
        end
      end
      if w = ws[0]
        w.write(mesg)
      end
    }

Output:

    ping pong
    ping pong
    ping pong
    (snipped)
    ping

**@overload** [] 

## send(*args) [](#method-i-send)
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

## set_trace_func(trace) [](#method-i-set_trace_func)
Establishes *proc* as the handler for tracing, or disables tracing if the
parameter is `nil`.

**Note:** this method is obsolete, please use TracePoint instead.

*proc* takes up to six parameters:

*   an event name string
*   a filename string
*   a line number
*   a method name symbol, or nil
*   a binding, or nil
*   the class, module, or nil

*proc* is invoked whenever an event occurs.

Events are:

`"c-call"`
:   call a C-language routine

`"c-return"`
:   return from a C-language routine

`"call"`
:   call a Ruby method

`"class"`
:   start a class or module definition

`"end"`
:   finish a class or module definition

`"line"`
:   execute code on a new line

`"raise"`
:   raise an exception

`"return"`
:   return from a Ruby method


Tracing is disabled within the context of *proc*.

    class Test
      def test
        a = 1
        b = 2
      end
    end

    set_trace_func proc { |event, file, line, id, binding, class_or_module|
      printf "%8s %s:%-2d %16p %14p\n", event, file, line, id, class_or_module
    }
    t = Test.new
    t.test

Produces:

    c-return prog.rb:8   :set_trace_func         Kernel
        line prog.rb:11              nil            nil
      c-call prog.rb:11             :new          Class
      c-call prog.rb:11      :initialize    BasicObject
    c-return prog.rb:11      :initialize    BasicObject
    c-return prog.rb:11             :new          Class
        line prog.rb:12              nil            nil
        call prog.rb:2             :test           Test
        line prog.rb:3             :test           Test
        line prog.rb:4             :test           Test
      return prog.rb:5             :test           Test

**@overload** [] 

**@overload** [] 

## shortest_abbreviation(s'', mcallable_methods) [](#method-i-shortest_abbreviation)

## should(matcherNO_MATCHER_GIVEN, &block) [](#method-i-should)

## should_not(matcherNO_MATCHER_GIVEN, &block) [](#method-i-should_not)

## should_not_receive(sym) [](#method-i-should_not_receive)

## should_receive(sym) [](#method-i-should_receive)

## singleton_class() [](#method-i-singleton_class)
Returns the singleton class of *obj*.  This method creates a new singleton
class if *obj* does not have one.

If *obj* is `nil`, `true`, or `false`, it returns NilClass, TrueClass, or
FalseClass, respectively. If *obj* is an Integer, a Float or a Symbol, it
raises a TypeError.

    Object.new.singleton_class  #=> #<Class:#<Object:0xb7ce1e24>>
    String.singleton_class      #=> #<Class:String>
    nil.singleton_class         #=> NilClass

**@overload** [] 

## singleton_method(vid) [](#method-i-singleton_method)
Similar to *method*, searches singleton method only.

    class Demo
      def initialize(n)
        @iv = n
      end
      def hello()
        "Hello, @iv = #{@iv}"
      end
    end

    k = Demo.new(99)
    def k.hi
      "Hi, @iv = #{@iv}"
    end
    m = k.singleton_method(:hi)
    m.call   #=> "Hi, @iv = 99"
    m = k.singleton_method(:hello) #=> NameError

**@overload** [] 

## singleton_methods(*args) [](#method-i-singleton_methods)
Returns an array of the names of singleton methods for *obj*. If the optional
*all* parameter is true, the list will include methods in modules included in
*obj*. Only public and protected singleton methods are returned.

    module Other
      def three() end
    end

    class Single
      def Single.four() end
    end

    a = Single.new

    def a.one()
    end

    class << a
      include Other
      def two()
      end
    end

    Single.singleton_methods    #=> [:four]
    a.singleton_methods(false)  #=> [:two, :one]
    a.singleton_methods         #=> [:two, :one, :three]

**@overload** [] 

## sleep(*args) [](#method-i-sleep)
Suspends execution of the current thread for the number of seconds specified
by numeric argument `secs`, or forever if `secs` is `nil`; returns the integer
number of seconds suspended (rounded).

    Time.new  # => 2008-03-08 19:56:19 +0900
    sleep 1.2 # => 1
    Time.new  # => 2008-03-08 19:56:20 +0900
    sleep 1.9 # => 2
    Time.new  # => 2008-03-08 19:56:22 +0900

**@overload** [] 

## spawn(*args) [](#method-i-spawn)
Creates a new child process by doing one of the following in that process:

*   Passing string `command_line` to the shell.
*   Invoking the executable at `exe_path`.

This method has potential security vulnerabilities if called with untrusted
input; see [Command Injection](rdoc-ref:command_injection.rdoc).

Returns the process ID (pid) of the new process, without waiting for it to
complete.

To avoid zombie processes, the parent process should call either:

*   Process.wait, to collect the termination statuses of its children.
*   Process.detach, to register disinterest in their status.

The new process is created using the [exec system
call](https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/e
xecve.html); it may inherit some of its environment from the calling program
(possibly including open file descriptors).

Argument `env`, if given, is a hash that affects `ENV` for the new process;
see [Execution Environment](rdoc-ref:Process@Execution+Environment).

Argument `options` is a hash of options for the new process; see [Execution
Options](rdoc-ref:Process@Execution+Options).

The first required argument is one of the following:

*   `command_line` if it is a string, and if it begins with a shell reserved
    word or special built-in, or if it contains one or more meta characters.
*   `exe_path` otherwise.

**Argument `command_line`**

String argument `command_line` is a command line to be passed to a shell; it
must begin with a shell reserved word, begin with a special built-in, or
contain meta characters:

    spawn('if true; then echo "Foo"; fi') # => 798847 # Shell reserved word.
    Process.wait                          # => 798847
    spawn('exit')                         # => 798848 # Built-in.
    Process.wait                          # => 798848
    spawn('date > /tmp/date.tmp')         # => 798879 # Contains meta character.
    Process.wait                          # => 798849
    spawn('date > /nop/date.tmp')         # => 798882 # Issues error message.
    Process.wait                          # => 798882

The command line may also contain arguments and options for the command:

    spawn('echo "Foo"') # => 799031
    Process.wait        # => 799031

Output:

    Foo

See [Execution Shell](rdoc-ref:Process@Execution+Shell) for details about the
shell.

Raises an exception if the new process could not execute.

**Argument `exe_path`**

Argument `exe_path` is one of the following:

*   The string path to an executable to be called.
*   A 2-element array containing the path to an executable to be called, and
    the string to be used as the name of the executing process.

        spawn('/usr/bin/date') # Path to date on Unix-style system.
        Process.wait

    Output:

        Mon Aug 28 11:43:10 AM CDT 2023

Ruby invokes the executable directly. This form does not use the shell; see
[Arguments args](rdoc-ref:Process@Arguments+args) for caveats.

If one or more `args` is given, each is an argument or option to be passed to
the executable:

    spawn('echo', 'C*')             # => 799392
    Process.wait                    # => 799392
    spawn('echo', 'hello', 'world') # => 799393
    Process.wait                    # => 799393

Output:

    C*
    hello world

Raises an exception if the new process could not execute.

**@overload** [] 

**@overload** [] 

## sprintf(*v, _) [](#method-i-sprintf)
Returns the string resulting from formatting `objects` into `format_string`.

For details on `format_string`, see [Format
Specifications](rdoc-ref:format_specifications.rdoc).

**@overload** [] 

## srand(*args) [](#method-i-srand)
Seeds the system pseudo-random number generator, with `number`. The previous
seed value is returned.

If `number` is omitted, seeds the generator using a source of entropy provided
by the operating system, if available (/dev/urandom on Unix systems or the RSA
cryptographic provider on Windows), which is then combined with the time, the
process id, and a sequence number.

srand may be used to ensure repeatable sequences of pseudo-random numbers
between different runs of the program. By setting the seed to a known value,
programs can be made deterministic during testing.

    srand 1234               # => 268519324636777531569100071560086917274
    [ rand, rand ]           # => [0.1915194503788923, 0.6221087710398319]
    [ rand(10), rand(1000) ] # => [4, 664]
    srand 1234               # => 1234
    [ rand, rand ]           # => [0.1915194503788923, 0.6221087710398319]

**@overload** [] 

## stub(name, val_or_callable, *block_args) [](#method-i-stub)

## stub!(sym) [](#method-i-stub!)

## sub(*args) [](#method-i-sub)
Equivalent to `$_.sub(*args*)`, except that `$_` will be updated if
substitution occurs. Available only when -p/-n command line option specified.

**@overload** [] 

**@overload** [] 

## syscall(*args) [](#method-i-syscall)
Invokes Posix system call [syscall(2)](https://linux.die.net/man/2/syscall),
which calls a specified function.

Calls the operating system function identified by `integer_callno`; returns
the result of the function or raises SystemCallError if it failed. The effect
of the call is platform-dependent. The arguments and returned value are
platform-dependent.

For each of `arguments`: if it is an integer, it is passed directly; if it is
a string, it is interpreted as a binary sequence of bytes. There may be as
many as nine such arguments.

Arguments `integer_callno` and `argument`, as well as the returned value, are
platform-dependent.

Note: Method `syscall` is essentially unsafe and unportable. The DL (Fiddle)
library is preferred for safer and a bit more portable programming.

Not implemented on all platforms.

**@overload** [] 

## system(*args) [](#method-i-system)
Creates a new child process by doing one of the following in that process:

*   Passing string `command_line` to the shell.
*   Invoking the executable at `exe_path`.

This method has potential security vulnerabilities if called with untrusted
input; see [Command Injection](rdoc-ref:command_injection.rdoc).

Returns:

*   `true` if the command exits with status zero.
*   `false` if the exit status is a non-zero integer.
*   `nil` if the command could not execute.

Raises an exception (instead of returning `false` or `nil`) if keyword
argument `exception` is set to `true`.

Assigns the command's error status to `$?`.

The new process is created using the [system system
call](https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/s
ystem.html); it may inherit some of its environment from the calling program
(possibly including open file descriptors).

Argument `env`, if given, is a hash that affects `ENV` for the new process;
see [Execution Environment](rdoc-ref:Process@Execution+Environment).

Argument `options` is a hash of options for the new process; see [Execution
Options](rdoc-ref:Process@Execution+Options).

The first required argument is one of the following:

*   `command_line` if it is a string, and if it begins with a shell reserved
    word or special built-in, or if it contains one or more meta characters.
*   `exe_path` otherwise.

**Argument `command_line`**

String argument `command_line` is a command line to be passed to a shell; it
must begin with a shell reserved word, begin with a special built-in, or
contain meta characters:

    system('if true; then echo "Foo"; fi')          # => true  # Shell reserved word.
    system('exit')                                  # => true  # Built-in.
    system('date > /tmp/date.tmp')                  # => true  # Contains meta character.
    system('date > /nop/date.tmp')                  # => false
    system('date > /nop/date.tmp', exception: true) # Raises RuntimeError.

Assigns the command's error status to `$?`:

    system('exit')                             # => true  # Built-in.
    $?                                         # => #<Process::Status: pid 640610 exit 0>
    system('date > /nop/date.tmp')             # => false
    $?                                         # => #<Process::Status: pid 640742 exit 2>

The command line may also contain arguments and options for the command:

    system('echo "Foo"') # => true

Output:

    Foo

See [Execution Shell](rdoc-ref:Process@Execution+Shell) for details about the
shell.

Raises an exception if the new process could not execute.

**Argument `exe_path`**

Argument `exe_path` is one of the following:

*   The string path to an executable to be called.
*   A 2-element array containing the path to an executable and the string to
    be used as the name of the executing process.

Example:

    system('/usr/bin/date') # => true # Path to date on Unix-style system.
    system('foo')           # => nil  # Command failed.

Output:

    Mon Aug 28 11:43:10 AM CDT 2023

Assigns the command's error status to `$?`:

    system('/usr/bin/date') # => true
    $?                      # => #<Process::Status: pid 645605 exit 0>
    system('foo')           # => nil
    $?                      # => #<Process::Status: pid 645608 exit 127>

Ruby invokes the executable directly. This form does not use the shell; see
[Arguments args](rdoc-ref:Process@Arguments+args) for caveats.

    system('doesnt_exist') # => nil

If one or more `args` is given, each is an argument or option to be passed to
the executable:

    system('echo', 'C*')             # => true
    system('echo', 'hello', 'world') # => true

Output:

    C*
    hello world

Raises an exception if the new process could not execute.

**@overload** [] 

**@overload** [] 

## tap() [](#method-i-tap)
call-seq:
       obj.tap {|x| block }    -> obj

    Yields self to the block and then returns self.
    The primary purpose of this method is to "tap into" a method chain,
    in order to perform operations on intermediate results within the chain.

       (1..10)                  .tap {|x| puts "original: #{x}" }
         .to_a                  .tap {|x| puts "array:    #{x}" }
         .select {|x| x.even? } .tap {|x| puts "evens:    #{x}" }
         .map {|x| x*x }        .tap {|x| puts "squares:  #{x}" }

-- private ++

**@yield** [_self] 

**@yieldparam** [Kernel] the object that the method was called on

## test(*args) [](#method-i-test)
:markup: markdown

call-seq:
    test(char, path0, path1 = nil) -> object

Performs a test on one or both of the *filesystem entities* at the given paths
`path0` and `path1`:

*   Each path `path0` or `path1` points to a file, directory, device, pipe,
    etc.
*   Character `char` selects a specific test.

The tests:

*   Each of these tests operates only on the entity at `path0`, and returns
    `true` or `false`; for a non-existent entity, returns `false` (does not
    raise exception):

        | Character    | Test                                                                      |
        |:------------:|:--------------------------------------------------------------------------|
        | <tt>'b'</tt> | Whether the entity is a block device.                                     |
        | <tt>'c'</tt> | Whether the entity is a character device.                                 |
        | <tt>'d'</tt> | Whether the entity is a directory.                                        |
        | <tt>'e'</tt> | Whether the entity is an existing entity.                                 |
        | <tt>'f'</tt> | Whether the entity is an existing regular file.                           |
        | <tt>'g'</tt> | Whether the entity's setgid bit is set.                                   |
        | <tt>'G'</tt> | Whether the entity's group ownership is equal to the caller's.            |
        | <tt>'k'</tt> | Whether the entity's sticky bit is set.                                   |
        | <tt>'l'</tt> | Whether the entity is a symbolic link.                                    |
        | <tt>'o'</tt> | Whether the entity is owned by the caller's effective uid.                |
        | <tt>'O'</tt> | Like <tt>'o'</tt>, but uses the real uid (not the effective uid).         |
        | <tt>'p'</tt> | Whether the entity is a FIFO device (named pipe).                         |
        | <tt>'r'</tt> | Whether the entity is readable by the caller's effective uid/gid.         |
        | <tt>'R'</tt> | Like <tt>'r'</tt>, but uses the real uid/gid (not the effective uid/gid). |
        | <tt>'S'</tt> | Whether the entity is a socket.                                           |
        | <tt>'u'</tt> | Whether the entity's setuid bit is set.                                   |
        | <tt>'w'</tt> | Whether the entity is writable by the caller's effective uid/gid.         |
        | <tt>'W'</tt> | Like <tt>'w'</tt>, but uses the real uid/gid (not the effective uid/gid). |
        | <tt>'x'</tt> | Whether the entity is executable by the caller's effective uid/gid.       |
        | <tt>'X'</tt> | Like <tt>'x'</tt>, but uses the real uid/gid (not the effective uid/git). |
        | <tt>'z'</tt> | Whether the entity exists and is of length zero.                          |

*   This test operates only on the entity at `path0`, and returns an integer
    size or `nil`:

        | Character    | Test                                                                                         |
        |:------------:|:---------------------------------------------------------------------------------------------|
        | <tt>'s'</tt> | Returns positive integer size if the entity exists and has non-zero length, +nil+ otherwise. |

*   Each of these tests operates only on the entity at `path0`, and returns a
    Time object; raises an exception if the entity does not exist:

        | Character    | Test                                   |
        |:------------:|:---------------------------------------|
        | <tt>'A'</tt> | Last access time for the entity.       |
        | <tt>'C'</tt> | Last change time for the entity.       |
        | <tt>'M'</tt> | Last modification time for the entity. |

*   Each of these tests operates on the modification time (`mtime`) of each of
    the entities at `path0` and `path1`, and returns a `true` or `false`;
    returns `false` if either entity does not exist:

        | Character    | Test                                                            |
        |:------------:|:----------------------------------------------------------------|
        | <tt>'<'</tt> | Whether the `mtime` at `path0` is less than that at `path1`.    |
        | <tt>'='</tt> | Whether the `mtime` at `path0` is equal to that at `path1`.     |
        | <tt>'>'</tt> | Whether the `mtime` at `path0` is greater than that at `path1`. |

*   This test operates on the content of each of the entities at `path0` and
    `path1`, and returns a `true` or `false`; returns `false` if either entity
    does not exist:

        | Character    | Test                                          |
        |:------------:|:----------------------------------------------|
        | <tt>'-'</tt> | Whether the entities exist and are identical. |

## then() [](#method-i-then)
call-seq:
       obj.then {|x| block }          -> an_object

    Yields self to the block and returns the result of the block.

       3.next.then {|x| x**x }.to_s             #=> "256"

    A good use of +then+ is value piping in method chains:

       require 'open-uri'
       require 'json'

       construct_url(arguments)
         .then {|url| URI(url).read }
         .then {|response| JSON.parse(response) }

    When called without a block, the method returns an +Enumerator+,
    which can be used, for example, for conditional
    circuit-breaking:

       # Meets condition, no-op
       1.then.detect(&:odd?)            # => 1
       # Does not meet condition, drop value
       2.then.detect(&:odd?)            # => nil

**@yield** [_self] 

**@yieldparam** [Kernel] the object that the method was called on

## throw(*args) [](#method-i-throw)
Transfers control to the end of the active `catch` block waiting for *tag*.
Raises `UncaughtThrowError` if there is no `catch` block for the *tag*. The
optional second parameter supplies a return value for the `catch` block, which
otherwise defaults to `nil`. For examples, see Kernel::catch.

**@overload** [] 

## to_enum(*args) [](#method-i-to_enum)
Creates a new Enumerator which will enumerate by calling `method` on `obj`,
passing `args` if any. What was *yielded* by method becomes values of
enumerator.

If a block is given, it will be used to calculate the size of the enumerator
without the need to iterate it (see Enumerator#size).

### Examples

    str = "xyz"

    enum = str.enum_for(:each_byte)
    enum.each { |b| puts b }
    # => 120
    # => 121
    # => 122

    # protect an array from being modified by some_method
    a = [1, 2, 3]
    some_method(a.to_enum)

    # String#split in block form is more memory-effective:
    very_large_string.split("|") { |chunk| return chunk if chunk.include?('DATE') }
    # This could be rewritten more idiomatically with to_enum:
    very_large_string.to_enum(:split, "|").lazy.grep(/DATE/).first

It is typical to call to_enum when defining methods for a generic Enumerable,
in case no block is passed.

Here is such an example, with parameter passing and a sizing block:

    module Enumerable
      # a generic method to repeat the values of any enumerable
      def repeat(n)
        raise ArgumentError, "#{n} is negative!" if n < 0
        unless block_given?
          return to_enum(__method__, n) do # __method__ is :repeat here
            sz = size     # Call size and multiply by n...
            sz * n if sz  # but return nil if size itself is nil
          end
        end
        each do |*val|
          n.times { yield *val }
        end
      end
    end

    %i[hello world].repeat(2) { |w| puts w }
      # => Prints 'hello', 'hello', 'world', 'world'
    enum = (1..14).repeat(3)
      # => returns an Enumerator when called without a block
    enum.first(4) # => [1, 1, 1, 2]
    enum.size # => 42

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns a string representing *obj*. The default #to_s prints the object's
class and an encoding of the object id. As a special case, the top-level
object that is the initial execution context of Ruby programs returns
``main''.

**@overload** [] 

## to_yaml(options{}) [](#method-i-to_yaml)
call-seq: to_yaml(options = {})

Convert an object to YAML.  See Psych.dump for more information on the
available `options`.

## trace_var(*a, _) [](#method-i-trace_var)
Controls tracing of assignments to global variables. The parameter `symbol`
identifies the variable (as either a string name or a symbol identifier).
*cmd* (which may be a string or a `Proc` object) or block is executed whenever
the variable is assigned. The block or `Proc` object receives the variable's
new value as a parameter. Also see #untrace_var.

    trace_var :$_, proc {|v| puts "$_ is now '#{v}'" }
    $_ = "hello"
    $_ = ' there'

*produces:*

    $_ is now 'hello'
    $_ is now ' there'

**@overload** [] 

**@overload** [] 

## trap(*args) [](#method-i-trap)
Specifies the handling of signals. The first parameter is a signal name (a
string such as ``SIGALRM'', ``SIGUSR1'', and so on) or a signal number. The
characters ``SIG'' may be omitted from the signal name. The command or block
specifies code to be run when the signal is raised. If the command is the
string ``IGNORE'' or ``SIG_IGN'', the signal will be ignored. If the command
is ``DEFAULT'' or ``SIG_DFL'', the Ruby's default handler will be invoked. If
the command is ``EXIT'', the script will be terminated by the signal. If the
command is ``SYSTEM_DEFAULT'', the operating system's default handler will be
invoked. Otherwise, the given command or block will be run. The special signal
name ``EXIT'' or signal number zero will be invoked just prior to program
termination. trap returns the previous handler for the given signal.

    Signal.trap(0, proc { puts "Terminating: #{$$}" })
    Signal.trap("CLD")  { puts "Child died" }
    fork && Process.wait

*produces:*
    Terminating: 27461
    Child died
    Terminating: 27460

**@overload** [] 

**@overload** [] 

## unpack_format(countnil, repeatnil) [](#method-i-unpack_format)
This helper is defined here rather than in MSpec because it is only used in
#unpack specs.

## untrace_var(*a, _) [](#method-i-untrace_var)
Removes tracing for the specified command on the given global variable and
returns `nil`. If no command is specified, removes all tracing for that
variable and returns an array containing the commands actually removed.

**@overload** [] 

