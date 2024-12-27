# Class: RDoc::Alias
**Inherits:** RDoc::CodeObject
    

Represent an alias, which is an old_name/new_name pair associated with a
particular context -- TODO implement Alias as a proxy to a method/attribute,
inheriting from
    MethodAttr


# Attributes
## new_name[RW] [](#attribute-i-new_name)
Aliased method's name

## old_name[RW] [](#attribute-i-old_name)
Aliasee method's name

## singleton[RW] [](#attribute-i-singleton)
Is this an alias declared in a singleton context?

## text[RW] [](#attribute-i-text)
Source file token stream


#Instance Methods
## <=>(other) [](#method-i-<=>)
Order by #singleton then #new_name

## aref() [](#method-i-aref)
HTML fragment reference for this alias

## full_old_name() [](#method-i-full_old_name)
Full old name including namespace

## html_name() [](#method-i-html_name)
HTML id-friendly version of `#new_name`.

## initialize(text, old_name, new_name, comment, singletonfalse) [](#method-i-initialize)
Creates a new Alias with a token stream of `text` that aliases `old_name` to
`new_name`, has `comment` and is a `singleton` context.

**@return** [Alias] a new instance of Alias

## inspect() [](#method-i-inspect)
:nodoc:

## name_prefix() [](#method-i-name_prefix)
'::' for the alias of a singleton method/attribute, '#' for instance-level.

## pretty_new_name() [](#method-i-pretty_new_name)
New name with prefix '::' or '#'.

## pretty_old_name() [](#method-i-pretty_old_name)
Old name with prefix '::' or '#'.

## to_s() [](#method-i-to_s)
:nodoc:

