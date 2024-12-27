# Class: PrettyPrint::Group
**Inherits:** Object
    

The Group class is used for making indentation easier.

While this class does neither the breaking into newlines nor indentation, it
is used in a stack (as well as a queue) within PrettyPrint, to group objects.

For information on using groups, see PrettyPrint#group

This class is intended for internal use of the PrettyPrint buffers.


# Attributes
## breakables[RW] [](#attribute-i-breakables)
Array to hold the Breakable objects for this Group

## depth[RW] [](#attribute-i-depth)
This group's relation to previous groups


#Instance Methods
## break() [](#method-i-break)
Makes a break for this Group, and returns true

## break?() [](#method-i-break?)
Boolean of whether this Group has made a break

**@return** [Boolean] 

## first?() [](#method-i-first?)
Boolean of whether this Group has been queried for being first

This is used as a predicate, and ought to be called first.

**@return** [Boolean] 

## initialize(depth) [](#method-i-initialize)
Create a Group object

Arguments:
*   `depth` - this group's relation to previous groups

**@return** [Group] a new instance of Group

