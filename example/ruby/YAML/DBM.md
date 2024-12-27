# Class: YAML::DBM
**Inherits:** DBM
    

YAML + DBM = YDBM

YAML::DBM provides the same interface as ::DBM.

However, while DBM only allows strings for both keys and values, this library
allows one to use most Ruby objects for values by first converting them to
YAML. Keys must be strings.

Conversion to and from YAML is performed automatically.

See the documentation for ::DBM and ::YAML for more information.



#Instance Methods
## [](key) [](#method-i-[])
:call-seq:
    ydbm[key] -> value

Return value associated with `key` from database.

Returns `nil` if there is no such `key`.

See #fetch for more information.

## []=(key, val) [](#method-i-[]=)
:call-seq:
    ydbm[key] = value

Set `key` to `value` in database.

`value` will be converted to YAML before storage.

See #store for more information.

## delete(key) [](#method-i-delete)
:call-seq:
    ydbm.delete(key)

Deletes value from database associated with `key`.

Returns value or `nil`.

## delete_if() [](#method-i-delete_if)
:call-seq:
    ydbm.delete_if { |key, value| ... }

Calls the given block once for each `key`, `value` pair in the database.
Deletes all entries for which the block returns true.

Returns `self`.

## each_pair() [](#method-i-each_pair)
:call-seq:
    ydbm.each_pair { |key, value| ... }

Calls the given block once for each `key`, `value` pair in the database.

Returns `self`.

## each_value() [](#method-i-each_value)
:call-seq:
    ydbm.each_value { |value| ... }

Calls the given block for each value in database.

Returns `self`.

## fetch(keystr, ifnonenil) [](#method-i-fetch)
:call-seq:
    ydbm.fetch( key, ifnone = nil )
    ydbm.fetch( key ) { |key| ... }

Return value associated with `key`.

If there is no value for `key` and no block is given, returns `ifnone`.

Otherwise, calls block passing in the given `key`.

See ::DBM#fetch for more information.

## has_value?(val) [](#method-i-has_value?)
:call-seq:
    ydbm.has_value?(value)

Returns true if specified `value` is found in the database.

**@return** [Boolean] 

## index(keystr) [](#method-i-index)
Deprecated, used YAML::DBM#key instead.
---
Note: YAML::DBM#index makes warning from internal of ::DBM#index. It says
'DBM#index is deprecated; use DBM#key', but DBM#key behaves not same as
DBM#index.

## invert() [](#method-i-invert)
:call-seq:
    ydbm.invert -> hash

Returns a Hash (not a DBM database) created by using each value in the
database as a key, with the corresponding key as its value.

Note that all values in the hash will be Strings, but the keys will be actual
objects.

## key(keystr) [](#method-i-key)
:call-seq:
    ydbm.key(value) -> string

Returns the key for the specified value.

## reject() [](#method-i-reject)
:call-seq:
    ydbm.reject { |key, value| ... }

Converts the contents of the database to an in-memory Hash, then calls
Hash#reject with the specified code block, returning a new Hash.

## replace(hsh) [](#method-i-replace)
:call-seq:
    ydbm.replace(hash) -> ydbm

Replaces the contents of the database with the contents of the specified
object. Takes any object which implements the each_pair method, including Hash
and DBM objects.

## select(*keys) [](#method-i-select)
:call-seq:
    ydbm.select { |key, value| ... }
    ydbm.select(*keys)

If a block is provided, returns a new array containing [key, value] pairs for
which the block returns true.

Otherwise, same as #values_at

## shift() [](#method-i-shift)
:call-seq:
    ydbm.shift -> [key, value]

Removes a [key, value] pair from the database, and returns it. If the database
is empty, returns `nil`.

The order in which values are removed/returned is not guaranteed.

## store(key, val) [](#method-i-store)
:call-seq:
    ydbm.store(key, value) -> value

Stores `value` in database with `key` as the index. `value` is converted to
YAML before being stored.

Returns `value`

## to_a() [](#method-i-to_a)
:call-seq:
    ydbm.to_a -> array

Converts the contents of the database to an array of [key, value] arrays, and
returns it.

## to_hash() [](#method-i-to_hash)
:call-seq:
    ydbm.to_hash -> hash

Converts the contents of the database to an in-memory Hash object, and returns
it.

## update(hsh) [](#method-i-update)
:call-seq:
    ydbm.update(hash) -> ydbm

Updates the database with multiple values from the specified object. Takes any
object which implements the each_pair method, including Hash and DBM objects.

Returns `self`.

## values() [](#method-i-values)
:call-seq:
    ydbm.values

Returns an array of values from the database.

## values_at(*keys) [](#method-i-values_at)
:call-seq:
    ydbm.values_at(*keys)

Returns an array containing the values associated with the given keys.

