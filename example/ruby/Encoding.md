# Class: Encoding
**Inherits:** Object
    

An Encoding instance represents a character encoding usable in Ruby. It is
defined as a constant under the Encoding namespace. It has a name and,
optionally, aliases:

    Encoding::US_ASCII.name  # => "US-ASCII"
    Encoding::US_ASCII.names # => ["US-ASCII", "ASCII", "ANSI_X3.4-1968", "646"]

A Ruby method that accepts an encoding as an argument will accept:

*   An Encoding object.
*   The name of an encoding.
*   An alias for an encoding name.

These are equivalent:

    'foo'.encode(Encoding::US_ASCII) # Encoding object.
    'foo'.encode('US-ASCII')         # Encoding name.
    'foo'.encode('ASCII')            # Encoding alias.

For a full discussion of encodings and their uses, see [the Encodings
document](rdoc-ref:encodings.rdoc).

Encoding::ASCII_8BIT is a special-purpose encoding that is usually used for a
string of bytes, not a string of characters. But as the name indicates, its
characters in the ASCII range are considered as ASCII characters. This is
useful when you use other ASCII-compatible encodings.


# Class Methods
## _load(str ) [](#method-c-_load)
:nodoc:
## aliases() [](#method-c-aliases)
Returns the hash of available encoding alias and original encoding name.

    Encoding.aliases
    #=> {"BINARY"=>"ASCII-8BIT", "ASCII"=>"US-ASCII", "ANSI_X3.4-1968"=>"US-ASCII",
          "SJIS"=>"Windows-31J", "eucJP"=>"EUC-JP", "CP932"=>"Windows-31J"}
**@overload** [] 

## compatible?(str1 , str2 ) [](#method-c-compatible?)
Checks the compatibility of two objects.

If the objects are both strings they are compatible when they are
concatenatable.  The encoding of the concatenated string will be returned if
they are compatible, nil if they are not.

    Encoding.compatible?("\xa1".force_encoding("iso-8859-1"), "b")
    #=> #<Encoding:ISO-8859-1>

    Encoding.compatible?(
      "\xa1".force_encoding("iso-8859-1"),
      "\xa1\xa1".force_encoding("euc-jp"))
    #=> nil

If the objects are non-strings their encodings are compatible when they have
an encoding and:
*   Either encoding is US-ASCII compatible
*   One of the encodings is a 7-bit encoding
**@overload** [] 

## default_external() [](#method-c-default_external)
Returns default external encoding.

The default external encoding is used by default for strings created from the
following locations:

*   CSV
*   File data read from disk
*   SDBM
*   StringIO
*   Zlib::GzipReader
*   Zlib::GzipWriter
*   String#inspect
*   Regexp#inspect

While strings created from these locations will have this encoding, the
encoding may not be valid.  Be sure to check String#valid_encoding?.

File data written to disk will be transcoded to the default external encoding
when written, if default_internal is not nil.

The default external encoding is initialized by the -E option. If -E isn't
set, it is initialized to UTF-8 on Windows and the locale on other operating
systems.
**@overload** [] 

## default_external=(encoding ) [](#method-c-default_external=)
Sets default external encoding.  You should not set Encoding::default_external
in ruby code as strings created before changing the value may have a different
encoding from strings created after the value was changed., instead you should
use `ruby -E` to invoke ruby with the correct default_external.

See Encoding::default_external for information on how the default external
encoding is used.
**@overload** [] 

## default_internal() [](#method-c-default_internal)
Returns default internal encoding.  Strings will be transcoded to the default
internal encoding in the following places if the default internal encoding is
not nil:

*   CSV
*   Etc.sysconfdir and Etc.systmpdir
*   File data read from disk
*   File names from Dir
*   Integer#chr
*   String#inspect and Regexp#inspect
*   Strings returned from Readline
*   Strings returned from SDBM
*   Time#zone
*   Values from ENV
*   Values in ARGV including $PROGRAM_NAME

Additionally String#encode and String#encode! use the default internal
encoding if no encoding is given.

The script encoding (__ENCODING__), not default_internal, is used as the
encoding of created strings.

Encoding::default_internal is initialized with -E option or nil otherwise.
**@overload** [] 

## default_internal=(encoding ) [](#method-c-default_internal=)
Sets default internal encoding or removes default internal encoding when
passed nil.  You should not set Encoding::default_internal in ruby code as
strings created before changing the value may have a different encoding from
strings created after the change.  Instead you should use `ruby -E` to invoke
ruby with the correct default_internal.

See Encoding::default_internal for information on how the default internal
encoding is used.
**@overload** [] 

## find(enc ) [](#method-c-find)
Search the encoding with specified *name*. *name* should be a string.

    Encoding.find("US-ASCII")  #=> #<Encoding:US-ASCII>

Names which this method accept are encoding names and aliases including
following special aliases

"external"
:   default external encoding

"internal"
:   default internal encoding

"locale"
:   locale encoding

"filesystem"
:   filesystem encoding


An ArgumentError is raised when no encoding with *name*. Only
`Encoding.find("internal")` however returns nil when no encoding named
"internal", in other words, when Ruby has no default internal encoding.
**@overload** [] 

## list() [](#method-c-list)
Returns the list of loaded encodings.

    Encoding.list
    #=> [#<Encoding:ASCII-8BIT>, #<Encoding:UTF-8>,
          #<Encoding:ISO-2022-JP (dummy)>]

    Encoding.find("US-ASCII")
    #=> #<Encoding:US-ASCII>

    Encoding.list
    #=> [#<Encoding:ASCII-8BIT>, #<Encoding:UTF-8>,
          #<Encoding:US-ASCII>, #<Encoding:ISO-2022-JP (dummy)>]
**@overload** [] 

## locale_charmap() [](#method-c-locale_charmap)
## name_list() [](#method-c-name_list)
Returns the list of available encoding names.

    Encoding.name_list
    #=> ["US-ASCII", "ASCII-8BIT", "UTF-8",
          "ISO-8859-1", "Shift_JIS", "EUC-JP",
          "Windows-31J",
          "BINARY", "CP932", "eucJP"]
**@overload** [] 


#Instance Methods
## _dump(*args) [](#method-i-_dump)
:nodoc:

## ascii_compatible?() [](#method-i-ascii_compatible?)
Returns whether ASCII-compatible or not.

    Encoding::UTF_8.ascii_compatible?     #=> true
    Encoding::UTF_16BE.ascii_compatible?  #=> false

**@overload** [] 

## dummy?() [](#method-i-dummy?)
Returns true for dummy encodings. A dummy encoding is an encoding for which
character handling is not properly implemented. It is used for stateful
encodings.

    Encoding::ISO_2022_JP.dummy?       #=> true
    Encoding::UTF_8.dummy?             #=> false

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a string which represents the encoding for programmers.

    Encoding::UTF_8.inspect       #=> "#<Encoding:UTF-8>"
    Encoding::ISO_2022_JP.inspect #=> "#<Encoding:ISO-2022-JP (dummy)>"

**@overload** [] 

## name() [](#method-i-name)
Returns the name of the encoding.

    Encoding::UTF_8.name      #=> "UTF-8"

**@overload** [] 

**@overload** [] 

## names() [](#method-i-names)
Returns the list of name and aliases of the encoding.

    Encoding::WINDOWS_31J.names  #=> ["Windows-31J", "CP932", "csWindows31J", "SJIS", "PCK"]

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns the name of the encoding.

    Encoding::UTF_8.name      #=> "UTF-8"

**@overload** [] 

**@overload** [] 

