# Class: Set
**Inherits:** Object
    
**Includes:** Enumerable
  

This library provides the Set class, which implements a collection of
unordered values with no duplicates. It is a hybrid of Array's intuitive
inter-operation facilities and Hash's fast lookup.

The method `to_set` is added to Enumerable for convenience.

Set is easy to use with Enumerable objects (implementing `each`). Most of the
initializer methods and binary operators accept generic Enumerable objects
besides sets and arrays.  An Enumerable object can be converted to Set using
the `to_set` method.

Set uses Hash as storage, so you must note the following points:

*   Equality of elements is determined according to Object#eql? and
    Object#hash.  Use Set#compare_by_identity to make a set compare its
    elements by their identity.
*   Set assumes that the identity of each element does not change while it is
    stored.  Modifying an element of a set will render the set to an
    unreliable state.
*   When a string is to be stored, a frozen copy of the string is stored
    instead unless the original string is already frozen.

## Comparison

The comparison operators `<`, `>`, `<=`, and `>=` are implemented as shorthand
for the {proper_,}{subset?,superset?} methods.  The `<=>` operator reflects
this order, or return `nil` for sets that both have distinct elements (`{x,
y}` vs. `{x, z}` for example).

## Example

```ruby require 'set' s1 = Set[1, 2]                        #=> #<Set: {1, 2}>
s2 = [1, 2].to_set                    #=> #<Set: {1, 2}> s1 == s2             
                #=> true s1.add("foo")                         #=> #<Set: {1,
2, "foo"}> s1.merge([2, 6])                      #=> #<Set: {1, 2, "foo", 6}>
s1.subset?(s2)                        #=> false s2.subset?(s1)                
       #=> true ```

## Contact

*   Akinori MUSHA <<knu@iDaemons.org>> (current maintainer)

## What's Here

    First, what's elsewhere. \Class \Set:

*   Inherits from [class Object](rdoc-ref:Object@What-27s+Here).
*   Includes [module Enumerable](rdoc-ref:Enumerable@What-27s+Here), which
    provides dozens of additional methods.

In particular, class Set does not have many methods of its own for fetching or
for iterating. Instead, it relies on those in Enumerable.

Here, class Set provides methods that are useful for:

*   [Creating a Set](#class-Set-label-Methods+for+Creating+a+Set)
*   [Set Operations](#class-Set-label-Methods+for+Set+Operations)
*   [Comparing](#class-Set-label-Methods+for+Comparing)
*   [Querying](#class-Set-label-Methods+for+Querying)
*   [Assigning](#class-Set-label-Methods+for+Assigning)
*   [Deleting](#class-Set-label-Methods+for+Deleting)
*   [Converting](#class-Set-label-Methods+for+Converting)
*   [Iterating](#class-Set-label-Methods+for+Iterating)
*   [And more....](#class-Set-label-Other+Methods)

### Methods for Creating a Set

*   ::[]: Returns a new set containing the given objects.
*   ::new: Returns a new set containing either the given objects (if no block
    given) or the return values from the called block (if a block given).

### Methods for Set Operations

*   [|](#method-i-7C) (aliased as #union and #+): Returns a new set containing
    all elements from `self` and all elements from a given enumerable (no
    duplicates).
*   [&](#method-i-26) (aliased as #intersection): Returns a new set containing
    all elements common to `self` and a given enumerable.
*   [-](#method-i-2D) (aliased as #difference): Returns a copy of `self` with
    all elements in a given enumerable removed.
*   [^](#method-i-5E): Returns a new set containing all elements from `self`
    and a given enumerable except those common to both.

### Methods for Comparing

*   [<=>](#method-i-3C-3D-3E): Returns -1, 0, or 1 as `self` is less than,
    equal to, or greater than a given object.
*   [==](#method-i-3D-3D): Returns whether `self` and a given enumerable are
    equal, as determined by Object#eql?.
*   #compare_by_identity?: Returns whether the set considers only identity
    when comparing elements.

### Methods for Querying

*   #length (aliased as #size): Returns the count of elements.
*   #empty?: Returns whether the set has no elements.
*   #include? (aliased as #member? and #===): Returns whether a given object
    is an element in the set.
*   #subset? (aliased as [<=](#method-i-3C-3D)): Returns whether a given
    object is a subset of the set.
*   #proper_subset? (aliased as [<](#method-i-3C)): Returns whether a given
    enumerable is a proper subset of the set.
*   #superset? (aliased as [>=](#method-i-3E-3D])): Returns whether a given
    enumerable is a superset of the set.
*   #proper_superset? (aliased as [>](#method-i-3E)): Returns whether a given
    enumerable is a proper superset of the set.
*   #disjoint?: Returns `true` if the set and a given enumerable have no
    common elements, `false` otherwise.
*   #intersect?: Returns `true` if the set and a given enumerable: have any
    common elements, `false` otherwise.
*   #compare_by_identity?: Returns whether the set considers only identity
    when comparing elements.

### Methods for Assigning

*   #add (aliased as #<<): Adds a given object to the set; returns `self`.
*   #add?: If the given object is not an element in the set, adds it and
    returns `self`; otherwise, returns `nil`.
*   #merge: Merges the elements of each given enumerable object to the set;
    returns `self`.
*   #replace: Replaces the contents of the set with the contents of a given
    enumerable.

### Methods for Deleting

*   #clear: Removes all elements in the set; returns `self`.
*   #delete: Removes a given object from the set; returns `self`.
*   #delete?: If the given object is an element in the set, removes it and
    returns `self`; otherwise, returns `nil`.
*   #subtract: Removes each given object from the set; returns `self`.
*   #delete_if - Removes elements specified by a given block.
*   #select! (aliased as #filter!): Removes elements not specified by a given
    block.
*   #keep_if: Removes elements not specified by a given block.
*   #reject! Removes elements specified by a given block.

### Methods for Converting

*   #classify: Returns a hash that classifies the elements, as determined by
    the given block.
*   #collect! (aliased as #map!): Replaces each element with a block
    return-value.
*   #divide: Returns a hash that classifies the elements, as determined by the
    given block; differs from #classify in that the block may accept either
    one or two arguments.
*   #flatten: Returns a new set that is a recursive flattening of `self`.
    \#flatten!:
     Replaces each nested set in +self+ with the elements from that set.

*   #inspect (aliased as #to_s): Returns a string displaying the elements.
*   #join: Returns a string containing all elements, converted to strings as
    needed, and joined by the given record separator.
*   #to_a: Returns an array containing all set elements.
*   #to_set: Returns `self` if given no arguments and no block; with a block
    given, returns a new set consisting of block return values.

### Methods for Iterating

*   #each: Calls the block with each successive element; returns `self`.

### Other Methods

*   #reset: Resets the internal state; useful if an object has been modified
    while an element in the set.


# Class Methods
## [](*ary ) [](#method-c-[])
Creates a new set containing the given objects.

    Set[1, 2]                   # => #<Set: {1, 2}>
    Set[1, 2, 1]                # => #<Set: {1, 2}>
    Set[1, 'c', :s]             # => #<Set: {1, "c", :s}>
## json_create(object ) [](#method-c-json_create)
See #as_json.

#Instance Methods
## &(enum) [](#method-i-&)
Returns a new set containing elements common to the set and the given
enumerable object.

    Set[1, 3, 5] & Set[3, 2, 1]             #=> #<Set: {3, 1}>
    Set['a', 'b', 'z'] & ['a', 'b', 'c']    #=> #<Set: {"a", "b"}>

## -(enum) [](#method-i--)
Returns a new set built by duplicating the set, removing every element that
appears in the given enumerable object.

    Set[1, 3, 5] - Set[1, 5]                #=> #<Set: {3}>
    Set['a', 'b', 'z'] - ['a', 'c']         #=> #<Set: {"b", "z"}>

## <=>(set) [](#method-i-<=>)
Returns 0 if the set are equal, -1 / +1 if the set is a proper subset /
superset of the given set, or nil if they both have unique elements.

## ==(other) [](#method-i-==)
Returns true if two sets are equal.  The equality of each couple of elements
is defined according to Object#eql?.

    Set[1, 2] == Set[2, 1]                       #=> true
    Set[1, 3, 5] == Set[1, 5]                    #=> false
    Set['a', 'b', 'c'] == Set['a', 'c', 'b']     #=> true
    Set['a', 'b', 'c'] == ['a', 'c', 'b']        #=> false

## ^(enum) [](#method-i-^)
Returns a new set containing elements exclusive between the set and the given
enumerable object.  `(set ^ enum)` is equivalent to `((set | enum) - (set &
enum))`.

    Set[1, 2] ^ Set[2, 3]                   #=> #<Set: {3, 1}>
    Set[1, 'b', 'c'] ^ ['b', 'd']           #=> #<Set: {"d", 1, "c"}>

## add(o) [](#method-i-add)
Adds the given object to the set and returns self.  Use `merge` to add many
elements at once.

    Set[1, 2].add(3)                    #=> #<Set: {1, 2, 3}>
    Set[1, 2].add([3, 4])               #=> #<Set: {1, 2, [3, 4]}>
    Set[1, 2].add(2)                    #=> #<Set: {1, 2}>

## add?(o) [](#method-i-add?)
Adds the given object to the set and returns self.  If the object is already
in the set, returns nil.

    Set[1, 2].add?(3)                    #=> #<Set: {1, 2, 3}>
    Set[1, 2].add?([3, 4])               #=> #<Set: {1, 2, [3, 4]}>
    Set[1, 2].add?(2)                    #=> nil

**@return** [Boolean] 

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
Returns whether any element meets a given criterion.

If `self` has no element, returns `false` and argument or block are not used.

With no argument and no block, returns whether any element is truthy:

    (1..4).any?          # => true
    %w[a b c d].any?     # => true
    [1, false, nil].any? # => true
    [].any?              # => false

With argument `pattern` and no block, returns whether for any element
`element`, `pattern === element`:

    [nil, false, 0].any?(Integer)        # => true
    [nil, false, 0].any?(Numeric)        # => true
    [nil, false, 0].any?(Float)          # => false
    %w[bar baz bat bam].any?(/m/)        # => true
    %w[bar baz bat bam].any?(/foo/)      # => false
    %w[bar baz bat bam].any?('ba')       # => false
    {foo: 0, bar: 1, baz: 2}.any?(Array) # => true
    {foo: 0, bar: 1, baz: 2}.any?(Hash)  # => false
    [].any?(Integer)                     # => false

With a block given, returns whether the block returns a truthy value for any
element:

    (1..4).any? {|element| element < 2 }                    # => true
    (1..4).any? {|element| element < 1 }                    # => false
    {foo: 0, bar: 1, baz: 2}.any? {|key, value| value < 1 } # => true
    {foo: 0, bar: 1, baz: 2}.any? {|key, value| value < 0 } # => false

Related: #all?, #none?, #one?.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## as_json() [](#method-i-as_json)
Methods `Set#as_json` and `Set.json_create` may be used to serialize and
deserialize a Set object; see [Marshal](rdoc-ref:Marshal).

Method `Set#as_json` serializes `self`, returning a 2-element hash
representing `self`:

    require 'json/add/set'
    x = Set.new(%w/foo bar baz/).as_json
    # => {"json_class"=>"Set", "a"=>["foo", "bar", "baz"]}

Method `JSON.create` deserializes such a hash, returning a Set object:

    Set.json_create(x) # => #<Set: {"foo", "bar", "baz"}>

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

## classify() [](#method-i-classify)
Classifies the set by the return value of the given block and returns a hash
of {value => set of elements} pairs.  The block is called once for each
element of the set, passing the element as parameter.

    require 'set'
    files = Set.new(Dir.glob("*.rb"))
    hash = files.classify { |f| File.mtime(f).year }
    hash       #=> {2000=>#<Set: {"a.rb", "b.rb"}>,
               #    2001=>#<Set: {"c.rb", "d.rb", "e.rb"}>,
               #    2002=>#<Set: {"f.rb"}>}

Returns an enumerator if no block is given.

## clear() [](#method-i-clear)
Removes all elements and returns self.

    set = Set[1, 'c', :s]             #=> #<Set: {1, "c", :s}>
    set.clear                         #=> #<Set: {}>
    set                               #=> #<Set: {}>

## collect() [](#method-i-collect)
Returns an array of objects returned by the block.

With a block given, calls the block with successive elements; returns an array
of the objects returned by the block:

    (0..4).map {|i| i*i }                               # => [0, 1, 4, 9, 16]
    {foo: 0, bar: 1, baz: 2}.map {|key, value| value*2} # => [0, 2, 4]

With no block given, returns an Enumerator.

**@overload** [] 

**@overload** [] 

## collect!() [](#method-i-collect!)
Replaces the elements with ones returned by `collect()`. Returns an enumerator
if no block is given.

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
Returns an array of all non-`nil` elements:

    a = [nil, 0, nil, 'a', false, nil, false, nil, 'a', nil, 0, nil]
    a.compact # => [0, "a", false, false, "a", 0]

**@overload** [] 

## compare_by_identity() [](#method-i-compare_by_identity)
Makes the set compare its elements by their identity and returns self.  This
method may not be supported by all subclasses of Set.

## compare_by_identity?() [](#method-i-compare_by_identity?)
Returns true if the set will compare its elements by their identity.  Also see
Set#compare_by_identity.

**@return** [Boolean] 

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

## delete(o) [](#method-i-delete)
Deletes the given object from the set and returns self.  Use `subtract` to
delete many items at once.

## delete?(o) [](#method-i-delete?)
Deletes the given object from the set and returns self.  If the object is not
in the set, returns nil.

**@return** [Boolean] 

## delete_if(&block) [](#method-i-delete_if)
Deletes every element of the set for which block evaluates to true, and
returns self. Returns an enumerator if no block is given.

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

## disjoint?(set) [](#method-i-disjoint?)
Returns true if the set and the given enumerable have no element in common. 
This method is the opposite of `intersect?`.

    Set[1, 2, 3].disjoint? Set[3, 4]   #=> false
    Set[1, 2, 3].disjoint? Set[4, 5]   #=> true
    Set[1, 2, 3].disjoint? [3, 4]      #=> false
    Set[1, 2, 3].disjoint? 4..5        #=> true

**@return** [Boolean] 

## divide(&func) [](#method-i-divide)
Divides the set into a set of subsets according to the commonality defined by
the given block.

If the arity of the block is 2, elements o1 and o2 are in common if
block.call(o1, o2) is true.  Otherwise, elements o1 and o2 are in common if
block.call(o1) == block.call(o2).

    require 'set'
    numbers = Set[1, 3, 4, 6, 9, 10, 11]
    set = numbers.divide { |i,j| (i - j).abs == 1 }
    set        #=> #<Set: {#<Set: {1}>,
               #           #<Set: {11, 9, 10}>,
               #           #<Set: {3, 4}>,
               #           #<Set: {6}>}>

Returns an enumerator if no block is given.

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

## each(&block) [](#method-i-each)
Calls the given block once for each element in the set, passing the element as
parameter.  Returns an enumerator if no block is given.

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
Returns true if the set contains no elements.

**@return** [Boolean] 

## entries(*args) [](#method-i-entries)
Returns an array containing the items in `self`:

    (0..4).to_a # => [0, 1, 2, 3, 4]

**@overload** [] 

## eql?(o) [](#method-i-eql?)
:nodoc:

**@return** [Boolean] 

## filter() [](#method-i-filter)
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

## flatten() [](#method-i-flatten)
Returns a new set that is a copy of the set, flattening each containing set
recursively.

## flatten!() [](#method-i-flatten!)
Equivalent to Set#flatten, but replaces the receiver with the result in place.
 Returns nil if no modifications were made.

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

## hash() [](#method-i-hash)
:nodoc:

## include?(o) [](#method-i-include?)
Returns true if the set contains the given object.

Note that `include?` and `member?` do not test member equality using `==` as
do other Enumerables.

See also Enumerable#include?

**@return** [Boolean] 

## initialize(enumnil, &block) [](#method-i-initialize)
Creates a new set containing the elements of the given enumerable object.

If a block is given, the elements of enum are preprocessed by the given block.

    Set.new([1, 2])                       #=> #<Set: {1, 2}>
    Set.new([1, 2, 1])                    #=> #<Set: {1, 2}>
    Set.new([1, 'c', :s])                 #=> #<Set: {1, "c", :s}>
    Set.new(1..5)                         #=> #<Set: {1, 2, 3, 4, 5}>
    Set.new([1, 2, 3]) { |x| x * x }      #=> #<Set: {1, 4, 9}>

**@return** [Set] a new instance of Set

## initialize_clone(orig, **options) [](#method-i-initialize_clone)
Clone internal hash.

## initialize_dup(orig) [](#method-i-initialize_dup)
Dup internal hash.

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
Returns a string containing a human-readable representation of the set
("#<Set: {element1, element2, ...}>").

## intersect?(set) [](#method-i-intersect?)
Returns true if the set and the given enumerable have at least one element in
common.

    Set[1, 2, 3].intersect? Set[4, 5]   #=> false
    Set[1, 2, 3].intersect? Set[3, 4]   #=> true
    Set[1, 2, 3].intersect? 4..5        #=> false
    Set[1, 2, 3].intersect? [3, 4]      #=> true

**@return** [Boolean] 

## join(separatornil) [](#method-i-join)
Returns a string created by converting each element of the set to a string See
also: Array#join

## keep_if(&block) [](#method-i-keep_if)
Deletes every element of the set for which block evaluates to false, and
returns self. Returns an enumerator if no block is given.

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

## merge(*enums) [](#method-i-merge)
Merges the elements of the given enumerable objects to the set and returns
self.

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

## pretty_print(pp) [](#method-i-pretty_print)
:nodoc:

## pretty_print_cycle(pp) [](#method-i-pretty_print_cycle)
:nodoc:

## proper_subset?(set) [](#method-i-proper_subset?)
Returns true if the set is a proper subset of the given set.

**@return** [Boolean] 

## proper_superset?(set) [](#method-i-proper_superset?)
Returns true if the set is a proper superset of the given set.

**@return** [Boolean] 

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

## reject() [](#method-i-reject)
Returns an array of objects rejected by the block.

With a block given, calls the block with successive elements; returns an array
of those elements for which the block returns `nil` or `false`:

    (0..9).reject {|i| i * 2 if i.even? }                             # => [1, 3, 5, 7, 9]
    {foo: 0, bar: 1, baz: 2}.reject {|key, value| key if value.odd? } # => {:foo=>0, :baz=>2}

When no block given, returns an Enumerator.

Related: #select.

**@overload** [] 

**@overload** [] 

## reject!(&block) [](#method-i-reject!)
Equivalent to Set#delete_if, but returns nil if no changes were made. Returns
an enumerator if no block is given.

## replace(enum) [](#method-i-replace)
Replaces the contents of the set with the contents of the given enumerable
object and returns self.

    set = Set[1, 'c', :s]             #=> #<Set: {1, "c", :s}>
    set.replace([1, 2])               #=> #<Set: {1, 2}>
    set                               #=> #<Set: {1, 2}>

## reset() [](#method-i-reset)
Resets the internal state after modification to existing elements and returns
self.

Elements will be reindexed and deduplicated.

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

## select!(&block) [](#method-i-select!)
Equivalent to Set#keep_if, but returns nil if no changes were made. Returns an
enumerator if no block is given.

## size() [](#method-i-size)
Returns the number of elements.

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

## subset?(set) [](#method-i-subset?)
Returns true if the set is a subset of the given set.

**@return** [Boolean] 

## subtract(enum) [](#method-i-subtract)
Deletes every element that appears in the given enumerable object and returns
self.

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

## superset?(set) [](#method-i-superset?)
Returns true if the set is a superset of the given set.

**@return** [Boolean] 

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
Returns an array containing all elements in the set.

    Set[1, 2].to_a                    #=> [1, 2]
    Set[1, 'c', :s].to_a              #=> [1, "c", :s]

## to_h(*args) [](#method-i-to_h)
When `self` consists of 2-element arrays, returns a hash each of whose entries
is the key-value pair formed from one of those arrays:

    [[:foo, 0], [:bar, 1], [:baz, 2]].to_h # => {:foo=>0, :bar=>1, :baz=>2}

When a block is given, the block is called with each element of `self`; the
block should return a 2-element array which becomes a key-value pair in the
returned hash:

    (0..3).to_h {|i| [i, i ** 2]} # => {0=>0, 1=>1, 2=>4, 3=>9}

Raises an exception if an element of `self` is not a 2-element array, and a
block is not passed.

**@overload** [] 

**@overload** [] 

## to_json(*args) [](#method-i-to_json)
Returns a JSON string representing `self`:

    require 'json/add/set'
    puts Set.new(%w/foo bar baz/).to_json

Output:

    {"json_class":"Set","a":["foo","bar","baz"]}

## to_set(klassSet, *args, &block) [](#method-i-to_set)
Returns self if no arguments are given.  Otherwise, converts the set to
another with `klass.new(self, *args, &block)`.

In subclasses, returns `klass.new(self, *args, &block)` unless overridden.

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

## |(enum) [](#method-i-|)
Returns a new set built by merging the set and the elements of the given
enumerable object.

    Set[1, 2, 3] | Set[2, 4, 5]         #=> #<Set: {1, 2, 3, 4, 5}>
    Set[1, 5, 'z'] | (1..6)             #=> #<Set: {1, 5, "z", 2, 3, 4, 6}>

