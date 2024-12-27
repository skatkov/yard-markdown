# Module: Test::Unit::Guard
    

Provides a simple set of guards that you can use in your tests to skip
execution if it is not applicable. These methods are mixed into TestCase as
both instance and class methods so you can use them inside or outside of the
test methods.

    def test_something_for_mri
      skip "bug 1234"  if jruby?
      # ...
    end

    if windows? then
      # ... lots of test methods ...
    end



#Instance Methods
## jruby?(platformRUBY_PLATFORM) [](#method-i-jruby?)
Is this running on jruby?

**@return** [Boolean] 

## mingw?(platformRUBY_PLATFORM) [](#method-i-mingw?)
Is this running on mingw?

**@return** [Boolean] 

## mri?(platformRUBY_DESCRIPTION) [](#method-i-mri?)
Is this running on mri?

**@return** [Boolean] 

## windows?(platformRUBY_PLATFORM) [](#method-i-windows?)
Is this running on windows?

**@return** [Boolean] 

