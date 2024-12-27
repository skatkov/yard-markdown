# Module: Math
    



# Class Methods
## acos(x ) [](#method-c-acos)
Returns the [arc
cosine](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions) of `x`.

*   Domain: `[-1, 1]`.
*   Range: `[0, PI]`.

Examples:

    acos(-1.0) # => 3.141592653589793  # PI
    acos(0.0)  # => 1.5707963267948966 # PI/2
    acos(1.0)  # => 0.0
**@overload** [] 

## acosh(x ) [](#method-c-acosh)
Returns the [inverse hyperbolic
cosine](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions) of `x`.

*   Domain: `[1, INFINITY]`.
*   Range: `[0, INFINITY]`.

Examples:

    acosh(1.0)      # => 0.0
    acosh(INFINITY) # => Infinity
**@overload** [] 

## asin(x ) [](#method-c-asin)
Returns the [arc
sine](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions) of `x`.

*   Domain: `[-1, -1]`.
*   Range: `[-PI/2, PI/2]`.

Examples:

    asin(-1.0) # => -1.5707963267948966 # -PI/2
    asin(0.0)  # => 0.0
    asin(1.0)  # => 1.5707963267948966  # PI/2
**@overload** [] 

## asinh(x ) [](#method-c-asinh)
Returns the [inverse hyperbolic
sine](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions) of `x`.

*   Domain: `[-INFINITY, INFINITY]`.
*   Range: `[-INFINITY, INFINITY]`.

Examples:

    asinh(-INFINITY) # => -Infinity
    asinh(0.0)       # => 0.0
    asinh(INFINITY)  # => Infinity
**@overload** [] 

## atan(x ) [](#method-c-atan)
Returns the [arc
tangent](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions) of
`x`.

*   Domain: `[-INFINITY, INFINITY]`.
*   Range: `[-PI/2, PI/2]  `.

Examples:

    atan(-INFINITY) # => -1.5707963267948966 # -PI2
    atan(-PI)       # => -1.2626272556789115
    atan(-PI/2)     # => -1.0038848218538872
    atan(0.0)       # => 0.0
    atan(PI/2)      # => 1.0038848218538872
    atan(PI)        # => 1.2626272556789115
    atan(INFINITY)  # => 1.5707963267948966  # PI/2
**@overload** [] 

## atan2(y , x ) [](#method-c-atan2)
Returns the [arc tangent](https://en.wikipedia.org/wiki/Atan2) of `y` and `x`
in
[radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus
_degrees).

*   Domain of `y`: `[-INFINITY, INFINITY]`.
*   Domain of `x`: `[-INFINITY, INFINITY]`.
*   Range: `[-PI, PI]`.

Examples:

    atan2(-1.0, -1.0) # => -2.356194490192345  # -3*PI/4
    atan2(-1.0, 0.0)  # => -1.5707963267948966 # -PI/2
    atan2(-1.0, 1.0)  # => -0.7853981633974483 # -PI/4
    atan2(0.0, -1.0)  # => 3.141592653589793   # PI
**@overload** [] 

## atanh(x ) [](#method-c-atanh)
Returns the [inverse hyperbolic
tangent](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions) of `x`.

*   Domain: `[-1, 1]`.
*   Range: `[-INFINITY, INFINITY]`.

Examples:

    atanh(-1.0) # => -Infinity
    atanh(0.0)  # => 0.0
    atanh(1.0)  # => Infinity
**@overload** [] 

## cbrt(x ) [](#method-c-cbrt)
Returns the [cube root](https://en.wikipedia.org/wiki/Cube_root) of `x`.

*   Domain: `[-INFINITY, INFINITY]`.
*   Range: `[-INFINITY, INFINITY]`.

Examples:

    cbrt(-INFINITY) # => -Infinity
    cbrt(-27.0)     # => -3.0
    cbrt(-8.0)      # => -2.0
    cbrt(-2.0)      # => -1.2599210498948732
    cbrt(1.0)       # => 1.0
    cbrt(0.0)       # => 0.0
    cbrt(1.0)       # => 1.0
    cbrt(2.0)       # => 1.2599210498948732
    cbrt(8.0)       # => 2.0
    cbrt(27.0)      # => 3.0
    cbrt(INFINITY)  # => Infinity
**@overload** [] 

## cos(x ) [](#method-c-cos)
Returns the [cosine](https://en.wikipedia.org/wiki/Sine_and_cosine) of `x` in
[radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus
_degrees).

*   Domain: `(-INFINITY, INFINITY)`.
*   Range: `[-1.0, 1.0]`.

Examples:

    cos(-PI)   # => -1.0
    cos(-PI/2) # => 6.123031769111886e-17 # 0.0000000000000001
    cos(0.0)   # => 1.0
    cos(PI/2)  # => 6.123031769111886e-17 # 0.0000000000000001
    cos(PI)    # => -1.0
**@overload** [] 

## cosh(x ) [](#method-c-cosh)
Returns the [hyperbolic
cosine](https://en.wikipedia.org/wiki/Hyperbolic_functions) of `x` in
[radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus
_degrees).

*   Domain: `[-INFINITY, INFINITY]`.
*   Range: `[1, INFINITY]`.

Examples:

    cosh(-INFINITY) # => Infinity
    cosh(0.0)       # => 1.0
    cosh(INFINITY)  # => Infinity
**@overload** [] 

## erf(x ) [](#method-c-erf)
Returns the value of the [Gauss error
function](https://en.wikipedia.org/wiki/Error_function) for `x`.

    - Domain: <tt>[-INFINITY, INFINITY]</tt>.
    - Range: <tt>[-1, 1]</tt>.

    Examples:

      erf(-INFINITY) # => -1.0
      erf(0.0)       # => 0.0
      erf(INFINITY)  # => 1.0

    Related: Math.erfc.
**@overload** [] 

## erfc(x ) [](#method-c-erfc)
Returns the value of the [complementary error
function](https://en.wikipedia.org/wiki/Error_function#Complementary_error_fun
ction) for `x`.

    - Domain: <tt>[-INFINITY, INFINITY]</tt>.
    - Range: <tt>[0, 2]</tt>.

    Examples:

      erfc(-INFINITY) # => 2.0
      erfc(0.0)       # => 1.0
      erfc(INFINITY)  # => 0.0

    Related: Math.erf.
**@overload** [] 

## exp(x ) [](#method-c-exp)
Returns `e` raised to the `x` power.

*   Domain: `[-INFINITY, INFINITY]`.
*   Range: `[0, INFINITY]`.

Examples:

    exp(-INFINITY) # => 0.0
    exp(-1.0)      # => 0.36787944117144233 # 1.0/E
    exp(0.0)       # => 1.0
    exp(0.5)       # => 1.6487212707001282  # sqrt(E)
    exp(1.0)       # => 2.718281828459045   # E
    exp(2.0)       # => 7.38905609893065    # E**2
    exp(INFINITY)  # => Infinity
**@overload** [] 

## frexp(x ) [](#method-c-frexp)
Returns a 2-element array containing the normalized signed float `fraction`
and integer `exponent` of `x` such that:

    x = fraction * 2**exponent

See [IEEE 754 double-precision binary floating-point format:
binary64](https://en.wikipedia.org/wiki/Double-precision_floating-point_format
#IEEE_754_double-precision_binary_floating-point_format:_binary64).

*   Domain: `[-INFINITY, INFINITY]`.
*   Range `[-INFINITY, INFINITY]`.

Examples:

    frexp(-INFINITY) # => [-Infinity, -1]
    frexp(-2.0)      # => [-0.5, 2]
    frexp(-1.0)      # => [-0.5, 1]
    frexp(0.0)       # => [0.0, 0]
    frexp(1.0)       # => [0.5, 1]
    frexp(2.0)       # => [0.5, 2]
    frexp(INFINITY)  # => [Infinity, -1]

Related: Math.ldexp (inverse of Math.frexp).
**@overload** [] 

## gamma(x ) [](#method-c-gamma)
Returns the value of the [gamma
function](https://en.wikipedia.org/wiki/Gamma_function) for `x`.

    - Domain: <tt>(-INFINITY, INFINITY]</tt> excluding negative integers.
    - Range: <tt>[-INFINITY, INFINITY]</tt>.

    Examples:

      gamma(-2.5)      # => -0.9453087204829431
      gamma(-1.5)      # => 2.3632718012073513
      gamma(-0.5)      # => -3.5449077018110375
      gamma(0.0)      # => Infinity
      gamma(1.0)      # => 1.0
      gamma(2.0)      # => 1.0
      gamma(3.0)      # => 2.0
      gamma(4.0)      # => 6.0
      gamma(5.0)      # => 24.0

    Related: Math.lgamma.
**@overload** [] 

## hypot(x , y ) [](#method-c-hypot)
Returns `sqrt(a**2 + b**2)`, which is the length of the longest side `c` (the
hypotenuse) of the right triangle whose other sides have lengths `a` and `b`.

*   Domain of `a`: `[-INFINITY, INFINITY]`.
*   Domain of +ab: `[-INFINITY, INFINITY]`.
*   Range: `[0, INFINITY]`.

Examples:

    hypot(0.0, 1.0)       # => 1.0
    hypot(1.0, 1.0)       # => 1.4142135623730951 # sqrt(2.0)
    hypot(3.0, 4.0)       # => 5.0
    hypot(5.0, 12.0)      # => 13.0
    hypot(1.0, sqrt(3.0)) # => 1.9999999999999998 # Near 2.0

Note that if either argument is `INFINITY` or `-INFINITY`, the result is
`Infinity`.
**@overload** [] 

## ldexp(x , n ) [](#method-c-ldexp)
Returns the value of `fraction * 2**exponent`.

*   Domain of `fraction`: `[0.0, 1.0)`.
*   Domain of `exponent`: `[0, 1024]` (larger values are equivalent to 1024).

See [IEEE 754 double-precision binary floating-point format:
binary64](https://en.wikipedia.org/wiki/Double-precision_floating-point_format
#IEEE_754_double-precision_binary_floating-point_format:_binary64).

Examples:

    ldexp(-INFINITY, -1) # => -Infinity
    ldexp(-0.5, 2)       # => -2.0
    ldexp(-0.5, 1)       # => -1.0
    ldexp(0.0, 0)        # => 0.0
    ldexp(-0.5, 1)       # => 1.0
    ldexp(-0.5, 2)       # => 2.0
    ldexp(INFINITY, -1)  # => Infinity

Related: Math.frexp (inverse of Math.ldexp).
**@overload** [] 

## lgamma(x ) [](#method-c-lgamma)
Returns a 2-element array equivalent to:

      [Math.log(Math.gamma(x).abs), Math.gamma(x) < 0 ? -1 : 1]

    See {logarithmic gamma function}[https://en.wikipedia.org/wiki/Gamma_function#The_log-gamma_function].

    - Domain: <tt>(-INFINITY, INFINITY]</tt>.
    - Range of first element: <tt>(-INFINITY, INFINITY]</tt>.
    - Second element is -1 or 1.

    Examples:

      lgamma(-4.0) # => [Infinity, -1]
      lgamma(-3.0) # => [Infinity, -1]
      lgamma(-2.0) # => [Infinity, -1]
      lgamma(-1.0) # => [Infinity, -1]
      lgamma(0.0)  # => [Infinity, 1]

      lgamma(1.0)  # => [0.0, 1]
      lgamma(2.0)  # => [0.0, 1]
      lgamma(3.0)  # => [0.6931471805599436, 1]
      lgamma(4.0)  # => [1.7917594692280545, 1]

      lgamma(-2.5) # => [-0.05624371649767279, -1]
      lgamma(-1.5) # => [0.8600470153764797, 1]
      lgamma(-0.5) # => [1.265512123484647, -1]
      lgamma(0.5)  # => [0.5723649429247004, 1]
      lgamma(1.5)  # => [-0.12078223763524676, 1]
      lgamma(2.5)      # => [0.2846828704729205, 1]

    Related: Math.gamma.
**@overload** [] 

## log(*args ) [](#method-c-log)
Returns the base `base` [logarithm](https://en.wikipedia.org/wiki/Logarithm)
of `x`.

*   Domain: `[0, INFINITY]`.
*   Range: `[-INFINITY, INFINITY)]`.

Examples:

    log(0.0)        # => -Infinity
    log(1.0)        # => 0.0
    log(E)          # => 1.0
    log(INFINITY)   # => Infinity

    log(0.0, 2.0)   # => -Infinity
    log(1.0, 2.0)   # => 0.0
    log(2.0, 2.0)   # => 1.0

    log(0.0, 10.0)  # => -Infinity
    log(1.0, 10.0)  # => 0.0
    log(10.0, 10.0) # => 1.0
**@overload** [] 

## log10(x ) [](#method-c-log10)
Returns the base 10 [logarithm](https://en.wikipedia.org/wiki/Logarithm) of
`x`.

*   Domain: `[0, INFINITY]`.
*   Range: `[-INFINITY, INFINITY]`.

Examples:

    log10(0.0)      # => -Infinity
    log10(1.0)      # => 0.0
    log10(10.0)     # => 1.0
    log10(INFINITY) # => Infinity
**@overload** [] 

## log2(x ) [](#method-c-log2)
Returns the base 2 [logarithm](https://en.wikipedia.org/wiki/Logarithm) of
`x`.

*   Domain: `[0, INFINITY]`.
*   Range: `[-INFINITY, INFINITY]`.

Examples:

    log2(0.0)      # => -Infinity
    log2(1.0)      # => 0.0
    log2(2.0)      # => 1.0
    log2(INFINITY) # => Infinity
**@overload** [] 

## sin(x ) [](#method-c-sin)
Returns the [sine](https://en.wikipedia.org/wiki/Sine_and_cosine) of `x` in
[radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus
_degrees).

*   Domain: `(-INFINITY, INFINITY)`.
*   Range: `[-1.0, 1.0]`.

Examples:

    sin(-PI)   # => -1.2246063538223773e-16 # -0.0000000000000001
    sin(-PI/2) # => -1.0
    sin(0.0)   # => 0.0
    sin(PI/2)  # => 1.0
    sin(PI)    # => 1.2246063538223773e-16  # 0.0000000000000001
**@overload** [] 

## sinh(x ) [](#method-c-sinh)
Returns the [hyperbolic
sine](https://en.wikipedia.org/wiki/Hyperbolic_functions) of `x` in
[radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus
_degrees).

*   Domain: `[-INFINITY, INFINITY]`.
*   Range: `[-INFINITY, INFINITY]`.

Examples:

    sinh(-INFINITY) # => -Infinity
    sinh(0.0)       # => 0.0
    sinh(INFINITY)  # => Infinity
**@overload** [] 

## sqrt(x ) [](#method-c-sqrt)
Returns the principal (non-negative) [square
root](https://en.wikipedia.org/wiki/Square_root) of `x`.

*   Domain: `[0, INFINITY]`.
*   Range: `[0, INFINITY]`.

Examples:

    sqrt(0.0)      # => 0.0
    sqrt(0.5)      # => 0.7071067811865476
    sqrt(1.0)      # => 1.0
    sqrt(2.0)      # => 1.4142135623730951
    sqrt(4.0)      # => 2.0
    sqrt(9.0)      # => 3.0
    sqrt(INFINITY) # => Infinity
**@overload** [] 

## tan(x ) [](#method-c-tan)
Returns the [tangent](https://en.wikipedia.org/wiki/Trigonometric_functions)
of `x` in
[radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus
_degrees).

*   Domain: `(-INFINITY, INFINITY)`.
*   Range: `(-INFINITY, INFINITY)`.

Examples:

    tan(-PI)   # => 1.2246467991473532e-16  # -0.0000000000000001
    tan(-PI/2) # => -1.633123935319537e+16  # -16331239353195370.0
    tan(0.0)   # => 0.0
    tan(PI/2)  # => 1.633123935319537e+16   # 16331239353195370.0
    tan(PI)    # => -1.2246467991473532e-16 # -0.0000000000000001
**@overload** [] 

## tanh(x ) [](#method-c-tanh)
Returns the [hyperbolic
tangent](https://en.wikipedia.org/wiki/Hyperbolic_functions) of `x` in
[radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus
_degrees).

*   Domain: `[-INFINITY, INFINITY]`.
*   Range: `[-1, 1]`.

Examples:

    tanh(-INFINITY) # => -1.0
    tanh(0.0)       # => 0.0
    tanh(INFINITY)  # => 1.0
**@overload** [] 


