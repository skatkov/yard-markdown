# Class: TallyAction
**Inherits:** Object
    



# Attributes
## counter[RW] [](#attribute-i-counter)
Returns the value of attribute counter.


#Instance Methods
## example(state, block) [](#method-i-example)
Callback for the MSpec :example event. Increments the tally of examples.

## exception(exception) [](#method-i-exception)
Callback for the MSpec :exception event. Increments the tally of errors and
failures.

## expectation(state) [](#method-i-expectation)
Callback for the MSpec :expectation event. Increments the tally of
expectations (e.g. #should, #should_receive, etc.).

## format() [](#method-i-format)

## initialize() [](#method-i-initialize)

**@return** [TallyAction] a new instance of TallyAction

## load() [](#method-i-load)

## register() [](#method-i-register)

## tagged(state) [](#method-i-tagged)

## unregister() [](#method-i-unregister)

