# Class: TagPurgeAction
**Inherits:** TagListAction
    

TagPurgeAction - removes all tags not matching any spec descriptions.


# Attributes
## matching[RW] [](#attribute-i-matching)
Returns the value of attribute matching.


#Instance Methods
## after(state) [](#method-i-after)
Saves any matching tags

## initialize() [](#method-i-initialize)

**@return** [TagPurgeAction] a new instance of TagPurgeAction

## load() [](#method-i-load)
Creates a MatchFilter for all tags.

## register() [](#method-i-register)

## start() [](#method-i-start)
Prints a banner about purging tags.

## unload() [](#method-i-unload)
Rewrites any matching tags. Prints non-matching tags. Deletes the tag file if
there were no tags (this cleans up empty or malformed tag files).

## unregister() [](#method-i-unregister)

