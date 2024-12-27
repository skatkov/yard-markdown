# Class: Prism::TestCase::Fixture
**Inherits:** Object
    

We have a set of fixtures that we use to test various aspects of the parser.
They are all represented as .txt files under the test/prism/fixtures
directory. Typically in test files you will find calls to Fixture.each which
yields Fixture objects to the given block. These are used to define test
methods that assert against each fixture in some way.


# Class Methods
## each(except: [], &block ) [](#method-c-each)
# Attributes
## path[RW] [](#attribute-i-path)
Returns the value of attribute path.


#Instance Methods
## full_path() [](#method-i-full_path)

## initialize(path) [](#method-i-initialize)

**@return** [Fixture] a new instance of Fixture

## read() [](#method-i-read)

## snapshot_path() [](#method-i-snapshot_path)

## test_name() [](#method-i-test_name)

