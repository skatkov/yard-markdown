# Class: Bundler::Thor::CoreExt::HashWithIndifferentAccess
**Inherits:** Hash
    

A hash with indifferent access and magic predicates.

    hash = Bundler::Thor::CoreExt::HashWithIndifferentAccess.new 'foo' => 'bar', 'baz' => 'bee', 'force' => true

    hash[:foo]  #=> 'bar'
    hash['foo'] #=> 'bar'
    hash.foo?   #=> true



#Instance Methods
## [](key) [](#method-i-[])

## []=(key, value) [](#method-i-[]=)

## delete(key) [](#method-i-delete)

## except(*keys) [](#method-i-except)

## fetch(key, *args) [](#method-i-fetch)

## initialize(hash{}) [](#method-i-initialize)
:nodoc:

**@return** [HashWithIndifferentAccess] a new instance of HashWithIndifferentAccess

## key?(key) [](#method-i-key?)

**@return** [Boolean] 

## merge(other) [](#method-i-merge)

## merge!(other) [](#method-i-merge!)

## replace(other_hash) [](#method-i-replace)

## reverse_merge(other) [](#method-i-reverse_merge)

## reverse_merge!(other_hash) [](#method-i-reverse_merge!)

## slice(*keys) [](#method-i-slice)

## to_hash() [](#method-i-to_hash)
Convert to a Hash with String keys.

## values_at(*indices) [](#method-i-values_at)

