# Class: Complex
**Inherits:** Numeric
    

A Complex object houses a pair of values, given when the object is created as
either *rectangular coordinates* or *polar coordinates*.

## Rectangular Coordinates

The rectangular coordinates of a complex number are called the *real* and
*imaginary* parts; see [Complex number
definition](https://en.wikipedia.org/wiki/Complex_number#Definition_and_basic_
operations).

You can create a Complex object from rectangular coordinates with:

*   A [complex literal](rdoc-ref:syntax/literals.rdoc@Complex+Literals).
*   Method Complex.rect.
*   Method Kernel#Complex, either with numeric arguments or with certain
    string arguments.
*   Method String#to_c, for certain strings.

Note that each of the stored parts may be a an instance one of the classes
Complex, Float, Integer, or Rational; they may be retrieved:

*   Separately, with methods Complex#real and Complex#imaginary.
*   Together, with method Complex#rect.

The corresponding (computed) polar values may be retrieved:

*   Separately, with methods Complex#abs and Complex#arg.
*   Together, with method Complex#polar.

## Polar Coordinates

The polar coordinates of a complex number are called the *absolute* and
*argument* parts; see [Complex polar
plane](https://en.wikipedia.org/wiki/Complex_number#Polar_form).

In this class, the argument part in expressed
[radians](https://en.wikipedia.org/wiki/Radian) (not
[degrees](https://en.wikipedia.org/wiki/Degree_(angle))).

You can create a Complex object from polar coordinates with:

*   Method Complex.polar.
*   Method Kernel#Complex, with certain string arguments.
*   Method String#to_c, for certain strings.

Note that each of the stored parts may be a an instance one of the classes
Complex, Float, Integer, or Rational; they may be retrieved:

*   Separately, with methods Complex#abs and Complex#arg.
*   Together, with method Complex#polar.

The corresponding (computed) rectangular values may be retrieved:

*   Separately, with methods Complex#real and Complex#imag.
*   Together, with method Complex#rect.

## What's Here

First, what's elsewhere:

*   Class Complex inherits (directly or indirectly) from classes
    [Numeric](rdoc-ref:Numeric@What-27s+Here) and
    [Object](rdoc-ref:Object@What-27s+Here).
*   Includes (indirectly) module
    [Comparable](rdoc-ref:Comparable@What-27s+Here).

Here, class Complex has methods for:

### Creating Complex Objects

*   ::polar: Returns a new Complex object based on given polar coordinates.
*   ::rect (and its alias ::rectangular): Returns a new Complex object based
    on given rectangular coordinates.

### Querying

*   #abs (and its alias #magnitude): Returns the absolute value for `self`.
*   #arg (and its aliases #angle and #phase): Returns the argument (angle) for
    `self` in radians.
*   #denominator: Returns the denominator of `self`.
*   #finite?: Returns whether both `self.real` and `self.image` are finite.
*   #hash: Returns the integer hash value for `self`.
*   #imag (and its alias #imaginary): Returns the imaginary value for `self`.
*   #infinite?: Returns whether `self.real` or `self.image` is infinite.
*   #numerator: Returns the numerator of `self`.
*   #polar: Returns the array `[self.abs, self.arg]`.
*   #inspect: Returns a string representation of `self`.
*   #real: Returns the real value for `self`.
*   #real?: Returns `false`; for compatibility with Numeric#real?.
*   #rect (and its alias #rectangular): Returns the array `[self.real,
    self.imag]`.

### Comparing

*   #<=>: Returns whether `self` is less than, equal to, or greater than the
    given argument.
*   #==: Returns whether `self` is equal to the given argument.

### Converting

*   #rationalize: Returns a Rational object whose value is exactly or
    approximately equivalent to that of `self.real`.
*   #to_c: Returns `self`.
*   #to_d: Returns the value as a BigDecimal object.
*   #to_f: Returns the value of `self.real` as a Float, if possible.
*   #to_i: Returns the value of `self.real` as an Integer, if possible.
*   #to_r: Returns the value of `self.real` as a Rational, if possible.
*   #to_s: Returns a string representation of `self`.

### Performing Complex Arithmetic

*   #*: Returns the product of `self` and the given numeric.
*   #**: Returns `self` raised to power of the given numeric.
*   #+: Returns the sum of `self` and the given numeric.
*   #-: Returns the difference of `self` and the given numeric.
*   #-@: Returns the negation of `self`.
*   #/: Returns the quotient of `self` and the given numeric.
*   #abs2: Returns square of the absolute value (magnitude) for `self`.
*   #conj (and its alias #conjugate): Returns the conjugate of `self`.
*   #fdiv: Returns `Complex.rect(self.real/numeric, self.imag/numeric)`.

### Working with JSON

*   ::json_create: Returns a new Complex object, deserialized from the given
    serialized hash.
*   #as_json: Returns a serialized hash constructed from `self`.
*   #to_json: Returns a JSON string representing `self`.

These methods are provided by the [JSON gem](https://github.com/ruby/json). To
make these methods available:

    require 'json/add/complex'


# Class Methods
## json_create(object ) [](#method-c-json_create)
See #as_json.
## polar(*args ) [](#method-c-polar)
Returns a new Complex object formed from the arguments, each of which must be
an instance of Numeric, or an instance of one of its subclasses: Complex,
Float, Integer, Rational. Argument `arg` is given in radians; see [Polar
Coordinates](rdoc-ref:Complex@Polar+Coordinates):

    Complex.polar(3)        # => (3+0i)
    Complex.polar(3, 2.0)   # => (-1.2484405096414273+2.727892280477045i)
    Complex.polar(-3, -2.0) # => (1.2484405096414273+2.727892280477045i)
**@overload** [] 

## rect(*args ) [](#method-c-rect)
Returns a new Complex object formed from the arguments, each of which must be
an instance of Numeric, or an instance of one of its subclasses: Complex,
Float, Integer, Rational; see [Rectangular
Coordinates](rdoc-ref:Complex@Rectangular+Coordinates):

    Complex.rect(3)             # => (3+0i)
    Complex.rect(3, Math::PI)   # => (3+3.141592653589793i)
    Complex.rect(-3, -Math::PI) # => (-3-3.141592653589793i)

Complex.rectangular is an alias for Complex.rect.
**@overload** [] 

## rectangular(*args ) [](#method-c-rectangular)
Returns a new Complex object formed from the arguments, each of which must be
an instance of Numeric, or an instance of one of its subclasses: Complex,
Float, Integer, Rational; see [Rectangular
Coordinates](rdoc-ref:Complex@Rectangular+Coordinates):

    Complex.rect(3)             # => (3+0i)
    Complex.rect(3, Math::PI)   # => (3+3.141592653589793i)
    Complex.rect(-3, -Math::PI) # => (-3-3.141592653589793i)

Complex.rectangular is an alias for Complex.rect.
**@overload** [] 


#Instance Methods
## *(other) [](#method-i-*)
Returns the product of `self` and `numeric`:

    Complex.rect(2, 3)  * Complex.rect(2, 3)  # => (-5+12i)
    Complex.rect(900)   * Complex.rect(1)     # => (900+0i)
    Complex.rect(-2, 9) * Complex.rect(-9, 2) # => (0-85i)
    Complex.rect(9, 8)  * 4                   # => (36+32i)
    Complex.rect(20, 9) * 9.8                 # => (196.0+88.2i)

**@overload** [] 

## **(other) [](#method-i-**)
Returns `self` raised to power `numeric`:

    Complex.rect(0, 1) ** 2            # => (-1+0i)
    Complex.rect(-8) ** Rational(1, 3) # => (1.0000000000000002+1.7320508075688772i)

**@overload** [] 

## +(other) [](#method-i-+)
Returns the sum of `self` and `numeric`:

    Complex.rect(2, 3)  + Complex.rect(2, 3)  # => (4+6i)
    Complex.rect(900)   + Complex.rect(1)     # => (901+0i)
    Complex.rect(-2, 9) + Complex.rect(-9, 2) # => (-11+11i)
    Complex.rect(9, 8)  + 4                   # => (13+8i)
    Complex.rect(20, 9) + 9.8                 # => (29.8+9i)

**@overload** [] 

## -(other) [](#method-i--)
Returns the difference of `self` and `numeric`:

    Complex.rect(2, 3)  - Complex.rect(2, 3)  # => (0+0i)
    Complex.rect(900)   - Complex.rect(1)     # => (899+0i)
    Complex.rect(-2, 9) - Complex.rect(-9, 2) # => (7+7i)
    Complex.rect(9, 8)  - 4                   # => (5+8i)
    Complex.rect(20, 9) - 9.8                 # => (10.2+9i)

**@overload** [] 

## -@() [](#method-i--@)
Returns the negation of `self`, which is the negation of each of its parts:

    -Complex.rect(1, 2)   # => (-1-2i)
    -Complex.rect(-1, -2) # => (1+2i)

**@overload** [] 

## /(other) [](#method-i-/)
Returns the quotient of `self` and `numeric`:

    Complex.rect(2, 3)  / Complex.rect(2, 3)  # => (1+0i)
    Complex.rect(900)   / Complex.rect(1)     # => (900+0i)
    Complex.rect(-2, 9) / Complex.rect(-9, 2) # => ((36/85)-(77/85)*i)
    Complex.rect(9, 8)  / 4                   # => ((9/4)+2i)
    Complex.rect(20, 9) / 9.8                 # => (2.0408163265306123+0.9183673469387754i)

**@overload** [] 

## <=>(other) [](#method-i-<=>)
Returns:

*   `self.real <=> object.real` if both of the following are true:

    *   `self.imag == 0`.
    *   `object.imag == 0`. # Always true if object is numeric but not
        complex.

*   `nil` otherwise.

Examples:

    Complex.rect(2) <=> 3                  # => -1
    Complex.rect(2) <=> 2                  # => 0
    Complex.rect(2) <=> 1                  # => 1
    Complex.rect(2, 1) <=> 1               # => nil # self.imag not zero.
    Complex.rect(1) <=> Complex.rect(1, 1) # => nil # object.imag not zero.
    Complex.rect(1) <=> 'Foo'              # => nil # object.imag not defined.

**@overload** [] 

## ==(other) [](#method-i-==)
Returns `true` if `self.real == object.real` and `self.imag == object.imag`:

    Complex.rect(2, 3)  == Complex.rect(2.0, 3.0) # => true

**@overload** [] 

## abs() [](#method-i-abs)
Returns the absolute value (magnitude) for `self`; see [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates):

    Complex.polar(-1, 0).abs # => 1.0

If `self` was created with [rectangular
coordinates](rdoc-ref:Complex@Rectangular+Coordinates), the returned value is
computed, and may be inexact:

    Complex.rectangular(1, 1).abs # => 1.4142135623730951 # The square root of 2.

**@overload** [] 

## abs2() [](#method-i-abs2)
Returns square of the absolute value (magnitude) for `self`; see [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates):

    Complex.polar(2, 2).abs2 # => 4.0

If `self` was created with [rectangular
coordinates](rdoc-ref:Complex@Rectangular+Coordinates), the returned value is
computed, and may be inexact:

    Complex.rectangular(1.0/3, 1.0/3).abs2 # => 0.2222222222222222

**@overload** [] 

## angle() [](#method-i-angle)
Returns the argument (angle) for `self` in radians; see [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates):

    Complex.polar(3, Math::PI/2).arg  # => 1.57079632679489660

If `self` was created with [rectangular
coordinates](rdoc-ref:Complex@Rectangular+Coordinates), the returned value is
computed, and may be inexact:

    Complex.polar(1, 1.0/3).arg # => 0.33333333333333326

**@overload** [] 

## arg() [](#method-i-arg)
Returns the argument (angle) for `self` in radians; see [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates):

    Complex.polar(3, Math::PI/2).arg  # => 1.57079632679489660

If `self` was created with [rectangular
coordinates](rdoc-ref:Complex@Rectangular+Coordinates), the returned value is
computed, and may be inexact:

    Complex.polar(1, 1.0/3).arg # => 0.33333333333333326

**@overload** [] 

## as_json() [](#method-i-as_json)
Methods `Complex#as_json` and `Complex.json_create` may be used to serialize
and deserialize a Complex object; see [Marshal](rdoc-ref:Marshal).

Method `Complex#as_json` serializes `self`, returning a 2-element hash
representing `self`:

    require 'json/add/complex'
    x = Complex(2).as_json      # => {"json_class"=>"Complex", "r"=>2, "i"=>0}
    y = Complex(2.0, 4).as_json # => {"json_class"=>"Complex", "r"=>2.0, "i"=>4}

Method `JSON.create` deserializes such a hash, returning a Complex object:

    Complex.json_create(x) # => (2+0i)
    Complex.json_create(y) # => (2.0+4i)

## coerce(other) [](#method-i-coerce)
:nodoc:

## conj() [](#method-i-conj)
Returns the conjugate of `self`, `Complex.rect(self.imag, self.real)`:

    Complex.rect(1, 2).conj # => (1-2i)

**@overload** [] 

## conjugate() [](#method-i-conjugate)
Returns the conjugate of `self`, `Complex.rect(self.imag, self.real)`:

    Complex.rect(1, 2).conj # => (1-2i)

**@overload** [] 

## denominator() [](#method-i-denominator)
Returns the denominator of `self`, which is the [least common
multiple](https://en.wikipedia.org/wiki/Least_common_multiple) of
`self.real.denominator` and `self.imag.denominator`:

    Complex.rect(Rational(1, 2), Rational(2, 3)).denominator # => 6

Note that `n.denominator` of a non-rational numeric is `1`.

Related: Complex#numerator.

**@overload** [] 

## eql?(other) [](#method-i-eql?)
:nodoc:

**@return** [Boolean] 

## fdiv(other) [](#method-i-fdiv)
Returns `Complex.rect(self.real/numeric, self.imag/numeric)`:

    Complex.rect(11, 22).fdiv(3) # => (3.6666666666666665+7.333333333333333i)

**@overload** [] 

## finite?() [](#method-i-finite?)
Returns `true` if both `self.real.finite?` and `self.imag.finite?` are true,
`false` otherwise:

    Complex.rect(1, 1).finite?               # => true
    Complex.rect(Float::INFINITY, 0).finite? # => false

Related: Numeric#finite?, Float#finite?.

**@overload** [] 

## hash() [](#method-i-hash)
:call-seq:
    hash -> integer

Returns the integer hash value for `self`.

Two Complex objects created from the same values will have the same hash value
(and will compare using #eql?):

    Complex.rect(1, 2).hash == Complex.rect(1, 2).hash # => true

## imag() [](#method-i-imag)
Returns the imaginary value for `self`:

    Complex.rect(7).imag     # => 0
    Complex.rect(9, -4).imag # => -4

If `self` was created with [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates), the returned value is
computed, and may be inexact:

    Complex.polar(1, Math::PI/4).imag # => 0.7071067811865476 # Square root of 2.

**@overload** [] 

## imaginary() [](#method-i-imaginary)
Returns the imaginary value for `self`:

    Complex.rect(7).imag     # => 0
    Complex.rect(9, -4).imag # => -4

If `self` was created with [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates), the returned value is
computed, and may be inexact:

    Complex.polar(1, Math::PI/4).imag # => 0.7071067811865476 # Square root of 2.

**@overload** [] 

## infinite?() [](#method-i-infinite?)
Returns `1` if either `self.real.infinite?` or `self.imag.infinite?` is true,
`nil` otherwise:

    Complex.rect(Float::INFINITY, 0).infinite? # => 1
    Complex.rect(1, 1).infinite?               # => nil

Related: Numeric#infinite?, Float#infinite?.

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a string representation of `self`:

    Complex.rect(2).inspect                      # => "(2+0i)"
    Complex.rect(-8, 6).inspect                  # => "(-8+6i)"
    Complex.rect(0, Rational(1, 2)).inspect      # => "(0+(1/2)*i)"
    Complex.rect(0, Float::INFINITY).inspect     # => "(0+Infinity*i)"
    Complex.rect(Float::NAN, Float::NAN).inspect # => "(NaN+NaN*i)"

**@overload** [] 

## magnitude() [](#method-i-magnitude)
Returns the absolute value (magnitude) for `self`; see [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates):

    Complex.polar(-1, 0).abs # => 1.0

If `self` was created with [rectangular
coordinates](rdoc-ref:Complex@Rectangular+Coordinates), the returned value is
computed, and may be inexact:

    Complex.rectangular(1, 1).abs # => 1.4142135623730951 # The square root of 2.

**@overload** [] 

## numerator() [](#method-i-numerator)
Returns the Complex object created from the numerators of the real and
imaginary parts of `self`, after converting each part to the [lowest common
denominator](https://en.wikipedia.org/wiki/Lowest_common_denominator) of the
two:

    c = Complex.rect(Rational(2, 3), Rational(3, 4)) # => ((2/3)+(3/4)*i)
    c.numerator                                      # => (8+9i)

In this example, the lowest common denominator of the two parts is 12; the two
converted parts may be thought of as Rational(8, 12) and Rational(9, 12),
whose numerators, respectively, are 8 and 9; so the returned value of
`c.numerator` is `Complex.rect(8, 9)`.

Related: Complex#denominator.

**@overload** [] 

## phase() [](#method-i-phase)
Returns the argument (angle) for `self` in radians; see [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates):

    Complex.polar(3, Math::PI/2).arg  # => 1.57079632679489660

If `self` was created with [rectangular
coordinates](rdoc-ref:Complex@Rectangular+Coordinates), the returned value is
computed, and may be inexact:

    Complex.polar(1, 1.0/3).arg # => 0.33333333333333326

**@overload** [] 

## polar() [](#method-i-polar)
Returns the array `[self.abs, self.arg]`:

    Complex.polar(1, 2).polar # => [1.0, 2.0]

See [Polar Coordinates](rdoc-ref:Complex@Polar+Coordinates).

If `self` was created with [rectangular
coordinates](rdoc-ref:Complex@Rectangular+Coordinates), the returned value is
computed, and may be inexact:

    Complex.rect(1, 1).polar # => [1.4142135623730951, 0.7853981633974483]

**@overload** [] 

## quo() [](#method-i-quo)

## rationalize(*args) [](#method-i-rationalize)
Returns a Rational object whose value is exactly or approximately equivalent
to that of `self.real`.

With no argument `epsilon` given, returns a Rational object whose value is
exactly equal to that of `self.real.rationalize`:

    Complex.rect(1, 0).rationalize              # => (1/1)
    Complex.rect(1, Rational(0, 1)).rationalize # => (1/1)
    Complex.rect(3.14159, 0).rationalize        # => (314159/100000)

With argument `epsilon` given, returns a Rational object whose value is
exactly or approximately equal to that of `self.real` to the given precision:

    Complex.rect(3.14159, 0).rationalize(0.1)          # => (16/5)
    Complex.rect(3.14159, 0).rationalize(0.01)         # => (22/7)
    Complex.rect(3.14159, 0).rationalize(0.001)        # => (201/64)
    Complex.rect(3.14159, 0).rationalize(0.0001)       # => (333/106)
    Complex.rect(3.14159, 0).rationalize(0.00001)      # => (355/113)
    Complex.rect(3.14159, 0).rationalize(0.000001)     # => (7433/2366)
    Complex.rect(3.14159, 0).rationalize(0.0000001)    # => (9208/2931)
    Complex.rect(3.14159, 0).rationalize(0.00000001)   # => (47460/15107)
    Complex.rect(3.14159, 0).rationalize(0.000000001)  # => (76149/24239)
    Complex.rect(3.14159, 0).rationalize(0.0000000001) # => (314159/100000)
    Complex.rect(3.14159, 0).rationalize(0.0)          # => (3537115888337719/1125899906842624)

Related: Complex#to_r.

**@overload** [] 

## real() [](#method-i-real)
Returns the real value for `self`:

    Complex.rect(7).real     # => 7
    Complex.rect(9, -4).real # => 9

If `self` was created with [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates), the returned value is
computed, and may be inexact:

    Complex.polar(1, Math::PI/4).real # => 0.7071067811865476 # Square root of 2.

**@overload** [] 

## real?() [](#method-i-real?)
Returns `false`; for compatibility with Numeric#real?.

**@overload** [] 

## rect() [](#method-i-rect)
Returns the array `[self.real, self.imag]`:

    Complex.rect(1, 2).rect # => [1, 2]

See [Rectangular Coordinates](rdoc-ref:Complex@Rectangular+Coordinates).

If `self` was created with [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates), the returned value is
computed, and may be inexact:

    Complex.polar(1.0, 1.0).rect # => [0.5403023058681398, 0.8414709848078965]

Complex#rectangular is an alias for Complex#rect.

**@overload** [] 

## rectangular() [](#method-i-rectangular)
Returns the array `[self.real, self.imag]`:

    Complex.rect(1, 2).rect # => [1, 2]

See [Rectangular Coordinates](rdoc-ref:Complex@Rectangular+Coordinates).

If `self` was created with [polar
coordinates](rdoc-ref:Complex@Polar+Coordinates), the returned value is
computed, and may be inexact:

    Complex.polar(1.0, 1.0).rect # => [0.5403023058681398, 0.8414709848078965]

Complex#rectangular is an alias for Complex#rect.

**@overload** [] 

## to_c() [](#method-i-to_c)
Returns `self`.

**@overload** [] 

## to_f() [](#method-i-to_f)
Returns the value of `self.real` as a Float, if possible:

    Complex.rect(1, 0).to_f              # => 1.0
    Complex.rect(1, Rational(0, 1)).to_f # => 1.0

Raises RangeError if `self.imag` is not exactly zero (either `Integer(0)` or
`Rational(0, *n*)`).

**@overload** [] 

## to_i() [](#method-i-to_i)
Returns the value of `self.real` as an Integer, if possible:

    Complex.rect(1, 0).to_i              # => 1
    Complex.rect(1, Rational(0, 1)).to_i # => 1

Raises RangeError if `self.imag` is not exactly zero (either `Integer(0)` or
`Rational(0, *n*)`).

**@overload** [] 

## to_json(*args) [](#method-i-to_json)
Returns a JSON string representing `self`:

    require 'json/add/complex'
    puts Complex(2).to_json
    puts Complex(2.0, 4).to_json

Output:

    {"json_class":"Complex","r":2,"i":0}
    {"json_class":"Complex","r":2.0,"i":4}

## to_r() [](#method-i-to_r)
Returns the value of `self.real` as a Rational, if possible:

    Complex.rect(1, 0).to_r              # => (1/1)
    Complex.rect(1, Rational(0, 1)).to_r # => (1/1)
    Complex.rect(1, 0.0).to_r            # => (1/1)

Raises RangeError if `self.imag` is not exactly zero (either `Integer(0)` or
`Rational(0, *n*)`) and `self.imag.to_r` is not exactly zero.

Related: Complex#rationalize.

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns a string representation of `self`:

    Complex.rect(2).to_s                      # => "2+0i"
    Complex.rect(-8, 6).to_s                  # => "-8+6i"
    Complex.rect(0, Rational(1, 2)).to_s      # => "0+1/2i"
    Complex.rect(0, Float::INFINITY).to_s     # => "0+Infinity*i"
    Complex.rect(Float::NAN, Float::NAN).to_s # => "NaN+NaN*i"

**@overload** [] 

