# Class: TagListAction
**Inherits:** Object
    

TagListAction - prints out the descriptions for any specs tagged with `tags`.
If `tags` is an empty list, prints out descriptions for any specs that are
tagged.



#Instance Methods
## ===(string) [](#method-i-===)
Returns true if any tagged descriptions matches `string`.

## after(state) [](#method-i-after)
Prints the spec description if it matches the filter.

## include?(arg) [](#method-i-include?)
Returns true. This enables us to match any tag when loading tags from the
file.

**@return** [Boolean] 

## initialize(tagsnil) [](#method-i-initialize)

**@return** [TagListAction] a new instance of TagListAction

## load() [](#method-i-load)
Creates a MatchFilter for specific tags or for all tags.

## register() [](#method-i-register)

## start() [](#method-i-start)
Prints a banner about matching tagged specs.

## unregister() [](#method-i-unregister)

