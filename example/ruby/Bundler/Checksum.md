# Class: Bundler::Checksum
**Inherits:** Object
    



# Class Methods
## from_api(digest , source_uri , algo DEFAULT_ALGORITHM) [](#method-c-from_api)
## from_gem(io , pathname , algo DEFAULT_ALGORITHM) [](#method-c-from_gem)
## from_gem_package(gem_package , algo DEFAULT_ALGORITHM) [](#method-c-from_gem_package)
## from_lock(lock_checksum , lockfile_location ) [](#method-c-from_lock)
## to_hexdigest(digest , algo DEFAULT_ALGORITHM) [](#method-c-to_hexdigest)
# Attributes
## algo[RW] [](#attribute-i-algo)
Returns the value of attribute algo.

## digest[RW] [](#attribute-i-digest)
Returns the value of attribute digest.

## sources[RW] [](#attribute-i-sources)
Returns the value of attribute sources.


#Instance Methods
## ==(other) [](#method-i-==)

## formatted_sources() [](#method-i-formatted_sources)

## hash() [](#method-i-hash)

## initialize(algo, digest, source) [](#method-i-initialize)

**@return** [Checksum] a new instance of Checksum

## inspect() [](#method-i-inspect)

## match?(other) [](#method-i-match?)

**@return** [Boolean] 

## merge!(other) [](#method-i-merge!)

## removable?() [](#method-i-removable?)

**@return** [Boolean] 

## removal_instructions() [](#method-i-removal_instructions)

## same_source?(other) [](#method-i-same_source?)

**@return** [Boolean] 

## to_lock() [](#method-i-to_lock)

## to_s() [](#method-i-to_s)

