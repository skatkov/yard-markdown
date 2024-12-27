# Class: Hash
**Inherits:** Object
    
**Includes:** Enumerable
  

:nodoc:


# Class Methods
## [](*args ) [](#method-c-[])
Returns a new `Hash` object populated with the given objects, if any. See
Hash::new.

With no argument, returns a new empty `Hash`.

When the single given argument is a `Hash`, returns a new `Hash` populated
with the entries from the given `Hash`, excluding the default value or proc.

    h = {foo: 0, bar: 1, baz: 2}
    Hash[h] # => {:foo=>0, :bar=>1, :baz=>2}

When the single given argument is an Array of 2-element Arrays, returns a new
`Hash` object wherein each 2-element array forms a key-value entry:

    Hash[ [ [:foo, 0], [:bar, 1] ] ] # => {:foo=>0, :bar=>1}

When the argument count is an even number; returns a new `Hash` object wherein
each successive pair of arguments has become a key-value entry:

    Hash[:foo, 0, :bar, 1] # => {:foo=>0, :bar=>1}

Raises an exception if the argument list does not conform to any of the above.
**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## ruby2_keywords_hash(hash ) [](#method-c-ruby2_keywords_hash)
Duplicates a given hash and adds a ruby2_keywords flag. This method is not for
casual use; debugging, researching, and some truly necessary cases like
deserialization of arguments.

    h = {k: 1}
    h = Hash.ruby2_keywords_hash(h)
    def foo(k: 42)
      k
    end
    foo(*[h]) #=> 1 with neither a warning or an error
**@overload** [] 

## ruby2_keywords_hash?(hash ) [](#method-c-ruby2_keywords_hash?)
Checks if a given hash is flagged by Module#ruby2_keywords (or
Proc#ruby2_keywords). This method is not for casual use; debugging,
researching, and some truly necessary cases like serialization of arguments.

    ruby2_keywords def foo(*args)
      Hash.ruby2_keywords_hash?(args.last)
    end
    foo(k: 1)   #=> true
    foo({k: 1}) #=> false
**@overload** [] 

## try_convert(hash ) [](#method-c-try_convert)
If `obj` is a `Hash` object, returns `obj`.

Otherwise if `obj` responds to `:to_hash`, calls `obj.to_hash` and returns the
result.

Returns `nil` if `obj` does not respond to `:to_hash`

Raises an exception unless `obj.to_hash` returns a `Hash` object.
**@overload** [] 


#Instance Methods
## <(other) [](#method-i-<)
Returns `true` if `hash` is a proper subset of `other_hash`, `false`
otherwise:
    h1 = {foo: 0, bar: 1}
    h2 = {foo: 0, bar: 1, baz: 2}
    h1 < h2 # => true
    h2 < h1 # => false
    h1 < h1 # => false

**@overload** [] 

## <=(other) [](#method-i-<=)
Returns `true` if `hash` is a subset of `other_hash`, `false` otherwise:
    h1 = {foo: 0, bar: 1}
    h2 = {foo: 0, bar: 1, baz: 2}
    h1 <= h2 # => true
    h2 <= h1 # => false
    h1 <= h1 # => true

**@overload** [] 

## ==(hash2) [](#method-i-==)
Returns `true` if all of the following are true:
*   `object` is a `Hash` object.
*   `hash` and `object` have the same keys (regardless of order).
*   For each key `key`, `hash[key] == object[key]`.

Otherwise, returns `false`.

Equal:
    h1 = {foo: 0, bar: 1, baz: 2}
    h2 = {foo: 0, bar: 1, baz: 2}
    h1 == h2 # => true
    h3 = {baz: 2, bar: 1, foo: 0}
    h1 == h3 # => true

**@overload** [] 

## >(other) [](#method-i->)
Returns `true` if `hash` is a proper superset of `other_hash`, `false`
otherwise:
    h1 = {foo: 0, bar: 1, baz: 2}
    h2 = {foo: 0, bar: 1}
    h1 > h2 # => true
    h2 > h1 # => false
    h1 > h1 # => false

**@overload** [] 

## >=(other) [](#method-i->=)
Returns `true` if `hash` is a superset of `other_hash`, `false` otherwise:
    h1 = {foo: 0, bar: 1, baz: 2}
    h2 = {foo: 0, bar: 1}
    h1 >= h2 # => true
    h2 >= h1 # => false
    h1 >= h1 # => true

**@overload** [] 

## [](key) [](#method-i-[])
Returns the value associated with the given `key`, if found:
    h = {foo: 0, bar: 1, baz: 2}
    h[:foo] # => 0

If `key` is not found, returns a default value (see [Default
Values](rdoc-ref:Hash@Default+Values)):
    h = {foo: 0, bar: 1, baz: 2}
    h[:nosuch] # => nil

**@overload** [] 

## []=() [](#method-i-[]=)

## all?(*args) [](#method-i-all?)
Returns whether every element meets a given criterion.

If `self` has no element, returns `true` and argument or block are not used.

With no argument and no block, returns whether every element is truthy:

    (1..4).all?           # => true
    %w[a b c d].all?      # => true
    [1, 2, nil].all?      # => false
    ['a','b', false].all? # => false
    [].all?               # => true

With argument `pattern` and no block, returns whether for each element
`element`, `pattern === element`:

    (1..4).all?(Integer)                 # => true
    (1..4).all?(Numeric)                 # => true
    (1..4).all?(Float)                   # => false
    %w[bar baz bat bam].all?(/ba/)       # => true
    %w[bar baz bat bam].all?(/bar/)      # => false
    %w[bar baz bat bam].all?('ba')       # => false
    {foo: 0, bar: 1, baz: 2}.all?(Array) # => true
    {foo: 0, bar: 1, baz: 2}.all?(Hash)  # => false
    [].all?(Integer)                     # => true

With a block given, returns whether the block returns a truthy value for every
element:

    (1..4).all? {|element| element < 5 }                    # => true
    (1..4).all? {|element| element < 4 }                    # => false
    {foo: 0, bar: 1, baz: 2}.all? {|key, value| value < 3 } # => true
    {foo: 0, bar: 1, baz: 2}.all? {|key, value| value < 2 } # => false

Related: #any?, #none? #one?.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## any?(*args) [](#method-i-any?)
Returns `true` if any element satisfies a given criterion; `false` otherwise.

If `self` has no element, returns `false` and argument or block are not used.

With no argument and no block, returns `true` if `self` is non-empty; `false`
if empty.

With argument `object` and no block, returns `true` if for any key `key`
`h.assoc(key) == object`:
    h = {foo: 0, bar: 1, baz: 2}
    h.any?([:bar, 1]) # => true
    h.any?([:bar, 0]) # => false
    h.any?([:baz, 1]) # => false

With no argument and a block, calls the block with each key-value pair;
returns `true` if the block returns any truthy value, `false` otherwise:
    h = {foo: 0, bar: 1, baz: 2}
    h.any? {|key, value| value < 3 } # => true
    h.any? {|key, value| value > 3 } # => false

Related: Enumerable#any?

**@overload** [] 

**@overload** [] 

**@overload** [] 

## assoc(key) [](#method-i-assoc)
If the given `key` is found, returns a 2-element Array containing that key and
its value:
    h = {foo: 0, bar: 1, baz: 2}
    h.assoc(:bar) # => [:bar, 1]

Returns `nil` if key `key` is not found.

**@overload** [] 

## chain(*args) [](#method-i-chain)
Returns an enumerator object generated from this enumerator and given
enumerables.

    e = (1..3).chain([4, 5])
    e.to_a #=> [1, 2, 3, 4, 5]

**@overload** [] 

## chunk() [](#method-i-chunk)
Each element in the returned enumerator is a 2-element array consisting of:

*   A value returned by the block.
*   An array ("chunk") containing the element for which that value was
    returned, and all following elements for which the block returned the same
    value:

So that:

*   Each block return value that is different from its predecessor begins a
    new chunk.
*   Each block return value that is the same as its predecessor continues the
    same chunk.

Example:

    e = (0..10).chunk {|i| (i / 3).floor } # => #<Enumerator: ...>
    # The enumerator elements.
    e.next # => [0, [0, 1, 2]]
    e.next # => [1, [3, 4, 5]]
    e.next # => [2, [6, 7, 8]]
    e.next # => [3, [9, 10]]

Method `chunk` is especially useful for an enumerable that is already sorted.
This example counts words for each initial letter in a large array of words:

    # Get sorted words from a web page.
    url = 'https://raw.githubusercontent.com/eneko/data-repository/master/data/words.txt'
    words = URI::open(url).readlines
    # Make chunks, one for each letter.
    e = words.chunk {|word| word.upcase[0] } # => #<Enumerator: ...>
    # Display 'A' through 'F'.
    e.each {|c, words| p [c, words.length]; break if c == 'F' }

Output:

    ["A", 17096]
    ["B", 11070]
    ["C", 19901]
    ["D", 10896]
    ["E", 8736]
    ["F", 6860]

You can use the special symbol `:_alone` to force an element into its own
separate chuck:

    a = [0, 0, 1, 1]
    e = a.chunk{|i| i.even? ? :_alone : true }
    e.to_a # => [[:_alone, [0]], [:_alone, [0]], [true, [1, 1]]]

For example, you can put each line that contains a URL into its own chunk:

    pattern = /http/
    open(filename) { |f|
      f.chunk { |line| line =~ pattern ? :_alone : true }.each { |key, lines|
        pp lines
      }
    }

You can use the special symbol `:_separator` or `nil` to force an element to
be ignored (not included in any chunk):

    a = [0, 0, -1, 1, 1]
    e = a.chunk{|i| i < 0 ? :_separator : true }
    e.to_a # => [[true, [0, 0]], [true, [1, 1]]]

Note that the separator does end the chunk:

    a = [0, 0, -1, 1, -1, 1]
    e = a.chunk{|i| i < 0 ? :_separator : true }
    e.to_a # => [[true, [0, 0]], [true, [1]], [true, [1]]]

For example, the sequence of hyphens in svn log can be eliminated as follows:

    sep = "-"*72 + "\n"
    IO.popen("svn log README") { |f|
      f.chunk { |line|
        line != sep || nil
      }.each { |_, lines|
        pp lines
      }
    }
    #=> ["r20018 | knu | 2008-10-29 13:20:42 +0900 (Wed, 29 Oct 2008) | 2 lines\n",
    #    "\n",
    #    "* README, README.ja: Update the portability section.\n",
    #    "\n"]
    #   ["r16725 | knu | 2008-05-31 23:34:23 +0900 (Sat, 31 May 2008) | 2 lines\n",
    #    "\n",
    #    "* README, README.ja: Add a note about default C flags.\n",
    #    "\n"]
    #   ...

Paragraphs separated by empty lines can be parsed as follows:

    File.foreach("README").chunk { |line|
      /\A\s*\z/ !~ line || nil
    }.each { |_, lines|
      pp lines
    }

**@overload** [] 

## chunk_while() [](#method-i-chunk_while)
Creates an enumerator for each chunked elements. The beginnings of chunks are
defined by the block.

This method splits each chunk using adjacent elements, *elt_before* and
*elt_after*, in the receiver enumerator. This method split chunks between
*elt_before* and *elt_after* where the block returns `false`.

The block is called the length of the receiver enumerator minus one.

The result enumerator yields the chunked elements as an array. So `each`
method can be called as follows:

    enum.chunk_while { |elt_before, elt_after| bool }.each { |ary| ... }

Other methods of the Enumerator class and Enumerable module, such as `to_a`,
`map`, etc., are also usable.

For example, one-by-one increasing subsequence can be chunked as follows:

    a = [1,2,4,9,10,11,12,15,16,19,20,21]
    b = a.chunk_while {|i, j| i+1 == j }
    p b.to_a #=> [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
    c = b.map {|a| a.length < 3 ? a : "#{a.first}-#{a.last}" }
    p c #=> [[1, 2], [4], "9-12", [15, 16], "19-21"]
    d = c.join(",")
    p d #=> "1,2,4,9-12,15,16,19-21"

Increasing (non-decreasing) subsequence can be chunked as follows:

    a = [0, 9, 2, 2, 3, 2, 7, 5, 9, 5]
    p a.chunk_while {|i, j| i <= j }.to_a
    #=> [[0, 9], [2, 2, 3], [2, 7], [5, 9], [5]]

Adjacent evens and odds can be chunked as follows: (Enumerable#chunk is
another way to do it.)

    a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
    p a.chunk_while {|i, j| i.even? == j.even? }.to_a
    #=> [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]

Enumerable#slice_when does the same, except splitting when the block returns
`true` instead of `false`.

**@overload** [] 

## clear() [](#method-i-clear)
Removes all hash entries; returns `self`.

**@overload** [] 

## collect() [](#method-i-collect)
Returns an array of objects returned by the block.

With a block given, calls the block with successive elements; returns an array
of the objects returned by the block:

    (0..4).map {|i| i*i }                               # => [0, 1, 4, 9, 16]
    {foo: 0, bar: 1, baz: 2}.map {|key, value| value*2} # => [0, 2, 4]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## collect_concat() [](#method-i-collect_concat)
Returns an array of flattened objects returned by the block.

With a block given, calls the block with successive elements; returns a
flattened array of objects returned by the block:

    [0, 1, 2, 3].flat_map {|element| -element }                    # => [0, -1, -2, -3]
    [0, 1, 2, 3].flat_map {|element| [element, -element] }         # => [0, 0, 1, -1, 2, -2, 3, -3]
    [[0, 1], [2, 3]].flat_map {|e| e + [100] }                     # => [0, 1, 100, 2, 3, 100]
    {foo: 0, bar: 1, baz: 2}.flat_map {|key, value| [key, value] } # => [:foo, 0, :bar, 1, :baz, 2]

With no block given, returns an Enumerator.

Alias: #collect_concat.

**@overload** [] 

**@overload** [] 

## compact() [](#method-i-compact)
Returns a copy of `self` with all `nil`-valued entries removed:
    h = {foo: 0, bar: nil, baz: 2, bat: nil}
    h1 = h.compact
    h1 # => {:foo=>0, :baz=>2}

**@overload** [] 

## compact!() [](#method-i-compact!)
Returns `self` with all its `nil`-valued entries removed (in place):
    h = {foo: 0, bar: nil, baz: 2, bat: nil}
    h.compact! # => {:foo=>0, :baz=>2}

Returns `nil` if no entries were removed.

**@overload** [] 

## compare_by_identity() [](#method-i-compare_by_identity)
Sets `self` to consider only identity in comparing keys; two keys are
considered the same only if they are the same object; returns `self`.

By default, these two object are considered to be the same key, so `s1` will
overwrite `s0`:
    s0 = 'x'
    s1 = 'x'
    h = {}
    h.compare_by_identity? # => false
    h[s0] = 0
    h[s1] = 1
    h # => {"x"=>1}

After calling #compare_by_identity, the keys are considered to be different,
and therefore do not overwrite each other:
    h = {}
    h.compare_by_identity # => {}
    h.compare_by_identity? # => true
    h[s0] = 0
    h[s1] = 1
    h # => {"x"=>0, "x"=>1}

**@overload** [] 

## compare_by_identity?() [](#method-i-compare_by_identity?)
Returns `true` if #compare_by_identity has been called, `false` otherwise.

**@overload** [] 

## count(*args) [](#method-i-count)
Returns the count of elements, based on an argument or block criterion, if
given.

With no argument and no block given, returns the number of elements:

    [0, 1, 2].count                # => 3
    {foo: 0, bar: 1, baz: 2}.count # => 3

With argument `object` given, returns the number of elements that are `==` to
`object`:

    [0, 1, 2, 1].count(1)           # => 2

With a block given, calls the block with each element and returns the number
of elements for which the block returns a truthy value:

    [0, 1, 2, 3].count {|element| element < 2}              # => 2
    {foo: 0, bar: 1, baz: 2}.count {|key, value| value < 2} # => 2

**@overload** [] 

**@overload** [] 

**@overload** [] 

## cycle(*args) [](#method-i-cycle)
When called with positive integer argument `n` and a block, calls the block
with each element, then does so again, until it has done so `n` times; returns
`nil`:

    a = []
    (1..4).cycle(3) {|element| a.push(element) } # => nil
    a # => [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4]
    a = []
    ('a'..'d').cycle(2) {|element| a.push(element) }
    a # => ["a", "b", "c", "d", "a", "b", "c", "d"]
    a = []
    {foo: 0, bar: 1, baz: 2}.cycle(2) {|element| a.push(element) }
    a # => [[:foo, 0], [:bar, 1], [:baz, 2], [:foo, 0], [:bar, 1], [:baz, 2]]

If count is zero or negative, does not call the block.

When called with a block and `n` is `nil`, cycles forever.

When no block is given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
:nodoc:

## default(*args) [](#method-i-default)
Returns the default value for the given `key`. The returned value will be
determined either by the default proc or by the default value. See [Default
Values](rdoc-ref:Hash@Default+Values).

With no argument, returns the current default value:
    h = {}
    h.default # => nil

If `key` is given, returns the default value for `key`, regardless of whether
that key exists:
    h = Hash.new { |hash, key| hash[key] = "No key #{key}"}
    h[:foo] = "Hello"
    h.default(:foo) # => "No key foo"

**@overload** [] 

**@overload** [] 

## default=(ifnone) [](#method-i-default=)
Sets the default value to `value`; returns `value`:
    h = {}
    h.default # => nil
    h.default = false # => false
    h.default # => false

See [Default Values](rdoc-ref:Hash@Default+Values).

**@overload** [] 

## default_proc() [](#method-i-default_proc)
Returns the default proc for `self` (see [Default
Values](rdoc-ref:Hash@Default+Values)):
    h = {}
    h.default_proc # => nil
    h.default_proc = proc {|hash, key| "Default value for #{key}" }
    h.default_proc.class # => Proc

**@overload** [] 

## default_proc=(proc) [](#method-i-default_proc=)
Sets the default proc for `self` to `proc` (see [Default
Values](rdoc-ref:Hash@Default+Values)):
    h = {}
    h.default_proc # => nil
    h.default_proc = proc { |hash, key| "Default value for #{key}" }
    h.default_proc.class # => Proc
    h.default_proc = nil
    h.default_proc # => nil

**@overload** [] 

## delete(key) [](#method-i-delete)
Deletes the entry for the given `key` and returns its associated value.

If no block is given and `key` is found, deletes the entry and returns the
associated value:
    h = {foo: 0, bar: 1, baz: 2}
    h.delete(:bar) # => 1
    h # => {:foo=>0, :baz=>2}

If no block given and `key` is not found, returns `nil`.

If a block is given and `key` is found, ignores the block, deletes the entry,
and returns the associated value:
    h = {foo: 0, bar: 1, baz: 2}
    h.delete(:baz) { |key| raise 'Will never happen'} # => 2
    h # => {:foo=>0, :bar=>1}

If a block is given and `key` is not found, calls the block and returns the
block's return value:
    h = {foo: 0, bar: 1, baz: 2}
    h.delete(:nosuch) { |key| "Key #{key} not found" } # => "Key nosuch not found"
    h # => {:foo=>0, :bar=>1, :baz=>2}

**@overload** [] 

**@overload** [] 

## delete_if() [](#method-i-delete_if)
If a block given, calls the block with each key-value pair; deletes each entry
for which the block returns a truthy value; returns `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.delete_if {|key, value| value > 0 } # => {:foo=>0}

If no block given, returns a new Enumerator:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.delete_if # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:delete_if>
    e.each { |key, value| value > 0 } # => {:foo=>0}

**@overload** [] 

**@overload** [] 

## detect(*args) [](#method-i-detect)
Returns the first element for which the block returns a truthy value.

With a block given, calls the block with successive elements of the
collection; returns the first element for which the block returns a truthy
value:

    (0..9).find {|element| element > 2}                # => 3

If no such element is found, calls `if_none_proc` and returns its return
value.

    (0..9).find(proc {false}) {|element| element > 12} # => false
    {foo: 0, bar: 1, baz: 2}.find {|key, value| key.start_with?('b') }            # => [:bar, 1]
    {foo: 0, bar: 1, baz: 2}.find(proc {[]}) {|key, value| key.start_with?('c') } # => []

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## dig(*args) [](#method-i-dig)
Finds and returns the object in nested objects that is specified by `key` and
`identifiers`. The nested objects may be instances of various classes. See
[Dig Methods](rdoc-ref:dig_methods.rdoc).

Nested Hashes:
    h = {foo: {bar: {baz: 2}}}
    h.dig(:foo) # => {:bar=>{:baz=>2}}
    h.dig(:foo, :bar) # => {:baz=>2}
    h.dig(:foo, :bar, :baz) # => 2
    h.dig(:foo, :bar, :BAZ) # => nil

Nested Hashes and Arrays:
    h = {foo: {bar: [:a, :b, :c]}}
    h.dig(:foo, :bar, 2) # => :c

This method will use the [default values](rdoc-ref:Hash@Default+Values) for
keys that are not present:
    h = {foo: {bar: [:a, :b, :c]}}
    h.dig(:hello) # => nil
    h.default_proc = -> (hash, _key) { hash }
    h.dig(:hello, :world) # => h
    h.dig(:hello, :world, :foo, :bar, 2) # => :c

**@overload** [] 

## drop(n) [](#method-i-drop)
For positive integer `n`, returns an array containing all but the first `n`
elements:

    r = (1..4)
    r.drop(3)  # => [4]
    r.drop(2)  # => [3, 4]
    r.drop(1)  # => [2, 3, 4]
    r.drop(0)  # => [1, 2, 3, 4]
    r.drop(50) # => []

    h = {foo: 0, bar: 1, baz: 2, bat: 3}
    h.drop(2) # => [[:baz, 2], [:bat, 3]]

**@overload** [] 

## drop_while() [](#method-i-drop_while)
Calls the block with successive elements as long as the block returns a truthy
value; returns an array of all elements after that point:

    (1..4).drop_while{|i| i < 3 } # => [3, 4]
    h = {foo: 0, bar: 1, baz: 2}
    a = h.drop_while{|element| key, value = *element; value < 2 }
    a # => [[:baz, 2]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each() [](#method-i-each)
Calls the given block with each key-value pair; returns `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.each_pair {|key, value| puts "#{key}: #{value}"} # => {:foo=>0, :bar=>1, :baz=>2}

Output:
    foo: 0
    bar: 1
    baz: 2

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.each_pair # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:each_pair>
    h1 = e.each {|key, value| puts "#{key}: #{value}"}
    h1 # => {:foo=>0, :bar=>1, :baz=>2}

Output:
    foo: 0
    bar: 1
    baz: 2

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## each_cons(n) [](#method-i-each_cons)
Calls the block with each successive overlapped `n`-tuple of elements; returns
`self`:

    a = []
    (1..5).each_cons(3) {|element| a.push(element) }
    a # => [[1, 2, 3], [2, 3, 4], [3, 4, 5]]

    a = []
    h = {foo: 0,  bar: 1, baz: 2, bam: 3}
    h.each_cons(2) {|element| a.push(element) }
    a # => [[[:foo, 0], [:bar, 1]], [[:bar, 1], [:baz, 2]], [[:baz, 2], [:bam, 3]]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each_entry(*args) [](#method-i-each_entry)
Calls the given block with each element, converting multiple values from yield
to an array; returns `self`:

    a = []
    (1..4).each_entry {|element| a.push(element) } # => 1..4
    a # => [1, 2, 3, 4]

    a = []
    h = {foo: 0, bar: 1, baz:2}
    h.each_entry {|element| a.push(element) }
    # => {:foo=>0, :bar=>1, :baz=>2}
    a # => [[:foo, 0], [:bar, 1], [:baz, 2]]

    class Foo
      include Enumerable
      def each
        yield 1
        yield 1, 2
        yield
      end
    end
    Foo.new.each_entry {|yielded| p yielded }

Output:

    1
    [1, 2]
    nil

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each_key() [](#method-i-each_key)
Calls the given block with each key; returns `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.each_key {|key| puts key }  # => {:foo=>0, :bar=>1, :baz=>2}

Output:
    foo
    bar
    baz

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.each_key # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:each_key>
    h1 = e.each {|key| puts key }
    h1 # => {:foo=>0, :bar=>1, :baz=>2}

Output:
    foo
    bar
    baz

**@overload** [] 

**@overload** [] 

## each_pair() [](#method-i-each_pair)
Calls the given block with each key-value pair; returns `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.each_pair {|key, value| puts "#{key}: #{value}"} # => {:foo=>0, :bar=>1, :baz=>2}

Output:
    foo: 0
    bar: 1
    baz: 2

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.each_pair # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:each_pair>
    h1 = e.each {|key, value| puts "#{key}: #{value}"}
    h1 # => {:foo=>0, :bar=>1, :baz=>2}

Output:
    foo: 0
    bar: 1
    baz: 2

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## each_slice(n) [](#method-i-each_slice)
Calls the block with each successive disjoint `n`-tuple of elements; returns
`self`:

    a = []
    (1..10).each_slice(3) {|tuple| a.push(tuple) }
    a # => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

    a = []
    h = {foo: 0, bar: 1, baz: 2, bat: 3, bam: 4}
    h.each_slice(2) {|tuple| a.push(tuple) }
    a # => [[[:foo, 0], [:bar, 1]], [[:baz, 2], [:bat, 3]], [[:bam, 4]]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each_value() [](#method-i-each_value)
Calls the given block with each value; returns `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.each_value {|value| puts value } # => {:foo=>0, :bar=>1, :baz=>2}

Output:
    0
    1
    2

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.each_value # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:each_value>
    h1 = e.each {|value| puts value }
    h1 # => {:foo=>0, :bar=>1, :baz=>2}

Output:
    0
    1
    2

**@overload** [] 

**@overload** [] 

## each_with_index(*args) [](#method-i-each_with_index)
Invoke `self.each` with `*args`. With a block given, the block receives each
element and its index; returns `self`:

    h = {}
    (1..4).each_with_index {|element, i| h[element] = i } # => 1..4
    h # => {1=>0, 2=>1, 3=>2, 4=>3}

    h = {}
    %w[a b c d].each_with_index {|element, i| h[element] = i }
    # => ["a", "b", "c", "d"]
    h # => {"a"=>0, "b"=>1, "c"=>2, "d"=>3}

    a = []
    h = {foo: 0, bar: 1, baz: 2}
    h.each_with_index {|element, i| a.push([i, element]) }
    # => {:foo=>0, :bar=>1, :baz=>2}
    a # => [[0, [:foo, 0]], [1, [:bar, 1]], [2, [:baz, 2]]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## each_with_object(memo) [](#method-i-each_with_object)
Calls the block once for each element, passing both the element and the given
object:

    (1..4).each_with_object([]) {|i, a| a.push(i**2) }
    # => [1, 4, 9, 16]

    {foo: 0, bar: 1, baz: 2}.each_with_object({}) {|(k, v), h| h[v] = k }
    # => {0=>:foo, 1=>:bar, 2=>:baz}

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## empty?() [](#method-i-empty?)
Returns `true` if there are no hash entries, `false` otherwise:
    {}.empty? # => true
    {foo: 0, bar: 1, baz: 2}.empty? # => false

**@overload** [] 

## entries(*args) [](#method-i-entries)
Returns an array containing the items in `self`:

    (0..4).to_a # => [0, 1, 2, 3, 4]

**@overload** [] 

## eql?(hash2) [](#method-i-eql?)
Returns `true` if all of the following are true:
*   `object` is a `Hash` object.
*   `hash` and `object` have the same keys (regardless of order).
*   For each key `key`, `h[key].eql?(object[key])`.

Otherwise, returns `false`.

    h1 = {foo: 0, bar: 1, baz: 2}
    h2 = {foo: 0, bar: 1, baz: 2}
    h1.eql? h2 # => true
    h3 = {baz: 2, bar: 1, foo: 0}
    h1.eql? h3 # => true

**@overload** [] 

## except(*args) [](#method-i-except)
Returns a new `Hash` excluding entries for the given `keys`:
    h = { a: 100, b: 200, c: 300 }
    h.except(:a)          #=> {:b=>200, :c=>300}

Any given `keys` that are not found are ignored.

**@overload** [] 

## fetch(*args) [](#method-i-fetch)
Returns the value for the given `key`, if found.
    h = {foo: 0, bar: 1, baz: 2}
    h.fetch(:bar) # => 1

If `key` is not found and no block was given, returns `default_value`:
    {}.fetch(:nosuch, :default) # => :default

If `key` is not found and a block was given, yields `key` to the block and
returns the block's return value:
    {}.fetch(:nosuch) {|key| "No key #{key}"} # => "No key nosuch"

Raises KeyError if neither `default_value` nor a block was given.

Note that this method does not use the values of either #default or
#default_proc.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## fetch_values(*args) [](#method-i-fetch_values)
Returns a new Array containing the values associated with the given keys
*keys:
    h = {foo: 0, bar: 1, baz: 2}
    h.fetch_values(:baz, :foo) # => [2, 0]

Returns a new empty Array if no arguments given.

When a block is given, calls the block with each missing key, treating the
block's return value as the value for that key:
    h = {foo: 0, bar: 1, baz: 2}
    values = h.fetch_values(:bar, :foo, :bad, :bam) {|key| key.to_s}
    values # => [1, 0, "bad", "bam"]

When no block is given, raises an exception if any given key is not found.

**@overload** [] 

**@overload** [] 

## filter() [](#method-i-filter)
Returns a new `Hash` object whose entries are those for which the block
returns a truthy value:
    h = {foo: 0, bar: 1, baz: 2}
    h.select {|key, value| value < 2 } # => {:foo=>0, :bar=>1}

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.select # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:select>
    e.each {|key, value| value < 2 } # => {:foo=>0, :bar=>1}

**@overload** [] 

**@overload** [] 

## filter!() [](#method-i-filter!)
Returns `self`, whose entries are those for which the block returns a truthy
value:
    h = {foo: 0, bar: 1, baz: 2}
    h.select! {|key, value| value < 2 }  => {:foo=>0, :bar=>1}

Returns `nil` if no entries were removed.

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.select!  # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:select!>
    e.each { |key, value| value < 2 } # => {:foo=>0, :bar=>1}

**@overload** [] 

**@overload** [] 

## filter_map() [](#method-i-filter_map)
Returns an array containing truthy elements returned by the block.

With a block given, calls the block with successive elements; returns an array
containing each truthy value returned by the block:

    (0..9).filter_map {|i| i * 2 if i.even? }                              # => [0, 4, 8, 12, 16]
    {foo: 0, bar: 1, baz: 2}.filter_map {|key, value| key if value.even? } # => [:foo, :baz]

When no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## find(*args) [](#method-i-find)
Returns the first element for which the block returns a truthy value.

With a block given, calls the block with successive elements of the
collection; returns the first element for which the block returns a truthy
value:

    (0..9).find {|element| element > 2}                # => 3

If no such element is found, calls `if_none_proc` and returns its return
value.

    (0..9).find(proc {false}) {|element| element > 12} # => false
    {foo: 0, bar: 1, baz: 2}.find {|key, value| key.start_with?('b') }            # => [:bar, 1]
    {foo: 0, bar: 1, baz: 2}.find(proc {[]}) {|key, value| key.start_with?('c') } # => []

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## find_all() [](#method-i-find_all)
Returns an array containing elements selected by the block.

With a block given, calls the block with successive elements; returns an array
of those elements for which the block returns a truthy value:

    (0..9).select {|element| element % 3 == 0 } # => [0, 3, 6, 9]
    a = {foo: 0, bar: 1, baz: 2}.select {|key, value| key.start_with?('b') }
    a # => {:bar=>1, :baz=>2}

With no block given, returns an Enumerator.

Related: #reject.

**@overload** [] 

**@overload** [] 

## find_index(*args) [](#method-i-find_index)
Returns the index of the first element that meets a specified criterion, or
`nil` if no such element is found.

With argument `object` given, returns the index of the first element that is
`==` `object`:

    ['a', 'b', 'c', 'b'].find_index('b') # => 1

With a block given, calls the block with successive elements; returns the
first element for which the block returns a truthy value:

    ['a', 'b', 'c', 'b'].find_index {|element| element.start_with?('b') } # => 1
    {foo: 0, bar: 1, baz: 2}.find_index {|key, value| value > 1 }         # => 2

With no argument and no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## first(*args) [](#method-i-first)
Returns the first element or elements.

With no argument, returns the first element, or `nil` if there is none:

    (1..4).first                   # => 1
    %w[a b c].first                # => "a"
    {foo: 1, bar: 1, baz: 2}.first # => [:foo, 1]
    [].first                       # => nil

With integer argument `n`, returns an array containing the first `n` elements
that exist:

    (1..4).first(2)                   # => [1, 2]
    %w[a b c d].first(3)              # => ["a", "b", "c"]
    %w[a b c d].first(50)             # => ["a", "b", "c", "d"]
    {foo: 1, bar: 1, baz: 2}.first(2) # => [[:foo, 1], [:bar, 1]]
    [].first(2)                       # => []

**@overload** [] 

**@overload** [] 

## flat_map() [](#method-i-flat_map)
Returns an array of flattened objects returned by the block.

With a block given, calls the block with successive elements; returns a
flattened array of objects returned by the block:

    [0, 1, 2, 3].flat_map {|element| -element }                    # => [0, -1, -2, -3]
    [0, 1, 2, 3].flat_map {|element| [element, -element] }         # => [0, 0, 1, -1, 2, -2, 3, -3]
    [[0, 1], [2, 3]].flat_map {|e| e + [100] }                     # => [0, 1, 100, 2, 3, 100]
    {foo: 0, bar: 1, baz: 2}.flat_map {|key, value| [key, value] } # => [:foo, 0, :bar, 1, :baz, 2]

With no block given, returns an Enumerator.

Alias: #collect_concat.

**@overload** [] 

**@overload** [] 

## flatten(*args) [](#method-i-flatten)
Returns a new Array object that is a 1-dimensional flattening of `self`.

---

By default, nested Arrays are not flattened:
    h = {foo: 0, bar: [:bat, 3], baz: 2}
    h.flatten # => [:foo, 0, :bar, [:bat, 3], :baz, 2]

Takes the depth of recursive flattening from Integer argument `level`:
    h = {foo: 0, bar: [:bat, [:baz, [:bat, ]]]}
    h.flatten(1) # => [:foo, 0, :bar, [:bat, [:baz, [:bat]]]]
    h.flatten(2) # => [:foo, 0, :bar, :bat, [:baz, [:bat]]]
    h.flatten(3) # => [:foo, 0, :bar, :bat, :baz, [:bat]]
    h.flatten(4) # => [:foo, 0, :bar, :bat, :baz, :bat]

When `level` is negative, flattens all nested Arrays:
    h = {foo: 0, bar: [:bat, [:baz, [:bat, ]]]}
    h.flatten(-1) # => [:foo, 0, :bar, :bat, :baz, :bat]
    h.flatten(-2) # => [:foo, 0, :bar, :bat, :baz, :bat]

When `level` is zero, returns the equivalent of #to_a :
    h = {foo: 0, bar: [:bat, 3], baz: 2}
    h.flatten(0) # => [[:foo, 0], [:bar, [:bat, 3]], [:baz, 2]]
    h.flatten(0) == h.to_a # => true

**@overload** [] 

**@overload** [] 

## freeze() [](#method-i-freeze)
:nodoc:

## grep(pat) [](#method-i-grep)
Returns an array of objects based elements of `self` that match the given
pattern.

With no block given, returns an array containing each element for which
`pattern === element` is `true`:

    a = ['foo', 'bar', 'car', 'moo']
    a.grep(/ar/)                   # => ["bar", "car"]
    (1..10).grep(3..8)             # => [3, 4, 5, 6, 7, 8]
    ['a', 'b', 0, 1].grep(Integer) # => [0, 1]

With a block given, calls the block with each matching element and returns an
array containing each object returned by the block:

    a = ['foo', 'bar', 'car', 'moo']
    a.grep(/ar/) {|element| element.upcase } # => ["BAR", "CAR"]

Related: #grep_v.

**@overload** [] 

**@overload** [] 

## grep_v(pat) [](#method-i-grep_v)
Returns an array of objects based on elements of `self` that *don't* match the
given pattern.

With no block given, returns an array containing each element for which
`pattern === element` is `false`:

    a = ['foo', 'bar', 'car', 'moo']
    a.grep_v(/ar/)                   # => ["foo", "moo"]
    (1..10).grep_v(3..8)             # => [1, 2, 9, 10]
    ['a', 'b', 0, 1].grep_v(Integer) # => ["a", "b"]

With a block given, calls the block with each non-matching element and returns
an array containing each object returned by the block:

    a = ['foo', 'bar', 'car', 'moo']
    a.grep_v(/ar/) {|element| element.upcase } # => ["FOO", "MOO"]

Related: #grep.

**@overload** [] 

**@overload** [] 

## group_by() [](#method-i-group_by)
With a block given returns a hash:

*   Each key is a return value from the block.
*   Each value is an array of those elements for which the block returned that
    key.

Examples:

    g = (1..6).group_by {|i| i%3 }
    g # => {1=>[1, 4], 2=>[2, 5], 0=>[3, 6]}
    h = {foo: 0, bar: 1, baz: 0, bat: 1}
    g = h.group_by {|key, value| value }
    g # => {0=>[[:foo, 0], [:baz, 0]], 1=>[[:bar, 1], [:bat, 1]]}

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## has_key?(key) [](#method-i-has_key?)
Returns `true` if `key` is a key in `self`, otherwise `false`.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## has_value?(val) [](#method-i-has_value?)
Returns `true` if `value` is a value in `self`, otherwise `false`.

**@overload** [] 

**@overload** [] 

## hash() [](#method-i-hash)
Returns the Integer hash-code for the hash.

Two `Hash` objects have the same hash-code if their content is the same
(regardless of order):
    h1 = {foo: 0, bar: 1, baz: 2}
    h2 = {baz: 2, bar: 1, foo: 0}
    h2.hash == h1.hash # => true
    h2.eql? h1 # => true

**@overload** [] 

## include?(key) [](#method-i-include?)
Returns `true` if `key` is a key in `self`, otherwise `false`.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize(ifnone(ifnone_unset = true), capacity:0, &block) [](#method-i-initialize)
call-seq:
    Hash.new(default_value = nil) -> new_hash
    Hash.new(default_value = nil, capacity: size) -> new_hash
    Hash.new {|hash, key| ... } -> new_hash
    Hash.new(capacity: size) {|hash, key| ... } -> new_hash

Returns a new empty `Hash` object.

The initial default value and initial default proc for the new hash depend on
which form above was used. See [Default Values](rdoc-ref:Hash@Default+Values).

If neither an argument nor a block is given, initializes both the default
value and the default proc to `nil`:
    h = Hash.new
    h.default # => nil
    h.default_proc # => nil

If argument `default_value` is given but no block is given, initializes the
default value to the given `default_value` and the default proc to `nil`:
    h = Hash.new(false)
    h.default # => false
    h.default_proc # => nil

If a block is given but no `default_value`, stores the block as the default
proc and sets the default value to `nil`:
    h = Hash.new {|hash, key| "Default value for #{key}" }
    h.default # => nil
    h.default_proc.class # => Proc
    h[:nosuch] # => "Default value for nosuch"

If both a block and a `default_value` are given, raises an `ArgumentError`

If the optional keyword argument `capacity` is given, the hash will be
allocated with enough capacity to accommodate this many keys without having to
be resized.

**@return** [Hash] a new instance of Hash

## initialize_copy(hash2) [](#method-i-initialize_copy)
Replaces the entire contents of `self` with the contents of `other_hash`;
returns `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.replace({bat: 3, bam: 4}) # => {:bat=>3, :bam=>4}

**@overload** [] 

## inject(*args) [](#method-i-inject)
Returns the result of applying a reducer to an initial value and the first
element of the Enumerable. It then takes the result and applies the function
to it and the second element of the collection, and so on. The return value is
the result returned by the final call to the function.

You can think of

    [ a, b, c, d ].inject(i) { |r, v| fn(r, v) }

as being

    fn(fn(fn(fn(i, a), b), c), d)

In a way the `inject` function *injects* the function between the elements of
the enumerable.

`inject` is aliased as `reduce`. You use it when you want to *reduce* a
collection to a single value.

**The Calling Sequences**

Let's start with the most verbose:

    enum.inject(initial_value) do |result, next_value|
      # do something with +result+ and +next_value+
      # the value returned by the block becomes the
      # value passed in to the next iteration
      # as +result+
    end

For example:

    product = [ 2, 3, 4 ].inject(1) do |result, next_value|
      result * next_value
    end
    product #=> 24

When this runs, the block is first called with `1` (the initial value) and `2`
(the first element of the array). The block returns `1*2`, so on the next
iteration the block is called with `2` (the previous result) and `3`. The
block returns `6`, and is called one last time with `6` and `4`. The result of
the block, `24` becomes the value returned by `inject`. This code returns the
product of the elements in the enumerable.

**First Shortcut: Default Initial value**

In the case of the previous example, the initial value, `1`, wasn't really
necessary: the calculation of the product of a list of numbers is
self-contained.

In these circumstances, you can omit the `initial_value` parameter. `inject`
will then initially call the block with the first element of the collection as
the `result` parameter and the second element as the `next_value`.

    [ 2, 3, 4 ].inject do |result, next_value|
      result * next_value
    end

This shortcut is convenient, but can only be used when the block produces a
result which can be passed back to it as a first parameter.

Here's an example where that's not the case: it returns a hash where the keys
are words and the values are the number of occurrences of that word in the
enumerable.

    freqs = File.read("README.md")
      .scan(/\w{2,}/)
      .reduce(Hash.new(0)) do |counts, word|
        counts[word] += 1
        counts
      end
    freqs #=> {"Actions"=>4,
               "Status"=>5,
               "MinGW"=>3,
               "https"=>27,
               "github"=>10,
               "com"=>15, ...

Note that the last line of the block is just the word `counts`. This ensures
the return value of the block is the result that's being calculated.

**Second Shortcut: a Reducer function**

A *reducer function* is a function that takes a partial result and the next
value, returning the next partial result. The block that is given to `inject`
is a reducer.

You can also write a reducer as a function and pass the name of that function
(as a symbol) to `inject`. However, for this to work, the function

1.  Must be defined on the type of the result value
2.  Must accept a single parameter, the next value in the collection, and
3.  Must return an updated result which will also implement the function.

Here's an example that adds elements to a string. The two calls invoke the
functions String#concat and String#+ on the result so far, passing it the next
value.

    s = [ "cat", " ", "dog" ].inject("", :concat)
    s #=> "cat dog"
    s = [ "cat", " ", "dog" ].inject("The result is:", :+)
    s #=> "The result is: cat dog"

Here's a more complex example when the result object maintains state of a
different type to the enumerable elements.

    class Turtle

      def initialize
        @x = @y = 0
      end

      def move(dir)
        case dir
        when "n" then @y += 1
        when "s" then @y -= 1
        when "e" then @x += 1
        when "w" then @x -= 1
        end
        self
      end
    end

    position = "nnneesw".chars.reduce(Turtle.new, :move)
    position  #=>> #<Turtle:0x00000001052f4698 @y=2, @x=1>

**Third Shortcut: Reducer With no Initial Value**

If your reducer returns a value that it can accept as a parameter, then you
don't have to pass in an initial value. Here `:*` is the name of the *times*
function:

    product = [ 2, 3, 4 ].inject(:*)
    product # => 24

String concatenation again:

    s = [ "cat", " ", "dog" ].inject(:+)
    s #=> "cat dog"

And an example that converts a hash to an array of two-element subarrays.

    nested = {foo: 0, bar: 1}.inject([], :push)
    nested # => [[:foo, 0], [:bar, 1]]

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a new String containing the hash entries:

    h = {foo: 0, bar: 1, baz: 2}
    h.inspect # => "{foo: 0, bar: 1, baz: 2}"

**@overload** [] 

## invert() [](#method-i-invert)
Returns a new `Hash` object with the each key-value pair inverted:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = h.invert
    h1 # => {0=>:foo, 1=>:bar, 2=>:baz}

Overwrites any repeated new keys: (see [Entry
Order](rdoc-ref:Hash@Entry+Order)):
    h = {foo: 0, bar: 0, baz: 0}
    h.invert # => {0=>:baz}

**@overload** [] 

## keep_if() [](#method-i-keep_if)
Calls the block for each key-value pair; retains the entry if the block
returns a truthy value; otherwise deletes the entry; returns `self`.
    h = {foo: 0, bar: 1, baz: 2}
    h.keep_if { |key, value| key.start_with?('b') } # => {:bar=>1, :baz=>2}

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.keep_if # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:keep_if>
    e.each { |key, value| key.start_with?('b') } # => {:bar=>1, :baz=>2}

**@overload** [] 

**@overload** [] 

## key(value) [](#method-i-key)
Returns the key for the first-found entry with the given `value` (see [Entry
Order](rdoc-ref:Hash@Entry+Order)):
    h = {foo: 0, bar: 2, baz: 2}
    h.key(0) # => :foo
    h.key(2) # => :bar

Returns `nil` if no such value is found.

**@overload** [] 

## key?(key) [](#method-i-key?)
Returns `true` if `key` is a key in `self`, otherwise `false`.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## keys() [](#method-i-keys)
Returns a new Array containing all keys in `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.keys # => [:foo, :bar, :baz]

**@overload** [] 

## lazy() [](#method-i-lazy)
Returns an Enumerator::Lazy, which redefines most Enumerable methods to
postpone enumeration and enumerate values only on an as-needed basis.

### Example

The following program finds pythagorean triples:

    def pythagorean_triples
      (1..Float::INFINITY).lazy.flat_map {|z|
        (1..z).flat_map {|x|
          (x..z).select {|y|
            x**2 + y**2 == z**2
          }.map {|y|
            [x, y, z]
          }
        }
      }
    end
    # show first ten pythagorean triples
    p pythagorean_triples.take(10).force # take is lazy, so force is needed
    p pythagorean_triples.first(10)      # first is eager
    # show pythagorean triples less than 100
    p pythagorean_triples.take_while { |*, z| z < 100 }.force

**@overload** [] 

## length() [](#method-i-length)
Returns the count of entries in `self`:

    {foo: 0, bar: 1, baz: 2}.length # => 3

**@overload** [] 

**@overload** [] 

## map() [](#method-i-map)
Returns an array of objects returned by the block.

With a block given, calls the block with successive elements; returns an array
of the objects returned by the block:

    (0..4).map {|i| i*i }                               # => [0, 1, 4, 9, 16]
    {foo: 0, bar: 1, baz: 2}.map {|key, value| value*2} # => [0, 2, 4]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## max(*args) [](#method-i-max)
Returns the element with the maximum element according to a given criterion.
The ordering of equal elements is indeterminate and may be unstable.

With no argument and no block, returns the maximum element, using the
elements' own method `#<=>` for comparison:

    (1..4).max                   # => 4
    (-4..-1).max                 # => -1
    %w[d c b a].max              # => "d"
    {foo: 0, bar: 1, baz: 2}.max # => [:foo, 0]
    [].max                       # => nil

With positive integer argument `n` given, and no block, returns an array
containing the first `n` maximum elements that exist:

    (1..4).max(2)                   # => [4, 3]
    (-4..-1).max(2)                # => [-1, -2]
    %w[d c b a].max(2)              # => ["d", "c"]
    {foo: 0, bar: 1, baz: 2}.max(2) # => [[:foo, 0], [:baz, 2]]
    [].max(2)                       # => []

With a block given, the block determines the maximum elements. The block is
called with two elements `a` and `b`, and must return:

*   A negative integer if `a < b`.
*   Zero if `a == b`.
*   A positive integer if `a > b`.

With a block given and no argument, returns the maximum element as determined
by the block:

    %w[xxx x xxxx xx].max {|a, b| a.size <=> b.size } # => "xxxx"
    h = {foo: 0, bar: 1, baz: 2}
    h.max {|pair1, pair2| pair1[1] <=> pair2[1] }     # => [:baz, 2]
    [].max {|a, b| a <=> b }                          # => nil

With a block given and positive integer argument `n` given, returns an array
containing the first `n` maximum elements that exist, as determined by the
block.

    %w[xxx x xxxx xx].max(2) {|a, b| a.size <=> b.size } # => ["xxxx", "xxx"]
    h = {foo: 0, bar: 1, baz: 2}
    h.max(2) {|pair1, pair2| pair1[1] <=> pair2[1] }
    # => [[:baz, 2], [:bar, 1]]
    [].max(2) {|a, b| a <=> b }                          # => []

Related: #min, #minmax, #max_by.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## max_by(*args) [](#method-i-max_by)
Returns the elements for which the block returns the maximum values.

With a block given and no argument, returns the element for which the block
returns the maximum value:

    (1..4).max_by {|element| -element }                    # => 1
    %w[a b c d].max_by {|element| -element.ord }           # => "a"
    {foo: 0, bar: 1, baz: 2}.max_by {|key, value| -value } # => [:foo, 0]
    [].max_by {|element| -element }                        # => nil

With a block given and positive integer argument `n` given, returns an array
containing the `n` elements for which the block returns maximum values:

    (1..4).max_by(2) {|element| -element }
    # => [1, 2]
    %w[a b c d].max_by(2) {|element| -element.ord }
    # => ["a", "b"]
    {foo: 0, bar: 1, baz: 2}.max_by(2) {|key, value| -value }
    # => [[:foo, 0], [:bar, 1]]
    [].max_by(2) {|element| -element }
    # => []

Returns an Enumerator if no block is given.

Related: #max, #minmax, #min_by.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## member?(key) [](#method-i-member?)
Returns `true` if `key` is a key in `self`, otherwise `false`.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## merge(*args) [](#method-i-merge)
Returns the new `Hash` formed by merging each of `other_hashes` into a copy of
`self`.

Each argument in `other_hashes` must be a `Hash`.

---

With arguments and no block:
*   Returns the new `Hash` object formed by merging each successive `Hash` in
    `other_hashes` into `self`.
*   Each new-key entry is added at the end.
*   Each duplicate-key entry's value overwrites the previous value.

Example:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = {bat: 3, bar: 4}
    h2 = {bam: 5, bat:6}
    h.merge(h1, h2) # => {:foo=>0, :bar=>4, :baz=>2, :bat=>6, :bam=>5}

With arguments and a block:
*   Returns a new `Hash` object that is the merge of `self` and each given
    hash.
*   The given hashes are merged left to right.
*   Each new-key entry is added at the end.
*   For each duplicate key:
    *   Calls the block with the key and the old and new values.
    *   The block's return value becomes the new value for the entry.

Example:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = {bat: 3, bar: 4}
    h2 = {bam: 5, bat:6}
    h3 = h.merge(h1, h2) { |key, old_value, new_value| old_value + new_value }
    h3 # => {:foo=>0, :bar=>5, :baz=>2, :bat=>9, :bam=>5}

With no arguments:
*   Returns a copy of `self`.
*   The block, if given, is ignored.

Example:
    h = {foo: 0, bar: 1, baz: 2}
    h.merge # => {:foo=>0, :bar=>1, :baz=>2}
    h1 = h.merge { |key, old_value, new_value| raise 'Cannot happen' }
    h1 # => {:foo=>0, :bar=>1, :baz=>2}

**@overload** [] 

**@overload** [] 

**@overload** [] 

## merge!(*args) [](#method-i-merge!)
Merges each of `other_hashes` into `self`; returns `self`.

Each argument in `other_hashes` must be a `Hash`.

With arguments and no block:
*   Returns `self`, after the given hashes are merged into it.
*   The given hashes are merged left to right.
*   Each new entry is added at the end.
*   Each duplicate-key entry's value overwrites the previous value.

Example:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = {bat: 3, bar: 4}
    h2 = {bam: 5, bat:6}
    h.merge!(h1, h2) # => {:foo=>0, :bar=>4, :baz=>2, :bat=>6, :bam=>5}

With arguments and a block:
*   Returns `self`, after the given hashes are merged.
*   The given hashes are merged left to right.
*   Each new-key entry is added at the end.
*   For each duplicate key:
    *   Calls the block with the key and the old and new values.
    *   The block's return value becomes the new value for the entry.

Example:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = {bat: 3, bar: 4}
    h2 = {bam: 5, bat:6}
    h3 = h.merge!(h1, h2) { |key, old_value, new_value| old_value + new_value }
    h3 # => {:foo=>0, :bar=>5, :baz=>2, :bat=>9, :bam=>5}

With no arguments:
*   Returns `self`, unmodified.
*   The block, if given, is ignored.

Example:
    h = {foo: 0, bar: 1, baz: 2}
    h.merge # => {:foo=>0, :bar=>1, :baz=>2}
    h1 = h.merge! { |key, old_value, new_value| raise 'Cannot happen' }
    h1 # => {:foo=>0, :bar=>1, :baz=>2}

**@overload** [] 

**@overload** [] 

**@overload** [] 

## min(*args) [](#method-i-min)
Returns the element with the minimum element according to a given criterion.
The ordering of equal elements is indeterminate and may be unstable.

With no argument and no block, returns the minimum element, using the
elements' own method `#<=>` for comparison:

    (1..4).min                   # => 1
    (-4..-1).min                 # => -4
    %w[d c b a].min              # => "a"
    {foo: 0, bar: 1, baz: 2}.min # => [:bar, 1]
    [].min                       # => nil

With positive integer argument `n` given, and no block, returns an array
containing the first `n` minimum elements that exist:

    (1..4).min(2)                   # => [1, 2]
    (-4..-1).min(2)                 # => [-4, -3]
    %w[d c b a].min(2)              # => ["a", "b"]
    {foo: 0, bar: 1, baz: 2}.min(2) # => [[:bar, 1], [:baz, 2]]
    [].min(2)                       # => []

With a block given, the block determines the minimum elements. The block is
called with two elements `a` and `b`, and must return:

*   A negative integer if `a < b`.
*   Zero if `a == b`.
*   A positive integer if `a > b`.

With a block given and no argument, returns the minimum element as determined
by the block:

    %w[xxx x xxxx xx].min {|a, b| a.size <=> b.size } # => "x"
    h = {foo: 0, bar: 1, baz: 2}
    h.min {|pair1, pair2| pair1[1] <=> pair2[1] } # => [:foo, 0]
    [].min {|a, b| a <=> b }                          # => nil

With a block given and positive integer argument `n` given, returns an array
containing the first `n` minimum elements that exist, as determined by the
block.

    %w[xxx x xxxx xx].min(2) {|a, b| a.size <=> b.size } # => ["x", "xx"]
    h = {foo: 0, bar: 1, baz: 2}
    h.min(2) {|pair1, pair2| pair1[1] <=> pair2[1] }
    # => [[:foo, 0], [:bar, 1]]
    [].min(2) {|a, b| a <=> b }                          # => []

Related: #min_by, #minmax, #max.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## min_by(*args) [](#method-i-min_by)
Returns the elements for which the block returns the minimum values.

With a block given and no argument, returns the element for which the block
returns the minimum value:

    (1..4).min_by {|element| -element }                    # => 4
    %w[a b c d].min_by {|element| -element.ord }           # => "d"
    {foo: 0, bar: 1, baz: 2}.min_by {|key, value| -value } # => [:baz, 2]
    [].min_by {|element| -element }                        # => nil

With a block given and positive integer argument `n` given, returns an array
containing the `n` elements for which the block returns minimum values:

    (1..4).min_by(2) {|element| -element }
    # => [4, 3]
    %w[a b c d].min_by(2) {|element| -element.ord }
    # => ["d", "c"]
    {foo: 0, bar: 1, baz: 2}.min_by(2) {|key, value| -value }
    # => [[:baz, 2], [:bar, 1]]
    [].min_by(2) {|element| -element }
    # => []

Returns an Enumerator if no block is given.

Related: #min, #minmax, #max_by.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## minmax() [](#method-i-minmax)
Returns a 2-element array containing the minimum and maximum elements
according to a given criterion. The ordering of equal elements is
indeterminate and may be unstable.

With no argument and no block, returns the minimum and maximum elements, using
the elements' own method `#<=>` for comparison:

    (1..4).minmax                   # => [1, 4]
    (-4..-1).minmax                 # => [-4, -1]
    %w[d c b a].minmax              # => ["a", "d"]
    {foo: 0, bar: 1, baz: 2}.minmax # => [[:bar, 1], [:foo, 0]]
    [].minmax                       # => [nil, nil]

With a block given, returns the minimum and maximum elements as determined by
the block:

    %w[xxx x xxxx xx].minmax {|a, b| a.size <=> b.size } # => ["x", "xxxx"]
    h = {foo: 0, bar: 1, baz: 2}
    h.minmax {|pair1, pair2| pair1[1] <=> pair2[1] }
    # => [[:foo, 0], [:baz, 2]]
    [].minmax {|a, b| a <=> b }                          # => [nil, nil]

Related: #min, #max, #minmax_by.

**@overload** [] 

**@overload** [] 

## minmax_by() [](#method-i-minmax_by)
Returns a 2-element array containing the elements for which the block returns
minimum and maximum values:

    (1..4).minmax_by {|element| -element }
    # => [4, 1]
    %w[a b c d].minmax_by {|element| -element.ord }
    # => ["d", "a"]
    {foo: 0, bar: 1, baz: 2}.minmax_by {|key, value| -value }
    # => [[:baz, 2], [:foo, 0]]
    [].minmax_by {|element| -element }
    # => [nil, nil]

Returns an Enumerator if no block is given.

Related: #max_by, #minmax, #min_by.

**@overload** [] 

**@overload** [] 

## none?(*args) [](#method-i-none?)
Returns whether no element meets a given criterion.

With no argument and no block, returns whether no element is truthy:

    (1..4).none?           # => false
    [nil, false].none?     # => true
    {foo: 0}.none?         # => false
    {foo: 0, bar: 1}.none? # => false
    [].none?               # => true

With argument `pattern` and no block, returns whether for no element
`element`, `pattern === element`:

    [nil, false, 1.1].none?(Integer)      # => true
    %w[bar baz bat bam].none?(/m/)        # => false
    %w[bar baz bat bam].none?(/foo/)      # => true
    %w[bar baz bat bam].none?('ba')       # => true
    {foo: 0, bar: 1, baz: 2}.none?(Hash)  # => true
    {foo: 0}.none?(Array)                 # => false
    [].none?(Integer)                     # => true

With a block given, returns whether the block returns a truthy value for no
element:

    (1..4).none? {|element| element < 1 }                     # => true
    (1..4).none? {|element| element < 2 }                     # => false
    {foo: 0, bar: 1, baz: 2}.none? {|key, value| value < 0 }  # => true
    {foo: 0, bar: 1, baz: 2}.none? {|key, value| value < 1 } # => false

Related: #one?, #all?, #any?.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## one?(*args) [](#method-i-one?)
Returns whether exactly one element meets a given criterion.

With no argument and no block, returns whether exactly one element is truthy:

    (1..1).one?           # => true
    [1, nil, false].one?  # => true
    (1..4).one?           # => false
    {foo: 0}.one?         # => true
    {foo: 0, bar: 1}.one? # => false
    [].one?               # => false

With argument `pattern` and no block, returns whether for exactly one element
`element`, `pattern === element`:

    [nil, false, 0].one?(Integer)        # => true
    [nil, false, 0].one?(Numeric)        # => true
    [nil, false, 0].one?(Float)          # => false
    %w[bar baz bat bam].one?(/m/)        # => true
    %w[bar baz bat bam].one?(/foo/)      # => false
    %w[bar baz bat bam].one?('ba')       # => false
    {foo: 0, bar: 1, baz: 2}.one?(Array) # => false
    {foo: 0}.one?(Array)                 # => true
    [].one?(Integer)                     # => false

With a block given, returns whether the block returns a truthy value for
exactly one element:

    (1..4).one? {|element| element < 2 }                     # => true
    (1..4).one? {|element| element < 1 }                     # => false
    {foo: 0, bar: 1, baz: 2}.one? {|key, value| value < 1 }  # => true
    {foo: 0, bar: 1, baz: 2}.one? {|key, value| value < 2 } # => false

Related: #none?, #all?, #any?.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## partition() [](#method-i-partition)
With a block given, returns an array of two arrays:

*   The first having those elements for which the block returns a truthy
    value.
*   The other having all other elements.

Examples:

    p = (1..4).partition {|i| i.even? }
    p # => [[2, 4], [1, 3]]
    p = ('a'..'d').partition {|c| c < 'c' }
    p # => [["a", "b"], ["c", "d"]]
    h = {foo: 0, bar: 1, baz: 2, bat: 3}
    p = h.partition {|key, value| key.start_with?('b') }
    p # => [[[:bar, 1], [:baz, 2], [:bat, 3]], [[:foo, 0]]]
    p = h.partition {|key, value| value < 2 }
    p # => [[[:foo, 0], [:bar, 1]], [[:baz, 2], [:bat, 3]]]

With no block given, returns an Enumerator.

Related: Enumerable#group_by.

**@overload** [] 

**@overload** [] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## pretty_print_cycle(q) [](#method-i-pretty_print_cycle)
:nodoc:

## rassoc(obj) [](#method-i-rassoc)
Returns a new 2-element Array consisting of the key and value of the
first-found entry whose value is `==` to value (see [Entry
Order](rdoc-ref:Hash@Entry+Order)):
    h = {foo: 0, bar: 1, baz: 1}
    h.rassoc(1) # => [:bar, 1]

Returns `nil` if no such value found.

**@overload** [] 

## reduce(*args) [](#method-i-reduce)
Returns the result of applying a reducer to an initial value and the first
element of the Enumerable. It then takes the result and applies the function
to it and the second element of the collection, and so on. The return value is
the result returned by the final call to the function.

You can think of

    [ a, b, c, d ].inject(i) { |r, v| fn(r, v) }

as being

    fn(fn(fn(fn(i, a), b), c), d)

In a way the `inject` function *injects* the function between the elements of
the enumerable.

`inject` is aliased as `reduce`. You use it when you want to *reduce* a
collection to a single value.

**The Calling Sequences**

Let's start with the most verbose:

    enum.inject(initial_value) do |result, next_value|
      # do something with +result+ and +next_value+
      # the value returned by the block becomes the
      # value passed in to the next iteration
      # as +result+
    end

For example:

    product = [ 2, 3, 4 ].inject(1) do |result, next_value|
      result * next_value
    end
    product #=> 24

When this runs, the block is first called with `1` (the initial value) and `2`
(the first element of the array). The block returns `1*2`, so on the next
iteration the block is called with `2` (the previous result) and `3`. The
block returns `6`, and is called one last time with `6` and `4`. The result of
the block, `24` becomes the value returned by `inject`. This code returns the
product of the elements in the enumerable.

**First Shortcut: Default Initial value**

In the case of the previous example, the initial value, `1`, wasn't really
necessary: the calculation of the product of a list of numbers is
self-contained.

In these circumstances, you can omit the `initial_value` parameter. `inject`
will then initially call the block with the first element of the collection as
the `result` parameter and the second element as the `next_value`.

    [ 2, 3, 4 ].inject do |result, next_value|
      result * next_value
    end

This shortcut is convenient, but can only be used when the block produces a
result which can be passed back to it as a first parameter.

Here's an example where that's not the case: it returns a hash where the keys
are words and the values are the number of occurrences of that word in the
enumerable.

    freqs = File.read("README.md")
      .scan(/\w{2,}/)
      .reduce(Hash.new(0)) do |counts, word|
        counts[word] += 1
        counts
      end
    freqs #=> {"Actions"=>4,
               "Status"=>5,
               "MinGW"=>3,
               "https"=>27,
               "github"=>10,
               "com"=>15, ...

Note that the last line of the block is just the word `counts`. This ensures
the return value of the block is the result that's being calculated.

**Second Shortcut: a Reducer function**

A *reducer function* is a function that takes a partial result and the next
value, returning the next partial result. The block that is given to `inject`
is a reducer.

You can also write a reducer as a function and pass the name of that function
(as a symbol) to `inject`. However, for this to work, the function

1.  Must be defined on the type of the result value
2.  Must accept a single parameter, the next value in the collection, and
3.  Must return an updated result which will also implement the function.

Here's an example that adds elements to a string. The two calls invoke the
functions String#concat and String#+ on the result so far, passing it the next
value.

    s = [ "cat", " ", "dog" ].inject("", :concat)
    s #=> "cat dog"
    s = [ "cat", " ", "dog" ].inject("The result is:", :+)
    s #=> "The result is: cat dog"

Here's a more complex example when the result object maintains state of a
different type to the enumerable elements.

    class Turtle

      def initialize
        @x = @y = 0
      end

      def move(dir)
        case dir
        when "n" then @y += 1
        when "s" then @y -= 1
        when "e" then @x += 1
        when "w" then @x -= 1
        end
        self
      end
    end

    position = "nnneesw".chars.reduce(Turtle.new, :move)
    position  #=>> #<Turtle:0x00000001052f4698 @y=2, @x=1>

**Third Shortcut: Reducer With no Initial Value**

If your reducer returns a value that it can accept as a parameter, then you
don't have to pass in an initial value. Here `:*` is the name of the *times*
function:

    product = [ 2, 3, 4 ].inject(:*)
    product # => 24

String concatenation again:

    s = [ "cat", " ", "dog" ].inject(:+)
    s #=> "cat dog"

And an example that converts a hash to an array of two-element subarrays.

    nested = {foo: 0, bar: 1}.inject([], :push)
    nested # => [[:foo, 0], [:bar, 1]]

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## rehash() [](#method-i-rehash)
Rebuilds the hash table by recomputing the hash index for each key; returns
`self`.

The hash table becomes invalid if the hash value of a key has changed after
the entry was created. See [Modifying an Active Hash
Key](rdoc-ref:Hash@Modifying+an+Active+Hash+Key).

**@overload** [] 

## reject() [](#method-i-reject)
Returns a new `Hash` object whose entries are all those from `self` for which
the block returns `false` or `nil`:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = h.reject {|key, value| key.start_with?('b') }
    h1 # => {:foo=>0}

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.reject # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:reject>
    h1 = e.each {|key, value| key.start_with?('b') }
    h1 # => {:foo=>0}

**@overload** [] 

**@overload** [] 

## reject!() [](#method-i-reject!)
Returns `self`, whose remaining entries are those for which the block returns
`false` or `nil`:
    h = {foo: 0, bar: 1, baz: 2}
    h.reject! {|key, value| value < 2 } # => {:baz=>2}

Returns `nil` if no entries are removed.

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.reject! # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:reject!>
    e.each {|key, value| key.start_with?('b') } # => {:foo=>0}

**@overload** [] 

**@overload** [] 

## replace(hash2) [](#method-i-replace)
Replaces the entire contents of `self` with the contents of `other_hash`;
returns `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.replace({bat: 3, bam: 4}) # => {:bat=>3, :bam=>4}

**@overload** [] 

## reverse_each(*args) [](#method-i-reverse_each)
With a block given, calls the block with each element, but in reverse order;
returns `self`:

    a = []
    (1..4).reverse_each {|element| a.push(-element) } # => 1..4
    a # => [-4, -3, -2, -1]

    a = []
    %w[a b c d].reverse_each {|element| a.push(element) }
    # => ["a", "b", "c", "d"]
    a # => ["d", "c", "b", "a"]

    a = []
    h.reverse_each {|element| a.push(element) }
    # => {:foo=>0, :bar=>1, :baz=>2}
    a # => [[:baz, 2], [:bar, 1], [:foo, 0]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## select() [](#method-i-select)
Returns a new `Hash` object whose entries are those for which the block
returns a truthy value:
    h = {foo: 0, bar: 1, baz: 2}
    h.select {|key, value| value < 2 } # => {:foo=>0, :bar=>1}

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.select # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:select>
    e.each {|key, value| value < 2 } # => {:foo=>0, :bar=>1}

**@overload** [] 

**@overload** [] 

## select!() [](#method-i-select!)
Returns `self`, whose entries are those for which the block returns a truthy
value:
    h = {foo: 0, bar: 1, baz: 2}
    h.select! {|key, value| value < 2 }  => {:foo=>0, :bar=>1}

Returns `nil` if no entries were removed.

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.select!  # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:select!>
    e.each { |key, value| value < 2 } # => {:foo=>0, :bar=>1}

**@overload** [] 

**@overload** [] 

## shift() [](#method-i-shift)
Removes the first hash entry (see [Entry Order](rdoc-ref:Hash@Entry+Order));
returns a 2-element Array containing the removed key and value:
    h = {foo: 0, bar: 1, baz: 2}
    h.shift # => [:foo, 0]
    h # => {:bar=>1, :baz=>2}

Returns nil if the hash is empty.

**@overload** [] 

## size() [](#method-i-size)
Returns the count of entries in `self`:

    {foo: 0, bar: 1, baz: 2}.length # => 3

**@overload** [] 

**@overload** [] 

## slice(*args) [](#method-i-slice)
Returns a new `Hash` object containing the entries for the given `keys`:
    h = {foo: 0, bar: 1, baz: 2}
    h.slice(:baz, :foo) # => {:baz=>2, :foo=>0}

Any given `keys` that are not found are ignored.

**@overload** [] 

## slice_after(*args) [](#method-i-slice_after)
Creates an enumerator for each chunked elements. The ends of chunks are
defined by *pattern* and the block.

If *`pattern* === *elt`* returns `true` or the block returns `true` for the
element, the element is end of a chunk.

The `===` and *block* is called from the first element to the last element of
*enum*.

The result enumerator yields the chunked elements as an array. So `each`
method can be called as follows:

    enum.slice_after(pattern).each { |ary| ... }
    enum.slice_after { |elt| bool }.each { |ary| ... }

Other methods of the Enumerator class and Enumerable module, such as `map`,
etc., are also usable.

For example, continuation lines (lines end with backslash) can be concatenated
as follows:

    lines = ["foo\n", "bar\\\n", "baz\n", "\n", "qux\n"]
    e = lines.slice_after(/(?<!\\)\n\z/)
    p e.to_a
    #=> [["foo\n"], ["bar\\\n", "baz\n"], ["\n"], ["qux\n"]]
    p e.map {|ll| ll[0...-1].map {|l| l.sub(/\\\n\z/, "") }.join + ll.last }
    #=>["foo\n", "barbaz\n", "\n", "qux\n"]

**@overload** [] 

**@overload** [] 

## slice_before(*args) [](#method-i-slice_before)
With argument `pattern`, returns an enumerator that uses the pattern to
partition elements into arrays ("slices"). An element begins a new slice if
`element === pattern` (or if it is the first element).

    a = %w[foo bar fop for baz fob fog bam foy]
    e = a.slice_before(/ba/) # => #<Enumerator: ...>
    e.each {|array| p array }

Output:

    ["foo"]
    ["bar", "fop", "for"]
    ["baz", "fob", "fog"]
    ["bam", "foy"]

With a block, returns an enumerator that uses the block to partition elements
into arrays. An element begins a new slice if its block return is a truthy
value (or if it is the first element):

    e = (1..20).slice_before {|i| i % 4 == 2 } # => #<Enumerator: ...>
    e.each {|array| p array }

Output:

    [1]
    [2, 3, 4, 5]
    [6, 7, 8, 9]
    [10, 11, 12, 13]
    [14, 15, 16, 17]
    [18, 19, 20]

Other methods of the Enumerator class and Enumerable module, such as `to_a`,
`map`, etc., are also usable.

For example, iteration over ChangeLog entries can be implemented as follows:

    # iterate over ChangeLog entries.
    open("ChangeLog") { |f|
      f.slice_before(/\A\S/).each { |e| pp e }
    }

    # same as above.  block is used instead of pattern argument.
    open("ChangeLog") { |f|
      f.slice_before { |line| /\A\S/ === line }.each { |e| pp e }
    }

"svn proplist -R" produces multiline output for each file. They can be chunked
as follows:

    IO.popen([{"LC_ALL"=>"C"}, "svn", "proplist", "-R"]) { |f|
      f.lines.slice_before(/\AProp/).each { |lines| p lines }
    }
    #=> ["Properties on '.':\n", "  svn:ignore\n", "  svk:merge\n"]
    #   ["Properties on 'goruby.c':\n", "  svn:eol-style\n"]
    #   ["Properties on 'complex.c':\n", "  svn:mime-type\n", "  svn:eol-style\n"]
    #   ["Properties on 'regparse.c':\n", "  svn:eol-style\n"]
    #   ...

If the block needs to maintain state over multiple elements, local variables
can be used. For example, three or more consecutive increasing numbers can be
squashed as follows (see `chunk_while` for a better way):

    a = [0, 2, 3, 4, 6, 7, 9]
    prev = a[0]
    p a.slice_before { |e|
      prev, prev2 = e, prev
      prev2 + 1 != e
    }.map { |es|
      es.length <= 2 ? es.join(",") : "#{es.first}-#{es.last}"
    }.join(",")
    #=> "0,2-4,6,7,9"

However local variables should be used carefully if the result enumerator is
enumerated twice or more. The local variables should be initialized for each
enumeration. Enumerator.new can be used to do it.

    # Word wrapping.  This assumes all characters have same width.
    def wordwrap(words, maxwidth)
      Enumerator.new {|y|
        # cols is initialized in Enumerator.new.
        cols = 0
        words.slice_before { |w|
          cols += 1 if cols != 0
          cols += w.length
          if maxwidth < cols
            cols = w.length
            true
          else
            false
          end
        }.each {|ws| y.yield ws }
      }
    end
    text = (1..20).to_a.join(" ")
    enum = wordwrap(text.split(/\s+/), 10)
    puts "-"*10
    enum.each { |ws| puts ws.join(" ") } # first enumeration.
    puts "-"*10
    enum.each { |ws| puts ws.join(" ") } # second enumeration generates same result as the first.
    puts "-"*10
    #=> ----------
    #   1 2 3 4 5
    #   6 7 8 9 10
    #   11 12 13
    #   14 15 16
    #   17 18 19
    #   20
    #   ----------
    #   1 2 3 4 5
    #   6 7 8 9 10
    #   11 12 13
    #   14 15 16
    #   17 18 19
    #   20
    #   ----------

mbox contains series of mails which start with Unix From line. So each mail
can be extracted by slice before Unix From line.

    # parse mbox
    open("mbox") { |f|
      f.slice_before { |line|
        line.start_with? "From "
      }.each { |mail|
        unix_from = mail.shift
        i = mail.index("\n")
        header = mail[0...i]
        body = mail[(i+1)..-1]
        body.pop if body.last == "\n"
        fields = header.slice_before { |line| !" \t".include?(line[0]) }.to_a
        p unix_from
        pp fields
        pp body
      }
    }

    # split mails in mbox (slice before Unix From line after an empty line)
    open("mbox") { |f|
      emp = true
      f.slice_before { |line|
        prevemp = emp
        emp = line == "\n"
        prevemp && line.start_with?("From ")
      }.each { |mail|
        mail.pop if mail.last == "\n"
        pp mail
      }
    }

**@overload** [] 

**@overload** [] 

## slice_when() [](#method-i-slice_when)
Creates an enumerator for each chunked elements. The beginnings of chunks are
defined by the block.

This method splits each chunk using adjacent elements, *elt_before* and
*elt_after*, in the receiver enumerator. This method split chunks between
*elt_before* and *elt_after* where the block returns `true`.

The block is called the length of the receiver enumerator minus one.

The result enumerator yields the chunked elements as an array. So `each`
method can be called as follows:

    enum.slice_when { |elt_before, elt_after| bool }.each { |ary| ... }

Other methods of the Enumerator class and Enumerable module, such as `to_a`,
`map`, etc., are also usable.

For example, one-by-one increasing subsequence can be chunked as follows:

    a = [1,2,4,9,10,11,12,15,16,19,20,21]
    b = a.slice_when {|i, j| i+1 != j }
    p b.to_a #=> [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
    c = b.map {|a| a.length < 3 ? a : "#{a.first}-#{a.last}" }
    p c #=> [[1, 2], [4], "9-12", [15, 16], "19-21"]
    d = c.join(",")
    p d #=> "1,2,4,9-12,15,16,19-21"

Near elements (threshold: 6) in sorted array can be chunked as follows:

    a = [3, 11, 14, 25, 28, 29, 29, 41, 55, 57]
    p a.slice_when {|i, j| 6 < j - i }.to_a
    #=> [[3], [11, 14], [25, 28, 29, 29], [41], [55, 57]]

Increasing (non-decreasing) subsequence can be chunked as follows:

    a = [0, 9, 2, 2, 3, 2, 7, 5, 9, 5]
    p a.slice_when {|i, j| i > j }.to_a
    #=> [[0, 9], [2, 2, 3], [2, 7], [5, 9], [5]]

Adjacent evens and odds can be chunked as follows: (Enumerable#chunk is
another way to do it.)

    a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
    p a.slice_when {|i, j| i.even? != j.even? }.to_a
    #=> [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]

Paragraphs (non-empty lines with trailing empty lines) can be chunked as
follows: (See Enumerable#chunk to ignore empty lines.)

    lines = ["foo\n", "bar\n", "\n", "baz\n", "qux\n"]
    p lines.slice_when {|l1, l2| /\A\s*\z/ =~ l1 && /\S/ =~ l2 }.to_a
    #=> [["foo\n", "bar\n", "\n"], ["baz\n", "qux\n"]]

Enumerable#chunk_while does the same, except splitting when the block returns
`false` instead of `true`.

**@overload** [] 

## sort() [](#method-i-sort)
Returns an array containing the sorted elements of `self`. The ordering of
equal elements is indeterminate and may be unstable.

With no block given, the sort compares using the elements' own method `#<=>`:

    %w[b c a d].sort              # => ["a", "b", "c", "d"]
    {foo: 0, bar: 1, baz: 2}.sort # => [[:bar, 1], [:baz, 2], [:foo, 0]]

With a block given, comparisons in the block determine the ordering. The block
is called with two elements `a` and `b`, and must return:

*   A negative integer if `a < b`.
*   Zero if `a == b`.
*   A positive integer if `a > b`.

Examples:

    a = %w[b c a d]
    a.sort {|a, b| b <=> a } # => ["d", "c", "b", "a"]
    h = {foo: 0, bar: 1, baz: 2}
    h.sort {|a, b| b <=> a } # => [[:foo, 0], [:baz, 2], [:bar, 1]]

See also #sort_by. It implements a Schwartzian transform which is useful when
key computation or comparison is expensive.

**@overload** [] 

**@overload** [] 

## sort_by() [](#method-i-sort_by)
With a block given, returns an array of elements of `self`, sorted according
to the value returned by the block for each element. The ordering of equal
elements is indeterminate and may be unstable.

Examples:

    a = %w[xx xxx x xxxx]
    a.sort_by {|s| s.size }        # => ["x", "xx", "xxx", "xxxx"]
    a.sort_by {|s| -s.size }       # => ["xxxx", "xxx", "xx", "x"]
    h = {foo: 2, bar: 1, baz: 0}
    h.sort_by{|key, value| value } # => [[:baz, 0], [:bar, 1], [:foo, 2]]
    h.sort_by{|key, value| key }   # => [[:bar, 1], [:baz, 0], [:foo, 2]]

With no block given, returns an Enumerator.

The current implementation of #sort_by generates an array of tuples containing
the original collection element and the mapped value. This makes #sort_by
fairly expensive when the keysets are simple.

    require 'benchmark'

    a = (1..100000).map { rand(100000) }

    Benchmark.bm(10) do |b|
      b.report("Sort")    { a.sort }
      b.report("Sort by") { a.sort_by { |a| a } }
    end

*produces:*

    user     system      total        real
    Sort        0.180000   0.000000   0.180000 (  0.175469)
    Sort by     1.980000   0.040000   2.020000 (  2.013586)

However, consider the case where comparing the keys is a non-trivial
operation. The following code sorts some files on modification time using the
basic #sort method.

    files = Dir["*"]
    sorted = files.sort { |a, b| File.new(a).mtime <=> File.new(b).mtime }
    sorted   #=> ["mon", "tues", "wed", "thurs"]

This sort is inefficient: it generates two new File objects during every
comparison. A slightly better technique is to use the Kernel#test method to
generate the modification times directly.

    files = Dir["*"]
    sorted = files.sort { |a, b|
      test(?M, a) <=> test(?M, b)
    }
    sorted   #=> ["mon", "tues", "wed", "thurs"]

This still generates many unnecessary Time objects. A more efficient technique
is to cache the sort keys (modification times in this case) before the sort.
Perl users often call this approach a Schwartzian transform, after Randal
Schwartz. We construct a temporary array, where each element is an array
containing our sort key along with the filename. We sort this array, and then
extract the filename from the result.

    sorted = Dir["*"].collect { |f|
       [test(?M, f), f]
    }.sort.collect { |f| f[1] }
    sorted   #=> ["mon", "tues", "wed", "thurs"]

This is exactly what #sort_by does internally.

    sorted = Dir["*"].sort_by { |f| test(?M, f) }
    sorted   #=> ["mon", "tues", "wed", "thurs"]

To produce the reverse of a specific order, the following can be used:

    ary.sort_by { ... }.reverse!

**@overload** [] 

**@overload** [] 

## store() [](#method-i-store)

## sum(*args) [](#method-i-sum)
With no block given, returns the sum of `initial_value` and the elements:

    (1..100).sum          # => 5050
    (1..100).sum(1)       # => 5051
    ('a'..'d').sum('foo') # => "fooabcd"

Generally, the sum is computed using methods `+` and `each`; for performance
optimizations, those methods may not be used, and so any redefinition of those
methods may not have effect here.

One such optimization: When possible, computes using Gauss's summation formula
*n(n+1)/2*:

    100 * (100 + 1) / 2 # => 5050

With a block given, calls the block with each element; returns the sum of
`initial_value` and the block return values:

    (1..4).sum {|i| i*i }                        # => 30
    (1..4).sum(100) {|i| i*i }                   # => 130
    h = {a: 0, b: 1, c: 2, d: 3, e: 4, f: 5}
    h.sum {|key, value| value.odd? ? value : 0 } # => 9
    ('a'..'f').sum('x') {|c| c < 'd' ? c : '' }  # => "xabc"

**@overload** [] 

**@overload** [] 

## take(n) [](#method-i-take)
For non-negative integer `n`, returns the first `n` elements:

    r = (1..4)
    r.take(2) # => [1, 2]
    r.take(0) # => []

    h = {foo: 0, bar: 1, baz: 2, bat: 3}
    h.take(2) # => [[:foo, 0], [:bar, 1]]

**@overload** [] 

## take_while() [](#method-i-take_while)
Calls the block with successive elements as long as the block returns a truthy
value; returns an array of all elements up to that point:

    (1..4).take_while{|i| i < 3 } # => [1, 2]
    h = {foo: 0, bar: 1, baz: 2}
    h.take_while{|element| key, value = *element; value < 2 }
    # => [[:foo, 0], [:bar, 1]]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## tally(*args) [](#method-i-tally)
When argument `hash` is not given, returns a new hash whose keys are the
distinct elements in `self`; each integer value is the count of occurrences of
each element:

    %w[a b c b c a c b].tally # => {"a"=>2, "b"=>3, "c"=>3}

When argument `hash` is given, returns `hash`, possibly augmented; for each
element `ele` in `self`:

*   Adds it as a key with a zero value if that key does not already exist:

        hash[ele] = 0 unless hash.include?(ele)

*   Increments the value of key `ele`:

        hash[ele] += 1

This is useful for accumulating tallies across multiple enumerables:

    h = {}                   # => {}
    %w[a c d b c a].tally(h) # => {"a"=>2, "c"=>2, "d"=>1, "b"=>1}
    %w[b a z].tally(h)       # => {"a"=>3, "c"=>2, "d"=>1, "b"=>2, "z"=>1}
    %w[b a m].tally(h)       # => {"a"=>4, "c"=>2, "d"=>1, "b"=>3, "z"=>1, "m"=>1}

The key to be added or found for an element depends on the class of `self`;
see [Enumerable in Ruby
Classes](rdoc-ref:Enumerable@Enumerable+in+Ruby+Classes).

Examples:

*   Array (and certain array-like classes): the key is the element (as above).
*   Hash (and certain hash-like classes): the key is the 2-element array
    formed from the key-value pair:

        h = {}                        # => {}
        {foo: 'a', bar: 'b'}.tally(h) # => {[:foo, "a"]=>1, [:bar, "b"]=>1}
        {foo: 'c', bar: 'd'}.tally(h) # => {[:foo, "a"]=>1, [:bar, "b"]=>1, [:foo, "c"]=>1, [:bar, "d"]=>1}
        {foo: 'a', bar: 'b'}.tally(h) # => {[:foo, "a"]=>2, [:bar, "b"]=>2, [:foo, "c"]=>1, [:bar, "d"]=>1}
        {foo: 'c', bar: 'd'}.tally(h) # => {[:foo, "a"]=>2, [:bar, "b"]=>2, [:foo, "c"]=>2, [:bar, "d"]=>2}

**@overload** [] 

## to_a() [](#method-i-to_a)
Returns a new Array of 2-element Array objects; each nested Array contains a
key-value pair from `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.to_a # => [[:foo, 0], [:bar, 1], [:baz, 2]]

**@overload** [] 

## to_h() [](#method-i-to_h)
For an instance of `Hash`, returns `self`.

For a subclass of `Hash`, returns a new `Hash` containing the content of
`self`.

When a block is given, returns a new `Hash` object whose content is based on
the block; the block should return a 2-element Array object specifying the
key-value pair to be included in the returned Array:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = h.to_h {|key, value| [value, key] }
    h1 # => {0=>:foo, 1=>:bar, 2=>:baz}

**@overload** [] 

**@overload** [] 

## to_hash() [](#method-i-to_hash)
Returns `self`.

**@overload** [] 

## to_proc() [](#method-i-to_proc)
Returns a Proc object that maps a key to its value:
    h = {foo: 0, bar: 1, baz: 2}
    proc = h.to_proc
    proc.class # => Proc
    proc.call(:foo) # => 0
    proc.call(:bar) # => 1
    proc.call(:nosuch) # => nil

**@overload** [] 

## to_set(klassSet, *args, &block) [](#method-i-to_set)
Makes a set from the enumerable object with given arguments.

## transform_keys(*args) [](#method-i-transform_keys)
Returns a new `Hash` object; each entry has:
*   A key provided by the block.
*   The value from `self`.

An optional hash argument can be provided to map keys to new keys. Any key not
given will be mapped using the provided block, or remain the same if no block
is given.

Transform keys:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = h.transform_keys {|key| key.to_s }
    h1 # => {"foo"=>0, "bar"=>1, "baz"=>2}

    h.transform_keys(foo: :bar, bar: :foo)
    #=> {bar: 0, foo: 1, baz: 2}

    h.transform_keys(foo: :hello, &:to_s)
    #=> {:hello=>0, "bar"=>1, "baz"=>2}

Overwrites values for duplicate keys:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = h.transform_keys {|key| :bat }
    h1 # => {:bat=>2}

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.transform_keys # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:transform_keys>
    h1 = e.each { |key| key.to_s }
    h1 # => {"foo"=>0, "bar"=>1, "baz"=>2}

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## transform_keys!(*args) [](#method-i-transform_keys!)
Same as Hash#transform_keys but modifies the receiver in place instead of
returning a new hash.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## transform_values() [](#method-i-transform_values)
Returns a new `Hash` object; each entry has:
*   A key from `self`.
*   A value provided by the block.

Transform values:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = h.transform_values {|value| value * 100}
    h1 # => {:foo=>0, :bar=>100, :baz=>200}

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.transform_values # => #<Enumerator: {:foo=>0, :bar=>1, :baz=>2}:transform_values>
    h1 = e.each { |value| value * 100}
    h1 # => {:foo=>0, :bar=>100, :baz=>200}

**@overload** [] 

**@overload** [] 

## transform_values!() [](#method-i-transform_values!)
Returns `self`, whose keys are unchanged, and whose values are determined by
the given block.
    h = {foo: 0, bar: 1, baz: 2}
    h.transform_values! {|value| value * 100} # => {:foo=>0, :bar=>100, :baz=>200}

Returns a new Enumerator if no block given:
    h = {foo: 0, bar: 1, baz: 2}
    e = h.transform_values! # => #<Enumerator: {:foo=>0, :bar=>100, :baz=>200}:transform_values!>
    h1 = e.each {|value| value * 100}
    h1 # => {:foo=>0, :bar=>100, :baz=>200}

**@overload** [] 

**@overload** [] 

## uniq() [](#method-i-uniq)
With no block, returns a new array containing only unique elements; the array
has no two elements `e0` and `e1` such that `e0.eql?(e1)`:

    %w[a b c c b a a b c].uniq       # => ["a", "b", "c"]
    [0, 1, 2, 2, 1, 0, 0, 1, 2].uniq # => [0, 1, 2]

With a block, returns a new array containing elements only for which the block
returns a unique value:

    a = [0, 1, 2, 3, 4, 5, 5, 4, 3, 2, 1]
    a.uniq {|i| i.even? ? i : 0 } # => [0, 2, 4]
    a = %w[a b c d e e d c b a a b c d e]
    a.uniq {|c| c < 'c' }         # => ["a", "c"]

**@overload** [] 

**@overload** [] 

## update(*args) [](#method-i-update)
Merges each of `other_hashes` into `self`; returns `self`.

Each argument in `other_hashes` must be a `Hash`.

With arguments and no block:
*   Returns `self`, after the given hashes are merged into it.
*   The given hashes are merged left to right.
*   Each new entry is added at the end.
*   Each duplicate-key entry's value overwrites the previous value.

Example:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = {bat: 3, bar: 4}
    h2 = {bam: 5, bat:6}
    h.merge!(h1, h2) # => {:foo=>0, :bar=>4, :baz=>2, :bat=>6, :bam=>5}

With arguments and a block:
*   Returns `self`, after the given hashes are merged.
*   The given hashes are merged left to right.
*   Each new-key entry is added at the end.
*   For each duplicate key:
    *   Calls the block with the key and the old and new values.
    *   The block's return value becomes the new value for the entry.

Example:
    h = {foo: 0, bar: 1, baz: 2}
    h1 = {bat: 3, bar: 4}
    h2 = {bam: 5, bat:6}
    h3 = h.merge!(h1, h2) { |key, old_value, new_value| old_value + new_value }
    h3 # => {:foo=>0, :bar=>5, :baz=>2, :bat=>9, :bam=>5}

With no arguments:
*   Returns `self`, unmodified.
*   The block, if given, is ignored.

Example:
    h = {foo: 0, bar: 1, baz: 2}
    h.merge # => {:foo=>0, :bar=>1, :baz=>2}
    h1 = h.merge! { |key, old_value, new_value| raise 'Cannot happen' }
    h1 # => {:foo=>0, :bar=>1, :baz=>2}

**@overload** [] 

**@overload** [] 

**@overload** [] 

## value?(val) [](#method-i-value?)
Returns `true` if `value` is a value in `self`, otherwise `false`.

**@overload** [] 

**@overload** [] 

## values() [](#method-i-values)
Returns a new Array containing all values in `self`:
    h = {foo: 0, bar: 1, baz: 2}
    h.values # => [0, 1, 2]

**@overload** [] 

## values_at(*args) [](#method-i-values_at)
Returns a new Array containing values for the given `keys`:
    h = {foo: 0, bar: 1, baz: 2}
    h.values_at(:baz, :foo) # => [2, 0]

The [default values](rdoc-ref:Hash@Default+Values) are returned for any keys
that are not found:
    h.values_at(:hello, :foo) # => [nil, 0]

**@overload** [] 

## zip(*args) [](#method-i-zip)
With no block given, returns a new array `new_array` of size self.size whose
elements are arrays. Each nested array `new_array[n]` is of size
`other_enums.size+1`, and contains:

*   The `n`-th element of self.
*   The `n`-th element of each of the `other_enums`.

If all `other_enums` and self are the same size, all elements are included in
the result, and there is no `nil`-filling:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2, :b3]
    c = [:c0, :c1, :c2, :c3]
    d = a.zip(b, c)
    d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3]]

    f = {foo: 0, bar: 1, baz: 2}
    g = {goo: 3, gar: 4, gaz: 5}
    h = {hoo: 6, har: 7, haz: 8}
    d = f.zip(g, h)
    d # => [
      #      [[:foo, 0], [:goo, 3], [:hoo, 6]],
      #      [[:bar, 1], [:gar, 4], [:har, 7]],
      #      [[:baz, 2], [:gaz, 5], [:haz, 8]]
      #    ]

If any enumerable in other_enums is smaller than self, fills to `self.size`
with `nil`:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2]
    c = [:c0, :c1]
    d = a.zip(b, c)
    d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, nil], [:a3, nil, nil]]

If any enumerable in other_enums is larger than self, its trailing elements
are ignored:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2, :b3, :b4]
    c = [:c0, :c1, :c2, :c3, :c4, :c5]
    d = a.zip(b, c)
    d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3]]

When a block is given, calls the block with each of the sub-arrays (formed as
above); returns nil:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2, :b3]
    c = [:c0, :c1, :c2, :c3]
    a.zip(b, c) {|sub_array| p sub_array} # => nil

Output:

    [:a0, :b0, :c0]
    [:a1, :b1, :c1]
    [:a2, :b2, :c2]
    [:a3, :b3, :c3]

**@overload** [] 

**@overload** [] 

