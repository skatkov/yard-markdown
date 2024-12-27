# Class: Gem::Molinillo::Resolver::Resolution::UnwindDetails
**Inherits:** Struct
    
**Includes:** Comparable
  

Details of the state to unwind to when a conflict occurs, and the cause of the
unwind

**@attr** [Integer] the index of the state to unwind to

**@attr** [Object] the requirement of the state we're unwinding to

**@attr** [Array] for the requirement we're relaxing

**@attr** [Array] the requirements that combined to cause the conflict

**@attr** [Array] for the conflict

**@attr** [Array] array of unwind requirements that were chosen over this unwind


# Attributes
## conflicting_requirements[RW] [](#attribute-i-conflicting_requirements)
the requirements that combined to cause the conflict

**@return** [Array] the current value of conflicting_requirements

## requirement_tree[RW] [](#attribute-i-requirement_tree)
for the requirement we're relaxing

**@return** [Array] the current value of requirement_tree

## requirement_trees[RW] [](#attribute-i-requirement_trees)
for the conflict

**@return** [Array] the current value of requirement_trees

## requirements_unwound_to_instead[RW] [](#attribute-i-requirements_unwound_to_instead)
array of unwind requirements that were chosen over this unwind

**@return** [Array] the current value of requirements_unwound_to_instead

## state_index[RW] [](#attribute-i-state_index)
the index of the state to unwind to

**@return** [Integer] the current value of state_index

## state_requirement[RW] [](#attribute-i-state_requirement)
the requirement of the state we're unwinding to

**@return** [Object] the current value of state_requirement


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
We compare UnwindDetails when choosing which state to unwind to. If two
options have the same state_index we prefer the one most removed from a
requirement that caused the conflict. Both options would unwind to the same
state, but a `grandparent` option will filter out fewer of its possibilities
after doing so - where a state is both a `parent` and a `grandparent` to
requirements that have caused a conflict this is the correct behaviour.

**@param** [UnwindDetail] UnwindDetail to be compared

**@return** [Integer] integer specifying ordering

## ==(y) [](#method-i-==)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns 0. Also returns true if *obj* and *other* are the same object.

**@overload** [] 

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## all_requirements() [](#method-i-all_requirements)

**@return** [Array] array of all the requirements that led to the need for
this unwind

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

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

## reversed_requirement_tree_index() [](#method-i-reversed_requirement_tree_index)

**@return** [Integer] index of state requirement in reversed requirement tree
(the conflicting requirement itself will be at position 0)

## sub_dependencies_to_avoid() [](#method-i-sub_dependencies_to_avoid)

**@return** [Array] array of sub-dependencies to avoid when choosing a
new possibility for the state we've unwound to. Only relevant for
non-primary unwinds

## unwinding_to_primary_requirement?() [](#method-i-unwinding_to_primary_requirement?)

**@return** [Boolean] where the requirement of the state we're unwinding
to directly caused the conflict. Note: in this case, it is
impossible for the state we're unwinding to be a parent of
any of the other conflicting requirements (or we would have
circularity)

