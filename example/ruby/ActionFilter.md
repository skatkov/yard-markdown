# Class: ActionFilter
**Inherits:** Object
    

ActionFilter is a base class for actions that are triggered by specs that
match the filter. The filter may be specified by strings that match spec
descriptions or by tags for strings that match spec descriptions.

Unlike TagFilter and RegexpFilter, ActionFilter instances do not affect the
specs that are run. The filter is only used to trigger the action.



#Instance Methods
## ===(string) [](#method-i-===)

## initialize(tagsnil, descsnil) [](#method-i-initialize)

**@return** [ActionFilter] a new instance of ActionFilter

## load() [](#method-i-load)

## register() [](#method-i-register)

## unregister() [](#method-i-unregister)

