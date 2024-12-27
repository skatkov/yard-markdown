# Class: OpenSSL::PKey::EC::Group
**Inherits:** Object
    




#Instance Methods
## asn1_flag() [](#method-i-asn1_flag)
Returns the flags set on the group.

See also #asn1_flag=.

**@overload** [] 

## asn1_flag=(flag_v) [](#method-i-asn1_flag=)
Sets flags on the group. The flag value is used to determine how to encode the
group: encode explicit parameters or named curve using an OID.

The flag value can be either of:

*   EC::NAMED_CURVE
*   EC::EXPLICIT_CURVE

See the OpenSSL documentation for EC_GROUP_set_asn1_flag().

**@overload** [] 

## cofactor() [](#method-i-cofactor)
Returns the cofactor of the group.

See the OpenSSL documentation for EC_GROUP_get_cofactor()

**@overload** [] 

## curve_name() [](#method-i-curve_name)
Returns the curve name (sn).

See the OpenSSL documentation for EC_GROUP_get_curve_name()

**@overload** [] 

## degree() [](#method-i-degree)
See the OpenSSL documentation for EC_GROUP_get_degree()

**@overload** [] 

## eql?(b) [](#method-i-eql?)
Returns `true` if the two groups use the same curve and have the same
parameters, `false` otherwise.

**@overload** [] 

**@overload** [] 

**@return** [Boolean] 

## generator() [](#method-i-generator)
Returns the generator of the group.

See the OpenSSL documentation for EC_GROUP_get0_generator()

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new EC::Group object.

If the first argument is :GFp or :GF2m, creates a new curve with given
parameters.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(other) [](#method-i-initialize_copy)

## order() [](#method-i-order)
Returns the order of the group.

See the OpenSSL documentation for EC_GROUP_get_order()

**@overload** [] 

## point_conversion_form() [](#method-i-point_conversion_form)
Returns the form how EC::Point data is encoded as ASN.1.

See also #point_conversion_form=.

**@overload** [] 

## point_conversion_form=(form_v) [](#method-i-point_conversion_form=)
Sets the form how EC::Point data is encoded as ASN.1 as defined in X9.62.

*format* can be one of these:

`:compressed`
:   Encoded as z||x, where z is an octet indicating which solution of the
    equation y is. z will be 0x02 or 0x03.

`:uncompressed`
:   Encoded as z||x||y, where z is an octet 0x04.

`:hybrid`
:   Encodes as z||x||y, where z is an octet indicating which solution of the
    equation y is. z will be 0x06 or 0x07.


See the OpenSSL documentation for EC_GROUP_set_point_conversion_form()

**@overload** [] 

## seed() [](#method-i-seed)
See the OpenSSL documentation for EC_GROUP_get0_seed()

**@overload** [] 

## seed=(seed) [](#method-i-seed=)
See the OpenSSL documentation for EC_GROUP_set_seed()

**@overload** [] 

## set_generator(generator, order, cofactor) [](#method-i-set_generator)
Sets the curve parameters. *generator* must be an instance of EC::Point that
is on the curve. *order* and *cofactor* are integers.

See the OpenSSL documentation for EC_GROUP_set_generator()

**@overload** [] 

## to_der() [](#method-i-to_der)
See the OpenSSL documentation for i2d_ECPKParameters_bio()

**@overload** [] 

## to_pem() [](#method-i-to_pem)
See the OpenSSL documentation for PEM_write_bio_ECPKParameters()

**@overload** [] 

## to_text() [](#method-i-to_text)
See the OpenSSL documentation for ECPKParameters_print()

**@overload** [] 

