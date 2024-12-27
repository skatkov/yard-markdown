# Class: OpenSSL::BN
**Inherits:** Object
    
**Includes:** Comparable
  



# Class Methods
## generate_prime(*args ) [](#method-c-generate_prime)
Generates a random prime number of bit length *bits*. If *safe* is set to
`true`, generates a safe prime. If *add* is specified, generates a prime that
fulfills condition `p % add = rem`.

### Parameters
*   *bits* - integer
*   *safe* - boolean
*   *add* - BN
*   *rem* - BN
**@overload** [] 

## rand() [](#method-c-rand)
zero one value_one - DON'T IMPL. set_word get_word
## rand_range(range ) [](#method-c-rand_range)
Generates a cryptographically strong pseudo-random number in the range
0...`range`.

See also the man page BN_rand_range(3).
**@overload** [] 


#Instance Methods
## %() [](#method-i-%)

**@overload** [] 

## *() [](#method-i-*)

**@overload** [] 

## **() [](#method-i-**)

**@overload** [] 

## +() [](#method-i-+)

**@overload** [] 

## +@() [](#method-i-+@)

**@overload** [] 

## -() [](#method-i--)

**@overload** [] 

## -@() [](#method-i--@)

**@overload** [] 

## /() [](#method-i-/)

## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <<() [](#method-i-<<)

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## ==() [](#method-i-==)

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## >>() [](#method-i->>)

**@overload** [] 

## abs() [](#method-i-abs)

**@overload** [] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## bit_set?() [](#method-i-bit_set?)

**@return** [Boolean] 

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

## clear_bit!() [](#method-i-clear_bit!)

**@overload** [] 

## cmp() [](#method-i-cmp)

**@overload** [] 

## coerce(other) [](#method-i-coerce)

## copy() [](#method-i-copy)

## eql?(other) [](#method-i-eql?)
Returns `true` only if *obj* is a `OpenSSL::BN` with the same value as *bn*.
Contrast this with OpenSSL::BN#==, which performs type conversions.

**@overload** [] 

## gcd() [](#method-i-gcd)

**@overload** [] 

## get_flags(arg) [](#method-i-get_flags)
Returns the flags on the BN object. The argument is used as a bit mask.

### Parameters
*   *flags* - integer

**@overload** [] 

## hash() [](#method-i-hash)
Returns a hash code for this object.

See also Object#hash.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Construct a new OpenSSL BIGNUM object.

If `bn` is an Integer or OpenSSL::BN, a new instance of OpenSSL::BN
representing the same value is returned. See also Integer#to_bn for the
short-hand.

If a String is given, the content will be parsed according to `base`.

`string`
:   The string to be parsed.

`base`
:   The format. Must be one of the following:
    *   `0`  - MPI format. See the man page BN_mpi2bn(3) for details.
    *   `2`  - Variable-length and big-endian binary encoding of a positive
        number.
    *   `10` - Decimal number representation, with a leading '-' for a
        negative number.
    *   `16` - Hexadecimal number representation, with a leading '-' for a
        negative number.


**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy() [](#method-i-initialize_copy)

## lshift!() [](#method-i-lshift!)

**@overload** [] 

## mask_bits!() [](#method-i-mask_bits!)

## mod_add() [](#method-i-mod_add)

**@overload** [] 

## mod_exp() [](#method-i-mod_exp)

**@overload** [] 

## mod_inverse() [](#method-i-mod_inverse)

**@overload** [] 

## mod_mul() [](#method-i-mod_mul)

**@overload** [] 

## mod_sqr() [](#method-i-mod_sqr)

**@overload** [] 

## mod_sqrt() [](#method-i-mod_sqrt)

**@overload** [] 

## mod_sub() [](#method-i-mod_sub)

**@overload** [] 

## negative?() [](#method-i-negative?)

**@return** [Boolean] 

## num_bits() [](#method-i-num_bits)

**@overload** [] 

## num_bytes() [](#method-i-num_bytes)

**@overload** [] 

## odd?() [](#method-i-odd?)

**@overload** [] 

**@return** [Boolean] 

## one?() [](#method-i-one?)

**@overload** [] 

**@return** [Boolean] 

## pretty_print(q) [](#method-i-pretty_print)

## prime?(*args) [](#method-i-prime?)
Performs a Miller-Rabin probabilistic primality test for `bn`.

**`checks` parameter is deprecated in version 3.0.** It has no effect.

**@overload** [] 

**@overload** [] 

**@return** [Boolean] 

## prime_fasttest?(*args) [](#method-i-prime_fasttest?)
Performs a Miller-Rabin probabilistic primality test for `bn`.

**Deprecated in version 3.0.** Use #prime? instead.

`checks` and `trial_div` parameters no longer have any effect.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@return** [Boolean] 

## rshift!() [](#method-i-rshift!)

**@overload** [] 

## set_bit!() [](#method-i-set_bit!)

**@overload** [] 

## set_flags(arg) [](#method-i-set_flags)
Enables the flags on the BN object. Currently, the flags argument can contain
zero of OpenSSL::BN::CONSTTIME.

**@overload** [] 

## sqr() [](#method-i-sqr)

**@overload** [] 

## to_bn() [](#method-i-to_bn)

## to_i() [](#method-i-to_i)

**@overload** [] 

## to_s(*args) [](#method-i-to_s)
Returns the string representation of the bignum.

BN.new can parse the encoded string to convert back into an OpenSSL::BN.

`base`
:   The format. Must be one of the following:
    *   `0`  - MPI format. See the man page BN_bn2mpi(3) for details.
    *   `2`  - Variable-length and big-endian binary encoding. The sign of the
        bignum is ignored.
    *   `10` - Decimal number representation, with a leading '-' for a
        negative bignum.
    *   `16` - Hexadecimal number representation, with a leading '-' for a
        negative bignum.


**@overload** [] 

## ucmp() [](#method-i-ucmp)

**@overload** [] 

## zero?() [](#method-i-zero?)

**@overload** [] 

**@return** [Boolean] 

