# Class: Prism::CodeUnitsCache
**Inherits:** Object
    

A cache that can be used to quickly compute code unit offsets from byte
offsets. It purposefully provides only a single #[] method to access the cache
in order to minimize surface area.

Note that there are some known issues here that may or may not be addressed in
the future:

*   The first is that there are issues when the cache computes values that are
    not on character boundaries. This can result in subsequent computations
    being off by one or more code units.
*   The second is that this cache is currently unbounded. In theory we could
    introduce some kind of LRU cache to limit the number of entries, but this
    has not yet been implemented.



#Instance Methods
## [](byte_offset) [](#method-i-[])
Retrieve the code units offset from the given byte offset.

## initialize(source, encoding) [](#method-i-initialize)
Initialize a new cache with the given source and encoding.

**@return** [CodeUnitsCache] a new instance of CodeUnitsCache

