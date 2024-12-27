# Class: Fiddle::CUnionEntity
**Inherits:** Fiddle::CStructEntity
    
**Includes:** Fiddle::PackInfo
  

A pointer to a C union


# Class Methods
## size(types ) [](#method-c-size)
Returns the size needed for the union with the given `types`.

    Fiddle::CUnionEntity.size(
      [ Fiddle::TYPE_DOUBLE,
        Fiddle::TYPE_INT,
        Fiddle::TYPE_CHAR,
        Fiddle::TYPE_VOIDP ]) #=> 8

#Instance Methods
## set_ctypes(types) [](#method-i-set_ctypes)
Calculate the necessary offset and for each union member with the given
`types`

