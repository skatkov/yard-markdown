# Class: TagAction
**Inherits:** ActionFilter
    

TagAction - Write tagged spec description string to a tag file associated with
each spec file.

The action is triggered by specs whose descriptions match the filter created
with 'tags' and/or 'desc'

The action fires in the :after event, after the spec had been run. The action
fires if the outcome of running the spec matches 'outcome'.

The arguments are:

    action:  :add, :del
    outcome: :pass, :fail, :all
    tag:     the tag to create/delete
    comment: the comment to create
    tags:    zero or more tags to get matching
             spec description strings from
    desc:    zero or more strings to match the
             spec description strings



#Instance Methods
## ===(string) [](#method-i-===)
Returns true if there are no *tag* or *description* filters. This means that a
TagAction matches any example by default. Otherwise, returns true if either
the *tag* or the *description* filter matches `string`.

## after(state) [](#method-i-after)
Callback for the MSpec :after event. Performs the tag action depending on the
type of action and the outcome of evaluating the example. See `TagAction` for
a description of the actions.

## before(state) [](#method-i-before)
Callback for the MSpec :before event. Resets the `#exception?` flag to false.

## exception(exception) [](#method-i-exception)
Callback for the MSpec :exception event. Sets the `#exception?` flag to true.

## exception?() [](#method-i-exception?)
Returns true if an exception was raised while evaluating the current example.

**@return** [Boolean] 

## finish() [](#method-i-finish)
Callback for the MSpec :finish event. Prints the actions performed while
evaluating the examples.

## initialize(action, outcome, tag, comment, tagsnil, descsnil) [](#method-i-initialize)

**@return** [TagAction] a new instance of TagAction

## outcome?() [](#method-i-outcome?)
Returns true if the result of evaluating the example matches the *outcome*
registered for this tag action. See `TagAction` for a description of the
*outcome* types.

**@return** [Boolean] 

## register() [](#method-i-register)

## unregister() [](#method-i-unregister)

