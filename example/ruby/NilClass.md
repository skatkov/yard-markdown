# Class: NilClass
**Inherits:** Object
    

The class of the singleton object `nil`.

Several of its methods act as operators:

*   #&
*   #|
*   #===
*   #=~
*   #^

Others act as converters, carrying the concept of *nullity* to other classes:

*   #rationalize
*   #to_a
*   #to_c
*   #to_h
*   #to_r
*   #to_s

While `nil` doesn't have an explicitly defined #to_hash method, it can be used
in `**` unpacking, not adding any keyword arguments.

Another method provides inspection:

*   #inspect

Finally, there is this query method:

*   #nil?



#Instance Methods
## &(obj2) [](#method-i-&)
Returns `false`:

    false & true       # => false
    false & Object.new # => false

Argument `object` is evaluated:

    false & raise # Raises RuntimeError.

**@overload** [] 

**@overload** [] 

## ===() [](#method-i-===)

## =~(obj2) [](#method-i-=~)
Returns `nil`.

This method makes it useful to write:

    while gets =~ /re/
      # ...
    end

**@overload** [] 

## ^() [](#method-i-^)

## inspect() [](#method-i-inspect)
Returns string `'nil'`:

    nil.inspect # => "nil"

**@overload** [] 

## nil?() [](#method-i-nil?)
Returns `true`. For all other objects, method `nil?` returns `false`.

**@overload** [] 

## rationalize(*args) [](#method-i-rationalize)
Returns zero as a Rational:

    nil.rationalize # => (0/1)

Argument `eps` is ignored.

**@overload** [] 

## to_a() [](#method-i-to_a)
call-seq:
    to_a -> []

Returns an empty Array.

    nil.to_a # => []

## to_c() [](#method-i-to_c)
Returns zero as a Complex:

    nil.to_c # => (0+0i)

**@overload** [] 

## to_f() [](#method-i-to_f)
call-seq:
       nil.to_f    -> 0.0

    Always returns zero.

       nil.to_f   #=> 0.0

## to_h() [](#method-i-to_h)
call-seq:
    to_h -> {}

Returns an empty Hash.

    nil.to_h   #=> {}

## to_i() [](#method-i-to_i)
call-seq:
       nil.to_i -> 0

    Always returns zero.

       nil.to_i   #=> 0

## to_r() [](#method-i-to_r)
Returns zero as a Rational:

    nil.to_r # => (0/1)

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns an empty String:

    nil.to_s # => ""

**@overload** [] 

## |() [](#method-i-|)

