# Class: ContextState
**Inherits:** Object
    

Holds the state of the `describe` block that is being evaluated. Every example
(i.e. `it` block) is evaluated in a context, which may include state set up in
`before :each` or `before :all` blocks.

-- A note on naming: this is named *ContextState* rather than *DescribeState*
because `describe` is the keyword in the DSL for referring to the context in
which an example is evaluated, just as `it` refers to the example itself. ++


# Attributes
## children[RW] [](#attribute-i-children)
Returns the value of attribute children.

## examples[RW] [](#attribute-i-examples)
Returns the value of attribute examples.

## parent[RW] [](#attribute-i-parent)
Returns the value of attribute parent.

## parents[RW] [](#attribute-i-parents)
Returns the value of attribute parents.

## state[RW] [](#attribute-i-state)
Returns the value of attribute state.

## to_s[RW] [](#attribute-i-to_s)
Returns the value of attribute to_s.


#Instance Methods
## adopt(parent) [](#method-i-adopt)
Adds a nested ContextState in a shared ContextState to a containing
ContextState.

Normal adoption is from the parent's perspective. But adopt is a good verb and
it's reasonable for the child to adopt the parent as well. In this case,
manipulating state from inside the child avoids needlessly exposing the state
to manipulate it externally in the dup. (See #it_should_behave_like)

## after(what, &block) [](#method-i-after)
Records after(:each) and after(:all) blocks.

## before(what, &block) [](#method-i-before)
Records before(:each) and before(:all) blocks.

## child(child) [](#method-i-child)
Add the ContextState instance `child` to the list of nested describe blocks.

## describe(&block) [](#method-i-describe)
Evaluates the block and resets the toplevel `ContextState` to #parent.

## description() [](#method-i-description)
Returns a description string generated from self and all parents

## filter_examples() [](#method-i-filter_examples)
Removes filtered examples. Returns true if there are examples left to
evaluate.

## initialize(description, optionsnil) [](#method-i-initialize)

**@return** [ContextState] a new instance of ContextState

## initialize_copy(other) [](#method-i-initialize_copy)
Remove caching when a ContextState is dup'd for shared specs.

## it(desc, &block) [](#method-i-it)
Creates an ExampleState instance for the block and stores it in a list of
examples to evaluate unless the example is filtered.

## it_should_behave_like(desc) [](#method-i-it_should_behave_like)
Injects the before/after blocks and examples from the shared describe block
into this `ContextState` instance.

## post(what) [](#method-i-post)
Returns a list of all after(`what`) blocks from self and any parents. The list
is in reverse order. In other words, the blocks defined in inner describes are
in the list before those defined in outer describes, and in a particular
describe block those defined later are in the list before those defined
earlier.

## pre(what) [](#method-i-pre)
Returns a list of all before(`what`) blocks from self and any parents.

## process() [](#method-i-process)
Evaluates the examples in a `ContextState`. Invokes the MSpec events for
:enter, :before, :after, :leave.

## protect(what, blocks, checktrue) [](#method-i-protect)
Evaluates each block in `blocks` using the `MSpec.protect` method so that
exceptions are handled and tallied. Returns true and does NOT evaluate any
blocks if `check` is true and `MSpec.mode?(:pretend)` is true.

## shared?() [](#method-i-shared?)
Returns true if this is a shared `ContextState`. Essentially, when created
with: describe "Something", :shared => true { ... }

**@return** [Boolean] 

