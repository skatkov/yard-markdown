# Class: Gem::Source
**Inherits:** Object
    
**Includes:** Comparable, Gem::Text
  

bundler dependency API and so-forth.


# Attributes
## uri[RW] [](#attribute-i-uri)
The URI this source will fetch gems from.


#Instance Methods
## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>(other) [](#method-i-<=>)
Sources are ordered by installation preference.

## ==(other) [](#method-i-==)
:nodoc:

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## cache_dir(uri) [](#method-i-cache_dir)
Returns the local directory to write `uri` to.

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

## clean_text(text) [](#method-i-clean_text)
Remove any non-printable characters and make the text suitable for printing.

## dependency_resolver_set() [](#method-i-dependency_resolver_set)
Returns a Set that can fetch specifications from this source.

## download(spec, dirDir.pwd) [](#method-i-download)
Downloads `spec` and writes it to `dir`.  See also
Gem::RemoteFetcher#download.

## fetch_spec(name_tuple) [](#method-i-fetch_spec)
Fetches a specification for the given `name_tuple`.

## format_text(text, wrap, indent0) [](#method-i-format_text)
Wraps `text` to `wrap` characters and optionally indents by `indent`
characters

## hash() [](#method-i-hash)
:nodoc:

## initialize(uri) [](#method-i-initialize)
Creates a new Source which will use the index located at `uri`.

**@return** [Source] a new instance of Source

## levenshtein_distance(str1, str2) [](#method-i-levenshtein_distance)
Returns a value representing the "cost" of transforming str1 into str2
Vendored version of DidYouMean::Levenshtein.distance from the
ruby/did_you_mean gem @ 1.4.0
https://github.com/ruby/did_you_mean/blob/2ddf39b874808685965dbc47d344cf6c7651
807c/lib/did_you_mean/levenshtein.rb#L7-L37

## load_specs(type) [](#method-i-load_specs)
Loads `type` kind of specs fetching from +@uri+ if the on-disk cache is out of
date.

`type` is one of the following:

:released   => Return the list of all released specs :latest     => Return the
list of only the highest version of each gem :prerelease => Return the list of
all prerelease only specs

## min3(a, b, c) [](#method-i-min3)
:nodoc:

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## truncate_text(text, description, max_length100_000) [](#method-i-truncate_text)

**@raise** [ArgumentError] 

## typo_squatting?(host, distance_threshold4) [](#method-i-typo_squatting?)

**@return** [Boolean] 

## update_cache?() [](#method-i-update_cache?)
Returns true when it is possible and safe to update the cache directory.

**@return** [Boolean] 

