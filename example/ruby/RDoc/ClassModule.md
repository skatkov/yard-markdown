# Class: RDoc::ClassModule
**Inherits:** RDoc::Context
    

ClassModule is the base class for objects representing either a class or a
module.


# Class Methods
## from_module(class_type , mod ) [](#method-c-from_module)
Return a RDoc::ClassModule of class `class_type` that is a copy of module
`module`. Used to promote modules to classes. -- TODO move to
RDoc::NormalClass (I think)
# Attributes
## comment_location[RW] [](#attribute-i-comment_location)
Comment and the location it came from.  Use #add_comment to add comments

## constant_aliases[RW] [](#attribute-i-constant_aliases)
Constants that are aliases for this class or module

## diagram[RW] [](#attribute-i-diagram)
:nodoc:

## is_alias_for[RW] [](#attribute-i-is_alias_for)
Class or module this constant is an alias for


#Instance Methods
## add_comment(comment, location) [](#method-i-add_comment)
Adds `comment` to this ClassModule's list of comments at `location`.  This
method is preferred over #comment= since it allows ri data to be updated
across multiple runs.

## add_things(my_things, other_things) [](#method-i-add_things)
:nodoc:

## ancestors() [](#method-i-ancestors)
Ancestors list for this ClassModule: the list of included modules (classes
will add their superclass if any).

Returns the included classes or modules, not the includes themselves. The
returned values are either String or RDoc::NormalModule instances (see
RDoc::Include#module).

The values are returned in reverse order of their inclusion, which is the
order suitable for searching methods/attributes in the ancestors. The
superclass, if any, comes last.

## aref() [](#method-i-aref)
HTML fragment reference for this module or class.  See RDoc::NormalClass#aref
and RDoc::NormalModule#aref

## aref_prefix() [](#method-i-aref_prefix)
:nodoc:

**@raise** [NotImplementedError] 

## clear_comment() [](#method-i-clear_comment)
Clears the comment. Used by the Ruby parser.

## comment=(comment) [](#method-i-comment=)
This method is deprecated, use #add_comment instead.

Appends `comment` to the current comment, but separated by a rule.  Works more
like `+=`.

## complete(min_visibility) [](#method-i-complete)
Prepares this ClassModule for use by a generator.

See RDoc::Store#complete

## description() [](#method-i-description)
Handy wrapper for marking up this class or module's comment

## document_self_or_methods() [](#method-i-document_self_or_methods)
Does this ClassModule or any of its methods have document_self set?

## documented?() [](#method-i-documented?)
Does this class or module have a comment with content or is #received_nodoc
true?

**@return** [Boolean] 

## each_ancestor() [](#method-i-each_ancestor)
Iterates the ancestors of this class or module for which an RDoc::ClassModule
exists.

## embed_mixins() [](#method-i-embed_mixins)

## find_ancestor_local_symbol(symbol) [](#method-i-find_ancestor_local_symbol)
Looks for a symbol in the #ancestors. See Context#find_local_symbol.

## find_class_named(name) [](#method-i-find_class_named)
Finds a class or module with `name` in this namespace or its descendants

## full_name() [](#method-i-full_name)
Return the fully qualified name of this class or module

## initialize(name, superclassnil) [](#method-i-initialize)
Creates a new ClassModule with `name` with optional `superclass`

This is a constructor for subclasses, and must never be called directly.

**@return** [ClassModule] a new instance of ClassModule

## marshal_dump() [](#method-i-marshal_dump)
TODO: filter included items by #display?

## marshal_load(array) [](#method-i-marshal_load)
:nodoc:

## merge(class_module) [](#method-i-merge)
Merges `class_module` into this ClassModule.

The data in `class_module` is preferred over the receiver.

## merge_collections(mine, other, other_files, &block) [](#method-i-merge_collections)
Merges collection `mine` with `other` preferring other.  `other_files` is used
to help determine which items should be deleted.

Yields whether the item should be added or removed (true or false) and the
item to be added or removed.

    merge_collections things, other.things, other.in_files do |add, thing|
      if add then
        # add the thing
      else
        # remove the thing
      end
    end

## merge_sections(cm) [](#method-i-merge_sections)
Merges the comments in this ClassModule with the comments in the other
ClassModule `cm`.

## module?() [](#method-i-module?)
Does this object represent a module?

**@return** [Boolean] 

## name=(new_name) [](#method-i-name=)
Allows overriding the initial name.

Used for modules and classes that are constant aliases.

## name_for_path() [](#method-i-name_for_path)
Name to use to generate the url: modules and classes that are aliases for
another module or class return the name of the latter.

## non_aliases() [](#method-i-non_aliases)
Returns the classes and modules that are not constants aliasing another class
or module. For use by formatters only (caches its result).

## parse(comment_location) [](#method-i-parse)
Parses `comment_location` into an RDoc::Markup::Document composed of multiple
RDoc::Markup::Documents with their file set.

## path() [](#method-i-path)
Path to this class or module for use with HTML generator output.

## remove_nodoc_children() [](#method-i-remove_nodoc_children)
Updates the child modules or classes of class/module `parent` by deleting the
ones that have been removed from the documentation.

`parent_hash` is either `parent.modules_hash` or `parent.classes_hash` and
`all_hash` is ::all_modules_hash or ::all_classes_hash.

## remove_things(my_things, other_files) [](#method-i-remove_things)
:nodoc:

## search_record() [](#method-i-search_record)
Search record used by RDoc::Generator::JsonIndex

## store=(store) [](#method-i-store=)
Sets the store for this class or module and its contained code objects.

## super_classes() [](#method-i-super_classes)
Get all super classes of this class in an array. The last element might be a
string if the name is unknown.

## superclass() [](#method-i-superclass)
Get the superclass of this class.  Attempts to retrieve the superclass object,
returns the name if it is not known.

## superclass=(superclass) [](#method-i-superclass=)
Set the superclass of this class to `superclass`

where `superclass` is one of:

*   `nil`
*   a String containing the full name of the superclass
*   the RDoc::ClassModule representing the superclass

**@raise** [NoMethodError] 

## to_s() [](#method-i-to_s)
:nodoc:

## type() [](#method-i-type)
'module' or 'class'

## update_aliases() [](#method-i-update_aliases)
Updates the child modules & classes by replacing the ones that are aliases
through a constant.

The aliased module/class is replaced in the children and in
RDoc::Store#modules_hash or RDoc::Store#classes_hash by a copy that has
`RDoc::ClassModule#is_alias_for` set to the aliased module/class, and this
copy is added to `#aliases` of the aliased module/class.

Formatters can use the #non_aliases method to retrieve children that are not
aliases, for instance to list the namespace content, since the aliased modules
are included in the constants of the class/module, that are listed separately.

## update_extends() [](#method-i-update_extends)
Deletes from #extends those whose module has been removed from the
documentation. -- FIXME: like update_includes, extends are not reliably
removed

## update_includes() [](#method-i-update_includes)
Deletes from #includes those whose module has been removed from the
documentation. -- FIXME: includes are not reliably removed, see _possible_bug
test case

