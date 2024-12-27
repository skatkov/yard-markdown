# Class: Gem::Specification
**Inherits:** Gem::BasicSpecification
  
**Extended by:** Enumerable, Gem::Deprecate, Gem::Specification::RequirePathFlattener
    
**Includes:** Bundler::MatchMetadata, Bundler::MatchPlatform, Gem::Specification::AllowSettingSource
  

The Specification class contains the information for a gem.  Typically defined
in a .gemspec file or a Rakefile, and looks like this:

    Gem::Specification.new do |s|
      s.name        = 'example'
      s.version     = '0.1.0'
      s.licenses    = ['MIT']
      s.summary     = "This is an example!"
      s.description = "Much longer explanation of the example!"
      s.authors     = ["Ruby Coder"]
      s.email       = 'rubycoder@example.com'
      s.files       = ["lib/example.rb"]
      s.homepage    = 'https://rubygems.org/gems/example'
      s.metadata    = { "source_code_uri" => "https://github.com/example/example" }
    end

Starting in RubyGems 2.0, a Specification can hold arbitrary metadata.  See
#metadata for restrictions on the format and size of metadata items you may
add to a specification.


# Class Methods
## _all() [](#method-c-_all)
:nodoc:
## _latest_specs(specs , prerelease false) [](#method-c-_latest_specs)
:nodoc:
## _load(str ) [](#method-c-_load)
Load custom marshal format, re-initializing defaults as needed
## _resort!(specs ) [](#method-c-_resort!)
:nodoc:
## add_spec(spec ) [](#method-c-add_spec)
Adds `spec` to the known specifications, keeping the collection properly
sorted.
## all() [](#method-c-all)
Returns all specifications. This method is discouraged from use. You probably
want to use one of the Enumerable methods instead.
## all=(specs ) [](#method-c-all=)
Sets the known specs to `specs`.
## all?(*args ) [](#method-c-all?)
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

## all_names() [](#method-c-all_names)
Return full names of all specs in sorted order.
## any?(*args ) [](#method-c-any?)
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

## array_attributes() [](#method-c-array_attributes)
Return the list of all array-oriented instance variables. -- Not sure why we
need to use so much stupid reflection in here...
## attribute_names() [](#method-c-attribute_names)
Return the list of all instance variables. -- Not sure why we need to use so
much stupid reflection in here...
## chain(*args ) [](#method-c-chain)
Returns an enumerator object generated from this enumerator and given
enumerables.

    e = (1..3).chain([4, 5])
    e.to_a #=> [1, 2, 3, 4, 5]
**@overload** [] 

## chunk() [](#method-c-chunk)
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

## chunk_while() [](#method-c-chunk_while)
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

## collect() [](#method-c-collect)
Returns an array of objects returned by the block.

With a block given, calls the block with successive elements; returns an array
of the objects returned by the block:

    (0..4).map {|i| i*i }                               # => [0, 1, 4, 9, 16]
    {foo: 0, bar: 1, baz: 2}.map {|key, value| value*2} # => [0, 2, 4]

With no block given, returns an Enumerator.
**@overload** [] 

**@overload** [] 

## collect_concat() [](#method-c-collect_concat)
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

## compact() [](#method-c-compact)
Returns an array of all non-`nil` elements:

    a = [nil, 0, nil, 'a', false, nil, false, nil, 'a', nil, 0, nil]
    a.compact # => [0, "a", false, false, "a", 0]
**@overload** [] 

## count(*args ) [](#method-c-count)
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

## cycle(*args ) [](#method-c-cycle)
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

## default_stubs(pattern "*.gemspec") [](#method-c-default_stubs)
Returns a Gem::StubSpecification for default gems
## deprecate(name , repl , year , month ) [](#method-c-deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the year/month that it is planned to go away.
## detect(*args ) [](#method-c-detect)
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

## dirs() [](#method-c-dirs)
Return the directories that Specification uses to find specs.
## dirs=(dirs ) [](#method-c-dirs=)
Set the directories that Specification uses to find specs. Setting this resets
the list of known specs.
## drop(n ) [](#method-c-drop)
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

## drop_while() [](#method-c-drop_while)
Calls the block with successive elements as long as the block returns a truthy
value; returns an array of all elements after that point:

    (1..4).drop_while{|i| i < 3 } # => [3, 4]
    h = {foo: 0, bar: 1, baz: 2}
    a = h.drop_while{|element| key, value = *element; value < 2 }
    a # => [[:baz, 2]]

With no block given, returns an Enumerator.
**@overload** [] 

**@overload** [] 

## each(&block ) [](#method-c-each)
Enumerate every known spec.  See ::dirs= and ::add_spec to set the list of
specs.
## each_cons(n ) [](#method-c-each_cons)
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

## each_entry(*args ) [](#method-c-each_entry)
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

## each_gemspec(dirs ) [](#method-c-each_gemspec)
:nodoc:
## each_slice(n ) [](#method-c-each_slice)
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

## each_spec(dirs ) [](#method-c-each_spec)
:nodoc:
## each_with_index(*args ) [](#method-c-each_with_index)
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

## each_with_object(memo ) [](#method-c-each_with_object)
Calls the block once for each element, passing both the element and the given
object:

    (1..4).each_with_object([]) {|i, a| a.push(i**2) }
    # => [1, 4, 9, 16]

    {foo: 0, bar: 1, baz: 2}.each_with_object({}) {|(k, v), h| h[v] = k }
    # => {0=>:foo, 1=>:bar, 2=>:baz}

With no block given, returns an Enumerator.
**@overload** [] 

**@overload** [] 

## entries(*args ) [](#method-c-entries)
Returns an array containing the items in `self`:

    (0..4).to_a # => [0, 1, 2, 3, 4]
**@overload** [] 

## filter() [](#method-c-filter)
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

## filter_map() [](#method-c-filter_map)
Returns an array containing truthy elements returned by the block.

With a block given, calls the block with successive elements; returns an array
containing each truthy value returned by the block:

    (0..9).filter_map {|i| i * 2 if i.even? }                              # => [0, 4, 8, 12, 16]
    {foo: 0, bar: 1, baz: 2}.filter_map {|key, value| key if value.even? } # => [:foo, :baz]

When no block given, returns an Enumerator.
**@overload** [] 

**@overload** [] 

## find(*args ) [](#method-c-find)
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

## find_active_stub_by_path(path ) [](#method-c-find_active_stub_by_path)
Return the best specification that contains the file matching `path`, among
those already activated.
## find_all() [](#method-c-find_all)
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

## find_all_by_full_name(full_name ) [](#method-c-find_all_by_full_name)
Returns every spec that has the given `full_name`
## find_all_by_name(name , *requirements ) [](#method-c-find_all_by_name)
Returns every spec that matches `name` and optional `requirements`.
## find_by_full_name(full_name ) [](#method-c-find_by_full_name)
Find the best specification matching a `full_name`.
## find_by_name(name , *requirements ) [](#method-c-find_by_name)
Find the best specification matching a `name` and `requirements`. Raises if
the dependency doesn't resolve to a valid specification.
## find_by_path(path ) [](#method-c-find_by_path)
Return the best specification that contains the file matching `path`.
## find_in_unresolved(path ) [](#method-c-find_in_unresolved)
Return currently unresolved specs that contain the file matching `path`.
## find_in_unresolved_tree(path ) [](#method-c-find_in_unresolved_tree)
Search through all unresolved deps and sub-dependencies and return specs that
contain the file matching `path`.
## find_inactive_by_path(path ) [](#method-c-find_inactive_by_path)
Return the best specification that contains the file matching `path` amongst
the specs that are not activated.
## find_index(*args ) [](#method-c-find_index)
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

## first(*args ) [](#method-c-first)
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

## flat_map() [](#method-c-flat_map)
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

## from_yaml(input ) [](#method-c-from_yaml)
Special loader for YAML files.  When a Specification object is loaded from a
YAML file, it bypasses the normal Ruby object initialization routine
(#initialize).  This method makes up for that and deals with gems of different
ages.

`input` can be anything that YAML.load() accepts: String or IO.
## gemspec_stubs_in(dir , pattern ) [](#method-c-gemspec_stubs_in)
:nodoc:
## grep(pat ) [](#method-c-grep)
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

## grep_v(pat ) [](#method-c-grep_v)
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

## group_by() [](#method-c-group_by)
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

## include?(val ) [](#method-c-include?)
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

## inject(*args ) [](#method-c-inject)
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

## latest_spec_for(name ) [](#method-c-latest_spec_for)
Return the latest installed spec for gem `name`.
## latest_specs(prerelease false) [](#method-c-latest_specs)
Return the latest specs, optionally including prerelease specs if `prerelease`
is true.
## lazy() [](#method-c-lazy)
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

## load(file ) [](#method-c-load)
Loads Ruby format gemspec from `file`.
## load_defaults() [](#method-c-load_defaults)
Loads the default specifications. It should be called only once.
## map() [](#method-c-map)
Returns an array of objects returned by the block.

With a block given, calls the block with successive elements; returns an array
of the objects returned by the block:

    (0..4).map {|i| i*i }                               # => [0, 1, 4, 9, 16]
    {foo: 0, bar: 1, baz: 2}.map {|key, value| value*2} # => [0, 2, 4]

With no block given, returns an Enumerator.
**@overload** [] 

**@overload** [] 

## max(*args ) [](#method-c-max)
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

## max_by(*args ) [](#method-c-max_by)
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

## member?(val ) [](#method-c-member?)
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

## min(*args ) [](#method-c-min)
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

## min_by(*args ) [](#method-c-min_by)
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

## minmax() [](#method-c-minmax)
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

## minmax_by() [](#method-c-minmax_by)
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

## non_nil_attributes() [](#method-c-non_nil_attributes)
Specification attributes that must be non-nil
## none?(*args ) [](#method-c-none?)
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

## normalize_yaml_input(input ) [](#method-c-normalize_yaml_input)
Make sure the YAML specification is properly formatted with dashes
## one?(*args ) [](#method-c-one?)
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

## outdated() [](#method-c-outdated)
Return a list of all outdated local gem names.  This method is HEAVY as it
must go fetch specifications from the server.

Use outdated_and_latest_version if you wish to retrieve the latest remote
version as well.
## outdated_and_latest_version() [](#method-c-outdated_and_latest_version)
Enumerates the outdated local gems yielding the local specification and the
latest remote version.

This method may take some time to return as it must check each local gem
against the server's index.
## partition() [](#method-c-partition)
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

## reduce(*args ) [](#method-c-reduce)
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

## reject() [](#method-c-reject)
Returns an array of objects rejected by the block.

With a block given, calls the block with successive elements; returns an array
of those elements for which the block returns `nil` or `false`:

    (0..9).reject {|i| i * 2 if i.even? }                             # => [1, 3, 5, 7, 9]
    {foo: 0, bar: 1, baz: 2}.reject {|key, value| key if value.odd? } # => {:foo=>0, :baz=>2}

When no block given, returns an Enumerator.

Related: #select.
**@overload** [] 

**@overload** [] 

## remove_spec(spec ) [](#method-c-remove_spec)
Removes `spec` from the known specs.
## required_attribute?(name ) [](#method-c-required_attribute?)
Is `name` a required attribute?
**@return** [Boolean] 

## required_attributes() [](#method-c-required_attributes)
Required specification attributes
## reset() [](#method-c-reset)
Reset the list of known specs, running pre and post reset hooks registered in
Gem.
## reverse_each(*args ) [](#method-c-reverse_each)
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

## select() [](#method-c-select)
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

## slice_after(*args ) [](#method-c-slice_after)
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

## slice_before(*args ) [](#method-c-slice_before)
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

## slice_when() [](#method-c-slice_when)
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

## sort() [](#method-c-sort)
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

## sort_by() [](#method-c-sort_by)
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

## specification_record() [](#method-c-specification_record)
Keeps track of all currently known specifications
## stubs() [](#method-c-stubs)
Returns a Gem::StubSpecification for every installed gem
## stubs_for(name ) [](#method-c-stubs_for)
Returns a Gem::StubSpecification for installed gem named `name` only returns
stubs that match Gem.platforms
## stubs_for_pattern(pattern , match_platform true) [](#method-c-stubs_for_pattern)
Finds stub specifications matching a pattern from the standard locations,
optionally filtering out specs not matching the current platform
## sum(*args ) [](#method-c-sum)
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

## take(n ) [](#method-c-take)
For non-negative integer `n`, returns the first `n` elements:

    r = (1..4)
    r.take(2) # => [1, 2]
    r.take(0) # => []

    h = {foo: 0, bar: 1, baz: 2, bat: 3}
    h.take(2) # => [[:foo, 0], [:bar, 1]]
**@overload** [] 

## take_while() [](#method-c-take_while)
Calls the block with successive elements as long as the block returns a truthy
value; returns an array of all elements up to that point:

    (1..4).take_while{|i| i < 3 } # => [1, 2]
    h = {foo: 0, bar: 1, baz: 2}
    h.take_while{|element| key, value = *element; value < 2 }
    # => [[:foo, 0], [:bar, 1]]

With no block given, returns an Enumerator.
**@overload** [] 

**@overload** [] 

## tally(*args ) [](#method-c-tally)
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

## to_a(*args ) [](#method-c-to_a)
Returns an array containing the items in `self`:

    (0..4).to_a # => [0, 1, 2, 3, 4]
**@overload** [] 

## to_h(*args ) [](#method-c-to_h)
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

## to_set(klass Set, *args , &block ) [](#method-c-to_set)
Makes a set from the enumerable object with given arguments.
## uniq() [](#method-c-uniq)
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

## unresolved_deps() [](#method-c-unresolved_deps)
DOC: This method needs documented or nodoc'd
## zip(*args ) [](#method-c-zip)
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

# Attributes
## activated[RW] [](#attribute-i-activated)
True when this gemspec has been activated. This attribute is not persisted.

## autorequire[RW] [](#attribute-i-autorequire)
Autorequire was used by old RubyGems to automatically require a file.

Deprecated: It is neither supported nor functional.

## bindir[RW] [](#attribute-i-bindir)
The path in the gem for executable scripts.  Usually 'exe'

Usage:

    spec.bindir = 'exe'

## cert_chain[RW] [](#attribute-i-cert_chain)
The certificate chain used to sign this gem.  See Gem::Security for details.

## default_executable[RW] [](#attribute-i-default_executable)
The default executable for this gem.

Deprecated: The name of the gem is assumed to be the name of the executable
now.  See Gem.bin_path.

## description[RW] [](#attribute-i-description)
A long description of this gem

The description should be more detailed than the summary but not excessively
long.  A few paragraphs is a recommended length with no examples or
formatting.

Usage:

    spec.description = <<~EOF
      Rake is a Make-like program implemented in Ruby. Tasks and
      dependencies are specified in standard Ruby syntax.
    EOF

## email[RW] [](#attribute-i-email)
A contact email address (or addresses) for this gem

Usage:

    spec.email = 'john.jones@example.com'
    spec.email = ['jack@example.com', 'jill@example.com']

## homepage[RW] [](#attribute-i-homepage)
The URL of this gem's home page

Usage:

    spec.homepage = 'https://github.com/ruby/rake'

## metadata[RW] [](#attribute-i-metadata)
The metadata holds extra data for this gem that may be useful to other
consumers and is settable by gem authors.

Metadata items have the following restrictions:

*   The metadata must be a Hash object
*   All keys and values must be Strings
*   Keys can be a maximum of 128 bytes and values can be a maximum of 1024
    bytes
*   All strings must be UTF-8, no binary data is allowed

You can use metadata to specify links to your gem's homepage, codebase,
documentation, wiki, mailing list, issue tracker and changelog.

    s.metadata = {
      "bug_tracker_uri"   => "https://example.com/user/bestgemever/issues",
      "changelog_uri"     => "https://example.com/user/bestgemever/CHANGELOG.md",
      "documentation_uri" => "https://www.example.info/gems/bestgemever/0.0.1",
      "homepage_uri"      => "https://bestgemever.example.io",
      "mailing_list_uri"  => "https://groups.example.com/bestgemever",
      "source_code_uri"   => "https://example.com/user/bestgemever",
      "wiki_uri"          => "https://example.com/user/bestgemever/wiki",
      "funding_uri"       => "https://example.com/donate"
    }

These links will be used on your gem's page on rubygems.org and must pass
validation against following regex.

    %r{\Ahttps?:\/\/([^\s:@]+:[^\s:@]*@)?[A-Za-z\d\-]+(\.[A-Za-z\d\-]+)+\.?(:\d{1,5})?([\/?]\S*)?\z}

## name[RW] [](#attribute-i-name)
This gem's name.

Usage:

    spec.name = 'rake'

## original_platform[RW] [](#attribute-i-original_platform)
Cruft. Use `platform`.

## post_install_message[RW] [](#attribute-i-post_install_message)
A message that gets displayed after the gem is installed.

Usage:

    spec.post_install_message = "Thanks for installing!"

## relative_loaded_from[RW] [](#attribute-i-relative_loaded_from)
Returns the value of attribute relative_loaded_from.

## remote[RW] [](#attribute-i-remote)
Returns the value of attribute remote.

## required_ruby_version[RW] [](#attribute-i-required_ruby_version)
The version of Ruby required by this gem

Usage:

    spec.required_ruby_version = '>= 2.7.0'

## required_rubygems_version[RW] [](#attribute-i-required_rubygems_version)
The RubyGems version required by this gem

## rubygems_version[RW] [](#attribute-i-rubygems_version)
The version of RubyGems used to create this gem.

## signing_key[RW] [](#attribute-i-signing_key)
The key used to sign this gem.  See Gem::Security for details.

## specification_version[RW] [](#attribute-i-specification_version)
The Gem::Specification version of this gemspec.

Do not set this, it is set automatically when the gem is packaged.

## summary[RW] [](#attribute-i-summary)
A short summary of this gem's description.  Displayed in `gem list -d`.

The #description should be more detailed than the summary.

Usage:

    spec.summary = "This is a small summary of my gem"

## version[RW] [](#attribute-i-version)
This gem's version.

The version string can contain numbers and periods, such as `1.0.0`. A gem is
a 'prerelease' gem if the version has a letter in it, such as `1.0.0.pre`.

Usage:

    spec.version = '0.4.1'


#Instance Methods
## <=>(other) [](#method-i-<=>)
:nodoc:

## ==(other) [](#method-i-==)
:nodoc:

## _dump(limit) [](#method-i-_dump)
Dump only crucial instance variables. -- MAINTAIN ORDER! (down with the man)

## abbreviate() [](#method-i-abbreviate)
Abbreviate the spec for downloading.  Abbreviated specs are only used for
searching, downloading and related activities and do not need deployment
specific information (e.g. list of files).  So we abbreviate the spec, making
it much smaller for quicker downloads.

## activate() [](#method-i-activate)
Activate this spec, registering it as a loaded spec and adding it's lib paths
to $LOAD_PATH. Returns true if the spec was activated, false if it was
previously activated. Freaks out if there are conflicts upon activation.

## activate_dependencies() [](#method-i-activate_dependencies)
Activate all unambiguously resolved runtime dependencies of this spec. Add any
ambiguous dependencies to the unresolved list to be resolved later, as needed.

## add_bindir(executables) [](#method-i-add_bindir)
Returns an array with bindir attached to each executable in the `executables`
list

## add_dependency(gem, *requirements) [](#method-i-add_dependency)
Adds a runtime dependency named `gem` with `requirements` to this gem.

Usage:

    spec.add_dependency 'example', '~> 1.1', '>= 1.1.4'

## add_development_dependency(gem, *requirements) [](#method-i-add_development_dependency)
Adds a development dependency named `gem` with `requirements` to this gem.

Usage:

    spec.add_development_dependency 'example', '~> 1.1', '>= 1.1.4'

Development dependencies aren't installed by default and aren't activated when
a gem is required.

## add_self_to_load_path() [](#method-i-add_self_to_load_path)
Adds this spec's require paths to LOAD_PATH, in the proper location.

## author() [](#method-i-author)
Singular reader for #authors.  Returns the first author in the list

## author=(o) [](#method-i-author=)
Singular (alternative) writer for #authors

Usage:

    spec.author = 'John Jones'

## authors() [](#method-i-authors)
The list of author names who wrote this gem.

    spec.authors = ['Chad Fowler', 'Jim Weirich', 'Rich Kilmer']

## authors=(value) [](#method-i-authors=)
A list of authors for this gem.

Alternatively, a single author can be specified by assigning a string to
`spec.author`

Usage:

    spec.authors = ['John Jones', 'Mary Smith']

## base_dir() [](#method-i-base_dir)

## bin_dir() [](#method-i-bin_dir)
Returns the full path to installed gem's bin directory.

NOTE: do not confuse this with `bindir`, which is just 'bin', not a full path.

## bin_file(name) [](#method-i-bin_file)
Returns the full path to an executable named `name` in this gem.

## build_args() [](#method-i-build_args)
Returns the build_args used to install the gem

## build_extensions() [](#method-i-build_extensions)
Builds extensions for this platform if the gem has extensions listed and the
gem.build_complete file is missing.

## build_info_dir() [](#method-i-build_info_dir)
Returns the full path to the build info directory

## build_info_file() [](#method-i-build_info_file)
Returns the full path to the file containing the build information generated
when the gem was installed

## cache_dir() [](#method-i-cache_dir)
Returns the full path to the cache directory containing this spec's cached
gem.

## cache_file() [](#method-i-cache_file)
Returns the full path to the cached gem for this spec.

## conficts_when_loaded_with?(list_of_specs) [](#method-i-conficts_when_loaded_with?)
return true if there will be conflict when spec if loaded together with the
list of specs.

**@return** [Boolean] 

## conflicts() [](#method-i-conflicts)
Return any possible conflicts against the currently loaded specs.

## date() [](#method-i-date)
The date this gem was created.

If SOURCE_DATE_EPOCH is set as an environment variable, use that to support
reproducible builds; otherwise, default to the current UTC date.

Details on SOURCE_DATE_EPOCH:
https://reproducible-builds.org/specs/source-date-epoch/

## date=(date) [](#method-i-date=)
The date this gem was created

DO NOT set this, it is set automatically when the gem is packaged.

## default_value(name) [](#method-i-default_value)
The default value for specification attribute `name`

## deleted_gem?() [](#method-i-deleted_gem?)

**@return** [Boolean] 

## dependencies() [](#method-i-dependencies)
A list of Gem::Dependency objects this gem depends on.

Use #add_dependency or #add_development_dependency to add dependencies to a
gem.

## dependent_gems(check_devtrue) [](#method-i-dependent_gems)
Return a list of all gems that have a dependency on this gemspec.  The list is
structured with entries that conform to:

    [depending_gem, dependency, [list_of_gems_that_satisfy_dependency]]

## dependent_specs() [](#method-i-dependent_specs)
Returns all specs that matches this spec's runtime dependencies.

## development_dependencies() [](#method-i-development_dependencies)
List of dependencies that are used for development

## doc_dir(typenil) [](#method-i-doc_dir)
Returns the full path to this spec's documentation directory.  If `type` is
given it will be appended to the end.  For example:

    spec.doc_dir      # => "/path/to/gem_repo/doc/a-1"

    spec.doc_dir 'ri' # => "/path/to/gem_repo/doc/a-1/ri"

## encode_with(coder) [](#method-i-encode_with)
:nodoc:

## eql?(other) [](#method-i-eql?)
:nodoc:

**@return** [Boolean] 

## executable() [](#method-i-executable)
Singular accessor for #executables

## executable=(o) [](#method-i-executable=)
Singular accessor for #executables

## executables() [](#method-i-executables)
Executables included in the gem.

For example, the rake gem has rake as an executable. You don't specify the
full path (as in bin/rake); all application-style files are expected to be
found in bindir.  These files must be executable Ruby files.  Files that use
bash or other interpreters will not work.

Executables included may only be ruby scripts, not scripts for other languages
or compiled binaries.

Usage:

    spec.executables << 'rake'

## executables=(value) [](#method-i-executables=)
Sets executables to `value`, ensuring it is an array.

## extension_dir() [](#method-i-extension_dir)

## extensions() [](#method-i-extensions)
Extensions to build when installing the gem, specifically the paths to
extconf.rb-style files used to compile extensions.

These files will be run when the gem is installed, causing the C (or whatever)
code to be compiled on the user's machine.

Usage:

    spec.extensions << 'ext/rmagic/extconf.rb'

See Gem::Ext::Builder for information about writing extensions for gems.

## extensions=(extensions) [](#method-i-extensions=)
Sets extensions to `extensions`, ensuring it is an array.

## extensions_dir() [](#method-i-extensions_dir)
The path where this gem installs its extensions.

## extra_rdoc_files() [](#method-i-extra_rdoc_files)
Extra files to add to RDoc such as README or doc/examples.txt

When the user elects to generate the RDoc documentation for a gem (typically
at install time), all the library files are sent to RDoc for processing. This
option allows you to have some non-code files included for a more complete set
of documentation.

Usage:

    spec.extra_rdoc_files = ['README', 'doc/user-guide.txt']

## extra_rdoc_files=(files) [](#method-i-extra_rdoc_files=)
Sets extra_rdoc_files to `files`, ensuring it is an array.

## file_name() [](#method-i-file_name)
The default (generated) file name of the gem.  See also #spec_name.

    spec.file_name # => "example-1.0.gem"

## files() [](#method-i-files)
Files included in this gem.  You cannot append to this accessor, you must
assign to it.

Only add files you can require to this list, not directories, etc.

Directories are automatically stripped from this list when building a gem,
other non-files cause an error.

Usage:

    require 'rake'
    spec.files = FileList['lib/**/*.rb',
                          'bin/*',
                          '[A-Z]*'].to_a

    # or without Rake...
    spec.files = Dir['lib/**/*.rb'] + Dir['bin/*']
    spec.files += Dir['[A-Z]*']
    spec.files.reject! { |fn| fn.include? "CVS" }

## files=(files) [](#method-i-files=)
Sets files to `files`, ensuring it is an array.

## flatten_require_paths() [](#method-i-flatten_require_paths)
:nodoc:

## for_cache() [](#method-i-for_cache)
Creates a duplicate spec without large blobs that aren't used at runtime.

## full_gem_path() [](#method-i-full_gem_path)

## full_name() [](#method-i-full_name)

## gem_dir() [](#method-i-gem_dir)
Work around old bundler versions removing my methods Can be removed once
RubyGems can no longer install Bundler 2.5

## gems_dir() [](#method-i-gems_dir)

## git_version() [](#method-i-git_version)

## groups() [](#method-i-groups)

## has_conflicts?() [](#method-i-has_conflicts?)
Return true if there are possible conflicts against the currently loaded
specs.

**@return** [Boolean] 

## has_rdoc() [](#method-i-has_rdoc)
Deprecated and ignored, defaults to true.

Formerly used to indicate this gem was RDoc-capable.

## has_rdoc=(ignored) [](#method-i-has_rdoc=)
Deprecated and ignored.

Formerly used to indicate this gem was RDoc-capable.

## has_unit_tests?() [](#method-i-has_unit_tests?)
True if this gem has files in test_files

**@return** [Boolean] 

## hash() [](#method-i-hash)
:startdoc:

## init_with(coder) [](#method-i-init_with)
:nodoc:

## initialize(namenil, versionnil) [](#method-i-initialize)
Specification constructor. Assigns the default values to the attributes and
yields itself for further initialization.  Optionally takes `name` and
`version`.

**@return** [Specification] a new instance of Specification

**@yield** [_self] 

**@yieldparam** [Gem::Specification] the object that the method was called on

## initialize_copy(other_spec) [](#method-i-initialize_copy)
Duplicates Array and Gem::Requirement attributes from `other_spec` so state
isn't shared.

## insecurely_materialized?() [](#method-i-insecurely_materialized?)

**@return** [Boolean] 

## inspect() [](#method-i-inspect)
:nodoc:

## installed_by_version() [](#method-i-installed_by_version)
The version of RubyGems that installed this gem.  Returns
`Gem::Version.new(0)` for gems installed by versions earlier than RubyGems
2.2.0.

## installed_by_version=(version) [](#method-i-installed_by_version=)
Sets the version of RubyGems that installed this gem.  See also
#installed_by_version.

## internal_init() [](#method-i-internal_init)
:nodoc:

## keep_only_files_and_directories() [](#method-i-keep_only_files_and_directories)

## lib_files() [](#method-i-lib_files)
Files in the Gem under one of the require_paths

## license() [](#method-i-license)
Singular accessor for #licenses

## license=(o) [](#method-i-license=)
The license for this gem.

The license must be no more than 64 characters.

This should just be the name of your license. The full text of the license
should be inside of the gem (at the top level) when you build it.

The simplest way is to specify the standard SPDX ID https://spdx.org/licenses/
for the license. Ideally, you should pick one that is OSI (Open Source
Initiative) https://opensource.org/licenses/ approved.

The most commonly used OSI-approved licenses are MIT and Apache-2.0. GitHub
also provides a license picker at https://choosealicense.com/.

You can also use a custom license file along with your gemspec and specify a
LicenseRef-<idstring>, where idstring is the name of the file containing the
license text.

You should specify a license for your gem so that people know how they are
permitted to use it and any restrictions you're placing on it.  Not specifying
a license means all rights are reserved; others have no right to use the code
for any purpose.

You can set multiple licenses with #licenses=

Usage:
    spec.license = 'MIT'

## licenses() [](#method-i-licenses)
Plural accessor for setting licenses

See #license= for details

## licenses=(licenses) [](#method-i-licenses=)
The license(s) for the library.

Each license must be a short name, no more than 64 characters.

This should just be the name of your license. The full text of the license
should be inside of the gem when you build it.

See #license= for more discussion

Usage:
    spec.licenses = ['MIT', 'GPL-2.0']

## load_paths() [](#method-i-load_paths)

## loaded_from() [](#method-i-loaded_from)

## match_platform(p) [](#method-i-match_platform)

## matches_current_metadata?() [](#method-i-matches_current_metadata?)

**@return** [Boolean] 

## matches_current_ruby?() [](#method-i-matches_current_ruby?)

**@return** [Boolean] 

## matches_current_rubygems?() [](#method-i-matches_current_rubygems?)

**@return** [Boolean] 

## method_missing(sym, *a, &b) [](#method-i-method_missing)
Track removed method calls to warn about during build time. Warn about unknown
attributes while loading a spec.

## missing_extensions?() [](#method-i-missing_extensions?)
Is this specification missing its extensions?  When this returns true you
probably want to build_extensions

**@return** [Boolean] 

## name_tuple() [](#method-i-name_tuple)
Return a NameTuple that represents this Specification

## nondevelopment_dependencies() [](#method-i-nondevelopment_dependencies)

## normalize() [](#method-i-normalize)
Normalize the list of files so that:
*   All file lists have redundancies removed.
*   Files referenced in the extra_rdoc_files are included in the package file
    list.

## original_name() [](#method-i-original_name)
Returns the full name (name-version) of this gemspec using the original
platform.  For use with legacy gems.

## platform() [](#method-i-platform)
The platform this gem runs on.  See Gem::Platform for details.

## platform=(platform) [](#method-i-platform=)
The platform this gem runs on.

This is usually Gem::Platform::RUBY or Gem::Platform::CURRENT.

Most gems contain pure Ruby code; they should simply leave the default value
in place.  Some gems contain C (or other) code to be compiled into a Ruby
"extension".  The gem should leave the default value in place unless the code
will only compile on a certain type of system.  Some gems consist of
pre-compiled code ("binary gems").  It's especially important that they set
the platform attribute appropriately.  A shortcut is to set the platform to
Gem::Platform::CURRENT, which will cause the gem builder to set the platform
to the appropriate value for the system on which the build is being performed.

If this attribute is set to a non-default value, it will be included in the
filename of the gem when it is built such as: nokogiri-1.6.0-x86-mingw32.gem

Usage:

    spec.platform = Gem::Platform.local

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## raise_if_conflicts() [](#method-i-raise_if_conflicts)
Check the spec for possible conflicts and freak out if there are any.

## raw_require_paths() [](#method-i-raw_require_paths)
:nodoc:

## rdoc_options() [](#method-i-rdoc_options)
Specifies the rdoc options to be used when generating API documentation.

Usage:

    spec.rdoc_options << '--title' << 'Rake -- Ruby Make' <<
      '--main' << 'README' <<
      '--line-numbers'

## rdoc_options=(options) [](#method-i-rdoc_options=)
Sets rdoc_options to `value`, ensuring it is an array.

## removed_method_calls() [](#method-i-removed_method_calls)

## require_path() [](#method-i-require_path)
Singular accessor for #require_paths

## require_path=(path) [](#method-i-require_path=)
Singular accessor for #require_paths

## require_paths=(val) [](#method-i-require_paths=)
Paths in the gem to add to `$LOAD_PATH` when this gem is activated. -- See
also #require_paths ++ If you have an extension you do not need to add `"ext"`
to the require path, the extension build process will copy the extension files
into "lib" for you.

The default value is `"lib"`

Usage:

    # If all library files are in the root directory...
    spec.require_paths = ['.']

## requirements() [](#method-i-requirements)
Lists the external (to RubyGems) requirements that must be met for this gem to
work.  It's simply information for the user.

Usage:

    spec.requirements << 'libmagick, v6.0'
    spec.requirements << 'A good graphics card'

## requirements=(req) [](#method-i-requirements=)
Set requirements to `req`, ensuring it is an array.

## reset_nil_attributes_to_default() [](#method-i-reset_nil_attributes_to_default)
Reset nil attributes to their default values to make the spec valid

## respond_to_missing?(m, include_privatefalse) [](#method-i-respond_to_missing?)
:nodoc:

**@return** [Boolean] 

## rg_extension_dir() [](#method-i-rg_extension_dir)

## rg_full_gem_path() [](#method-i-rg_full_gem_path)

## rg_loaded_from() [](#method-i-rg_loaded_from)

## rg_required_ruby_version=() [](#method-i-rg_required_ruby_version=)

## ri_dir() [](#method-i-ri_dir)
Returns the full path to this spec's ri directory.

## runtime_dependencies() [](#method-i-runtime_dependencies)
List of dependencies that will automatically be activated at runtime.

## sanitize() [](#method-i-sanitize)
Sanitize the descriptive fields in the spec.  Sometimes non-ASCII characters
will garble the site index.  Non-ASCII characters will be replaced by their
XML entity equivalent.

## sanitize_string(string) [](#method-i-sanitize_string)
Sanitize a single string.

## satisfies_requirement?(dependency) [](#method-i-satisfies_requirement?)
Checks if this specification meets the requirement of `dependency`.

**@return** [Boolean] 

## sort_obj() [](#method-i-sort_obj)
Returns an object you can use to sort specifications in #sort_by.

## source() [](#method-i-source)
Used by Gem::Resolver to order Gem::Specification objects

## spec_dir() [](#method-i-spec_dir)
Returns the full path to the directory containing this spec's gemspec file.
eg: /usr/local/lib/ruby/gems/1.8/specifications

## spec_file() [](#method-i-spec_file)
Returns the full path to this spec's gemspec file. eg:
/usr/local/lib/ruby/gems/1.8/specifications/mygem-1.0.gemspec

## spec_name() [](#method-i-spec_name)
The default name of the gemspec.  See also #file_name

    spec.spec_name # => "example-1.0.gemspec"

## stubbed?() [](#method-i-stubbed?)

**@return** [Boolean] 

## test_file() [](#method-i-test_file)
Singular accessor for #test_files

## test_file=(file) [](#method-i-test_file=)
Singular mutator for #test_files

## test_files() [](#method-i-test_files)
Test files included in this gem.  You cannot append to this accessor, you must
assign to it.

## test_files=(files) [](#method-i-test_files=)
A collection of unit test files.  They will be loaded as unit tests when the
user requests a gem to be unit tested.

Usage:
    spec.test_files = Dir.glob('test/tc_*.rb')
    spec.test_files = ['tests/test-suite.rb']

## to_gemfile(pathnil) [](#method-i-to_gemfile)

## to_ruby() [](#method-i-to_ruby)
Returns a Ruby code representation of this specification, such that it can be
eval'ed and reconstruct the same specification later.  Attributes that still
have their default values are omitted.

## to_ruby_for_cache() [](#method-i-to_ruby_for_cache)
Returns a Ruby lighter-weight code representation of this specification, used
for indexing only.

See #to_ruby.

## to_s() [](#method-i-to_s)
:nodoc:

## to_spec() [](#method-i-to_spec)
Returns self

## to_yaml(opts{}) [](#method-i-to_yaml)
:nodoc:

## traverse(trail[], visited{}, &block) [](#method-i-traverse)
Recursively walk dependencies of this spec, executing the `block` for each
hop.

## validate(packagingtrue, strictfalse) [](#method-i-validate)
Checks that the specification contains all required fields, and does a very
basic sanity check.

Raises InvalidSpecificationException if the spec does not pass the checks..

## validate_dependencies() [](#method-i-validate_dependencies)

## validate_for_resolution() [](#method-i-validate_for_resolution)

## validate_metadata() [](#method-i-validate_metadata)

## validate_permissions() [](#method-i-validate_permissions)

## yaml_initialize(tag, vals) [](#method-i-yaml_initialize)
:nodoc:

