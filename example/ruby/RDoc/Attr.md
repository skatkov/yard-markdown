# Class: RDoc::Attr
**Inherits:** RDoc::MethodAttr
    

An attribute created by #attr, #attr_reader, #attr_writer or #attr_accessor


# Attributes
## rw[RW] [](#attribute-i-rw)
Is the attribute readable ('R'), writable ('W') or both ('RW')?


#Instance Methods
## ==(other) [](#method-i-==)
Attributes are equal when their names, singleton and rw are identical

## add_alias(an_alias, context) [](#method-i-add_alias)
Add `an_alias` as an attribute in `context`.

## aref_prefix() [](#method-i-aref_prefix)
The #aref prefix for attributes

## calls_super() [](#method-i-calls_super)
Attributes never call super.  See RDoc::AnyMethod#calls_super

An RDoc::Attr can show up in the method list in some situations (see
Gem::ConfigFile)

## definition() [](#method-i-definition)
Returns attr_reader, attr_writer or attr_accessor as appropriate.

## initialize(text, name, rw, comment, singletonfalse) [](#method-i-initialize)
Creates a new Attr with body `text`, `name`, read/write status `rw` and
`comment`.  `singleton` marks this as a class attribute.

**@return** [Attr] a new instance of Attr

## inspect() [](#method-i-inspect)
:nodoc:

## marshal_dump() [](#method-i-marshal_dump)
Dumps this Attr for use by ri.  See also #marshal_load

## marshal_load(array) [](#method-i-marshal_load)
Loads this Attr from `array`.  For a loaded Attr the following methods will
return cached values:

*   #full_name
*   #parent_name

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## to_s() [](#method-i-to_s)
:nodoc:

## token_stream() [](#method-i-token_stream)
Attributes do not have token streams.

An RDoc::Attr can show up in the method list in some situations (see
Gem::ConfigFile)

