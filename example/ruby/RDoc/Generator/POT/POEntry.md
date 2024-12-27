# Class: RDoc::Generator::POT::POEntry
**Inherits:** Object
    

A PO entry in PO


# Attributes
## extracted_comment[RW] [](#attribute-i-extracted_comment)
The comment content extracted from source file

## flags[RW] [](#attribute-i-flags)
The flags of the PO entry

## msgid[RW] [](#attribute-i-msgid)
The msgid content

## msgstr[RW] [](#attribute-i-msgstr)
The msgstr content

## references[RW] [](#attribute-i-references)
The locations where the PO entry is extracted

## translator_comment[RW] [](#attribute-i-translator_comment)
The comment content created by translator (PO editor)


#Instance Methods
## initialize(msgid, options{}) [](#method-i-initialize)
Creates a PO entry for `msgid`. Other values can be specified by `options`.

**@return** [POEntry] a new instance of POEntry

## merge(other_entry) [](#method-i-merge)
Merges the PO entry with `other_entry`.

## to_s() [](#method-i-to_s)
Returns the PO entry in PO format.

