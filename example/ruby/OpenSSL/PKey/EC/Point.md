# Class: OpenSSL::PKey::EC::Point
**Inherits:** Object
    




#Instance Methods
## add(other) [](#method-i-add)
Performs elliptic curve point addition.

**@overload** [] 

## eql?(b) [](#method-i-eql?)

**@overload** [] 

**@overload** [] 

**@return** [Boolean] 

## infinity?() [](#method-i-infinity?)

**@overload** [] 

**@return** [Boolean] 

## initialize(*args) [](#method-i-initialize)
Creates a new instance of OpenSSL::PKey::EC::Point. If the only argument is an
instance of EC::Point, a copy is returned. Otherwise, creates a point that
belongs to *group*.

*encoded_point* is the octet string representation of the point. This must be
either a String or an OpenSSL::BN.

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## invert!() [](#method-i-invert!)

**@overload** [] 

## make_affine!() [](#method-i-make_affine!)
This method is deprecated and should not be used. This is a no-op.

**@overload** [] 

## mul(*args) [](#method-i-mul)
Performs elliptic curve point multiplication.

The first form calculates `bn1 * point + bn2 * G`, where `G` is the generator
of the group of *point*. *bn2* may be omitted, and in that case, the result is
just `bn1 * point`.

The second form calculates `bns[0] * point + bns[1] * points[0] + ... +
bns[-1] * points[-1] + bn2 * G`. *bn2* may be omitted. *bns* must be an array
of OpenSSL::BN. *points* must be an array of OpenSSL::PKey::EC::Point. Please
note that `points[0]` is not multiplied by `bns[0]`, but `bns[1]`.

**@overload** [] 

**@overload** [] 

## on_curve?() [](#method-i-on_curve?)

**@overload** [] 

**@return** [Boolean] 

## set_to_infinity!() [](#method-i-set_to_infinity!)

**@overload** [] 

## to_bn(conversion_formgroup.point_conversion_form) [](#method-i-to_bn)
:call-seq:
    point.to_bn([conversion_form]) -> OpenSSL::BN

Returns the octet string representation of the EC point as an instance of
OpenSSL::BN.

If *conversion_form* is not given, the *point_conversion_form* attribute set
to the group is used.

See #to_octet_string for more information.

## to_octet_string(conversion_form) [](#method-i-to_octet_string)
Returns the octet string representation of the elliptic curve point.

*conversion_form* specifies how the point is converted. Possible values are:

*   `:compressed`
*   `:uncompressed`
*   `:hybrid`

**@overload** [] 

