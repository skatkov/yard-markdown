# Class: Array
**Inherits:** Object
    
**Includes:** Enumerable
  

append method to built-in class


# Class Methods
## [](*args ) [](#method-c-[])
Returns a new array, populated with the given objects:

    Array[1, 'a', /^A/]    # => [1, "a", /^A/]
    Array[]                # => []
    Array.[](1, 'a', /^A/) # => [1, "a", /^A/]

Related: see [Methods for Creating an
Array](rdoc-ref:Array@Methods+for+Creating+an+Array).
## new(*args ) [](#method-c-new)
:nodoc:
## try_convert(ary ) [](#method-c-try_convert)
Attempts to return an array, based on the given `object`.

If `object` is an array, returns `object`.

Otherwise if `object` responds to `:to_ary`. calls `object.to_ary`: if the
return value is an array or `nil`, returns that value; if not, raises
TypeError.

Otherwise returns `nil`.

Related: see [Methods for Creating an
Array](rdoc-ref:Array@Methods+for+Creating+an+Array).
**@overload** [] 


#Instance Methods
## &(ary2) [](#method-i-&)
Returns a new array containing the *intersection* of `self` and `other_array`;
that is, containing those elements found in both `self` and `other_array`:

    [0, 1, 2, 3] & [1, 2] # => [1, 2]

Omits duplicates:

    [0, 1, 1, 0] & [0, 1] # => [0, 1]

Preserves order from `self`:

    [0, 1, 2] & [3, 2, 1, 0] # => [0, 1, 2]

Identifies common elements using method `#eql?` (as defined in each element of
`self`).

Related: see [Methods for Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

## *(times) [](#method-i-*)
When non-negative integer argument `n` is given, returns a new array built by
concatenating `n` copies of `self`:

    a = ['x', 'y']
    a * 3 # => ["x", "y", "x", "y", "x", "y"]

When string argument `string_separator` is given, equivalent to
`self.join(string_separator)`:

    [0, [0, 1], {foo: 0}] * ', ' # => "0, 0, 1, {foo: 0}"

**@overload** [] 

**@overload** [] 

## -(a) [](#method-i--)
Returns a new array containing only those elements of `self` that are not
found in `other_array`; the order from `self` is preserved:

    [0, 1, 1, 2, 1, 1, 3, 1, 1] - [1]             # => [0, 2, 3]
    [0, 1, 1, 2, 1, 1, 3, 1, 1] - [3, 2, 0, :foo] # => [1, 1, 1, 1, 1, 1]
    [0, 1, 2] - [:foo]                            # => [0, 1, 2]

Element are compared using method `#eql?` (as defined in each element of
`self`).

Related: see [Methods for Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

## -@() [](#method-i--@)

## <<(item) [](#method-i-<<)
Appends `object` as the last element in `self`; returns `self`:

    [:foo, 'bar', 2] << :baz # => [:foo, "bar", 2, :baz]

Appends `object` as a single element, even if it is another array:

    [:foo, 'bar', 2] << [3, 4] # => [:foo, "bar", 2, [3, 4]]

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

## <=>(ary2) [](#method-i-<=>)
Returns -1, 0, or 1 as `self` is determined to be less than, equal to, or
greater than `other_array`.

Iterates over each index `i` in `(0...self.size)`:

*   Computes `result[i]` as `self[i] <=> other_array[i]`.
*   Immediately returns 1 if `result[i]` is 1:

        [0, 1, 2] <=> [0, 0, 2] # => 1

*   Immediately returns -1 if `result[i]` is -1:

        [0, 1, 2] <=> [0, 2, 2] # => -1

*   Continues if `result[i]` is 0.

When every `result` is 0, returns `self.size <=> other_array.size` (see
Integer#<=>):

    [0, 1, 2] <=> [0, 1]        # => 1
    [0, 1, 2] <=> [0, 1, 2]     # => 0
    [0, 1, 2] <=> [0, 1, 2, 3]  # => -1

Note that when `other_array` is larger than `self`, its trailing elements do
not affect the result:

    [0, 1, 2] <=> [0, 1, 2, -3] # => -1
    [0, 1, 2] <=> [0, 1, 2, 0]  # => -1
    [0, 1, 2] <=> [0, 1, 2, 3]  # => -1

Related: see [Methods for Comparing](rdoc-ref:Array@Methods+for+Comparing).

**@overload** [] 

## ==(ary2) [](#method-i-==)
Returns whether both:

*   `self` and `other_array` are the same size.
*   Their corresponding elements are the same; that is, for each index `i` in
    `(0...self.size)`, `self[i] == other_array[i]`.

Examples:

    [:foo, 'bar', 2] == [:foo, 'bar', 2]   # => true
    [:foo, 'bar', 2] == [:foo, 'bar', 2.0] # => true
    [:foo, 'bar', 2] == [:foo, 'bar']      # => false # Different sizes.
    [:foo, 'bar', 2] == [:foo, 'bar', 3]   # => false # Different elements.

This method is different from method Array#eql?, which compares elements using
`Object#eql?`.

Related: see [Methods for Comparing](rdoc-ref:Array@Methods+for+Comparing).

**@overload** [] 

## [](*args) [](#method-i-[])
Returns elements from `self`; does not modify `self`.

In brief:

    a = [:foo, 'bar', 2]

    # Single argument index: returns one element.
    a[0]     # => :foo          # Zero-based index.
    a[-1]    # => 2             # Negative index counts backwards from end.

    # Arguments start and length: returns an array.
    a[1, 2]  # => ["bar", 2]
    a[-2, 2] # => ["bar", 2]    # Negative start counts backwards from end.

    # Single argument range: returns an array.
    a[0..1]  # => [:foo, "bar"]
    a[0..-2] # => [:foo, "bar"] # Negative range-begin counts backwards from end.
    a[-2..2] # => ["bar", 2]    # Negative range-end counts backwards from end.

When a single integer argument `index` is given, returns the element at offset
`index`:

    a = [:foo, 'bar', 2]
    a[0] # => :foo
    a[2] # => 2
    a # => [:foo, "bar", 2]

If `index` is negative, counts backwards from the end of `self`:

    a = [:foo, 'bar', 2]
    a[-1] # => 2
    a[-2] # => "bar"

If `index` is out of range, returns `nil`.

When two Integer arguments `start` and `length` are given, returns a new
`Array` of size `length` containing successive elements beginning at offset
`start`:

    a = [:foo, 'bar', 2]
    a[0, 2] # => [:foo, "bar"]
    a[1, 2] # => ["bar", 2]

If `start + length` is greater than `self.length`, returns all elements from
offset `start` to the end:

    a = [:foo, 'bar', 2]
    a[0, 4] # => [:foo, "bar", 2]
    a[1, 3] # => ["bar", 2]
    a[2, 2] # => [2]

If `start == self.size` and `length >= 0`, returns a new empty `Array`.

If `length` is negative, returns `nil`.

When a single Range argument `range` is given, treats `range.min` as `start`
above and `range.size` as `length` above:

    a = [:foo, 'bar', 2]
    a[0..1] # => [:foo, "bar"]
    a[1..2] # => ["bar", 2]

Special case: If `range.start == a.size`, returns a new empty `Array`.

If `range.end` is negative, calculates the end index from the end:

    a = [:foo, 'bar', 2]
    a[0..-1] # => [:foo, "bar", 2]
    a[0..-2] # => [:foo, "bar"]
    a[0..-3] # => [:foo]

If `range.start` is negative, calculates the start index from the end:

    a = [:foo, 'bar', 2]
    a[-1..2] # => [2]
    a[-2..2] # => ["bar", 2]
    a[-3..2] # => [:foo, "bar", 2]

If `range.start` is larger than the array size, returns `nil`.

    a = [:foo, 'bar', 2]
    a[4..1] # => nil
    a[4..0] # => nil
    a[4..-1] # => nil

When a single Enumerator::ArithmeticSequence argument `aseq` is given, returns
an `Array` of elements corresponding to the indexes produced by the sequence.

    a = ['--', 'data1', '--', 'data2', '--', 'data3']
    a[(1..).step(2)] # => ["data1", "data2", "data3"]

Unlike slicing with range, if the start or the end of the arithmetic sequence
is larger than array size, throws RangeError.

    a = ['--', 'data1', '--', 'data2', '--', 'data3']
    a[(1..11).step(2)]
    # RangeError (((1..11).step(2)) out of range)
    a[(7..).step(2)]
    # RangeError (((7..).step(2)) out of range)

If given a single argument, and its type is not one of the listed, tries to
convert it to Integer, and raises if it is impossible:

    a = [:foo, 'bar', 2]
    # Raises TypeError (no implicit conversion of Symbol into Integer):
    a[:foo]

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## []=(*args) [](#method-i-[]=)
Assigns elements in `self`, based on the given `object`; returns `object`.

In brief:

    a_orig = [:foo, 'bar', 2]

    # With argument index.
    a = a_orig.dup
    a[0] = 'foo' # => "foo"
    a # => ["foo", "bar", 2]
    a = a_orig.dup
    a[7] = 'foo' # => "foo"
    a # => [:foo, "bar", 2, nil, nil, nil, nil, "foo"]

    # With arguments start and length.
    a = a_orig.dup
    a[0, 2] = 'foo' # => "foo"
    a # => ["foo", 2]
    a = a_orig.dup
    a[6, 50] = 'foo' # => "foo"
    a # => [:foo, "bar", 2, nil, nil, nil, "foo"]

    # With argument range.
    a = a_orig.dup
    a[0..1] = 'foo' # => "foo"
    a # => ["foo", 2]
    a = a_orig.dup
    a[6..50] = 'foo' # => "foo"
    a # => [:foo, "bar", 2, nil, nil, nil, "foo"]

When Integer argument `index` is given, assigns `object` to an element in
`self`.

If `index` is non-negative, assigns `object` the element at offset `index`:

    a = [:foo, 'bar', 2]
    a[0] = 'foo' # => "foo"
    a # => ["foo", "bar", 2]

If `index` is greater than `self.length`, extends the array:

    a = [:foo, 'bar', 2]
    a[7] = 'foo' # => "foo"
    a # => [:foo, "bar", 2, nil, nil, nil, nil, "foo"]

If `index` is negative, counts backwards from the end of the array:

    a = [:foo, 'bar', 2]
    a[-1] = 'two' # => "two"
    a # => [:foo, "bar", "two"]

When Integer arguments `start` and `length` are given and `object` is not an
`Array`, removes `length - 1` elements beginning at offset `start`, and
assigns `object` at offset `start`:

    a = [:foo, 'bar', 2]
    a[0, 2] = 'foo' # => "foo"
    a # => ["foo", 2]

If `start` is negative, counts backwards from the end of the array:

    a = [:foo, 'bar', 2]
    a[-2, 2] = 'foo' # => "foo"
    a # => [:foo, "foo"]

If `start` is non-negative and outside the array (` >= self.size`), extends
the array with `nil`, assigns `object` at offset `start`, and ignores
`length`:

    a = [:foo, 'bar', 2]
    a[6, 50] = 'foo' # => "foo"
    a # => [:foo, "bar", 2, nil, nil, nil, "foo"]

If `length` is zero, shifts elements at and following offset `start` and
assigns `object` at offset `start`:

    a = [:foo, 'bar', 2]
    a[1, 0] = 'foo' # => "foo"
    a # => [:foo, "foo", "bar", 2]

If `length` is too large for the existing array, does not extend the array:

    a = [:foo, 'bar', 2]
    a[1, 5] = 'foo' # => "foo"
    a # => [:foo, "foo"]

When Range argument `range` is given and `object` is not an `Array`, removes
`length - 1` elements beginning at offset `start`, and assigns `object` at
offset `start`:

    a = [:foo, 'bar', 2]
    a[0..1] = 'foo' # => "foo"
    a # => ["foo", 2]

if `range.begin` is negative, counts backwards from the end of the array:

    a = [:foo, 'bar', 2]
    a[-2..2] = 'foo' # => "foo"
    a # => [:foo, "foo"]

If the array length is less than `range.begin`, extends the array with `nil`,
assigns `object` at offset `range.begin`, and ignores `length`:

    a = [:foo, 'bar', 2]
    a[6..50] = 'foo' # => "foo"
    a # => [:foo, "bar", 2, nil, nil, nil, "foo"]

If `range.end` is zero, shifts elements at and following offset `start` and
assigns `object` at offset `start`:

    a = [:foo, 'bar', 2]
    a[1..0] = 'foo' # => "foo"
    a # => [:foo, "foo", "bar", 2]

If `range.end` is negative, assigns `object` at offset `start`, retains
`range.end.abs -1` elements past that, and removes those beyond:

    a = [:foo, 'bar', 2]
    a[1..-1] = 'foo' # => "foo"
    a # => [:foo, "foo"]
    a = [:foo, 'bar', 2]
    a[1..-2] = 'foo' # => "foo"
    a # => [:foo, "foo", 2]
    a = [:foo, 'bar', 2]
    a[1..-3] = 'foo' # => "foo"
    a # => [:foo, "foo", "bar", 2]
    a = [:foo, 'bar', 2]

If `range.end` is too large for the existing array, replaces array elements,
but does not extend the array with `nil` values:

    a = [:foo, 'bar', 2]
    a[1..5] = 'foo' # => "foo"
    a # => [:foo, "foo"]

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## all?(*args) [](#method-i-all?)
Returns whether for every element of `self`, a given criterion is satisfied.

With no block and no argument, returns whether every element of `self` is
truthy:

    [[], {}, '', 0, 0.0, Object.new].all? # => true  # All truthy objects.
    [[], {}, '', 0, 0.0, nil].all?        # => false # nil is not truthy.
    [[], {}, '', 0, 0.0, false].all?      # => false # false is not truthy.

With argument `object` given, returns whether `object === ele` for every
element `ele` in `self`:

    [0, 0, 0].all?(0)                    # => true
    [0, 1, 2].all?(1)                    # => false
    ['food', 'fool', 'foot'].all?(/foo/) # => true
    ['food', 'drink'].all?(/foo/)        # => false

With a block given, calls the block with each element in `self`; returns
whether the block returns only truthy values:

    [0, 1, 2].all? { |ele| ele < 3 } # => true
    [0, 1, 2].all? { |ele| ele < 2 } # => false

With both a block and argument `object` given, ignores the block and uses
`object` as above.

**Special case**: returns `true` if `self` is empty (regardless of any given
argument or block).

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## any?(*args) [](#method-i-any?)
Returns whether for any element of `self`, a given criterion is satisfied.

With no block and no argument, returns whether any element of `self` is
truthy:

    [nil, false, []].any? # => true  # Array object is truthy.
    [nil, false, {}].any? # => true  # Hash object is truthy.
    [nil, false, ''].any? # => true  # String object is truthy.
    [nil, false].any?     # => false # Nil and false are not truthy.

With argument `object` given, returns whether `object === ele` for any element
`ele` in `self`:

    [nil, false, 0].any?(0)          # => true
    [nil, false, 1].any?(0)          # => false
    [nil, false, 'food'].any?(/foo/) # => true
    [nil, false, 'food'].any?(/bar/) # => false

With a block given, calls the block with each element in `self`; returns
whether the block returns any truthy value:

    [0, 1, 2].any? {|ele| ele < 1 } # => true
    [0, 1, 2].any? {|ele| ele < 0 } # => false

With both a block and argument `object` given, ignores the block and uses
`object` as above.

**Special case**: returns `false` if `self` is empty (regardless of any given
argument or block).

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## assoc(key) [](#method-i-assoc)
Returns the first element `ele` in `self` such that `ele` is an array and
`ele[0] == object`:

    a = [{foo: 0}, [2, 4], [4, 5, 6], [4, 5]]
    a.assoc(4) # => [4, 5, 6]

Returns `nil` if no such element is found.

Related: Array#rassoc; see also [Methods for
Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

## at(pos) [](#method-i-at)
Returns the element of `self` specified by the given `index` or `nil` if there
is no such element; `index` must be an [integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects).

For non-negative `index`, returns the element of `self` at offset `index`:

    a = [:foo, 'bar', 2]
    a.at(0)   # => :foo
    a.at(2)   # => 2
    a.at(2.0) # => 2

For negative `index`, counts backwards from the end of `self`:

    a.at(-2) # => "bar"

Related: Array#[]; see also [Methods for
Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

## bsearch() [](#method-i-bsearch)
Returns the element from `self` found by a binary search, or `nil` if the
search found no suitable element.

See [Binary Searching](rdoc-ref:bsearch.rdoc).

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

## bsearch_index() [](#method-i-bsearch_index)
Returns the integer index of the element from `self` found by a binary search,
or `nil` if the search found no suitable element.

See [Binary Searching](rdoc-ref:bsearch.rdoc).

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

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
Removes all elements from `self`; returns `self`:

    a = [:foo, 'bar', 2]
    a.clear # => []

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

## collect() [](#method-i-collect)
With a block given, calls the block with each element of `self`; returns a new
array whose elements are the return values from the block:

    a = [:foo, 'bar', 2]
    a1 = a.map {|element| element.class }
    a1 # => [Symbol, String, Integer]

With no block given, returns a new Enumerator.

Related: #collect!; see also [Methods for
Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## collect!() [](#method-i-collect!)
With a block given, calls the block with each element of `self` and replaces
the element with the block's return value; returns `self`:

    a = [:foo, 'bar', 2]
    a.map! { |element| element.class } # => [Symbol, String, Integer]

With no block given, returns a new Enumerator.

Related: #collect; see also [Methods for
Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

**@overload** [] 

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

## combination(num) [](#method-i-combination)
When a block and a positive [integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects)
argument `count` (`0 < count <= self.size`) are given, calls the block with
each combination of `self` of size `count`; returns `self`:

    a = %w[a b c]                                   # => ["a", "b", "c"]
    a.combination(2) {|combination| p combination } # => ["a", "b", "c"]

Output:

    ["a", "b"]
    ["a", "c"]
    ["b", "c"]

The order of the yielded combinations is not guaranteed.

When `count` is zero, calls the block once with a new empty array:

    a.combination(0) {|combination| p combination }
    [].combination(0) {|combination| p combination }

Output:

    []
    []

When `count` is negative or larger than `self.size` and `self` is non-empty,
does not call the block:

    a.combination(-1) {|combination| fail 'Cannot happen' } # => ["a", "b", "c"]
    a.combination(4)  {|combination| fail 'Cannot happen' } # => ["a", "b", "c"]

With no block given, returns a new Enumerator.

Related: Array#permutation; see also [Methods for
Iterating](rdoc-ref:Array@Methods+for+Iterating).

**@overload** [] 

**@overload** [] 

## compact() [](#method-i-compact)
Returns a new array containing only the non-`nil` elements from `self`;
element order is preserved:

    a = [nil, 0, nil, false, nil, '', nil, [], nil, {}]
    a.compact # => [0, false, "", [], {}]

Related: Array#compact!; see also [Methods for
Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

## compact!() [](#method-i-compact!)
Removes all `nil` elements from `self`; Returns `self` if any elements are
removed, `nil` otherwise:

    a = [nil, 0, nil, false, nil, '', nil, [], nil, {}]
    a.compact! # => [0, false, "", [], {}]
    a          # => [0, false, "", [], {}]
    a.compact! # => nil

Related: Array#compact; see also [Methods for
Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

## concat(*args) [](#method-i-concat)
Adds to `self` all elements from each array in `other_arrays`; returns `self`:

    a = [0, 1]
    a.concat(['two', 'three'], [:four, :five], a)
    # => [0, 1, "two", "three", :four, :five, 0, 1]

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

## count(*args) [](#method-i-count)
Returns a count of specified elements.

With no argument and no block, returns the count of all elements:

    [0, :one, 'two', 3, 3.0].count # => 5

With argument `object` given, returns the count of elements `==` to `object`:

    [0, :one, 'two', 3, 3.0].count(3) # => 2

With no argument and a block given, calls the block with each element; returns
the count of elements for which the block returns a truthy value:

    [0, 1, 2, 3].count {|element| element > 1 } # => 2

With argument `object` and a block given, issues a warning, ignores the block,
and returns the count of elements `==` to `object`.

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## cycle(*args) [](#method-i-cycle)
With a block given, may call the block, depending on the value of argument
`count`; `count` must be an [integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects), or
`nil`.

When `count` is positive, calls the block with each element, then does so
repeatedly, until it has done so `count` times; returns `nil`:

    output = []
    [0, 1].cycle(2) {|element| output.push(element) } # => nil
    output # => [0, 1, 0, 1]

When `count` is zero or negative, does not call the block:

    [0, 1].cycle(0) {|element| fail 'Cannot happen' }  # => nil
    [0, 1].cycle(-1) {|element| fail 'Cannot happen' } # => nil

When `count` is `nil`, cycles forever:

    # Prints 0 and 1 forever.
    [0, 1].cycle {|element| puts element }
    [0, 1].cycle(nil) {|element| puts element }

With no block given, returns a new Enumerator.

Related: see [Methods for Iterating](rdoc-ref:Array@Methods+for+Iterating).

**@overload** [] 

**@overload** [] 

## deconstruct() [](#method-i-deconstruct)
:nodoc:

## delete(item) [](#method-i-delete)
Removes zero or more elements from `self`.

With no block given, removes from `self` each element `ele` such that `ele ==
object`; returns the last removed element:

    a = [0, 1, 2, 2.0]
    a.delete(2) # => 2.0
    a           # => [0, 1]

Returns `nil` if no elements removed:

    a.delete(2) # => nil

With a block given, removes from `self` each element `ele` such that `ele ==
object`.

If any such elements are found, ignores the block and returns the last removed
element:

    a = [0, 1, 2, 2.0]
    a.delete(2) {|element| fail 'Cannot happen' } # => 2.0
    a                                             # => [0, 1]

If no such element is found, returns the block's return value:

    a.delete(2) {|element| "Element #{element} not found." }
    # => "Element 2 not found."

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

**@overload** [] 

## delete_at(pos) [](#method-i-delete_at)
Removes the element of `self` at the given `index`, which must be an
[integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects).

When `index` is non-negative, deletes the element at offset `index`:

    a = [:foo, 'bar', 2]
    a.delete_at(1) # => "bar"
    a # => [:foo, 2]

When `index` is negative, counts backward from the end of the array:

    a = [:foo, 'bar', 2]
    a.delete_at(-2) # => "bar"
    a # => [:foo, 2]

When `index` is out of range, returns `nil`.

    a = [:foo, 'bar', 2]
    a.delete_at(3)  # => nil
    a.delete_at(-4) # => nil

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

## delete_if() [](#method-i-delete_if)
With a block given, calls the block with each element of `self`; removes the
element if the block returns a truthy value; returns `self`:

    a = [:foo, 'bar', 2, 'bat']
    a.delete_if {|element| element.to_s.start_with?('b') } # => [:foo, 2]

With no block given, returns a new Enumerator.

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

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

## difference(*args) [](#method-i-difference)
Returns a new array containing only those elements from `self` that are not
found in any of the given `other_arrays`; items are compared using `eql?`; 
order from `self` is preserved:

    [0, 1, 1, 2, 1, 1, 3, 1, 1].difference([1]) # => [0, 2, 3]
    [0, 1, 2, 3].difference([3, 0], [1, 3])     # => [2]
    [0, 1, 2].difference([4])                   # => [0, 1, 2]
    [0, 1, 2].difference                        # => [0, 1, 2]

Returns a copy of `self` if no arguments are given.

Related: Array#-; see also [Methods for
Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

## dig(*args) [](#method-i-dig)
Finds and returns the object in nested object specified by `index` and
`identifiers`; the nested objects may be instances of various classes. See
[Dig Methods](rdoc-ref:dig_methods.rdoc).

Examples:

    a = [:foo, [:bar, :baz, [:bat, :bam]]]
    a.dig(1) # => [:bar, :baz, [:bat, :bam]]
    a.dig(1, 2) # => [:bat, :bam]
    a.dig(1, 2, 0) # => :bat
    a.dig(1, 2, 3) # => nil

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

## drop(n) [](#method-i-drop)
Returns a new array containing all but the first `count` element of `self`,
where `count` is a non-negative integer; does not modify `self`.

Examples:

    a = [0, 1, 2, 3, 4, 5]
    a.drop(0) # => [0, 1, 2, 3, 4, 5]
    a.drop(1) # => [1, 2, 3, 4, 5]
    a.drop(2) # => [2, 3, 4, 5]
    a.drop(9) # => []

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

## drop_while() [](#method-i-drop_while)
With a block given, calls the block with each successive element of `self`;
stops if the block returns `false` or `nil`; returns a new array *omitting*
those elements for which the block returned a truthy value; does not modify
`self`:

    a = [0, 1, 2, 3, 4, 5]
    a.drop_while {|element| element < 3 } # => [3, 4, 5]

With no block given, returns a new Enumerator.

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

## each() [](#method-i-each)
With a block given, iterates over the elements of `self`, passing each element
to the block; returns `self`:

    a = [:foo, 'bar', 2]
    a.each {|element|  puts "#{element.class} #{element}" }

Output:

    Symbol foo
    String bar
    Integer 2

Allows the array to be modified during iteration:

    a = [:foo, 'bar', 2]
    a.each {|element| puts element; a.clear if element.to_s.start_with?('b') }

Output:

    foo
    bar

With no block given, returns a new Enumerator.

Related: see [Methods for Iterating](rdoc-ref:Array@Methods+for+Iterating).

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

## each_index() [](#method-i-each_index)
With a block given, iterates over the elements of `self`, passing each *array
index* to the block; returns `self`:

    a = [:foo, 'bar', 2]
    a.each_index {|index|  puts "#{index} #{a[index]}" }

Output:

    0 foo
    1 bar
    2 2

Allows the array to be modified during iteration:

    a = [:foo, 'bar', 2]
    a.each_index {|index| puts index; a.clear if index > 0 }
    a # => []

Output:

    0
    1

With no block given, returns a new Enumerator.

Related: see [Methods for Iterating](rdoc-ref:Array@Methods+for+Iterating).

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
Returns `true` if the count of elements in `self` is zero, `false` otherwise.

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

## entries(*args) [](#method-i-entries)
Returns an array containing the items in `self`:

    (0..4).to_a # => [0, 1, 2, 3, 4]

**@overload** [] 

## eql?(ary2) [](#method-i-eql?)
Returns `true` if `self` and `other_array` are the same size, and if, for each
index `i` in `self`, `self[i].eql?(other_array[i])`:

    a0 = [:foo, 'bar', 2]
    a1 = [:foo, 'bar', 2]
    a1.eql?(a0) # => true

Otherwise, returns `false`.

This method is different from method Array#==, which compares using method
`Object#==`.

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

## fetch(*args) [](#method-i-fetch)
Returns the element of `self` at offset `index` if `index` is in range;
`index` must be an [integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects).

With the single argument `index` and no block, returns the element at offset
`index`:

    a = [:foo, 'bar', 2]
    a.fetch(1)   # => "bar"
    a.fetch(1.1) # => "bar"

If `index` is negative, counts from the end of the array:

    a = [:foo, 'bar', 2]
    a.fetch(-1) # => 2
    a.fetch(-2) # => "bar"

With arguments `index` and `default_value` (which may be any object) and no
block, returns `default_value` if `index` is out-of-range:

    a = [:foo, 'bar', 2]
    a.fetch(1, nil)  # => "bar"
    a.fetch(3, :foo) # => :foo

With argument `index` and a block, returns the element at offset `index` if
index is in range (and the block is not called); otherwise calls the block
with index and returns its return value:

    a = [:foo, 'bar', 2]
    a.fetch(1) {|index| raise 'Cannot happen' } # => "bar"
    a.fetch(50) {|index| "Value for #{index}" } # => "Value for 50"

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## fetch_values(*indexes, &block) [](#method-i-fetch_values)
call-seq:
    fetch_values(*indexes) -> new_array
    fetch_values(*indexes) { |index| ... } -> new_array

With no block given, returns a new array containing the elements of `self` at
the offsets specified by `indexes`. Each of the `indexes` must be an
[integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects):

    a = [:foo, :bar, :baz]
    a.fetch_values(2, 0)   # => [:baz, :foo]
    a.fetch_values(2.1, 0) # => [:baz, :foo]
    a.fetch_values         # => []

For a negative index, counts backwards from the end of the array:

    a.fetch_values(-2, -1) # [:bar, :baz]

When no block is given, raises an exception if any index is out of range.

With a block given, for each index:

*   If the index is in range, uses an element of `self` (as above).
*   Otherwise, calls the block with the index and uses the block's return
    value.

Example:

    a = [:foo, :bar, :baz]
    a.fetch_values(1, 0, 42, 777) { |index| index.to_s }
    # => [:bar, :foo, "42", "777"]

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

## fill(*args) [](#method-i-fill)
Replaces selected elements in `self`; may add elements to `self`; always
returns `self` (never a new array).

In brief:

    # Non-negative start.
    ['a', 'b', 'c', 'd'].fill('-', 1, 2)          # => ["a", "-", "-", "d"]
    ['a', 'b', 'c', 'd'].fill(1, 2) {|e| e.to_s } # => ["a", "1", "2", "d"]

    # Extends with specified values if necessary.
    ['a', 'b', 'c', 'd'].fill('-', 3, 2)          # => ["a", "b", "c", "-", "-"]
    ['a', 'b', 'c', 'd'].fill(3, 2) {|e| e.to_s } # => ["a", "b", "c", "3", "4"]

    # Fills with nils if necessary.
    ['a', 'b', 'c', 'd'].fill('-', 6, 2)          # => ["a", "b", "c", "d", nil, nil, "-", "-"]
    ['a', 'b', 'c', 'd'].fill(6, 2) {|e| e.to_s } # => ["a", "b", "c", "d", nil, nil, "6", "7"]

    # For negative start, counts backwards from the end.
    ['a', 'b', 'c', 'd'].fill('-', -3, 3)          # => ["a", "-", "-", "-"]
    ['a', 'b', 'c', 'd'].fill(-3, 3) {|e| e.to_s } # => ["a", "1", "2", "3"]

    # Range.
    ['a', 'b', 'c', 'd'].fill('-', 1..2)          # => ["a", "-", "-", "d"]
    ['a', 'b', 'c', 'd'].fill(1..2) {|e| e.to_s } # => ["a", "1", "2", "d"]

When arguments `start` and `count` are given, they select the elements of
`self` to be replaced; each must be an [integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects) (or
`nil`):

*   `start` specifies the zero-based offset of the first element to be
    replaced; `nil` means zero.
*   `count` is the number of consecutive elements to be replaced; `nil` means
    "all the rest."

With argument `object` given, that one object is used for all replacements:

    o = Object.new           # => #<Object:0x0000014e7bff7600>
    a = ['a', 'b', 'c', 'd'] # => ["a", "b", "c", "d"]
    a.fill(o, 1, 2)
    # => ["a", #<Object:0x0000014e7bff7600>, #<Object:0x0000014e7bff7600>, "d"]

With a block given, the block is called once for each element to be replaced;
the value passed to the block is the *index* of the element to be replaced
(not the element itself); the block's return value replaces the element:

    a = ['a', 'b', 'c', 'd']               # => ["a", "b", "c", "d"]
    a.fill(1, 2) {|element| element.to_s } # => ["a", "1", "2", "d"]

For arguments `start` and `count`:

*   If `start` is non-negative, replaces `count` elements beginning at offset
    `start`:

        ['a', 'b', 'c', 'd'].fill('-', 0, 2) # => ["-", "-", "c", "d"]
        ['a', 'b', 'c', 'd'].fill('-', 1, 2) # => ["a", "-", "-", "d"]
        ['a', 'b', 'c', 'd'].fill('-', 2, 2) # => ["a", "b", "-", "-"]

        ['a', 'b', 'c', 'd'].fill(0, 2) {|e| e.to_s } # => ["0", "1", "c", "d"]
        ['a', 'b', 'c', 'd'].fill(1, 2) {|e| e.to_s } # => ["a", "1", "2", "d"]
        ['a', 'b', 'c', 'd'].fill(2, 2) {|e| e.to_s } # => ["a", "b", "2", "3"]

    Extends `self` if necessary:

        ['a', 'b', 'c', 'd'].fill('-', 3, 2) # => ["a", "b", "c", "-", "-"]
        ['a', 'b', 'c', 'd'].fill('-', 4, 2) # => ["a", "b", "c", "d", "-", "-"]

        ['a', 'b', 'c', 'd'].fill(3, 2) {|e| e.to_s } # => ["a", "b", "c", "3", "4"]
        ['a', 'b', 'c', 'd'].fill(4, 2) {|e| e.to_s } # => ["a", "b", "c", "d", "4", "5"]

    Fills with `nil` if necessary:

        ['a', 'b', 'c', 'd'].fill('-', 5, 2) # => ["a", "b", "c", "d", nil, "-", "-"]
        ['a', 'b', 'c', 'd'].fill('-', 6, 2) # => ["a", "b", "c", "d", nil, nil, "-", "-"]

        ['a', 'b', 'c', 'd'].fill(5, 2) {|e| e.to_s } # => ["a", "b", "c", "d", nil, "5", "6"]
        ['a', 'b', 'c', 'd'].fill(6, 2) {|e| e.to_s } # => ["a", "b", "c", "d", nil, nil, "6", "7"]

    Does nothing if `count` is non-positive:

        ['a', 'b', 'c', 'd'].fill('-', 2, 0)    # => ["a", "b", "c", "d"]
        ['a', 'b', 'c', 'd'].fill('-', 2, -100) # => ["a", "b", "c", "d"]
        ['a', 'b', 'c', 'd'].fill('-', 6, -100) # => ["a", "b", "c", "d"]

        ['a', 'b', 'c', 'd'].fill(2, 0) {|e| fail 'Cannot happen' }    # => ["a", "b", "c", "d"]
        ['a', 'b', 'c', 'd'].fill(2, -100) {|e| fail 'Cannot happen' } # => ["a", "b", "c", "d"]
        ['a', 'b', 'c', 'd'].fill(6, -100) {|e| fail 'Cannot happen' } # => ["a", "b", "c", "d"]

*   If `start` is negative, counts backwards from the end of `self`:

        ['a', 'b', 'c', 'd'].fill('-', -4, 3) # => ["-", "-", "-", "d"]
        ['a', 'b', 'c', 'd'].fill('-', -3, 3) # => ["a", "-", "-", "-"]

        ['a', 'b', 'c', 'd'].fill(-4, 3) {|e| e.to_s } # => ["0", "1", "2", "d"]
        ['a', 'b', 'c', 'd'].fill(-3, 3) {|e| e.to_s } # => ["a", "1", "2", "3"]

    Extends `self` if necessary:

        ['a', 'b', 'c', 'd'].fill('-', -2, 3) # => ["a", "b", "-", "-", "-"]
        ['a', 'b', 'c', 'd'].fill('-', -1, 3) # => ["a", "b", "c", "-", "-", "-"]

        ['a', 'b', 'c', 'd'].fill(-2, 3) {|e| e.to_s } # => ["a", "b", "2", "3", "4"]
        ['a', 'b', 'c', 'd'].fill(-1, 3) {|e| e.to_s } # => ["a", "b", "c", "3", "4", "5"]

    Starts at the beginning of `self` if `start` is negative and out-of-range:

        ['a', 'b', 'c', 'd'].fill('-', -5, 2) # => ["-", "-", "c", "d"]
        ['a', 'b', 'c', 'd'].fill('-', -6, 2) # => ["-", "-", "c", "d"]

        ['a', 'b', 'c', 'd'].fill(-5, 2) {|e| e.to_s } # => ["0", "1", "c", "d"]
        ['a', 'b', 'c', 'd'].fill(-6, 2) {|e| e.to_s } # => ["0", "1", "c", "d"]

    Does nothing if `count` is non-positive:

        ['a', 'b', 'c', 'd'].fill('-', -2, 0)  # => ["a", "b", "c", "d"]
        ['a', 'b', 'c', 'd'].fill('-', -2, -1) # => ["a", "b", "c", "d"]

        ['a', 'b', 'c', 'd'].fill(-2, 0) {|e| fail 'Cannot happen' }  # => ["a", "b", "c", "d"]
        ['a', 'b', 'c', 'd'].fill(-2, -1) {|e| fail 'Cannot happen' } # => ["a", "b", "c", "d"]

When argument `range` is given, it must be a Range object whose members are
numeric; its `begin` and `end` values determine the elements of `self` to be
replaced:

*   If both `begin` and `end` are positive, they specify the first and last
    elements to be replaced:

        ['a', 'b', 'c', 'd'].fill('-', 1..2)          # => ["a", "-", "-", "d"]
        ['a', 'b', 'c', 'd'].fill(1..2) {|e| e.to_s } # => ["a", "1", "2", "d"]

    If `end` is smaller than `begin`, replaces no elements:

        ['a', 'b', 'c', 'd'].fill('-', 2..1)          # => ["a", "b", "c", "d"]
        ['a', 'b', 'c', 'd'].fill(2..1) {|e| e.to_s } # => ["a", "b", "c", "d"]

*   If either is negative (or both are negative), counts backwards from the
    end of `self`:

        ['a', 'b', 'c', 'd'].fill('-', -3..2)  # => ["a", "-", "-", "d"]
        ['a', 'b', 'c', 'd'].fill('-', 1..-2)  # => ["a", "-", "-", "d"]
        ['a', 'b', 'c', 'd'].fill('-', -3..-2) # => ["a", "-", "-", "d"]

        ['a', 'b', 'c', 'd'].fill(-3..2) {|e| e.to_s }  # => ["a", "1", "2", "d"]
        ['a', 'b', 'c', 'd'].fill(1..-2) {|e| e.to_s }  # => ["a", "1", "2", "d"]
        ['a', 'b', 'c', 'd'].fill(-3..-2) {|e| e.to_s } # => ["a", "1", "2", "d"]

*   If the `end` value is excluded (see Range#exclude_end?), omits the last
    replacement:

        ['a', 'b', 'c', 'd'].fill('-', 1...2)  # => ["a", "-", "c", "d"]
        ['a', 'b', 'c', 'd'].fill('-', 1...-2) # => ["a", "-", "c", "d"]

        ['a', 'b', 'c', 'd'].fill(1...2) {|e| e.to_s }  # => ["a", "1", "c", "d"]
        ['a', 'b', 'c', 'd'].fill(1...-2) {|e| e.to_s } # => ["a", "1", "c", "d"]

*   If the range is endless (see [Endless
    Ranges](rdoc-ref:Range@Endless+Ranges)), replaces elements to the end of
    `self`:

        ['a', 'b', 'c', 'd'].fill('-', 1..)          # => ["a", "-", "-", "-"]
        ['a', 'b', 'c', 'd'].fill(1..) {|e| e.to_s } # => ["a", "1", "2", "3"]

*   If the range is beginless (see [Beginless
    Ranges](rdoc-ref:Range@Beginless+Ranges)), replaces elements from the
    beginning of `self`:

        ['a', 'b', 'c', 'd'].fill('-', ..2)          # => ["-", "-", "-", "d"]
        ['a', 'b', 'c', 'd'].fill(..2) {|e| e.to_s } # => ["0", "1", "2", "d"]

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## filter() [](#method-i-filter)
With a block given, calls the block with each element of `self`; returns a new
array containing those elements of `self` for which the block returns a truthy
value:

    a = [:foo, 'bar', 2, :bam]
    a.select {|element| element.to_s.start_with?('b') }
    # => ["bar", :bam]

With no block given, returns a new Enumerator.

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## filter!() [](#method-i-filter!)
With a block given, calls the block with each element of `self`; removes from
`self` those elements for which the block returns `false` or `nil`.

Returns `self` if any elements were removed:

    a = [:foo, 'bar', 2, :bam]
    a.select! {|element| element.to_s.start_with?('b') } # => ["bar", :bam]

Returns `nil` if no elements were removed.

With no block given, returns a new Enumerator.

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

**@overload** [] 

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
Returns the zero-based integer index of a specified element, or `nil`.

With only argument `object` given, returns the index of the first element
`element` for which `object == element`:

    a = [:foo, 'bar', 2, 'bar']
    a.index('bar') # => 1

Returns `nil` if no such element found.

With only a block given, calls the block with each successive element; returns
the index of the first element for which the block returns a truthy value:

    a = [:foo, 'bar', 2, 'bar']
    a.index {|element| element == 'bar' } # => 1

Returns `nil` if the block never returns a truthy value.

With neither an argument nor a block given, returns a new Enumerator.

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## first(nunspecified = true) [](#method-i-first)
call-seq:
    first -> object or nil
    first(count) -> new_array

Returns elements from `self`, or `nil`; does not modify `self`.

With no argument given, returns the first element (if available):

    a = [:foo, 'bar', 2]
    a.first # => :foo
    a # => [:foo, "bar", 2]

If `self` is empty, returns `nil`.

    [].first # => nil

With a non-negative integer argument `count` given, returns the first `count`
elements (as available) in a new array:

    a.first(0)  # => []
    a.first(2)  # => [:foo, "bar"]
    a.first(50) # => [:foo, "bar", 2]

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

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
Returns a new array that is a recursive flattening of `self` to `depth` levels
of recursion; `depth` must be an [integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects) or
`nil`. At each level of recursion:

*   Each element that is an array is "flattened" (that is, replaced by its
    individual array elements).
*   Each element that is not an array is unchanged (even if the element is an
    object that has instance method `flatten`).

With non-negative integer argument `depth`, flattens recursively through
`depth` levels:

    a = [ 0, [ 1, [2, 3], 4 ], 5, {foo: 0}, Set.new([6, 7]) ]
    a              # => [0, [1, [2, 3], 4], 5, {:foo=>0}, #<Set: {6, 7}>]
    a.flatten(0)   # => [0, [1, [2, 3], 4], 5, {:foo=>0}, #<Set: {6, 7}>]
    a.flatten(1  ) # => [0, 1, [2, 3], 4, 5, {:foo=>0}, #<Set: {6, 7}>]
    a.flatten(1.1) # => [0, 1, [2, 3], 4, 5, {:foo=>0}, #<Set: {6, 7}>]
    a.flatten(2)   # => [0, 1, 2, 3, 4, 5, {:foo=>0}, #<Set: {6, 7}>]
    a.flatten(3)   # => [0, 1, 2, 3, 4, 5, {:foo=>0}, #<Set: {6, 7}>]

With `nil` or negative `depth`, flattens all levels.

    a.flatten     # => [0, 1, 2, 3, 4, 5, {:foo=>0}, #<Set: {6, 7}>]
    a.flatten(-1) # => [0, 1, 2, 3, 4, 5, {:foo=>0}, #<Set: {6, 7}>]

Related: Array#flatten!; see also [Methods for
Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

## flatten!(*args) [](#method-i-flatten!)
Returns `self` as a recursively flattening of `self` to `depth` levels of
recursion; `depth` must be an [integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects), or
`nil`. At each level of recursion:

*   Each element that is an array is "flattened" (that is, replaced by its
    individual array elements).
*   Each element that is not an array is unchanged (even if the element is an
    object that has instance method `flatten`).

Returns `nil` if no elements were flattened.

With non-negative integer argument `depth`, flattens recursively through
`depth` levels:

    a = [ 0, [ 1, [2, 3], 4 ], 5, {foo: 0}, Set.new([6, 7]) ]
    a                   # => [0, [1, [2, 3], 4], 5, {:foo=>0}, #<Set: {6, 7}>]
    a.dup.flatten!(1)   # => [0, 1, [2, 3], 4, 5, {:foo=>0}, #<Set: {6, 7}>]
    a.dup.flatten!(1.1) # => [0, 1, [2, 3], 4, 5, {:foo=>0}, #<Set: {6, 7}>]
    a.dup.flatten!(2)   # => [0, 1, 2, 3, 4, 5, {:foo=>0}, #<Set: {6, 7}>]
    a.dup.flatten!(3)   # => [0, 1, 2, 3, 4, 5, {:foo=>0}, #<Set: {6, 7}>]

With `nil` or negative argument `depth`, flattens all levels:

    a.dup.flatten!     # => [0, 1, 2, 3, 4, 5, {:foo=>0}, #<Set: {6, 7}>]
    a.dup.flatten!(-1) # => [0, 1, 2, 3, 4, 5, {:foo=>0}, #<Set: {6, 7}>]

Related: Array#flatten; see also [Methods for
Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

## freeze() [](#method-i-freeze)
Freezes `self` (if not already frozen); returns `self`:

    a = []
    a.frozen? # => false
    a.freeze
    a.frozen? # => true

No further changes may be made to `self`; raises FrozenError if a change is
attempted.

Related: Kernel#frozen?.

**@overload** [] 

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
Returns the integer hash value for `self`.

Two arrays with the same content will have the same hash value (and will
compare using eql?):

    ['a', 'b'].hash == ['a', 'b'].hash # => true
    ['a', 'b'].hash == ['a', 'c'].hash # => false
    ['a', 'b'].hash == ['a'].hash      # => false

**@overload** [] 

## include?(item) [](#method-i-include?)
Returns whether for some element `element` in `self`, `object == element`:

    [0, 1, 2].include?(2)   # => true
    [0, 1, 2].include?(2.0) # => true
    [0, 1, 2].include?(2.1) # => false

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

## index(*args) [](#method-i-index)
Returns the zero-based integer index of a specified element, or `nil`.

With only argument `object` given, returns the index of the first element
`element` for which `object == element`:

    a = [:foo, 'bar', 2, 'bar']
    a.index('bar') # => 1

Returns `nil` if no such element found.

With only a block given, calls the block with each successive element; returns
the index of the first element for which the block returns a truthy value:

    a = [:foo, 'bar', 2, 'bar']
    a.index {|element| element == 'bar' } # => 1

Returns `nil` if the block never returns a truthy value.

With neither an argument nor a block given, returns a new Enumerator.

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Returns a new array.

With no block and no argument given, returns a new empty array:

    Array.new # => []

With no block and array argument given, returns a new array with the same
elements:

    Array.new([:foo, 'bar', 2]) # => [:foo, "bar", 2]

With no block and integer argument given, returns a new array containing that
many instances of the given `default_value`:

    Array.new(0)    # => []
    Array.new(3)    # => [nil, nil, nil]
    Array.new(2, 3) # => [3, 3]

With a block given, returns an array of the given `size`; calls the block with
each `index` in the range `(0...size)`; the element at that `index` in the
returned array is the blocks return value:

    Array.new(3)  {|index| "Element #{index}" } # => ["Element 0", "Element 1", "Element 2"]

A common pitfall for new Rubyists is providing an expression as
`default_value`:

    array = Array.new(2, {})
    array # => [{}, {}]
    array[0][:a] = 1
    array # => [{a: 1}, {a: 1}], as array[0] and array[1] are same object

If you want the elements of the array to be distinct, you should pass a block:

    array = Array.new(2) { {} }
    array # => [{}, {}]
    array[0][:a] = 1
    array # => [{a: 1}, {}], as array[0] and array[1] are different objects

Raises TypeError if the first argument is not either an array or an
[integer-convertible
object](rdoc-ref:implicit_conversion.rdoc@Integer-Convertible+Objects)).
Raises ArgumentError if the first argument is a negative integer.

Related: see [Methods for Creating an
Array](rdoc-ref:Array@Methods+for+Creating+an+Array).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## initialize_copy(orig) [](#method-i-initialize_copy)
Replaces the elements of `self` with the elements of `other_array`, which must
be an [array-convertible
object](rdoc-ref:implicit_conversion.rdoc@Array-Convertible+Objects); returns
`self`:

    a = ['a', 'b', 'c']   # => ["a", "b", "c"]
    a.replace(['d', 'e']) # => ["d", "e"]

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

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

## insert(*args) [](#method-i-insert)
Inserts the given `objects` as elements of `self`; returns `self`.

When `index` is non-negative, inserts `objects` *before* the element at offset
`index`:

    a = ['a', 'b', 'c']     # => ["a", "b", "c"]
    a.insert(1, :x, :y, :z) # => ["a", :x, :y, :z, "b", "c"]

Extends the array if `index` is beyond the array (`index >= self.size`):

    a = ['a', 'b', 'c']     # => ["a", "b", "c"]
    a.insert(5, :x, :y, :z) # => ["a", "b", "c", nil, nil, :x, :y, :z]

When `index` is negative, inserts `objects` *after* the element at offset
`index + self.size`:

    a = ['a', 'b', 'c']      # => ["a", "b", "c"]
    a.insert(-2, :x, :y, :z) # => ["a", "b", :x, :y, :z, "c"]

With no `objects` given, does nothing:

    a = ['a', 'b', 'c'] # => ["a", "b", "c"]
    a.insert(1)         # => ["a", "b", "c"]
    a.insert(50)        # => ["a", "b", "c"]
    a.insert(-50)       # => ["a", "b", "c"]

Raises IndexError if `objects` are given and `index` is negative and out of
range.

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns the new string formed by calling method `#inspect` on each array
element:

    a = [:foo, 'bar', 2]
    a.inspect # => "[:foo, \"bar\", 2]"

Related: see [Methods for Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

**@overload** [] 

## intersect?(ary2) [](#method-i-intersect?)
Returns whether `other_array` has at least one element that is `#eql?` to some
element of `self`:

    [1, 2, 3].intersect?([3, 4, 5]) # => true
    [1, 2, 3].intersect?([4, 5, 6]) # => false

Each element must correctly implement method `#hash`.

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

## intersection(*args) [](#method-i-intersection)
Returns a new array containing each element in `self` that is `#eql?` to at
least one element in each of the given `other_arrays`; duplicates are omitted:

    [0, 0, 1, 1, 2, 3].intersection([0, 1, 2], [0, 1, 3]) # => [0, 1]

Each element must correctly implement method `#hash`.

Order from `self` is preserved:

    [0, 1, 2].intersection([2, 1, 0]) # => [0, 1, 2]

Returns a copy of `self` if no arguments are given.

Related: see [Methods for Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

## iter_test1() [](#method-i-iter_test1)

## iter_test2() [](#method-i-iter_test2)

## join(*args) [](#method-i-join)
Returns the new string formed by joining the converted elements of `self`; for
each element `element`:

*   Converts recursively using `element.join(separator)` if `element` is a
    `kind_of?(Array)`.
*   Otherwise, converts using `element.to_s`.

With no argument given, joins using the output field separator, `$,`:

    a = [:foo, 'bar', 2]
    $, # => nil
    a.join # => "foobar2"

With string argument `separator` given, joins using that separator:

    a = [:foo, 'bar', 2]
    a.join("\n") # => "foo\nbar\n2"

Joins recursively for nested arrays:

    a = [:foo, [:bar, [:baz, :bat]]]
    a.join # => "foobarbazbat"

Related: see [Methods for Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

## keep_if() [](#method-i-keep_if)
With a block given, calls the block with each element of `self`; removes the
element from `self` if the block does not return a truthy value:

    a = [:foo, 'bar', 2, :bam]
    a.keep_if {|element| element.to_s.start_with?('b') } # => ["bar", :bam]

With no block given, returns a new Enumerator.

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

**@overload** [] 

## last(nunspecified = true) [](#method-i-last)
call-seq:
    last  -> last_object or nil
    last(count) -> new_array

Returns elements from `self`, or `nil`; `self` is not modified.

With no argument given, returns the last element, or `nil` if `self` is empty:

    a = [:foo, 'bar', 2]
    a.last # => 2
    a # => [:foo, "bar", 2]
    [].last # => nil

With non-negative integer argument `count` given, returns a new array
containing the trailing `count` elements of `self`, as available:

    a = [:foo, 'bar', 2]
    a.last(2)  # => ["bar", 2]
    a.last(50) # => [:foo, "bar", 2]
    a.last(0)  # => []
    [].last(3) # => []

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

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
Returns the count of elements in `self`:

    [0, 1, 2].length # => 3
    [].length        # => 0

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

## map() [](#method-i-map)
With a block given, calls the block with each element of `self`; returns a new
array whose elements are the return values from the block:

    a = [:foo, 'bar', 2]
    a1 = a.map {|element| element.class }
    a1 # => [Symbol, String, Integer]

With no block given, returns a new Enumerator.

Related: #collect!; see also [Methods for
Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## map!() [](#method-i-map!)
With a block given, calls the block with each element of `self` and replaces
the element with the block's return value; returns `self`:

    a = [:foo, 'bar', 2]
    a.map! { |element| element.class } # => [Symbol, String, Integer]

With no block given, returns a new Enumerator.

Related: #collect; see also [Methods for
Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## max(*args) [](#method-i-max)
Returns one of the following:

*   The maximum-valued element from `self`.
*   A new array of maximum-valued elements from `self`.

Does not modify `self`.

With no block given, each element in `self` must respond to method `#<=>` with
a numeric.

With no argument and no block, returns the element in `self` having the
maximum value per method `#<=>`:

    [1, 0, 3, 2].max # => 3

With non-negative numeric argument `count` and no block, returns a new array
with at most `count` elements, in descending order, per method `#<=>`:

    [1, 0, 3, 2].max(3)   # => [3, 2, 1]
    [1, 0, 3, 2].max(3.0) # => [3, 2, 1]
    [1, 0, 3, 2].max(9)   # => [3, 2, 1, 0]
    [1, 0, 3, 2].max(0)   # => []

With a block given, the block must return a numeric.

With a block and no argument, calls the block `self.size - 1` times to compare
elements; returns the element having the maximum value per the block:

    ['0', '', '000', '00'].max {|a, b| a.size <=> b.size }
    # => "000"

With non-negative numeric argument `count` and a block, returns a new array
with at most `count` elements, in descending order, per the block:

    ['0', '', '000', '00'].max(2) {|a, b| a.size <=> b.size }
    # => ["000", "00"]

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

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

## member?(val) [](#method-i-member?)
Returns whether for any element `object == element`:

    (1..4).include?(2)                       # => true
    (1..4).include?(5)                       # => false
    (1..4).include?('2')                     # => false
    %w[a b c d].include?('b')                # => true
    %w[a b c d].include?('2')                # => false
    {foo: 0, bar: 1, baz: 2}.include?(:foo)  # => true
    {foo: 0, bar: 1, baz: 2}.include?('foo') # => false
    {foo: 0, bar: 1, baz: 2}.include?(0)     # => false

**@overload** [] 

## min(*args) [](#method-i-min)
Returns one of the following:

*   The minimum-valued element from `self`.
*   A new array of minimum-valued elements from `self`.

Does not modify `self`.

With no block given, each element in `self` must respond to method `#<=>` with
a numeric.

With no argument and no block, returns the element in `self` having the
minimum value per method `#<=>`:

    [1, 0, 3, 2].min # => 0

With non-negative numeric argument `count` and no block, returns a new array
with at most `count` elements, in ascending order, per method `#<=>`:

    [1, 0, 3, 2].min(3)   # => [0, 1, 2]
    [1, 0, 3, 2].min(3.0) # => [0, 1, 2]
    [1, 0, 3, 2].min(9)   # => [0, 1, 2, 3]
    [1, 0, 3, 2].min(0)   # => []

With a block given, the block must return a numeric.

With a block and no argument, calls the block `self.size - 1` times to compare
elements; returns the element having the minimum value per the block:

    ['0', '', '000', '00'].min {|a, b| a.size <=> b.size }
    # => ""

With non-negative numeric argument `count` and a block, returns a new array
with at most `count` elements, in ascending order, per the block:

    ['0', '', '000', '00'].min(2) {|a, b| a.size <=> b.size }
    # => ["", "0"]

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

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
Returns a 2-element array containing the minimum-valued and maximum-valued
elements from `self`; does not modify `self`.

With no block given, the minimum and maximum values are determined using
method `#<=>`:

    [1, 0, 3, 2].minmax # => [0, 3]

With a block given, the block must return a numeric; the block is called
`self.size - 1` times to compare elements; returns the elements having the
minimum and maximum values per the block:

    ['0', '', '000', '00'].minmax {|a, b| a.size <=> b.size }
    # => ["", "000"]

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

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
Returns `true` if no element of `self` meets a given criterion, `false`
otherwise.

With no block given and no argument, returns `true` if `self` has no truthy
elements, `false` otherwise:

    [nil, false].none?    # => true
    [nil, 0, false].none? # => false
    [].none?              # => true

With argument `object` given, returns `false` if for any element `element`,
`object === element`; `true` otherwise:

    ['food', 'drink'].none?(/bar/) # => true
    ['food', 'drink'].none?(/foo/) # => false
    [].none?(/foo/)                # => true
    [0, 1, 2].none?(3)             # => true
    [0, 1, 2].none?(1)             # => false

With a block given, calls the block with each element in `self`; returns
`true` if the block returns no truthy value, `false` otherwise:

    [0, 1, 2].none? {|element| element > 3 } # => true
    [0, 1, 2].none? {|element| element > 1 } # => false

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## one?(*args) [](#method-i-one?)
Returns `true` if exactly one element of `self` meets a given criterion.

With no block given and no argument, returns `true` if `self` has exactly one
truthy element, `false` otherwise:

    [nil, 0].one? # => true
    [0, 0].one? # => false
    [nil, nil].one? # => false
    [].one? # => false

With a block given, calls the block with each element in `self`; returns
`true` if the block a truthy value for exactly one element, `false` otherwise:

    [0, 1, 2].one? {|element| element > 0 } # => false
    [0, 1, 2].one? {|element| element > 1 } # => true
    [0, 1, 2].one? {|element| element > 2 } # => false

With argument `object` given, returns `true` if for exactly one element
`element`, `object === element`; `false` otherwise:

    [0, 1, 2].one?(0) # => true
    [0, 0, 1].one?(0) # => false
    [1, 1, 2].one?(0) # => false
    ['food', 'drink'].one?(/bar/) # => false
    ['food', 'drink'].one?(/foo/) # => true
    [].one?(/foo/) # => false

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## pack(fmt, buffer:nil) [](#method-i-pack)
call-seq:
      pack(template, buffer: nil) -> string

    Formats each element in +self+ into a binary string; returns that string.
    See {Packed Data}[rdoc-ref:packed_data.rdoc].

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

## permutation(*args) [](#method-i-permutation)
Iterates over permutations of the elements of `self`; the order of
permutations is indeterminate.

With a block and an in-range positive integer argument `count` (`0 < count <=
self.size`) given, calls the block with each permutation of `self` of size
`count`; returns `self`:

    a = [0, 1, 2]
    perms = []
    a.permutation(1) {|perm| perms.push(perm) }
    perms # => [[0], [1], [2]]

    perms = []
    a.permutation(2) {|perm| perms.push(perm) }
    perms # => [[0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1]]

    perms = []
    a.permutation(3) {|perm| perms.push(perm) }
    perms # => [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]]

When `count` is zero, calls the block once with a new empty array:

    perms = []
    a.permutation(0) {|perm| perms.push(perm) }
    perms # => [[]]

When `count` is out of range (negative or larger than `self.size`), does not
call the block:

    a.permutation(-1) {|permutation| fail 'Cannot happen' }
    a.permutation(4) {|permutation| fail 'Cannot happen' }

With no block given, returns a new Enumerator.

Related: [Methods for Iterating](rdoc-ref:Array@Methods+for+Iterating).

**@overload** [] 

**@overload** [] 

## pop(*args) [](#method-i-pop)
Removes and returns trailing elements of `self`.

With no argument given, removes and returns the last element, if available;
otherwise returns `nil`:

    a = [:foo, 'bar', 2]
    a.pop  # => 2
    a      # => [:foo, "bar"]
    [].pop # => nil

With non-negative integer argument `count` given, returns a new array
containing the trailing `count` elements of `self`, as available:

    a = [:foo, 'bar', 2]
    a.pop(2) # => ["bar", 2]
    a        # => [:foo]

    a = [:foo, 'bar', 2]
    a.pop(50) # => [:foo, "bar", 2]
    a         # => []

Related: Array#push; see also [Methods for
Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

**@overload** [] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## pretty_print_cycle(q) [](#method-i-pretty_print_cycle)
:nodoc:

## product(*args) [](#method-i-product)
Computes all combinations of elements from all the arrays, including both
`self` and `other_arrays`:

*   The number of combinations is the product of the sizes of all the arrays,
    including both `self` and `other_arrays`.
*   The order of the returned combinations is indeterminate.

With no block given, returns the combinations as an array of arrays:

    p = [0, 1].product([2, 3])
    # => [[0, 2], [0, 3], [1, 2], [1, 3]]
    p.size # => 4
    p = [0, 1].product([2, 3], [4, 5])
    # => [[0, 2, 4], [0, 2, 5], [0, 3, 4], [0, 3, 5], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3,...
    p.size # => 8

If `self` or any argument is empty, returns an empty array:

    [].product([2, 3], [4, 5]) # => []
    [0, 1].product([2, 3], []) # => []

If no argument is given, returns an array of 1-element arrays, each containing
an element of `self`:

    a.product # => [[0], [1], [2]]

With a block given, calls the block with each combination; returns `self`:

    p = []
    [0, 1].product([2, 3]) {|combination| p.push(combination) }
    p # => [[0, 2], [0, 3], [1, 2], [1, 3]]

If `self` or any argument is empty, does not call the block:

    [].product([2, 3], [4, 5]) {|combination| fail 'Cannot happen' }
    # => []
    [0, 1].product([2, 3], []) {|combination| fail 'Cannot happen' }
    # => [0, 1]

If no argument is given, calls the block with each element of `self` as a
1-element array:

    p = []
    [0, 1].product {|combination| p.push(combination) }
    p # => [[0], [1]]

Related: see [Methods for Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

**@overload** [] 

## push(*args) [](#method-i-push)
Appends each argument in `objects` to `self`; returns `self`:

    a = [:foo, 'bar', 2] # => [:foo, "bar", 2]
    a.push(:baz, :bat)   # => [:foo, "bar", 2, :baz, :bat]

Appends each argument as a single element, even if it is another array:

    a = [:foo, 'bar', 2]               # => [:foo, "bar", 2]
      a.push([:baz, :bat], [:bam, :bad]) # => [:foo, "bar", 2, [:baz, :bat], [:bam, :bad]]

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

**@overload** [] 

## quote() [](#method-i-quote)
Wraps all strings in escaped quotes if they contain whitespace.

## rassoc(value) [](#method-i-rassoc)
Returns the first element `ele` in `self` such that `ele` is an array and
`ele[1] == object`:

    a = [{foo: 0}, [2, 4], [4, 5, 6], [4, 5]]
    a.rassoc(4) # => [2, 4]
    a.rassoc(5) # => [4, 5, 6]

Returns `nil` if no such element is found.

Related: Array#assoc; see also [Methods for
Fetching](rdoc-ref:Array@Methods+for+Fetching).

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

## reject() [](#method-i-reject)
With a block given, returns a new array whose elements are all those from
`self` for which the block returns `false` or `nil`:

    a = [:foo, 'bar', 2, 'bat']
    a1 = a.reject {|element| element.to_s.start_with?('b') }
    a1 # => [:foo, 2]

With no block given, returns a new Enumerator.

Related: [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

## reject!() [](#method-i-reject!)
With a block given, calls the block with each element of `self`; removes each
element for which the block returns a truthy value.

Returns `self` if any elements removed:

    a = [:foo, 'bar', 2, 'bat']
    a.reject! {|element| element.to_s.start_with?('b') } # => [:foo, 2]

Returns `nil` if no elements removed.

With no block given, returns a new Enumerator.

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

**@overload** [] 

## repeated_combination(num) [](#method-i-repeated_combination)
With a block given, calls the block with each repeated combination of length
`size` of the elements of `self`; each combination is an array; returns
`self`. The order of the combinations is indeterminate.

If a positive integer argument `size` is given, calls the block with each
`size`-tuple repeated combination of the elements of `self`. The number of
combinations is `(size+1)(size+2)/2`.

Examples:

*   `size` is 1:

        c = []
        [0, 1, 2].repeated_combination(1) {|combination| c.push(combination) }
        c # => [[0], [1], [2]]

*   `size` is 2:

        c = []
        [0, 1, 2].repeated_combination(2) {|combination| c.push(combination) }
        c # => [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2], [2, 2]]

If `size` is zero, calls the block once with an empty array.

If `size` is negative, does not call the block:

    [0, 1, 2].repeated_combination(-1) {|combination| fail 'Cannot happen' }

With no block given, returns a new Enumerator.

Related: see [Methods for Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

**@overload** [] 

## repeated_permutation(num) [](#method-i-repeated_permutation)
With a block given, calls the block with each repeated permutation of length
`size` of the elements of `self`; each permutation is an array; returns
`self`. The order of the permutations is indeterminate.

If a positive integer argument `size` is given, calls the block with each
`size`-tuple repeated permutation of the elements of `self`. The number of
permutations is `self.size**size`.

Examples:

*   `size` is 1:

        p = []
        [0, 1, 2].repeated_permutation(1) {|permutation| p.push(permutation) }
        p # => [[0], [1], [2]]

*   `size` is 2:

        p = []
        [0, 1, 2].repeated_permutation(2) {|permutation| p.push(permutation) }
        p # => [[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]]

If `size` is zero, calls the block once with an empty array.

If `size` is negative, does not call the block:

    [0, 1, 2].repeated_permutation(-1) {|permutation| fail 'Cannot happen' }

With no block given, returns a new Enumerator.

Related: see [Methods for Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

**@overload** [] 

## replace(orig) [](#method-i-replace)
Replaces the elements of `self` with the elements of `other_array`, which must
be an [array-convertible
object](rdoc-ref:implicit_conversion.rdoc@Array-Convertible+Objects); returns
`self`:

    a = ['a', 'b', 'c']   # => ["a", "b", "c"]
    a.replace(['d', 'e']) # => ["d", "e"]

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

**@overload** [] 

## reverse() [](#method-i-reverse)
Returns a new array containing the elements of `self` in reverse order:

    [0, 1, 2].reverse # => [2, 1, 0]

Related: see [Methods for Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

## reverse!() [](#method-i-reverse!)
Reverses the order of the elements of `self`; returns `self`:

    a = [0, 1, 2]
    a.reverse! # => [2, 1, 0]
    a          # => [2, 1, 0]

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

## reverse_each() [](#method-i-reverse_each)
When a block given, iterates backwards over the elements of `self`, passing,
in reverse order, each element to the block; returns `self`:

    a = []
    [0, 1, 2].reverse_each {|element| a.push(element) }
    a # => [2, 1, 0]

Allows the array to be modified during iteration:

    a = ['a', 'b', 'c']
    a.reverse_each {|element| a.clear if element.start_with?('b') }
    a # => []

When no block given, returns a new Enumerator.

Related: see [Methods for Iterating](rdoc-ref:Array@Methods+for+Iterating).

**@overload** [] 

**@overload** [] 

## rindex(*args) [](#method-i-rindex)
Returns the index of the last element for which `object == element`.

With argument `object` given, returns the index of the last such element
found:

    a = [:foo, 'bar', 2, 'bar']
    a.rindex('bar') # => 3

Returns `nil` if no such object found.

With a block given, calls the block with each successive element; returns the
index of the last element for which the block returns a truthy value:

    a = [:foo, 'bar', 2, 'bar']
    a.rindex {|element| element == 'bar' } # => 3

Returns `nil` if the block never returns a truthy value.

When neither an argument nor a block is given, returns a new Enumerator.

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

**@overload** [] 

## rotate(*args) [](#method-i-rotate)
Returns a new array formed from `self` with elements rotated from one end to
the other.

With non-negative numeric `count`, rotates elements from the beginning to the
end:

    [0, 1, 2, 3].rotate(2)   # => [2, 3, 0, 1]
    [0, 1, 2, 3].rotate(2.1) # => [2, 3, 0, 1]

If `count` is large, uses `count % array.size` as the count:

    [0, 1, 2, 3].rotate(22) # => [2, 3, 0, 1]

With a `count` of zero, rotates no elements:

    [0, 1, 2, 3].rotate(0) # => [0, 1, 2, 3]

With negative numeric `count`, rotates in the opposite direction, from the end
to the beginning:

    [0, 1, 2, 3].rotate(-1) # => [3, 0, 1, 2]

If `count` is small (far from zero), uses `count % array.size` as the count:

    [0, 1, 2, 3].rotate(-21) # => [3, 0, 1, 2]

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

## rotate!(*args) [](#method-i-rotate!)
Rotates `self` in place by moving elements from one end to the other; returns
`self`.

With non-negative numeric `count`, rotates `count` elements from the beginning
to the end:

    [0, 1, 2, 3].rotate!(2)   # => [2, 3, 0, 1]
      [0, 1, 2, 3].rotate!(2.1) # => [2, 3, 0, 1]

If `count` is large, uses `count % array.size` as the count:

    [0, 1, 2, 3].rotate!(21) # => [1, 2, 3, 0]

If `count` is zero, rotates no elements:

    [0, 1, 2, 3].rotate!(0) # => [0, 1, 2, 3]

With a negative numeric `count`, rotates in the opposite direction, from end
to beginning:

    [0, 1, 2, 3].rotate!(-1) # => [3, 0, 1, 2]

If `count` is small (far from zero), uses `count % array.size` as the count:

    [0, 1, 2, 3].rotate!(-21) # => [3, 0, 1, 2]

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

## sample(n(ary = false), random:Random) [](#method-i-sample)
call-seq:
    sample(random: Random) -> object
    sample(count, random: Random) -> new_ary

Returns random elements from `self`, as selected by the object given by the
keyword argument `random`.

With no argument `count` given, returns one random element from `self`:

    a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    a.sample # => 3
    a.sample # => 8

Returns `nil` if `self` is empty:

    [].sample # => nil

With a non-negative numeric argument `count` given, returns a new array
containing `count` random elements from `self`:

    a.sample(3) # => [8, 9, 2]
    a.sample(6) # => [9, 6, 0, 3, 1, 4]

The order of the result array is unrelated to the order of `self`.

Returns a new empty `Array` if `self` is empty:

    [].sample(4) # => []

May return duplicates in `self`:

    a = [1, 1, 1, 2, 2, 3]
    a.sample(a.size) # => [1, 1, 3, 2, 1, 2]

Returns no more than `a.size` elements (because no new duplicates are
introduced):

    a.sample(50) # => [6, 4, 1, 8, 5, 9, 0, 2, 3, 7]

The object given with the keyword argument `random` is used as the random
number generator:

    a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    a.sample(random: Random.new(1))     # => 6
    a.sample(4, random: Random.new(1))  # => [6, 10, 9, 2]

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

## select() [](#method-i-select)
With a block given, calls the block with each element of `self`; returns a new
array containing those elements of `self` for which the block returns a truthy
value:

    a = [:foo, 'bar', 2, :bam]
    a.select {|element| element.to_s.start_with?('b') }
    # => ["bar", :bam]

With no block given, returns a new Enumerator.

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## select!() [](#method-i-select!)
With a block given, calls the block with each element of `self`; removes from
`self` those elements for which the block returns `false` or `nil`.

Returns `self` if any elements were removed:

    a = [:foo, 'bar', 2, :bam]
    a.select! {|element| element.to_s.start_with?('b') } # => ["bar", :bam]

Returns `nil` if no elements were removed.

With no block given, returns a new Enumerator.

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## shelljoin() [](#method-i-shelljoin)
call-seq:
    array.shelljoin => string

Builds a command line string from an argument list `array` joining all
elements escaped for the Bourne shell and separated by a space.

See Shellwords.shelljoin for details.

## shift(*args) [](#method-i-shift)
Removes and returns leading elements from `self`.

With no argument, removes and returns one element, if available, or `nil`
otherwise:

    a = [0, 1, 2, 3]
    a.shift  # => 0
    a        # => [1, 2, 3]
    [].shift # => nil

With non-negative numeric argument `count` given, removes and returns the
first `count` elements:

    a = [0, 1, 2, 3]
    a.shift(2)   # => [0, 1]
    a            # => [2, 3]
    a.shift(1.1) # => [2]
    a            # => [3]
    a.shift(0)   # => []
    a            # => [3]

If `count` is large, removes and returns all elements:

    a = [0, 1, 2, 3]
    a.shift(50) # => [0, 1, 2, 3]
    a           # => []

If `self` is empty, returns a new empty array.

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

**@overload** [] 

## shuffle(random:Random) [](#method-i-shuffle)
call-seq:
    shuffle(random: Random) -> new_array

Returns a new array containing all elements from `self` in a random order, as
selected by the object given by the keyword argument `random`:

    a =            [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    a.shuffle # => [0, 8, 1, 9, 6, 3, 4, 7, 2, 5]
    a.shuffle # => [8, 9, 0, 5, 1, 2, 6, 4, 7, 3]

Duplicate elements are included:

    a =            [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    a.shuffle # => [1, 0, 1, 1, 0, 0, 1, 0, 0, 1]
    a.shuffle # => [1, 1, 0, 0, 0, 1, 1, 0, 0, 1]

The object given with the keyword argument `random` is used as the random
number generator.

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

## shuffle!(random:Random) [](#method-i-shuffle!)
call-seq:
    shuffle!(random: Random) -> self

Shuffles all elements in `self` into a random order, as selected by the object
given by the keyword argument `random`. Returns `self`:

    a =             [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    a.shuffle! # => [5, 3, 8, 7, 6, 1, 9, 4, 2, 0]
    a.shuffle! # => [9, 4, 0, 6, 2, 8, 1, 5, 3, 7]

Duplicate elements are included:

    a =             [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
    a.shuffle! # => [1, 0, 0, 1, 1, 0, 1, 0, 0, 1]
    a.shuffle! # => [0, 1, 0, 1, 1, 0, 1, 0, 1, 0]

The object given with the keyword argument `random` is used as the random
number generator.

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

## size() [](#method-i-size)
Returns the count of elements in `self`:

    [0, 1, 2].length # => 3
    [].length        # => 0

Related: see [Methods for Querying](rdoc-ref:Array@Methods+for+Querying).

**@overload** [] 

**@overload** [] 

## slice(*args) [](#method-i-slice)
Returns elements from `self`; does not modify `self`.

In brief:

    a = [:foo, 'bar', 2]

    # Single argument index: returns one element.
    a[0]     # => :foo          # Zero-based index.
    a[-1]    # => 2             # Negative index counts backwards from end.

    # Arguments start and length: returns an array.
    a[1, 2]  # => ["bar", 2]
    a[-2, 2] # => ["bar", 2]    # Negative start counts backwards from end.

    # Single argument range: returns an array.
    a[0..1]  # => [:foo, "bar"]
    a[0..-2] # => [:foo, "bar"] # Negative range-begin counts backwards from end.
    a[-2..2] # => ["bar", 2]    # Negative range-end counts backwards from end.

When a single integer argument `index` is given, returns the element at offset
`index`:

    a = [:foo, 'bar', 2]
    a[0] # => :foo
    a[2] # => 2
    a # => [:foo, "bar", 2]

If `index` is negative, counts backwards from the end of `self`:

    a = [:foo, 'bar', 2]
    a[-1] # => 2
    a[-2] # => "bar"

If `index` is out of range, returns `nil`.

When two Integer arguments `start` and `length` are given, returns a new
`Array` of size `length` containing successive elements beginning at offset
`start`:

    a = [:foo, 'bar', 2]
    a[0, 2] # => [:foo, "bar"]
    a[1, 2] # => ["bar", 2]

If `start + length` is greater than `self.length`, returns all elements from
offset `start` to the end:

    a = [:foo, 'bar', 2]
    a[0, 4] # => [:foo, "bar", 2]
    a[1, 3] # => ["bar", 2]
    a[2, 2] # => [2]

If `start == self.size` and `length >= 0`, returns a new empty `Array`.

If `length` is negative, returns `nil`.

When a single Range argument `range` is given, treats `range.min` as `start`
above and `range.size` as `length` above:

    a = [:foo, 'bar', 2]
    a[0..1] # => [:foo, "bar"]
    a[1..2] # => ["bar", 2]

Special case: If `range.start == a.size`, returns a new empty `Array`.

If `range.end` is negative, calculates the end index from the end:

    a = [:foo, 'bar', 2]
    a[0..-1] # => [:foo, "bar", 2]
    a[0..-2] # => [:foo, "bar"]
    a[0..-3] # => [:foo]

If `range.start` is negative, calculates the start index from the end:

    a = [:foo, 'bar', 2]
    a[-1..2] # => [2]
    a[-2..2] # => ["bar", 2]
    a[-3..2] # => [:foo, "bar", 2]

If `range.start` is larger than the array size, returns `nil`.

    a = [:foo, 'bar', 2]
    a[4..1] # => nil
    a[4..0] # => nil
    a[4..-1] # => nil

When a single Enumerator::ArithmeticSequence argument `aseq` is given, returns
an `Array` of elements corresponding to the indexes produced by the sequence.

    a = ['--', 'data1', '--', 'data2', '--', 'data3']
    a[(1..).step(2)] # => ["data1", "data2", "data3"]

Unlike slicing with range, if the start or the end of the arithmetic sequence
is larger than array size, throws RangeError.

    a = ['--', 'data1', '--', 'data2', '--', 'data3']
    a[(1..11).step(2)]
    # RangeError (((1..11).step(2)) out of range)
    a[(7..).step(2)]
    # RangeError (((7..).step(2)) out of range)

If given a single argument, and its type is not one of the listed, tries to
convert it to Integer, and raises if it is impossible:

    a = [:foo, 'bar', 2]
    # Raises TypeError (no implicit conversion of Symbol into Integer):
    a[:foo]

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## slice!(*args) [](#method-i-slice!)
Removes and returns elements from `self`.

With numeric argument `index` given, removes and returns the element at offset
`index`:

    a = ['a', 'b', 'c', 'd']
    a.slice!(2)   # => "c"
    a             # => ["a", "b", "d"]
    a.slice!(2.1) # => "d"
    a             # => ["a", "b"]

If `index` is negative, counts backwards from the end of `self`:

    a = ['a', 'b', 'c', 'd']
    a.slice!(-2) # => "c"
    a            # => ["a", "b", "d"]

If `index` is out of range, returns `nil`.

With numeric arguments `start` and `length` given, removes `length` elements
from `self` beginning at zero-based offset `start`; returns the removed
objects in a new array:

    a = ['a', 'b', 'c', 'd']
    a.slice!(1, 2)     # => ["b", "c"]
    a                  # => ["a", "d"]
    a.slice!(0.1, 1.1) # => ["a"]
    a                  # => ["d"]

If `start` is negative, counts backwards from the end of `self`:

    a = ['a', 'b', 'c', 'd']
    a.slice!(-2, 1) # => ["c"]
    a               # => ["a", "b", "d"]

If `start` is out-of-range, returns `nil`:

    a = ['a', 'b', 'c', 'd']
    a.slice!(5, 1)  # => nil
    a.slice!(-5, 1) # => nil

If `start + length` exceeds the array size, removes and returns all elements
from offset `start` to the end:

    a = ['a', 'b', 'c', 'd']
    a.slice!(2, 50) # => ["c", "d"]
    a               # => ["a", "b"]

If `start == a.size` and `length` is non-negative, returns a new empty array.

If `length` is negative, returns `nil`.

With Range argument `range` given, treats `range.min` as `start` (as above)
and `range.size` as `length` (as above):

    a = ['a', 'b', 'c', 'd']
    a.slice!(1..2) # => ["b", "c"]
    a              # => ["a", "d"]

If `range.start == a.size`, returns a new empty array:

    a = ['a', 'b', 'c', 'd']
    a.slice!(4..5) # => []

If `range.start` is larger than the array size, returns `nil`:

    a = ['a', 'b', 'c', 'd']
      a.slice!(5..6) # => nil

If `range.start` is negative, calculates the start index by counting backwards
from the end of `self`:

    a = ['a', 'b', 'c', 'd']
    a.slice!(-2..2) # => ["c"]

If `range.end` is negative, calculates the end index by counting backwards
from the end of `self`:

    a = ['a', 'b', 'c', 'd']
    a.slice!(0..-2) # => ["a", "b", "c"]

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

**@overload** [] 

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
Returns a new array containing the elements of `self`, sorted.

With no block given, compares elements using operator `#<=>` (see Object#<=>):

    [0, 2, 3, 1].sort # => [0, 1, 2, 3]

With a block given, calls the block with each combination of pairs of elements
from `self`; for each pair `a` and `b`, the block should return a numeric:

*   Negative when `b` is to follow `a`.
*   Zero when `a` and `b` are equivalent.
*   Positive when `a` is to follow `b`.

Example:

    a = [3, 2, 0, 1]
    a.sort {|a, b| a <=> b } # => [0, 1, 2, 3]
    a.sort {|a, b| b <=> a } # => [3, 2, 1, 0]

When the block returns zero, the order for `a` and `b` is indeterminate, and
may be unstable.

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

## sort!() [](#method-i-sort!)
Like Array#sort, but returns `self` with its elements sorted in place.

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

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

## sort_by!() [](#method-i-sort_by!)
With a block given, sorts the elements of `self` in place; returns self.

Calls the block with each successive element; sorts elements based on the
values returned from the block:

    a = ['aaaa', 'bbb', 'cc', 'd']
    a.sort_by! {|element| element.size }
    a # => ["d", "cc", "bbb", "aaaa"]

For duplicate values returned by the block, the ordering is indeterminate, and
may be unstable.

With no block given, returns a new Enumerator.

Related: see [Methods for Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

**@overload** [] 

## sum(*args) [](#method-i-sum)
With no block given, returns the sum of `init` and all elements of `self`;
    for array +array+ and value +init+, equivalent to:

      sum = init
      array.each {|element| sum += element }
      sum

    For example, <tt>[e0, e1, e2].sum</tt> returns <tt>init + e0 + e1 + e2</tt>.

    Examples:

      [0, 1, 2, 3].sum                 # => 6
      [0, 1, 2, 3].sum(100)            # => 106
      ['abc', 'def', 'ghi'].sum('jkl') # => "jklabcdefghi"
      [[:foo, :bar], ['foo', 'bar']].sum([2, 3])
      # => [2, 3, :foo, :bar, "foo", "bar"]

    The +init+ value and elements need not be numeric, but must all be <tt>+</tt>-compatible:

      # Raises TypeError: Array can't be coerced into Integer.
      [[:foo, :bar], ['foo', 'bar']].sum(2)

    With a block given, calls the block with each element of +self+;
    the block's return value (instead of the element itself) is used as the addend:

      ['zero', 1, :two].sum('Coerced and concatenated: ') {|element| element.to_s }
      # => "Coerced and concatenated: zero1two"

    Notes:

    - Array#join and Array#flatten may be faster than Array#sum
      for an array of strings or an array of arrays.
    - Array#sum method may not respect method redefinition of "+" methods such as Integer#+.

**@overload** [] 

**@overload** [] 

## take(n) [](#method-i-take)
Returns a new array containing the first `count` element of `self` (as
available); `count` must be a non-negative numeric; does not modify `self`:

    a = ['a', 'b', 'c', 'd']
    a.take(2)   # => ["a", "b"]
    a.take(2.1) # => ["a", "b"]
    a.take(50)  # => ["a", "b", "c", "d"]
    a.take(0)   # => []

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

## take_while() [](#method-i-take_while)
With a block given, calls the block with each successive element of `self`;
stops iterating if the block returns `false` or `nil`; returns a new array
containing those elements for which the block returned a truthy value:

    a = [0, 1, 2, 3, 4, 5]
    a.take_while {|element| element < 3 } # => [0, 1, 2]
    a.take_while {|element| true }        # => [0, 1, 2, 3, 4, 5]
    a.take_while {|element| false }       # => []

With no block given, returns a new Enumerator.

Does not modify `self`.

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

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
When `self` is an instance of `Array`, returns `self`.

Otherwise, returns a new array containing the elements of `self`:

    class MyArray < Array; end
    my_a = MyArray.new(['foo', 'bar', 'two'])
    a = my_a.to_a
    a # => ["foo", "bar", "two"]
    a.class # => Array # Not MyArray.

Related: see [Methods for Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

## to_ary() [](#method-i-to_ary)
Returns `self`.

**@overload** [] 

## to_h() [](#method-i-to_h)
Returns a new hash formed from `self`.

With no block given, each element of `self` must be a 2-element sub-array;
forms each sub-array into a key-value pair in the new hash:

    a = [['foo', 'zero'], ['bar', 'one'], ['baz', 'two']]
    a.to_h # => {"foo"=>"zero", "bar"=>"one", "baz"=>"two"}
    [].to_h # => {}

With a block given, the block must return a 2-element array; calls the block
with each element of `self`; forms each returned array into a key-value pair
in the returned hash:

    a = ['foo', :bar, 1, [2, 3], {baz: 4}]
    a.to_h {|element| [element, element.class] }
    # => {"foo"=>String, :bar=>Symbol, 1=>Integer, [2, 3]=>Array, {:baz=>4}=>Hash}

Related: see [Methods for Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

**@overload** [] 

## to_set(klassSet, *args, &block) [](#method-i-to_set)
Makes a set from the enumerable object with given arguments.

## transpose() [](#method-i-transpose)
Returns a new array that is `self` as a [transposed
matrix](https://en.wikipedia.org/wiki/Transpose):

    a = [[:a0, :a1], [:b0, :b1], [:c0, :c1]]
    a.transpose # => [[:a0, :b0, :c0], [:a1, :b1, :c1]]

The elements of `self` must all be the same size.

Related: see [Methods for Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

## union(*args) [](#method-i-union)
Returns a new array that is the union of the elements of `self` and all given
arrays `other_arrays`; items are compared using `eql?`:

    [0, 1, 2, 3].union([4, 5], [6, 7]) # => [0, 1, 2, 3, 4, 5, 6, 7]

Removes duplicates (preserving the first found):

    [0, 1, 1].union([2, 1], [3, 1]) # => [0, 1, 2, 3]

Preserves order (preserving the position of the first found):

    [3, 2, 1, 0].union([5, 3], [4, 2]) # => [3, 2, 1, 0, 5, 4]

With no arguments given, returns a copy of `self`.

Related: see [Methods for Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

## uniq() [](#method-i-uniq)
Returns a new array containing those elements from `self` that are not
duplicates, the first occurrence always being retained.

With no block given, identifies and omits duplicate elements using method
`eql?` to compare elements:

    a = [0, 0, 1, 1, 2, 2]
    a.uniq # => [0, 1, 2]

With a block given, calls the block for each element; identifies and omits
"duplicate" elements using method `eql?` to compare *block return values*;
that is, an element is a duplicate if its block return value is the same as
that of a previous element:

    a = ['a', 'aa', 'aaa', 'b', 'bb', 'bbb']
    a.uniq {|element| element.size } # => ["a", "aa", "aaa"]

Related: [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

**@overload** [] 

## uniq!() [](#method-i-uniq!)
Removes duplicate elements from `self`, the first occurrence always being
retained; returns `self` if any elements removed, `nil` otherwise.

With no block given, identifies and removes elements using method `eql?` to
compare elements:

    a = [0, 0, 1, 1, 2, 2]
    a.uniq! # => [0, 1, 2]
    a.uniq! # => nil

With a block given, calls the block for each element; identifies and omits
"duplicate" elements using method `eql?` to compare *block return values*;
that is, an element is a duplicate if its block return value is the same as
that of a previous element:

    a = ['a', 'aa', 'aaa', 'b', 'bb', 'bbb']
    a.uniq! {|element| element.size } # => ["a", "aa", "aaa"]
    a.uniq! {|element| element.size } # => nil

Related: see [Methods for Deleting](rdoc-ref:Array@Methods+for+Deleting).

**@overload** [] 

**@overload** [] 

## unshift(*args) [](#method-i-unshift)
Prepends the given `objects` to `self`:

    a = [:foo, 'bar', 2]
    a.unshift(:bam, :bat) # => [:bam, :bat, :foo, "bar", 2]

Related: Array#shift; see also [Methods for
Assigning](rdoc-ref:Array@Methods+for+Assigning).

**@overload** [] 

**@overload** [] 

## values_at(*args) [](#method-i-values_at)
Returns elements from `self` in a new array; does not modify `self`.

The objects included in the returned array are the elements of `self` selected
by the given `specifiers`, each of which must be a numeric index or a Range.

In brief:

    a = ['a', 'b', 'c', 'd']

    # Index specifiers.
    a.values_at(2, 0, 2, 0)     # => ["c", "a", "c", "a"] # May repeat.
    a.values_at(-4, -3, -2, -1) # => ["a", "b", "c", "d"] # Counts backwards if negative.
    a.values_at(-50, 50)        # => [nil, nil]           # Outside of self.

    # Range specifiers.
    a.values_at(1..3)       # => ["b", "c", "d"] # From range.begin to range.end.
    a.values_at(1...3)      # => ["b", "c"]      # End excluded.
    a.values_at(3..1)       # => []              # No such elements.

    a.values_at(-3..3)  # => ["b", "c", "d"]     # Negative range.begin counts backwards.
    a.values_at(-50..3)                          # Raises RangeError.

    a.values_at(1..-2)  # => ["b", "c"]          # Negative range.end counts backwards.
    a.values_at(1..-50) # => []                  # No such elements.

    # Mixture of specifiers.
    a.values_at(2..3, 3, 0..1, 0) # => ["c", "d", "d", "a", "b", "a"]

With no `specifiers` given, returns a new empty array:

    a = ['a', 'b', 'c', 'd']
    a.values_at # => []

For each numeric specifier `index`, includes an element:

*   For each non-negative numeric specifier `index` that is in-range (less
    than `self.size`), includes the element at offset `index`:

        a.values_at(0, 2)     # => ["a", "c"]
        a.values_at(0.1, 2.9) # => ["a", "c"]

*   For each negative numeric `index` that is in-range (greater than or equal
    to `- self.size`), counts backwards from the end of `self`:

        a.values_at(-1, -4) # => ["d", "a"]

The given indexes may be in any order, and may repeat:

    a.values_at(2, 0, 1, 0, 2) # => ["c", "a", "b", "a", "c"]

For each `index` that is out-of-range, includes `nil`:

    a.values_at(4, -5) # => [nil, nil]

For each Range specifier `range`, includes elements according to `range.begin`
and `range.end`:

*   If both `range.begin` and `range.end` are non-negative and in-range (less
    than `self.size`), includes elements from index `range.begin` through
    `range.end - 1` (if `range.exclude_end?`), or through `range.end`
    (otherwise):

        a.values_at(1..2)  # => ["b", "c"]
        a.values_at(1...2) # => ["b"]

*   If `range.begin` is negative and in-range (greater than or equal to `-
    self.size`), counts backwards from the end of `self`:

        a.values_at(-2..3) # => ["c", "d"]

*   If `range.begin` is negative and out-of-range, raises an exception:

        a.values_at(-5..3) # Raises RangeError.

*   If `range.end` is positive and out-of-range, extends the returned array
    with `nil` elements:

        a.values_at(1..5) # => ["b", "c", "d", nil, nil]

*   If `range.end` is negative and in-range, counts backwards from the end of
    `self`:

        a.values_at(1..-2) # => ["b", "c"]

*   If `range.end` is negative and out-of-range, returns an empty array:

        a.values_at(1..-5) # => []

The given ranges may be in any order and may repeat:

    a.values_at(2..3, 0..1, 2..3) # => ["c", "d", "a", "b", "c", "d"]

The given specifiers may be any mixture of indexes and ranges:

    a.values_at(3, 1..2, 0, 2..3) # => ["d", "b", "c", "a", "c", "d"]

Related: see [Methods for Fetching](rdoc-ref:Array@Methods+for+Fetching).

**@overload** [] 

## zip(*args) [](#method-i-zip)
With no block given, combines `self` with the collection of `other_arrays`;
returns a new array of sub-arrays:

    [0, 1].zip(['zero', 'one'], [:zero, :one])
    # => [[0, "zero", :zero], [1, "one", :one]]

Returned:

*   The outer array is of size `self.size`.
*   Each sub-array is of size `other_arrays.size + 1`.
*   The *nth* sub-array contains (in order):

    *   The *nth* element of `self`.
    *   The *nth* element of each of the other arrays, as available.

Example:

    a = [0, 1]
    zipped = a.zip(['zero', 'one'], [:zero, :one])
    # => [[0, "zero", :zero], [1, "one", :one]]
    zipped.size       # => 2 # Same size as a.
    zipped.first.size # => 3 # Size of other arrays plus 1.

When the other arrays are all the same size as `self`, the returned sub-arrays
are a rearrangement containing exactly elements of all the arrays (including
`self`), with no omissions or additions:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2, :b3]
    c = [:c0, :c1, :c2, :c3]
    d = a.zip(b, c)
    pp d
    # =>
    [[:a0, :b0, :c0],
     [:a1, :b1, :c1],
     [:a2, :b2, :c2],
     [:a3, :b3, :c3]]

When one of the other arrays is smaller than `self`, pads the corresponding
sub-array with `nil` elements:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2]
    c = [:c0, :c1]
    d = a.zip(b, c)
    pp d
    # =>
    [[:a0, :b0, :c0],
     [:a1, :b1, :c1],
     [:a2, :b2, nil],
     [:a3, nil, nil]]

When one of the other arrays is larger than `self`, *ignores* its trailing
elements:

    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2, :b3, :b4]
    c = [:c0, :c1, :c2, :c3, :c4, :c5]
    d = a.zip(b, c)
    pp d
    # =>
    [[:a0, :b0, :c0],
     [:a1, :b1, :c1],
     [:a2, :b2, :c2],
     [:a3, :b3, :c3]]

With a block given, calls the block with each of the other arrays; returns
`nil`:

    d = []
    a = [:a0, :a1, :a2, :a3]
    b = [:b0, :b1, :b2, :b3]
    c = [:c0, :c1, :c2, :c3]
    a.zip(b, c) {|sub_array| d.push(sub_array.reverse) } # => nil
    pp d
    # =>
    [[:c0, :b0, :a0],
     [:c1, :b1, :a1],
     [:c2, :b2, :a2],
     [:c3, :b3, :a3]]

For an **object** in **other_arrays** that is not actually an array, forms the
the "other array" as `object.to_ary`, if defined, or as `object.each.to_a`
otherwise.

Related: see [Methods for Converting](rdoc-ref:Array@Methods+for+Converting).

**@overload** [] 

**@overload** [] 

## |(ary2) [](#method-i-|)
Returns the union of `self` and `other_array`; duplicates are removed; order
is preserved; items are compared using `eql?`:

    [0, 1] | [2, 3] # => [0, 1, 2, 3]
    [0, 1, 1] | [2, 2, 3] # => [0, 1, 2, 3]
    [0, 1, 2] | [3, 2, 1, 0] # => [0, 1, 2, 3]

Related: see [Methods for Combining](rdoc-ref:Array@Methods+for+Combining).

**@overload** [] 

