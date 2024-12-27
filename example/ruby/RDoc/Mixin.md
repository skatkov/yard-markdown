# Class: RDoc::Mixin
**Inherits:** RDoc::CodeObject
    

A Mixin adds features from a module into another context.  RDoc::Include and
RDoc::Extend are both mixins.


# Attributes
## name[RW] [](#attribute-i-name)
Name of included module


#Instance Methods
## <=>(other) [](#method-i-<=>)
Mixins are sorted by name

## ==(other) [](#method-i-==)
:nodoc:

## full_name() [](#method-i-full_name)
Full name based on #module

## hash() [](#method-i-hash)
:nodoc:

## initialize(name, comment) [](#method-i-initialize)
Creates a new Mixin for `name` with `comment`

**@return** [Mixin] a new instance of Mixin

## inspect() [](#method-i-inspect)
:nodoc:

## module() [](#method-i-module)
Attempts to locate the included module object.  Returns the name if not known.

The scoping rules of Ruby to resolve the name of an included module are:
*   first look into the children of the current context;
*   if not found, look into the children of included modules, in reverse
    inclusion order;
*   if still not found, go up the hierarchy of names.

This method has `O(n!)` behavior when the module calling include is
referencing nonexistent modules.  Avoid calling #module until after all the
files are parsed.  This behavior is due to ruby's constant lookup behavior.

As of the beginning of October, 2011, no gem includes nonexistent modules.

## store=(store) [](#method-i-store=)
Sets the store for this class or module and its contained code objects.

## to_s() [](#method-i-to_s)
:nodoc:

