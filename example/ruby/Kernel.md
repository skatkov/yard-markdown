# Module: Kernel
    

-- Monkey patch kernel to ensure that all `require` calls call the same method
++


# Class Methods
## <internal:() [](#method-c-<internal:)
## Float(arg , exception: true) [](#method-c-Float)
call-seq:
       Float(arg, exception: true)    -> float or nil

    Returns <i>arg</i> converted to a float. Numeric types are
    converted directly, and with exception to String and
    <code>nil</code>, the rest are converted using
    <i>arg</i><code>.to_f</code>. Converting a String with invalid
    characters will result in an ArgumentError. Converting
    <code>nil</code> generates a TypeError. Exceptions can be
    suppressed by passing <code>exception: false</code>.

       Float(1)                 #=> 1.0
       Float("123.456")         #=> 123.456
       Float("123.0_badstring") #=> ArgumentError: invalid value for Float(): "123.0_badstring"
       Float(nil)               #=> TypeError: can't convert nil into Float
       Float("123.0_badstring", exception: false)  #=> nil
## Integer(arg , base 0, exception: true) [](#method-c-Integer)
call-seq:
    Integer(object, base = 0, exception: true) -> integer or nil

Returns an integer converted from `object`.

Tries to convert `object` to an integer using `to_int` first and `to_i`
second; see below for exceptions.

With a non-zero `base`, `object` must be a string or convertible to a string.

#### Numeric objects

With an integer argument `object` given, returns `object`:

    Integer(1)                # => 1
    Integer(-1)               # => -1

With a floating-point argument `object` given, returns `object` truncated to
an integer:

    Integer(1.9)              # => 1  # Rounds toward zero.
    Integer(-1.9)             # => -1 # Rounds toward zero.

#### String objects

With a string argument `object` and zero `base` given, returns `object`
converted to an integer in base 10:

    Integer('100')    # => 100
    Integer('-100')   # => -100

With `base` zero, string `object` may contain leading characters to specify
the actual base (radix indicator):

    Integer('0100')  # => 64  # Leading '0' specifies base 8.
    Integer('0b100') # => 4   # Leading '0b' specifies base 2.
    Integer('0x100') # => 256 # Leading '0x' specifies base 16.

With a positive `base` (in range 2..36) given, returns `object` converted to
an integer in the given base:

    Integer('100', 2)   # => 4
    Integer('100', 8)   # => 64
    Integer('-100', 16) # => -256

With a negative `base` (in range -36..-2) given, returns `object` converted to
the radix indicator if it exists or `base`:

    Integer('0x100', -2)   # => 256
    Integer('100', -2)     # => 4
    Integer('0b100', -8)   # => 4
    Integer('100', -8)     # => 64
    Integer('0o100', -10)  # => 64
    Integer('100', -10)    # => 100

`base` -1 is equivalent to the -10 case.

When converting strings, surrounding whitespace and embedded underscores are
allowed and ignored:

    Integer(' 100 ')      # => 100
    Integer('-1_0_0', 16) # => -256

#### Other classes

Examples with `object` of various other classes:

    Integer(Rational(9, 10)) # => 0  # Rounds toward zero.
    Integer(Complex(2, 0))   # => 2  # Imaginary part must be zero.
    Integer(Time.now)        # => 1650974042

#### Keywords

With the optional keyword argument `exception` given as `true` (the default):

*   Raises TypeError if `object` does not respond to `to_int` or `to_i`.
*   Raises TypeError if `object` is `nil`.
*   Raises ArgumentError if `object` is an invalid string.

With `exception` given as `false`, an exception of any kind is suppressed and
`nil` is returned.
## URI(uri ) [](#method-c-URI)
Returns a URI object derived from the given `uri`, which may be a URI string
or an existing URI object:

    # Returns a new URI.
    uri = URI('http://github.com/ruby/ruby')
    # => #<URI::HTTP http://github.com/ruby/ruby>
    # Returns the given URI.
    URI(uri)
    # => #<URI::HTTP http://github.com/ruby/ruby>
## l!() [](#method-c-l!)
## load(file , wrap false) [](#method-c-load)
## loop() [](#method-c-loop)
call-seq:
    loop { block }
    loop            -> an_enumerator

Repeatedly executes the block.

If no block is given, an enumerator is returned instead.

    loop do
      print "Input: "
      line = gets
      break if !line or line =~ /^q/i
      # ...
    end

A StopIteration raised in the block breaks the loop. In this case, loop
returns the "result" value stored in the exception.

    enum = Enumerator.new { |y|
      y << "one"
      y << "two"
      :ok
    }

    result = loop {
      puts enum.next
    } #=> :ok
## pp(*objs ) [](#method-c-pp)
prints arguments in pretty form.

`#pp` returns argument(s).
## require(file ) [](#method-c-require)
## require_relative(file ) [](#method-c-require_relative)
## syntax_suggest_original_load() [](#method-c-syntax_suggest_original_load)
## syntax_suggest_original_require() [](#method-c-syntax_suggest_original_require)
## syntax_suggest_original_require_relative() [](#method-c-syntax_suggest_original_require_relative)
## uplevel() [](#method-c-uplevel)
## warn(*msgs , uplevel: nil, category: nil) [](#method-c-warn)
call-seq:
    warn(*msgs, uplevel: nil, category: nil)   -> nil

If warnings have been disabled (for example with the `-W0` flag), does
nothing.  Otherwise, converts each of the messages to strings, appends a
newline character to the string if the string does not end in a newline, and
calls Warning.warn with the string.

    warn("warning 1", "warning 2")

*produces:*

    warning 1
    warning 2

If the `uplevel` keyword argument is given, the string will be prepended with
information for the given caller frame in the same format used by the
`rb_warn` C function.

    # In baz.rb
    def foo
      warn("invalid call to foo", uplevel: 1)
    end

    def bar
      foo
    end

    bar

*produces:*

    baz.rb:6: warning: invalid call to foo

If `category` keyword argument is given, passes the category to
`Warning.warn`.  The category given must be one of the following categories:

:deprecated
:   Used for warning for deprecated functionality that may be removed in the
    future.

:experimental
:   Used for experimental features that may change in future releases.

:performance
:   Used for warning about APIs or pattern that have negative performance
    impact


#Instance Methods
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

## iterator?() [](#method-i-iterator?)
Deprecated.  Use block_given? instead.

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

## module_specs_public_method_on_kernel() [](#method-i-module_specs_public_method_on_kernel)

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

## pretty_inspect() [](#method-i-pretty_inspect)
Returns a pretty printed object as a string.

See the PP module for more information.

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

## proc() [](#method-i-proc)
Equivalent to Proc.new.

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

## untrace_var(*a, _) [](#method-i-untrace_var)
Removes tracing for the specified command on the given global variable and
returns `nil`. If no command is specified, removes all tracing for that
variable and returns an array containing the commands actually removed.

**@overload** [] 

