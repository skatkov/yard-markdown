# Class: Data
**Inherits:** Object
    

:nodoc:


# Class Methods
## define(*args ) [](#method-c-define)
Defines a new Data class.

       measure = Data.define(:amount, :unit)
       #=> #<Class:0x00007f70c6868498>
       measure.new(1, 'km')
       #=> #<data amount=1, unit="km">

       # It you store the new class in the constant, it will
       # affect #inspect and will be more natural to use:
       Measure = Data.define(:amount, :unit)
       #=> Measure
       Measure.new(1, 'km')
       #=> #<data Measure amount=1, unit="km">

    Note that member-less \Data is acceptable and might be a useful technique
    for defining several homogeneous data classes, like

       class HTTPFetcher
         Response = Data.define(:body)
         NotFound = Data.define
         # ... implementation
       end

    Now, different kinds of responses from +HTTPFetcher+ would have consistent
    representation:

        #<data HTTPFetcher::Response body="<html...">
        #<data HTTPFetcher::NotFound>

    And are convenient to use in pattern matching:

       case fetcher.get(url)
       in HTTPFetcher::Response(body)
         # process body variable
       in HTTPFetcher::NotFound
         # handle not found case
       end
**@overload** [] 

## members() [](#method-c-members)

#Instance Methods
## ==() [](#method-i-==)

## deconstruct() [](#method-i-deconstruct)

## deconstruct_keys() [](#method-i-deconstruct_keys)

## eql?() [](#method-i-eql?)

**@return** [Boolean] 

## hash() [](#method-i-hash)

## initialize(*args) [](#method-i-initialize)
::[](**kwargs) -> instance

    Constructors for classes defined with ::define accept both positional and
    keyword arguments.

       Measure = Data.define(:amount, :unit)

       Measure.new(1, 'km')
       #=> #<data Measure amount=1, unit="km">
       Measure.new(amount: 1, unit: 'km')
       #=> #<data Measure amount=1, unit="km">

       # Alternative shorter initialization with []
       Measure[1, 'km']
       #=> #<data Measure amount=1, unit="km">
       Measure[amount: 1, unit: 'km']
       #=> #<data Measure amount=1, unit="km">

    All arguments are mandatory (unlike Struct), and converted to keyword arguments:

       Measure.new(amount: 1)
       # in `initialize': missing keyword: :unit (ArgumentError)

       Measure.new(1)
       # in `initialize': missing keyword: :unit (ArgumentError)

    Note that <tt>Measure#initialize</tt> always receives keyword arguments, and that
    mandatory arguments are checked in +initialize+, not in +new+. This can be
    important for redefining initialize in order to convert arguments or provide
    defaults:

       Measure = Data.define(:amount, :unit) do
         NONE = Data.define

         def initialize(amount:, unit: NONE.new)
           super(amount: Float(amount), unit:)
         end
       end

       Measure.new('10', 'km') # => #<data Measure amount=10.0, unit="km">
       Measure.new(10_000)     # => #<data Measure amount=10000.0, unit=#<data NONE>>

**@overload** [] 

**@overload** [] 

## initialize_copy(s) [](#method-i-initialize_copy)
:nodoc:

## inspect() [](#method-i-inspect)
Returns a string representation of `self`:

    Measure = Data.define(:amount, :unit)

    distance = Measure[10, 'km']

    p distance  # uses #inspect underneath
    #<data Measure amount=10, unit="km">

    puts distance  # uses #to_s underneath, same representation
    #<data Measure amount=10, unit="km">

**@overload** [] 

**@overload** [] 

## members() [](#method-i-members)

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## pretty_print_cycle(q) [](#method-i-pretty_print_cycle)
:nodoc:

## to_h() [](#method-i-to_h)

## with(*args) [](#method-i-with)
Returns a shallow copy of `self` --- the instance variables of `self` are
copied, but not the objects they reference.

If the method is supplied any keyword arguments, the copy will be created with
the respective field values updated to use the supplied keyword argument
values. Note that it is an error to supply a keyword that the Data class does
not have as a member.

    Point = Data.define(:x, :y)

    origin = Point.new(x: 0, y: 0)

    up = origin.with(x: 1)
    right = origin.with(y: 1)
    up_and_right = up.with(y: 1)

    p origin       # #<data Point x=0, y=0>
    p up           # #<data Point x=1, y=0>
    p right        # #<data Point x=0, y=1>
    p up_and_right # #<data Point x=1, y=1>

    out = origin.with(z: 1) # ArgumentError: unknown keyword: :z
    some_point = origin.with(1, 2) # ArgumentError: expected keyword arguments, got positional arguments

**@overload** [] 

