# Class: Enumerator::Lazy
**Inherits:** Enumerator
    

Enumerator::Lazy is a special type of Enumerator, that allows constructing
chains of operations without evaluating them immediately, and evaluating
values on as-needed basis. In order to do so it redefines most of Enumerable
methods so that they just construct another lazy enumerator.

Enumerator::Lazy can be constructed from any Enumerable with the
Enumerable#lazy method.

    lazy = (1..Float::INFINITY).lazy.select(&:odd?).drop(10).take_while { |i| i < 30 }
    # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator::Lazy: 1..Infinity>:select>:drop(10)>:take_while>

The real enumeration is performed when any non-redefined Enumerable method is
called, like Enumerable#first or Enumerable#to_a (the latter is aliased as
#force for more semantic code):

    lazy.first(2)
    #=> [21, 23]

    lazy.force
    #=> [21, 23, 25, 27, 29]

Note that most Enumerable methods that could be called with or without a
block, on Enumerator::Lazy will always require a block:

    [1, 2, 3].map       #=> #<Enumerator: [1, 2, 3]:map>
    [1, 2, 3].lazy.map  # ArgumentError: tried to call lazy map without a block

This class allows idiomatic calculations on long or infinite sequences, as
well as chaining of calculations without constructing intermediate arrays.

Example for working with a slowly calculated sequence:

    require 'open-uri'

    # This will fetch all URLs before selecting
    # necessary data
    URLS.map { |u| JSON.parse(URI.open(u).read) }
      .select { |data| data.key?('stats') }
      .first(5)

    # This will fetch URLs one-by-one, only till
    # there is enough data to satisfy the condition
    URLS.lazy.map { |u| JSON.parse(URI.open(u).read) }
      .select { |data| data.key?('stats') }
      .first(5)

Ending a chain with ".eager" generates a non-lazy enumerator, which is
suitable for returning or passing to another method that expects a normal
enumerator.

    def active_items
      groups
        .lazy
        .flat_map(&:items)
        .reject(&:disabled)
        .eager
    end

    # This works lazily; if a checked item is found, it stops
    # iteration and does not look into remaining groups.
    first_checked = active_items.find(&:checked)

    # This returns an array of items like a normal enumerator does.
    all_checked = active_items.select(&:checked)



#Instance Methods
## chunk() [](#method-i-chunk)
Like Enumerable#chunk, but chains operation to be lazy-evaluated.

**@overload** [] 

## chunk_while() [](#method-i-chunk_while)
Like Enumerable#chunk_while, but chains operation to be lazy-evaluated.

**@overload** [] 

## collect() [](#method-i-collect)
Like Enumerable#map, but chains operation to be lazy-evaluated.

    (1..Float::INFINITY).lazy.map {|i| i**2 }
    #=> #<Enumerator::Lazy: #<Enumerator::Lazy: 1..Infinity>:map>
    (1..Float::INFINITY).lazy.map {|i| i**2 }.first(3)
    #=> [1, 4, 9]

**@overload** [] 

**@overload** [] 

## collect_concat() [](#method-i-collect_concat)
Returns a new lazy enumerator with the concatenated results of running `block`
once for every element in the lazy enumerator.

    ["foo", "bar"].lazy.flat_map {|i| i.each_char.lazy}.force
    #=> ["f", "o", "o", "b", "a", "r"]

A value `x` returned by `block` is decomposed if either of the following
conditions is true:

*   `x` responds to both each and force, which means that `x` is a lazy
    enumerator.
*   `x` is an array or responds to to_ary.

Otherwise, `x` is contained as-is in the return value.

    [{a:1}, {b:2}].lazy.flat_map {|i| i}.force
    #=> [{:a=>1}, {:b=>2}]

**@overload** [] 

**@overload** [] 

## compact() [](#method-i-compact)
Like Enumerable#compact, but chains operation to be lazy-evaluated.

**@overload** [] 

## drop(n) [](#method-i-drop)
Like Enumerable#drop, but chains operation to be lazy-evaluated.

**@overload** [] 

## drop_while() [](#method-i-drop_while)
Like Enumerable#drop_while, but chains operation to be lazy-evaluated.

**@overload** [] 

## eager() [](#method-i-eager)
Returns a non-lazy Enumerator converted from the lazy enumerator.

**@overload** [] 

## enum_for(*args) [](#method-i-enum_for)
Similar to Object#to_enum, except it returns a lazy enumerator. This makes it
easy to define Enumerable methods that will naturally remain lazy if called
from a lazy enumerator.

For example, continuing from the example in Object#to_enum:

    # See Object#to_enum for the definition of repeat
    r = 1..Float::INFINITY
    r.repeat(2).first(5) # => [1, 1, 2, 2, 3]
    r.repeat(2).class # => Enumerator
    r.repeat(2).map{|n| n ** 2}.first(5) # => endless loop!
    # works naturally on lazy enumerator:
    r.lazy.repeat(2).class # => Enumerator::Lazy
    r.lazy.repeat(2).map{|n| n ** 2}.first(5) # => [1, 1, 4, 4, 9]

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## filter() [](#method-i-filter)
Like Enumerable#select, but chains operation to be lazy-evaluated.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## filter_map() [](#method-i-filter_map)
Like Enumerable#filter_map, but chains operation to be lazy-evaluated.

    (1..).lazy.filter_map { |i| i * 2 if i.even? }.first(5)
    #=> [4, 8, 12, 16, 20]

**@overload** [] 

## find_all() [](#method-i-find_all)
Like Enumerable#select, but chains operation to be lazy-evaluated.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## flat_map() [](#method-i-flat_map)
Returns a new lazy enumerator with the concatenated results of running `block`
once for every element in the lazy enumerator.

    ["foo", "bar"].lazy.flat_map {|i| i.each_char.lazy}.force
    #=> ["f", "o", "o", "b", "a", "r"]

A value `x` returned by `block` is decomposed if either of the following
conditions is true:

*   `x` responds to both each and force, which means that `x` is a lazy
    enumerator.
*   `x` is an array or responds to to_ary.

Otherwise, `x` is contained as-is in the return value.

    [{a:1}, {b:2}].lazy.flat_map {|i| i}.force
    #=> [{:a=>1}, {:b=>2}]

**@overload** [] 

**@overload** [] 

## grep(pattern) [](#method-i-grep)
Like Enumerable#grep, but chains operation to be lazy-evaluated.

**@overload** [] 

**@overload** [] 

## grep_v(pattern) [](#method-i-grep_v)
Like Enumerable#grep_v, but chains operation to be lazy-evaluated.

**@overload** [] 

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
Creates a new Lazy enumerator. When the enumerator is actually enumerated
(e.g. by calling #force), `obj` will be enumerated and each value passed to
the given block. The block can yield values back using `yielder`. For example,
to create a "filter+map" enumerator:

    def filter_map(sequence)
      Lazy.new(sequence) do |yielder, *values|
        result = yield *values
        yielder << result if result
      end
    end

    filter_map(1..Float::INFINITY) {|i| i*i if i.even?}.first(5)
    #=> [4, 16, 36, 64, 100]

**@overload** [] 

## lazy() [](#method-i-lazy)
Returns self.

**@overload** [] 

## map() [](#method-i-map)
Like Enumerable#map, but chains operation to be lazy-evaluated.

    (1..Float::INFINITY).lazy.map {|i| i**2 }
    #=> #<Enumerator::Lazy: #<Enumerator::Lazy: 1..Infinity>:map>
    (1..Float::INFINITY).lazy.map {|i| i**2 }.first(3)
    #=> [1, 4, 9]

**@overload** [] 

**@overload** [] 

## reject() [](#method-i-reject)
Like Enumerable#reject, but chains operation to be lazy-evaluated.

**@overload** [] 

## select() [](#method-i-select)
Like Enumerable#select, but chains operation to be lazy-evaluated.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## slice_after() [](#method-i-slice_after)
Like Enumerable#slice_after, but chains operation to be lazy-evaluated.

**@overload** [] 

**@overload** [] 

## slice_before() [](#method-i-slice_before)
Like Enumerable#slice_before, but chains operation to be lazy-evaluated.

**@overload** [] 

**@overload** [] 

## slice_when() [](#method-i-slice_when)
Like Enumerable#slice_when, but chains operation to be lazy-evaluated.

**@overload** [] 

## take(n) [](#method-i-take)
Like Enumerable#take, but chains operation to be lazy-evaluated.

**@overload** [] 

## take_while() [](#method-i-take_while)
Like Enumerable#take_while, but chains operation to be lazy-evaluated.

**@overload** [] 

## to_a() [](#method-i-to_a)
Expands `lazy` enumerator to an array. See Enumerable#to_a.

**@overload** [] 

**@overload** [] 

## to_enum(*args) [](#method-i-to_enum)
Similar to Object#to_enum, except it returns a lazy enumerator. This makes it
easy to define Enumerable methods that will naturally remain lazy if called
from a lazy enumerator.

For example, continuing from the example in Object#to_enum:

    # See Object#to_enum for the definition of repeat
    r = 1..Float::INFINITY
    r.repeat(2).first(5) # => [1, 1, 2, 2, 3]
    r.repeat(2).class # => Enumerator
    r.repeat(2).map{|n| n ** 2}.first(5) # => endless loop!
    # works naturally on lazy enumerator:
    r.lazy.repeat(2).class # => Enumerator::Lazy
    r.lazy.repeat(2).map{|n| n ** 2}.first(5) # => [1, 1, 4, 4, 9]

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## uniq() [](#method-i-uniq)
Like Enumerable#uniq, but chains operation to be lazy-evaluated.

**@overload** [] 

**@overload** [] 

## with_index(*args) [](#method-i-with_index)
If a block is given, returns a lazy enumerator that will iterate over the
given block for each element with an index, which starts from `offset`, and
returns a lazy enumerator that yields the same values (without the index).

If a block is not given, returns a new lazy enumerator that includes the
index, starting from `offset`.

`offset`
:   the starting index to use


See Enumerator#with_index.

**@overload** [] 

**@overload** [] 

## zip(*args) [](#method-i-zip)
Like Enumerable#zip, but chains operation to be lazy-evaluated. However, if a
block is given to zip, values are enumerated immediately.

**@overload** [] 

**@overload** [] 

