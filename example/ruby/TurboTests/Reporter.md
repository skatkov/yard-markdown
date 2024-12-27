# Class: TurboTests::Reporter
**Inherits:** Object
    



# Class Methods
## from_config(formatter_config , start_time , seed , seed_used ) [](#method-c-from_config)
# Attributes
## failed_examples[RW] [](#attribute-i-failed_examples)
Returns the value of attribute failed_examples.

## load_time=[R] [](#attribute-i-load_time=)
Sets the attribute load_time

**@param** [] the value to set the attribute load_time to.

## pending_examples[RW] [](#attribute-i-pending_examples)
Returns the value of attribute pending_examples.


#Instance Methods
## add(name, outputs) [](#method-i-add)

## error_outside_of_examples(error_message) [](#method-i-error_outside_of_examples)

## example_failed(example) [](#method-i-example_failed)

## example_passed(example) [](#method-i-example_passed)

## example_pending(example) [](#method-i-example_pending)

## finish() [](#method-i-finish)

## group_finished() [](#method-i-group_finished)

## group_started(notification) [](#method-i-group_started)

## initialize(start_time, seed, seed_used) [](#method-i-initialize)

**@return** [Reporter] a new instance of Reporter

## message(message) [](#method-i-message)

## report(example_groups) [](#method-i-report)
Borrowed from RSpec::Core::Reporter
https://github.com/rspec/rspec-core/blob/5699fcdc4723087ff6139af55bd155ad9ad61
a7b/lib/rspec/core/reporter.rb#L71

## report_number_of_tests(groups) [](#method-i-report_number_of_tests)

## start(example_groups, timeRSpec::Core::Time.now) [](#method-i-start)

