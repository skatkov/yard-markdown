# Class: RDoc::Markup::AttributeManager
**Inherits:** Object
    

Manages changes of attributes in a block of text


# Attributes
## attributes[RW] [](#attribute-i-attributes)
The attributes enabled for this markup object.

## exclusive_bitmap[RW] [](#attribute-i-exclusive_bitmap)
A bits of exclusive maps

## html_tags[RW] [](#attribute-i-html_tags)
This maps HTML tags to the corresponding attribute char

## matching_word_pairs[RW] [](#attribute-i-matching_word_pairs)
This maps delimiters that occur around words (such as **bold** or `tt`) where
the start and end delimiters and the same. This lets us optimize the regexp

## protectable[RW] [](#attribute-i-protectable)
A \ in front of a character that would normally be processed turns off
processing. We do this by turning < into <#{PROTECT}

## regexp_handlings[RW] [](#attribute-i-regexp_handlings)
And this maps _regexp handling_ sequences to a name. A regexp handling
sequence is something like a WikiWord

## word_pair_map[RW] [](#attribute-i-word_pair_map)
And this is used when the delimiters aren't the same. In this case the hash
maps a pattern to the attribute character


#Instance Methods
## add_html(tag, name, exclusivefalse) [](#method-i-add_html)
Adds a markup class with `name` for words surrounded by HTML tag `tag`. To
process emphasis tags:

    am.add_html 'em', :EM

## add_regexp_handling(pattern, name, exclusivefalse) [](#method-i-add_regexp_handling)
Adds a regexp handling for `pattern` with `name`.  A simple URL handler would
be:

    @am.add_regexp_handling(/((https?:)\S+\w)/, :HYPERLINK)

## add_word_pair(start, stop, name, exclusivefalse) [](#method-i-add_word_pair)
Adds a markup class with `name` for words wrapped in the `start` and `stop`
character.  To make words wrapped with "*" bold:

    am.add_word_pair '*', '*', :BOLD

**@raise** [ArgumentError] 

## attribute(turn_on, turn_off) [](#method-i-attribute)
Return an attribute object with the given turn_on and turn_off bits set

## change_attribute(current, new) [](#method-i-change_attribute)
Changes the current attribute from `current` to `new`

## changed_attribute_by_name(current_set, new_set) [](#method-i-changed_attribute_by_name)
Used by the tests to change attributes by name from `current_set` to `new_set`

## convert_attrs(str, attrs, exclusivefalse) [](#method-i-convert_attrs)
Map attributes like **text**to the sequence 001002<char>001003<char>, where
<char> is a per-attribute specific character

## convert_attrs_matching_word_pairs(str, attrs, exclusive) [](#method-i-convert_attrs_matching_word_pairs)
:nodoc:

## convert_attrs_word_pair_map(str, attrs, exclusive) [](#method-i-convert_attrs_word_pair_map)
:nodoc:

## convert_html(str, attrs, exclusivefalse) [](#method-i-convert_html)
Converts HTML tags to RDoc attributes

## convert_regexp_handlings(str, attrs, exclusivefalse) [](#method-i-convert_regexp_handlings)
Converts regexp handling sequences to RDoc attributes

## copy_string(start_pos, end_pos) [](#method-i-copy_string)
Copies `start_pos` to `end_pos` from the current string

## display_attributes() [](#method-i-display_attributes)
Debug method that prints a string along with its attributes

## exclusive?(attr) [](#method-i-exclusive?)
:nodoc:

**@return** [Boolean] 

## flow(str) [](#method-i-flow)
Processes `str` converting attributes, HTML and regexp handlings

## initialize() [](#method-i-initialize)
Creates a new attribute manager that understands bold, emphasized and teletype
text.

**@return** [AttributeManager] a new instance of AttributeManager

## mask_protected_sequences() [](#method-i-mask_protected_sequences)
Escapes regexp handling sequences of text to prevent conversion to RDoc

## split_into_flow() [](#method-i-split_into_flow)
Splits the string into chunks by attribute change

## unmask_protected_sequences() [](#method-i-unmask_protected_sequences)
Unescapes regexp handling sequences of text

