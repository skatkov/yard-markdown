# Class: Symbol
**Inherits:** Object
    
**Includes:** Comparable
  

********************************************************************

    A +Symbol+ object represents a named identifier inside the Ruby interpreter.

    You can create a +Symbol+ object explicitly with:

    - A {symbol literal}[rdoc-ref:syntax/literals.rdoc@Symbol+Literals].

    The same +Symbol+ object will be
    created for a given name or string for the duration of a program's
    execution, regardless of the context or meaning of that name. Thus
    if <code>Fred</code> is a constant in one context, a method in
    another, and a class in a third, the +Symbol+ <code>:Fred</code>
    will be the same object in all three contexts.

        module One
          class Fred
          end
          $f1 = :Fred
        end
        module Two
          Fred = 1
          $f2 = :Fred
        end
        def Fred()
        end
        $f3 = :Fred
        $f1.object_id   #=> 2514190
        $f2.object_id   #=> 2514190
        $f3.object_id   #=> 2514190

    Constant, method, and variable names are returned as symbols:

        module One
          Two = 2
          def three; 3 end
          @four = 4
          @@five = 5
          $six = 6
        end
        seven = 7

        One.constants
        # => [:Two]
        One.instance_methods(true)
        # => [:three]
        One.instance_variables
        # => [:@four]
        One.class_variables
        # => [:@@five]
        global_variables.grep(/six/)
        # => [:$six]
        local_variables
        # => [:seven]

    A +Symbol+ object differs from a String object in that
    a +Symbol+ object represents an identifier, while a String object
    represents text or data.

    == What's Here

    First, what's elsewhere. \Class +Symbol+:

    - Inherits from {class Object}[rdoc-ref:Object@What-27s+Here].
    - Includes {module Comparable}[rdoc-ref:Comparable@What-27s+Here].

    Here, class +Symbol+ provides methods that are useful for:

    - {Querying}[rdoc-ref:Symbol@Methods+for+Querying]
    - {Comparing}[rdoc-ref:Symbol@Methods+for+Comparing]
    - {Converting}[rdoc-ref:Symbol@Methods+for+Converting]

    === Methods for Querying

    - ::all_symbols: Returns an array of the symbols currently in Ruby's symbol table.
    - #=~: Returns the index of the first substring in symbol that matches a
      given Regexp or other object; returns +nil+ if no match is found.
    - #[], #slice : Returns a substring of symbol
      determined by a given index, start/length, or range, or string.
    - #empty?: Returns +true+ if +self.length+ is zero; +false+ otherwise.
    - #encoding: Returns the Encoding object that represents the encoding
      of symbol.
    - #end_with?: Returns +true+ if symbol ends with
      any of the given strings.
    - #match: Returns a MatchData object if symbol
      matches a given Regexp; +nil+ otherwise.
    - #match?: Returns +true+ if symbol
      matches a given Regexp; +false+ otherwise.
    - #length, #size: Returns the number of characters in symbol.
    - #start_with?: Returns +true+ if symbol starts with
      any of the given strings.

    === Methods for Comparing

    - #<=>: Returns -1, 0, or 1 as a given symbol is smaller than, equal to,
      or larger than symbol.
    - #==, #===: Returns +true+ if a given symbol has the same content and
      encoding.
    - #casecmp: Ignoring case, returns -1, 0, or 1 as a given
      symbol is smaller than, equal to, or larger than symbol.
    - #casecmp?: Returns +true+ if symbol is equal to a given symbol
      after Unicode case folding; +false+ otherwise.

    === Methods for Converting

    - #capitalize: Returns symbol with the first character upcased
      and all other characters downcased.
    - #downcase: Returns symbol with all characters downcased.
    - #inspect: Returns the string representation of +self+ as a symbol literal.
    - #name: Returns the frozen string corresponding to symbol.
    - #succ, #next: Returns the symbol that is the successor to symbol.
    - #swapcase: Returns symbol with all upcase characters downcased
      and all downcase characters upcased.
    - #to_proc: Returns a Proc object which responds to the method named by symbol.
    - #to_s, #id2name: Returns the string corresponding to +self+.
    - #to_sym, #intern: Returns +self+.
    - #upcase: Returns symbol with all characters upcased.


# Class Methods
## all_symbols() [](#method-c-all_symbols)
Returns an array of all symbols currently in Ruby's symbol table:

    Symbol.all_symbols.size    # => 9334
    Symbol.all_symbols.take(3) # => [:!, :"\"", :"#"]
**@overload** [] 

## json_create(o ) [](#method-c-json_create)
See #as_json.

#Instance Methods
## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>(other) [](#method-i-<=>)
If `object` is a symbol, returns the equivalent of `symbol.to_s <=>
object.to_s`:

    :bar <=> :foo # => -1
    :foo <=> :foo # => 0
    :foo <=> :bar # => 1

Otherwise, returns `nil`:

    :foo <=> 'bar' # => nil

Related: String#<=>.

**@overload** [] 

## ==() [](#method-i-==)

## ===() [](#method-i-===)

## =~(other) [](#method-i-=~)
Equivalent to `symbol.to_s =~ object`, including possible updates to global
variables; see String#=~.

**@overload** [] 

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## [](*args) [](#method-i-[])
Equivalent to `symbol.to_s[]`; see String#[].

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## as_json() [](#method-i-as_json)
Methods `Symbol#as_json` and `Symbol.json_create` may be used to serialize and
deserialize a Symbol object; see [Marshal](rdoc-ref:Marshal).

Method `Symbol#as_json` serializes `self`, returning a 2-element hash
representing `self`:

    require 'json/add/symbol'
    x = :foo.as_json
    # => {"json_class"=>"Symbol", "s"=>"foo"}

Method `JSON.create` deserializes such a hash, returning a Symbol object:

    Symbol.json_create(x) # => :foo

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## call(*args, &block) [](#method-i-call)

## capitalize(*args) [](#method-i-capitalize)
Equivalent to `sym.to_s.capitalize.to_sym`.

See String#capitalize.

**@overload** [] 

## casecmp(other) [](#method-i-casecmp)
:include: doc/symbol/casecmp.rdoc

**@overload** [] 

## casecmp?(other) [](#method-i-casecmp?)
:include: doc/symbol/casecmp_p.rdoc

**@overload** [] 

## clamp(*args) [](#method-i-clamp)
In `(min, max)` form, returns *min* if *obj* `<=>` *min* is less than zero,
*max* if *obj* `<=>` *max* is greater than zero, and *obj* otherwise.

    12.clamp(0, 100)         #=> 12
    523.clamp(0, 100)        #=> 100
    -3.123.clamp(0, 100)     #=> 0

    'd'.clamp('a', 'f')      #=> 'd'
    'z'.clamp('a', 'f')      #=> 'f'

If *min* is `nil`, it is considered smaller than *obj*, and if *max* is `nil`,
it is considered greater than *obj*.

    -20.clamp(0, nil)           #=> 0
    523.clamp(nil, 100)         #=> 100

In `(range)` form, returns *range.begin* if *obj* `<=>` *range.begin* is less
than zero, *range.end* if *obj* `<=>` *range.end* is greater than zero, and
*obj* otherwise.

    12.clamp(0..100)         #=> 12
    523.clamp(0..100)        #=> 100
    -3.123.clamp(0..100)     #=> 0

    'd'.clamp('a'..'f')      #=> 'd'
    'z'.clamp('a'..'f')      #=> 'f'

If *range.begin* is `nil`, it is considered smaller than *obj*, and if
*range.end* is `nil`, it is considered greater than *obj*.

    -20.clamp(0..)           #=> 0
    523.clamp(..100)         #=> 100

When *range.end* is excluded and not `nil`, an exception is raised.

    100.clamp(0...100)       # ArgumentError

**@overload** [] 

**@overload** [] 

## downcase(*args) [](#method-i-downcase)
Equivalent to `sym.to_s.downcase.to_sym`.

See String#downcase.

Related: Symbol#upcase.

**@overload** [] 

## empty?() [](#method-i-empty?)
Returns `true` if `self` is `:''`, `false` otherwise.

**@overload** [] 

## encoding() [](#method-i-encoding)
Equivalent to `self.to_s.encoding`; see String#encoding.

**@overload** [] 

## end_with?(*args) [](#method-i-end_with?)
Equivalent to `self.to_s.end_with?`; see String#end_with?.

**@overload** [] 

## hash() [](#method-i-hash)

## inspect() [](#method-i-inspect)
Returns a string representation of `self` (including the leading colon):

    :foo.inspect # => ":foo"

Related:  Symbol#to_s, Symbol#name.

**@overload** [] 

## length() [](#method-i-length)
Equivalent to `self.to_s.length`; see String#length.

**@overload** [] 

## match(*args) [](#method-i-match)
Equivalent to `self.to_s.match`, including possible updates to global
variables; see String#match.

**@overload** [] 

**@overload** [] 

## match?(*args) [](#method-i-match?)
Equivalent to `sym.to_s.match?`; see String#match.

**@overload** [] 

## name() [](#method-i-name)
call-seq:
    name -> string

Returns a frozen string representation of `self` (not including the leading
colon):

    :foo.name         # => "foo"
    :foo.name.frozen? # => true

Related: Symbol#to_s, Symbol#inspect.

## next() [](#method-i-next)
Equivalent to `self.to_s.succ.to_sym`:

    :foo.succ # => :fop

Related: String#succ.

**@overload** [] 

## size() [](#method-i-size)
Equivalent to `self.to_s.length`; see String#length.

**@overload** [] 

## slice(*args) [](#method-i-slice)
Equivalent to `symbol.to_s[]`; see String#[].

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## start_with?(*args) [](#method-i-start_with?)
Equivalent to `self.to_s.start_with?`; see String#start_with?.

**@overload** [] 

## succ() [](#method-i-succ)
Equivalent to `self.to_s.succ.to_sym`:

    :foo.succ # => :fop

Related: String#succ.

**@overload** [] 

## swapcase(*args) [](#method-i-swapcase)
Equivalent to `sym.to_s.swapcase.to_sym`.

See String#swapcase.

**@overload** [] 

## to_json(*a) [](#method-i-to_json)
Returns a JSON string representing `self`:

    require 'json/add/symbol'
    puts :foo.to_json

Output:

    # {"json_class":"Symbol","s":"foo"}

## to_proc() [](#method-i-to_proc)
Returns a Proc object which calls the method with name of `self` on the first
parameter and passes the remaining parameters to the method.

    proc = :to_s.to_proc   # => #<Proc:0x000001afe0e48680(&:to_s) (lambda)>
    proc.call(1000)        # => "1000"
    proc.call(1000, 16)    # => "3e8"
    (1..3).collect(&:to_s) # => ["1", "2", "3"]

**@overload** [] 

## to_s() [](#method-i-to_s)
call-seq:
    to_s -> string

Returns a string representation of `self` (not including the leading colon):

    :foo.to_s # => "foo"

Related: Symbol#inspect, Symbol#name.

## to_sym() [](#method-i-to_sym)
call-seq:
    to_sym -> self

Returns `self`.

Related: String#to_sym.

## upcase(*args) [](#method-i-upcase)
Equivalent to `sym.to_s.upcase.to_sym`.

See String#upcase.

**@overload** [] 

