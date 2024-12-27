# Class: String
**Inherits:** Object
    
**Includes:** Comparable
  

Allows us to write cleaner tests since <<~EOM block quotes strip off all
leading indentation and we need it to be preserved sometimes.


# Class Methods
## new(*args ) [](#method-c-new)
:nodoc:
## try_convert(str ) [](#method-c-try_convert)
If `object` is a `String` object, returns `object`.

Otherwise if `object` responds to `:to_str`, calls `object.to_str` and returns
the result.

Returns `nil` if `object` does not respond to `:to_str`.

Raises an exception unless `object.to_str` returns a `String` object.
**@overload** [] 


#Instance Methods
## %(arg) [](#method-i-%)
Returns the result of formatting `object` into the format specification `self`
(see Kernel#sprintf for formatting details):

    "%05d" % 123 # => "00123"

If `self` contains multiple substitutions, `object` must be an Array or Hash
containing the values to be substituted:

    "%-5s: %016x" % [ "ID", self.object_id ] # => "ID   : 00002b054ec93168"
    "foo = %{foo}" % {foo: 'bar'} # => "foo = bar"
    "foo = %{foo}, baz = %{baz}" % {foo: 'bar', baz: 'bat'} # => "foo = bar, baz = bat"

**@overload** [] 

## *(times) [](#method-i-*)
Returns a new `String` containing `integer` copies of `self`:

    "Ho! " * 3 # => "Ho! Ho! Ho! "
    "Ho! " * 0 # => ""

**@overload** [] 

## +(str2) [](#method-i-+)
Returns a new `String` containing `other_string` concatenated to `self`:

    "Hello from " + self.to_s # => "Hello from main"

**@overload** [] 

## +@() [](#method-i-+@)
Returns `self` if `self` is not frozen and can be mutated without warning
issuance.

Otherwise returns `self.dup`, which is not frozen.

**@overload** [] 

## -(a) [](#method-i--)

## -@() [](#method-i--@)
Returns a frozen, possibly pre-existing copy of the string.

The returned `String` will be deduplicated as long as it does not have any
instance variables set on it and is not a String subclass.

Note that `-string` variant is more convenient for defining constants:

    FILENAME = -'config/database.yml'

while `dedup` is better suitable for using the method in chains of
calculations:

    @url_list.concat(urls.map(&:dedup))

**@overload** [] 

**@overload** [] 

## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <<(str2) [](#method-i-<<)
Concatenates `object` to `self` and returns `self`:

    s = 'foo'
    s << 'bar' # => "foobar"
    s          # => "foobar"

If `object` is an Integer, the value is considered a codepoint and converted
to a character before concatenation:

    s = 'foo'
    s << 33 # => "foo!"

If that codepoint is not representable in the encoding of *string*, RangeError
is raised.

    s = 'foo'
    s.encoding              # => <Encoding:UTF-8>
    s << 0x00110000         # 1114112 out of char range (RangeError)
    s = 'foo'.encode('EUC-JP')
    s << 0x00800080         # invalid codepoint 0x800080 in EUC-JP (RangeError)

If the encoding is US-ASCII and the codepoint is 0..0xff, *string* is
automatically promoted to ASCII-8BIT.

    s = 'foo'.encode('US-ASCII')
    s << 0xff
    s.encoding              # => #<Encoding:BINARY (ASCII-8BIT)>

Related: String#concat, which takes multiple arguments.

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>(str2) [](#method-i-<=>)
Compares `self` and `other_string`, returning:

*   -1 if `other_string` is larger.
*   0 if the two are equal.
*   1 if `other_string` is smaller.
*   `nil` if the two are incomparable.

Examples:

    'foo' <=> 'foo' # => 0
    'foo' <=> 'food' # => -1
    'food' <=> 'foo' # => 1
    'FOO' <=> 'foo' # => -1
    'foo' <=> 'FOO' # => 1
    'foo' <=> 1 # => nil

**@overload** [] 

## ==(str2) [](#method-i-==)
Returns `true` if `object` has the same length and content; as `self`; `false`
otherwise:

    s = 'foo'
    s == 'foo' # => true
    s == 'food' # => false
    s == 'FOO' # => false

Returns `false` if the two strings' encodings are not compatible:
    "\u{e4 f6 fc}".encode("ISO-8859-1") == ("\u{c4 d6 dc}") # => false

If `object` is not an instance of `String` but responds to `to_str`, then the
two strings are compared using `object.==`.

**@overload** [] 

**@overload** [] 

## ===(str2) [](#method-i-===)
Returns `true` if `object` has the same length and content; as `self`; `false`
otherwise:

    s = 'foo'
    s == 'foo' # => true
    s == 'food' # => false
    s == 'FOO' # => false

Returns `false` if the two strings' encodings are not compatible:
    "\u{e4 f6 fc}".encode("ISO-8859-1") == ("\u{c4 d6 dc}") # => false

If `object` is not an instance of `String` but responds to `to_str`, then the
two strings are compared using `object.==`.

**@overload** [] 

**@overload** [] 

## =~(y) [](#method-i-=~)
Returns the Integer index of the first substring that matches the given
`regexp`, or `nil` if no match found:

    'foo' =~ /f/ # => 0
    'foo' =~ /o/ # => 1
    'foo' =~ /x/ # => nil

Note: also updates Regexp@Global+Variables.

If the given `object` is not a Regexp, returns the value returned by `object
=~ self`.

Note that `string =~ regexp` is different from `regexp =~ string` (see
Regexp#=~):

    number= nil
    "no. 9" =~ /(?<number>\d+)/
    number # => nil (not assigned)
    /(?<number>\d+)/ =~ "no. 9"
    number #=> "9"

**@overload** [] 

**@overload** [] 

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## [](*a) [](#method-i-[])
Returns the substring of `self` specified by the arguments. See examples at
[String Slices](rdoc-ref:String@String+Slices).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## []=(*args) [](#method-i-[]=)
Replaces all, some, or none of the contents of `self`; returns `new_string`.
See [String Slices](rdoc-ref:String@String+Slices).

A few examples:

    s = 'foo'
    s[2] = 'rtune'     # => "rtune"
    s                  # => "fortune"
    s[1, 5] = 'init'   # => "init"
    s                  # => "finite"
    s[3..4] = 'al'     # => "al"
    s                  # => "finale"
    s[/e$/] = 'ly'     # => "ly"
    s                  # => "finally"
    s['lly'] = 'ncial' # => "ncial"
    s                  # => "financial"

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## append_as_bytes(*args) [](#method-i-append_as_bytes)
Concatenates each object in `objects` into `self` without any encoding
validation or conversion and returns `self`:

    s = 'foo'
    s.append_as_bytes(" \xE2\x82")  # => "foo \xE2\x82"
    s.valid_encoding?               # => false
    s.append_as_bytes("\xAC 12")
    s.valid_encoding?               # => true

For each given object `object` that is an Integer, the value is considered a
Byte. If the Integer is bigger than one byte, only the lower byte is
considered, similar to String#setbyte:

    s = ""
    s.append_as_bytes(0, 257)             # =>  "\u0000\u0001"

Related: String#<<, String#concat, which do an encoding aware concatenation.

**@overload** [] 

## ascii_only?() [](#method-i-ascii_only?)
Returns `true` if `self` contains only ASCII characters, `false` otherwise:

    'abc'.ascii_only?         # => true
    "abc\u{6666}".ascii_only? # => false

**@overload** [] 

## b() [](#method-i-b)
:include: doc/string/b.rdoc

**@overload** [] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## byteindex(*args) [](#method-i-byteindex)
Returns the Integer byte-based index of the first occurrence of the given
`substring`, or `nil` if none found:

    'foo'.byteindex('f') # => 0
    'foo'.byteindex('o') # => 1
    'foo'.byteindex('oo') # => 1
    'foo'.byteindex('ooo') # => nil

Returns the Integer byte-based index of the first match for the given Regexp
`regexp`, or `nil` if none found:

    'foo'.byteindex(/f/) # => 0
    'foo'.byteindex(/o/) # => 1
    'foo'.byteindex(/oo/) # => 1
    'foo'.byteindex(/ooo/) # => nil

Integer argument `offset`, if given, specifies the byte-based position in the
string to begin the search:

    'foo'.byteindex('o', 1) # => 1
    'foo'.byteindex('o', 2) # => 2
    'foo'.byteindex('o', 3) # => nil

If `offset` is negative, counts backward from the end of `self`:

    'foo'.byteindex('o', -1) # => 2
    'foo'.byteindex('o', -2) # => 1
    'foo'.byteindex('o', -3) # => 1
    'foo'.byteindex('o', -4) # => nil

If `offset` does not land on character (codepoint) boundary, `IndexError` is
raised.

Related: String#index, String#byterindex.

**@overload** [] 

**@overload** [] 

## byterindex(*args) [](#method-i-byterindex)
Returns the Integer byte-based index of the *last* occurrence of the given
`substring`, or `nil` if none found:

    'foo'.byterindex('f') # => 0
    'foo'.byterindex('o') # => 2
    'foo'.byterindex('oo') # => 1
    'foo'.byterindex('ooo') # => nil

Returns the Integer byte-based index of the *last* match for the given Regexp
`regexp`, or `nil` if none found:

    'foo'.byterindex(/f/) # => 0
    'foo'.byterindex(/o/) # => 2
    'foo'.byterindex(/oo/) # => 1
    'foo'.byterindex(/ooo/) # => nil

The *last* match means starting at the possible last position, not the last of
longest matches.

    'foo'.byterindex(/o+/) # => 2
    $~ #=> #<MatchData "o">

To get the last longest match, needs to combine with negative lookbehind.

    'foo'.byterindex(/(?<!o)o+/) # => 1
    $~ #=> #<MatchData "oo">

Or String#byteindex with negative lookforward.

    'foo'.byteindex(/o+(?!.*o)/) # => 1
    $~ #=> #<MatchData "oo">

Integer argument `offset`, if given and non-negative, specifies the maximum
starting byte-based position in the string to *end* the search:

    'foo'.byterindex('o', 0) # => nil
    'foo'.byterindex('o', 1) # => 1
    'foo'.byterindex('o', 2) # => 2
    'foo'.byterindex('o', 3) # => 2

If `offset` is a negative Integer, the maximum starting position in the string
to *end* the search is the sum of the string's length and `offset`:

    'foo'.byterindex('o', -1) # => 2
    'foo'.byterindex('o', -2) # => 1
    'foo'.byterindex('o', -3) # => nil
    'foo'.byterindex('o', -4) # => nil

If `offset` does not land on character (codepoint) boundary, `IndexError` is
raised.

Related: String#byteindex.

**@overload** [] 

**@overload** [] 

## bytes() [](#method-i-bytes)
:include: doc/string/bytes.rdoc

**@overload** [] 

## bytesize() [](#method-i-bytesize)
:include: doc/string/bytesize.rdoc

**@overload** [] 

## byteslice(*args) [](#method-i-byteslice)
Returns a substring of `self`, or `nil` if the substring cannot be
constructed.

With integer arguments `index` and `length` given, returns the substring
beginning at the given `index` of the given `length` (if possible), or `nil`
if `length` is negative or `index` falls outside of `self`:

    s = '0123456789' # => "0123456789"
    s.byteslice(2)   # => "2"
    s.byteslice(200) # => nil
    s.byteslice(4, 3)  # => "456"
    s.byteslice(4, 30) # => "456789"
    s.byteslice(4, -1) # => nil
    s.byteslice(40, 2) # => nil

In either case above, counts backwards from the end of `self` if `index` is
negative:

    s = '0123456789'   # => "0123456789"
    s.byteslice(-4)    # => "6"
    s.byteslice(-4, 3) # => "678"

With Range argument `range` given, returns `byteslice(range.begin,
range.size)`:

    s = '0123456789'    # => "0123456789"
    s.byteslice(4..6)   # => "456"
    s.byteslice(-6..-4) # => "456"
    s.byteslice(5..2)   # => "" # range.size is zero.
    s.byteslice(40..42) # => nil

In all cases, a returned string has the same encoding as `self`:

    s.encoding              # => #<Encoding:UTF-8>
    s.byteslice(4).encoding # => #<Encoding:UTF-8>

**@overload** [] 

**@overload** [] 

## bytesplice(*args) [](#method-i-bytesplice)
Replaces some or all of the content of `self` with `str`, and returns `self`.
The portion of the string affected is determined using the same criteria as
String#byteslice, except that `length` cannot be omitted. If the replacement
string is not the same length as the text it is replacing, the string will be
adjusted accordingly.

If `str_index` and `str_length`, or `str_range` are given, the content of
`self` is replaced by str.byteslice(str_index, str_length) or
str.byteslice(str_range); however the substring of `str` is not allocated as a
new string.

The form that take an Integer will raise an IndexError if the value is out of
range; the Range form will raise a RangeError. If the beginning or ending
offset does not land on character (codepoint) boundary, an IndexError will be
raised.

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## capitalize(*args) [](#method-i-capitalize)
Returns a string containing the characters in `self`; the first character is
upcased; the remaining characters are downcased:

    s = 'hello World!' # => "hello World!"
    s.capitalize       # => "Hello world!"

The casing may be affected by the given `options`; see [Case
Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#capitalize!.

**@overload** [] 

## capitalize!(*args) [](#method-i-capitalize!)
Upcases the first character in `self`; downcases the remaining characters;
returns `self` if any changes were made, `nil` otherwise:

    s = 'hello World!' # => "hello World!"
    s.capitalize!      # => "Hello world!"
    s                  # => "Hello world!"
    s.capitalize!      # => nil

The casing may be affected by the given `options`; see [Case
Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#capitalize.

**@overload** [] 

## casecmp(str2) [](#method-i-casecmp)
Compares `self.downcase` and `other_string.downcase`; returns:

*   -1 if `other_string.downcase` is larger.
*   0 if the two are equal.
*   1 if `other_string.downcase` is smaller.
*   `nil` if the two are incomparable.

Examples:

    'foo'.casecmp('foo') # => 0
    'foo'.casecmp('food') # => -1
    'food'.casecmp('foo') # => 1
    'FOO'.casecmp('foo') # => 0
    'foo'.casecmp('FOO') # => 0
    'foo'.casecmp(1) # => nil

See [Case Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#casecmp?.

**@overload** [] 

## casecmp?(str2) [](#method-i-casecmp?)
Returns `true` if `self` and `other_string` are equal after Unicode case
folding, otherwise `false`:

    'foo'.casecmp?('foo') # => true
    'foo'.casecmp?('food') # => false
    'food'.casecmp?('foo') # => false
    'FOO'.casecmp?('foo') # => true
    'foo'.casecmp?('FOO') # => true

Returns `nil` if the two values are incomparable:

    'foo'.casecmp?(1) # => nil

See [Case Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#casecmp.

**@overload** [] 

## center(*args) [](#method-i-center)
:include: doc/string/center.rdoc

Related: String#ljust, String#rjust.

**@overload** [] 

## chars() [](#method-i-chars)
:include: doc/string/chars.rdoc

**@overload** [] 

## chomp(*args) [](#method-i-chomp)
:include: doc/string/chomp.rdoc

**@overload** [] 

## chomp!(*args) [](#method-i-chomp!)
Like String#chomp, but modifies `self` in place; returns `nil` if no
modification made, `self` otherwise.

**@overload** [] 

## chop() [](#method-i-chop)
:include: doc/string/chop.rdoc

**@overload** [] 

## chop!() [](#method-i-chop!)
Like String#chop, but modifies `self` in place; returns `nil` if `self` is
empty, `self` otherwise.

Related: String#chomp!.

**@overload** [] 

## chr() [](#method-i-chr)
Returns a string containing the first character of `self`:

    s = 'foo' # => "foo"
    s.chr     # => "f"

**@overload** [] 

## clamp(*args) [](#method-i-clamp)
In `(min, max)` form, returns *min* if *obj* `<=>` *min* is less than zero,
*max* if *obj* `<=>` *max* is greater than zero, and *obj* otherwise.

    12.clamp(0, 100)         #=> 12
    523.clamp(0, 100)        #=> 100
    -3.123.clamp(0, 100)     #=> 0

    'd'.clamp('a', 'f')      #=> 'd'
    'z'.clamp('a', 'f')      #=> 'f'

If *min* is `nil`, it is considered smaller than *obj*, and if *max* is `nil`,
it is considered greater than *obj*.

    -20.clamp(0, nil)           #=> 0
    523.clamp(nil, 100)         #=> 100

In `(range)` form, returns *range.begin* if *obj* `<=>` *range.begin* is less
than zero, *range.end* if *obj* `<=>` *range.end* is greater than zero, and
*obj* otherwise.

    12.clamp(0..100)         #=> 12
    523.clamp(0..100)        #=> 100
    -3.123.clamp(0..100)     #=> 0

    'd'.clamp('a'..'f')      #=> 'd'
    'z'.clamp('a'..'f')      #=> 'f'

If *range.begin* is `nil`, it is considered smaller than *obj*, and if
*range.end* is `nil`, it is considered greater than *obj*.

    -20.clamp(0..)           #=> 0
    523.clamp(..100)         #=> 100

When *range.end* is excluded and not `nil`, an exception is raised.

    100.clamp(0...100)       # ArgumentError

**@overload** [] 

**@overload** [] 

## clear() [](#method-i-clear)
Removes the contents of `self`:

    s = 'foo' # => "foo"
    s.clear   # => ""

**@overload** [] 

## codepoints() [](#method-i-codepoints)
:include: doc/string/codepoints.rdoc

**@overload** [] 

## color(forenil, backnil, opts{}, bold:false, underscore:false) [](#method-i-color)

## concat(*args) [](#method-i-concat)
Concatenates each object in `objects` to `self` and returns `self`:

    s = 'foo'
    s.concat('bar', 'baz') # => "foobarbaz"
    s                      # => "foobarbaz"

For each given object `object` that is an Integer, the value is considered a
codepoint and converted to a character before concatenation:

    s = 'foo'
    s.concat(32, 'bar', 32, 'baz') # => "foo bar baz"

Related: String#<<, which takes a single argument.

**@overload** [] 

## count(*args) [](#method-i-count)
Returns the total number of characters in `self` that are specified by the
given `selectors` (see [Multiple Character
Selectors](rdoc-ref:character_selectors.rdoc@Multiple+Character+Selectors)):

    a = "hello world"
    a.count "lo"                   #=> 5
    a.count "lo", "o"              #=> 2
    a.count "hello", "^l"          #=> 4
    a.count "ej-m"                 #=> 4

    "hello^world".count "\\^aeiou" #=> 4
    "hello-world".count "a\\-eo"   #=> 4

    c = "hello world\\r\\n"
    c.count "\\"                   #=> 2
    c.count "\\A"                  #=> 0
    c.count "X-\\w"                #=> 3

**@overload** [] 

## crypt(salt) [](#method-i-crypt)
Returns the string generated by calling `crypt(3)` standard library function
with `str` and `salt_str`, in this order, as its arguments.  Please do not use
this method any longer.  It is legacy; provided only for backward
compatibility with ruby scripts in earlier days.  It is bad to use in
contemporary programs for several reasons:

*   Behaviour of C's `crypt(3)` depends on the OS it is run.  The generated
    string lacks data portability.

*   On some OSes such as Mac OS, `crypt(3)` never fails (i.e. silently ends up
    in unexpected results).

*   On some OSes such as Mac OS, `crypt(3)` is not thread safe.

*   So-called "traditional" usage of `crypt(3)` is very very very weak. 
    According to its manpage, Linux's traditional `crypt(3)` output has only
    2**56 variations; too easy to brute force today.  And this is the default
    behaviour.

*   In order to make things robust some OSes implement so-called "modular"
    usage. To go through, you have to do a complex build-up of the `salt_str`
    parameter, by hand. Failure in generation of a proper salt string tends
    not to yield any errors; typos in parameters are normally not detectable.

    *   For instance, in the following example, the second invocation of
        String#crypt is wrong; it has a typo in "round=" (lacks "s").  However
        the call does not fail and something unexpected is generated.

            "foo".crypt("$5$rounds=1000$salt$") # OK, proper usage
            "foo".crypt("$5$round=1000$salt$")  # Typo not detected

*   Even in the "modular" mode, some hash functions are considered archaic and
    no longer recommended at all; for instance module `$1$` is officially
    abandoned by its author: see http://phk.freebsd.dk/sagas/md5crypt_eol/ . 
    For another instance module `$3$` is considered completely broken: see the
    manpage of FreeBSD.

*   On some OS such as Mac OS, there is no modular mode. Yet, as written
    above, `crypt(3)` on Mac OS never fails. This means even if you build up a
    proper salt string it generates a traditional DES hash anyways, and there
    is no way for you to be aware of.

        "foo".crypt("$5$rounds=1000$salt$") # => "$5fNPQMxC5j6."

If for some reason you cannot migrate to other secure contemporary password
hashing algorithms, install the string-crypt gem and `require 'string/crypt'`
to continue using it.

**@overload** [] 

## dedup() [](#method-i-dedup)
Returns a frozen, possibly pre-existing copy of the string.

The returned `String` will be deduplicated as long as it does not have any
instance variables set on it and is not a String subclass.

Note that `-string` variant is more convenient for defining constants:

    FILENAME = -'config/database.yml'

while `dedup` is better suitable for using the method in chains of
calculations:

    @url_list.concat(urls.map(&:dedup))

**@overload** [] 

**@overload** [] 

## delete(*args) [](#method-i-delete)
Returns a copy of `self` with characters specified by `selectors` removed (see
[Multiple Character
Selectors](rdoc-ref:character_selectors.rdoc@Multiple+Character+Selectors)):

    "hello".delete "l","lo"        #=> "heo"
    "hello".delete "lo"            #=> "he"
    "hello".delete "aeiou", "^e"   #=> "hell"
    "hello".delete "ej-m"          #=> "ho"

**@overload** [] 

## delete!(*args) [](#method-i-delete!)
Like String#delete, but modifies `self` in place. Returns `self` if any
changes were made, `nil` otherwise.

**@overload** [] 

## delete_prefix(prefix) [](#method-i-delete_prefix)
:include: doc/string/delete_prefix.rdoc

**@overload** [] 

## delete_prefix!(prefix) [](#method-i-delete_prefix!)
Like String#delete_prefix, except that `self` is modified in place. Returns
`self` if the prefix is removed, `nil` otherwise.

**@overload** [] 

## delete_suffix(suffix) [](#method-i-delete_suffix)
:include: doc/string/delete_suffix.rdoc

**@overload** [] 

## delete_suffix!(suffix) [](#method-i-delete_suffix!)
Like String#delete_suffix, except that `self` is modified in place. Returns
`self` if the suffix is removed, `nil` otherwise.

**@overload** [] 

## downcase(*args) [](#method-i-downcase)
Returns a string containing the downcased characters in `self`:

    s = 'Hello World!' # => "Hello World!"
    s.downcase         # => "hello world!"

The casing may be affected by the given `options`; see [Case
Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#downcase!, String#upcase, String#upcase!.

**@overload** [] 

## downcase!(*args) [](#method-i-downcase!)
Downcases the characters in `self`; returns `self` if any changes were made,
`nil` otherwise:

    s = 'Hello World!' # => "Hello World!"
    s.downcase!        # => "hello world!"
    s                  # => "hello world!"
    s.downcase!        # => nil

The casing may be affected by the given `options`; see [Case
Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#downcase, String#upcase, String#upcase!.

**@overload** [] 

## dump() [](#method-i-dump)
Returns a printable version of `self`, enclosed in double-quotes, with special
characters escaped, and with non-printing characters replaced by hexadecimal
notation:

    "hello \n ''".dump    # => "\"hello \\n ''\""
    "\f\x00\xff\\\"".dump # => "\"\\f\\x00\\xFF\\\\\\\"\""

Related: String#undump (inverse of String#dump).

**@overload** [] 

## dup() [](#method-i-dup)
:nodoc:

## each_byte() [](#method-i-each_byte)
:include: doc/string/each_byte.rdoc

**@overload** [] 

**@overload** [] 

## each_char() [](#method-i-each_char)
:include: doc/string/each_char.rdoc

**@overload** [] 

**@overload** [] 

## each_codepoint() [](#method-i-each_codepoint)
:include: doc/string/each_codepoint.rdoc

**@overload** [] 

**@overload** [] 

## each_grapheme_cluster() [](#method-i-each_grapheme_cluster)
:include: doc/string/each_grapheme_cluster.rdoc

**@overload** [] 

**@overload** [] 

## each_line(*args) [](#method-i-each_line)
:include: doc/string/each_line.rdoc

**@overload** [] 

**@overload** [] 

## empty?() [](#method-i-empty?)
Returns `true` if the length of `self` is zero, `false` otherwise:

    "hello".empty? # => false
    " ".empty? # => false
    "".empty? # => true

**@overload** [] 

## encode(*args) [](#method-i-encode)
:include: doc/string/encode.rdoc

**@overload** [] 

**@overload** [] 

## encode!(*args) [](#method-i-encode!)
Like #encode, but applies encoding changes to `self`; returns `self`.

**@overload** [] 

**@overload** [] 

## encoding() [](#method-i-encoding)

## end_with?(*args) [](#method-i-end_with?)
:include: doc/string/end_with_p.rdoc

**@overload** [] 

## eql?(str2) [](#method-i-eql?)
Returns `true` if `object` has the same length and content;
    as +self+; +false+ otherwise:

      s = 'foo'
      s.eql?('foo') # => true
      s.eql?('food') # => false
      s.eql?('FOO') # => false

    Returns +false+ if the two strings' encodings are not compatible:

      "\u{e4 f6 fc}".encode("ISO-8859-1").eql?("\u{c4 d6 dc}") # => false

**@overload** [] 

## force_encoding(enc) [](#method-i-force_encoding)
:include: doc/string/force_encoding.rdoc

**@overload** [] 

## freeze() [](#method-i-freeze)
:nodoc:

## funcall_style() [](#method-i-funcall_style)

## getbyte(index) [](#method-i-getbyte)
Returns the byte at zero-based `index` as an integer, or `nil` if `index` is
out of range:

    s = 'abcde'   # => "abcde"
    s.getbyte(0)  # => 97
    s.getbyte(-1) # => 101
    s.getbyte(5)  # => nil

Related: String#setbyte.

**@overload** [] 

## grapheme_clusters() [](#method-i-grapheme_clusters)
:include: doc/string/grapheme_clusters.rdoc

**@overload** [] 

## gsub(*args) [](#method-i-gsub)
Returns a copy of `self` with all occurrences of the given `pattern` replaced.

See [Substitution Methods](rdoc-ref:String@Substitution+Methods).

Returns an Enumerator if no `replacement` and no block given.

Related: String#sub, String#sub!, String#gsub!.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## gsub!(*args) [](#method-i-gsub!)
Performs the specified substring replacement(s) on `self`; returns `self` if
any replacement occurred, `nil` otherwise.

See [Substitution Methods](rdoc-ref:String@Substitution+Methods).

Returns an Enumerator if no `replacement` and no block given.

Related: String#sub, String#gsub, String#sub!.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## hash() [](#method-i-hash)
Returns the integer hash value for `self`. The value is based on the length,
content and encoding of `self`.

Related: Object#hash.

**@overload** [] 

## hex() [](#method-i-hex)
Interprets the leading substring of `self` as a string of hexadecimal digits
(with an optional sign and an optional `0x`) and returns the corresponding
number; returns zero if there is no such leading substring:

    '0x0a'.hex        # => 10
    '-1234'.hex       # => -4660
    '0'.hex           # => 0
    'non-numeric'.hex # => 0

Related: String#oct.

**@overload** [] 

## include?(arg) [](#method-i-include?)
Returns `true` if `self` contains `other_string`, `false` otherwise:

    s = 'foo'
    s.include?('f')    # => true
    s.include?('fo')   # => true
    s.include?('food') # => false

**@overload** [] 

## indent(number) [](#method-i-indent)

## index(*args) [](#method-i-index)
:include: doc/string/index.rdoc

**@overload** [] 

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
:include: doc/string/new.rdoc

**@overload** [] 

## initialize_copy(str2) [](#method-i-initialize_copy)
Replaces the contents of `self` with the contents of `other_string`:

    s = 'foo'        # => "foo"
    s.replace('bar') # => "bar"

**@overload** [] 

## insert(idx, str2) [](#method-i-insert)
Inserts the given `other_string` into `self`; returns `self`.

If the Integer `index` is positive, inserts `other_string` at offset `index`:

    'foo'.insert(1, 'bar') # => "fbaroo"

If the Integer `index` is negative, counts backward from the end of `self` and
inserts `other_string` at offset `index+1` (that is, *after* `self[index]`):

    'foo'.insert(-2, 'bar') # => "fobaro"

**@overload** [] 

## inspect() [](#method-i-inspect)
Returns a printable version of `self`, enclosed in double-quotes, and with
special characters escaped:

    s = "foo\tbar\tbaz\n"
    s.inspect
    # => "\"foo\\tbar\\tbaz\\n\""

**@overload** [] 

## intern() [](#method-i-intern)

## kjust(len) [](#method-i-kjust)

## length() [](#method-i-length)
:include: doc/string/length.rdoc

**@overload** [] 

## lines(*args) [](#method-i-lines)
Forms substrings ("lines") of `self` according to the given arguments (see
String#each_line for details); returns the lines in an array.

**@overload** [] 

## ljust(*args) [](#method-i-ljust)
:include: doc/string/ljust.rdoc

Related: String#rjust, String#center.

**@overload** [] 

## lstrip() [](#method-i-lstrip)
Returns a copy of `self` with leading whitespace removed; see [Whitespace in
Strings](rdoc-ref:String@Whitespace+in+Strings):

    whitespace = "\x00\t\n\v\f\r "
    s = whitespace + 'abc' + whitespace
    s        # => "\u0000\t\n\v\f\r abc\u0000\t\n\v\f\r "
    s.lstrip # => "abc\u0000\t\n\v\f\r "

Related: String#rstrip, String#strip.

**@overload** [] 

## lstrip!() [](#method-i-lstrip!)
Like String#lstrip, except that any modifications are made in `self`; returns
`self` if any modification are made, `nil` otherwise.

Related: String#rstrip!, String#strip!.

**@overload** [] 

## match(*args) [](#method-i-match)
Returns a MatchData object (or `nil`) based on `self` and the given `pattern`.

Note: also updates Regexp@Global+Variables.

*   Computes `regexp` by converting `pattern` (if not already a Regexp).
        regexp = Regexp.new(pattern)

*   Computes `matchdata`, which will be either a MatchData object or `nil`
    (see Regexp#match):
        matchdata = <tt>regexp.match(self)

With no block given, returns the computed `matchdata`:

    'foo'.match('f') # => #<MatchData "f">
    'foo'.match('o') # => #<MatchData "o">
    'foo'.match('x') # => nil

If Integer argument `offset` is given, the search begins at index `offset`:

    'foo'.match('f', 1) # => nil
    'foo'.match('o', 1) # => #<MatchData "o">

With a block given, calls the block with the computed `matchdata` and returns
the block's return value:

    'foo'.match(/o/) {|matchdata| matchdata } # => #<MatchData "o">
    'foo'.match(/x/) {|matchdata| matchdata } # => nil
    'foo'.match(/f/, 1) {|matchdata| matchdata } # => nil

**@overload** [] 

**@overload** [] 

## match?(*args) [](#method-i-match?)
Returns `true` or `false` based on whether a match is found for `self` and
`pattern`.

Note: does not update Regexp@Global+Variables.

Computes `regexp` by converting `pattern` (if not already a Regexp).
    regexp = Regexp.new(pattern)

Returns `true` if `self+.match(regexp)` returns a MatchData object, `false`
otherwise:

    'foo'.match?(/o/) # => true
    'foo'.match?('o') # => true
    'foo'.match?(/x/) # => false

If Integer argument `offset` is given, the search begins at index `offset`:
    'foo'.match?('f', 1) # => false
    'foo'.match?('o', 1) # => true

**@overload** [] 

## next() [](#method-i-next)
Returns the successor to `self`. The successor is calculated by incrementing
characters.

The first character to be incremented is the rightmost alphanumeric: or, if no
alphanumerics, the rightmost character:

    'THX1138'.succ # => "THX1139"
    '<<koala>>'.succ # => "<<koalb>>"
    '***'.succ # => '**+'

The successor to a digit is another digit, "carrying" to the next-left
character for a "rollover" from 9 to 0, and prepending another digit if
necessary:

    '00'.succ # => "01"
    '09'.succ # => "10"
    '99'.succ # => "100"

The successor to a letter is another letter of the same case, carrying to the
next-left character for a rollover, and prepending another same-case letter if
necessary:

    'aa'.succ # => "ab"
    'az'.succ # => "ba"
    'zz'.succ # => "aaa"
    'AA'.succ # => "AB"
    'AZ'.succ # => "BA"
    'ZZ'.succ # => "AAA"

The successor to a non-alphanumeric character is the next character in the
underlying character set's collating sequence, carrying to the next-left
character for a rollover, and prepending another character if necessary:

    s = 0.chr * 3
    s # => "\x00\x00\x00"
    s.succ # => "\x00\x00\x01"
    s = 255.chr * 3
    s # => "\xFF\xFF\xFF"
    s.succ # => "\x01\x00\x00\x00"

Carrying can occur between and among mixtures of alphanumeric characters:

    s = 'zz99zz99'
    s.succ # => "aaa00aa00"
    s = '99zz99zz'
    s.succ # => "100aa00aa"

The successor to an empty `String` is a new empty `String`:

    ''.succ # => ""

**@overload** [] 

## next!() [](#method-i-next!)
Equivalent to String#succ, but modifies `self` in place; returns `self`.

**@overload** [] 

## oct() [](#method-i-oct)
Interprets the leading substring of `self` as a string of octal digits (with
an optional sign) and returns the corresponding number; returns zero if there
is no such leading substring:

    '123'.oct             # => 83
    '-377'.oct            # => -255
    '0377non-numeric'.oct # => 255
    'non-numeric'.oct     # => 0

If `self` starts with `0`, radix indicators are honored; see Kernel#Integer.

Related: String#hex.

**@overload** [] 

## ord() [](#method-i-ord)
:include: doc/string/ord.rdoc

**@overload** [] 

## partition(sep) [](#method-i-partition)
:include: doc/string/partition.rdoc

**@overload** [] 

## prepend(*args) [](#method-i-prepend)
Prepends each string in `other_strings` to `self` and returns `self`:

    s = 'foo'
    s.prepend('bar', 'baz') # => "barbazfoo"
    s                       # => "barbazfoo"

Related: String#concat.

**@overload** [] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## quote() [](#method-i-quote)
Wraps a string in escaped quotes if it contains whitespace.

## replace(str2) [](#method-i-replace)
Replaces the contents of `self` with the contents of `other_string`:

    s = 'foo'        # => "foo"
    s.replace('bar') # => "bar"

**@overload** [] 

## reverse() [](#method-i-reverse)
Returns a new string with the characters from `self` in reverse order.

    'stressed'.reverse # => "desserts"

**@overload** [] 

## reverse!() [](#method-i-reverse!)
Returns `self` with its characters reversed:

    s = 'stressed'
    s.reverse! # => "desserts"
    s          # => "desserts"

**@overload** [] 

## rindex(*args) [](#method-i-rindex)
Returns the Integer index of the *last* occurrence of the given `substring`,
or `nil` if none found:

    'foo'.rindex('f') # => 0
    'foo'.rindex('o') # => 2
    'foo'.rindex('oo') # => 1
    'foo'.rindex('ooo') # => nil

Returns the Integer index of the *last* match for the given Regexp `regexp`,
or `nil` if none found:

    'foo'.rindex(/f/) # => 0
    'foo'.rindex(/o/) # => 2
    'foo'.rindex(/oo/) # => 1
    'foo'.rindex(/ooo/) # => nil

The *last* match means starting at the possible last position, not the last of
longest matches.

    'foo'.rindex(/o+/) # => 2
    $~ #=> #<MatchData "o">

To get the last longest match, needs to combine with negative lookbehind.

    'foo'.rindex(/(?<!o)o+/) # => 1
    $~ #=> #<MatchData "oo">

Or String#index with negative lookforward.

    'foo'.index(/o+(?!.*o)/) # => 1
    $~ #=> #<MatchData "oo">

Integer argument `offset`, if given and non-negative, specifies the maximum
starting position in the string to *end* the search:

    'foo'.rindex('o', 0) # => nil
    'foo'.rindex('o', 1) # => 1
    'foo'.rindex('o', 2) # => 2
    'foo'.rindex('o', 3) # => 2

If `offset` is a negative Integer, the maximum starting position in the string
to *end* the search is the sum of the string's length and `offset`:

    'foo'.rindex('o', -1) # => 2
    'foo'.rindex('o', -2) # => 1
    'foo'.rindex('o', -3) # => nil
    'foo'.rindex('o', -4) # => nil

Related: String#index.

**@overload** [] 

**@overload** [] 

## rjust(*args) [](#method-i-rjust)
:include: doc/string/rjust.rdoc

Related: String#ljust, String#center.

**@overload** [] 

## rpartition(sep) [](#method-i-rpartition)
:include: doc/string/rpartition.rdoc

**@overload** [] 

## rstrip() [](#method-i-rstrip)
Returns a copy of the receiver with trailing whitespace removed; see
[Whitespace in Strings](rdoc-ref:String@Whitespace+in+Strings):

    whitespace = "\x00\t\n\v\f\r "
    s = whitespace + 'abc' + whitespace
    s        # => "\u0000\t\n\v\f\r abc\u0000\t\n\v\f\r "
    s.rstrip # => "\u0000\t\n\v\f\r abc"

Related: String#lstrip, String#strip.

**@overload** [] 

## rstrip!() [](#method-i-rstrip!)
Like String#rstrip, except that any modifications are made in `self`; returns
`self` if any modification are made, `nil` otherwise.

Related: String#lstrip!, String#strip!.

**@overload** [] 

## sans_arguments() [](#method-i-sans_arguments)

## scan(pat) [](#method-i-scan)
Matches a pattern against `self`; the pattern is:

*   `string_or_regexp` itself, if it is a Regexp.
*   `Regexp.quote(string_or_regexp)`, if `string_or_regexp` is a string.

Iterates through `self`, generating a collection of matching results:

*   If the pattern contains no groups, each result is the matched string,
    `$&`.
*   If the pattern contains groups, each result is an array containing one
    entry per group.

With no block given, returns an array of the results:

    s = 'cruel world'
    s.scan(/\w+/)      # => ["cruel", "world"]
    s.scan(/.../)      # => ["cru", "el ", "wor"]
    s.scan(/(...)/)    # => [["cru"], ["el "], ["wor"]]
    s.scan(/(..)(..)/) # => [["cr", "ue"], ["l ", "wo"]]

With a block given, calls the block with each result; returns `self`:

    s.scan(/\w+/) {|w| print "<<#{w}>> " }
    print "\n"
    s.scan(/(.)(.)/) {|x,y| print y, x }
    print "\n"

Output:

    <<cruel>> <<world>>
    rceu lowlr

**@overload** [] 

**@overload** [] 

## scrub(*args) [](#method-i-scrub)
:include: doc/string/scrub.rdoc

**@overload** [] 

**@overload** [] 

## scrub!(*args) [](#method-i-scrub!)
Like String#scrub, except that any replacements are made in `self`.

**@overload** [] 

**@overload** [] 

**@overload** [] 

## setbyte(index, value) [](#method-i-setbyte)
Sets the byte at zero-based `index` to `integer`; returns `integer`:

    s = 'abcde'      # => "abcde"
    s.setbyte(0, 98) # => 98
    s                # => "bbcde"

Related: String#getbyte.

**@overload** [] 

## shellescape() [](#method-i-shellescape)
call-seq:
    str.shellescape => string

Escapes `str` so that it can be safely used in a Bourne shell command line.

See Shellwords.shellescape for details.

## shellsplit() [](#method-i-shellsplit)
call-seq:
    str.shellsplit => array

Splits `str` into an array of tokens in the same way the UNIX Bourne shell
does.

See Shellwords.shellsplit for details.

## size() [](#method-i-size)
:include: doc/string/length.rdoc

**@overload** [] 

## slice(*args) [](#method-i-slice)
Returns the substring of `self` specified by the arguments. See examples at
[String Slices](rdoc-ref:String@String+Slices).

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## slice!(*args) [](#method-i-slice!)
Removes and returns the substring of `self` specified by the arguments. See
[String Slices](rdoc-ref:String@String+Slices).

A few examples:

    string = "This is a string"
    string.slice!(2)        #=> "i"
    string.slice!(3..6)     #=> " is "
    string.slice!(/s.*t/)   #=> "sa st"
    string.slice!("r")      #=> "r"
    string                  #=> "Thing"

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## split(*args) [](#method-i-split)
:include: doc/string/split.rdoc

**@overload** [] 

**@overload** [] 

## squeeze(*args) [](#method-i-squeeze)
Returns a copy of `self` with characters specified by `selectors` "squeezed"
(see [Multiple Character
Selectors](rdoc-ref:character_selectors.rdoc@Multiple+Character+Selectors)):

"Squeezed" means that each multiple-character run of a selected character is
squeezed down to a single character; with no arguments given, squeezes all
characters:

    "yellow moon".squeeze                  #=> "yelow mon"
    "  now   is  the".squeeze(" ")         #=> " now is the"
    "putters shoot balls".squeeze("m-z")   #=> "puters shot balls"

**@overload** [] 

## squeeze!(*args) [](#method-i-squeeze!)
Like String#squeeze, but modifies `self` in place. Returns `self` if any
changes were made, `nil` otherwise.

**@overload** [] 

## start_with?(*prefixes) [](#method-i-start_with?)
:include: doc/string/start_with_p.rdoc

**@overload** [] 

## strip() [](#method-i-strip)
Returns a copy of the receiver with leading and trailing whitespace removed;
see [Whitespace in Strings](rdoc-ref:String@Whitespace+in+Strings):

    whitespace = "\x00\t\n\v\f\r "
    s = whitespace + 'abc' + whitespace
    s       # => "\u0000\t\n\v\f\r abc\u0000\t\n\v\f\r "
    s.strip # => "abc"

Related: String#lstrip, String#rstrip.

**@overload** [] 

## strip!() [](#method-i-strip!)
Like String#strip, except that any modifications are made in `self`; returns
`self` if any modification are made, `nil` otherwise.

Related: String#lstrip!, String#strip!.

**@overload** [] 

## sub(*args) [](#method-i-sub)
Returns a copy of `self` with only the first occurrence (not all occurrences)
of the given `pattern` replaced.

See [Substitution Methods](rdoc-ref:String@Substitution+Methods).

Related: String#sub!, String#gsub, String#gsub!.

**@overload** [] 

**@overload** [] 

## sub!(*args) [](#method-i-sub!)
Replaces the first occurrence (not all occurrences) of the given `pattern` on
`self`; returns `self` if a replacement occurred, `nil` otherwise.

See [Substitution Methods](rdoc-ref:String@Substitution+Methods).

Related: String#sub, String#gsub, String#gsub!.

**@overload** [] 

**@overload** [] 

## succ() [](#method-i-succ)
Returns the successor to `self`. The successor is calculated by incrementing
characters.

The first character to be incremented is the rightmost alphanumeric: or, if no
alphanumerics, the rightmost character:

    'THX1138'.succ # => "THX1139"
    '<<koala>>'.succ # => "<<koalb>>"
    '***'.succ # => '**+'

The successor to a digit is another digit, "carrying" to the next-left
character for a "rollover" from 9 to 0, and prepending another digit if
necessary:

    '00'.succ # => "01"
    '09'.succ # => "10"
    '99'.succ # => "100"

The successor to a letter is another letter of the same case, carrying to the
next-left character for a rollover, and prepending another same-case letter if
necessary:

    'aa'.succ # => "ab"
    'az'.succ # => "ba"
    'zz'.succ # => "aaa"
    'AA'.succ # => "AB"
    'AZ'.succ # => "BA"
    'ZZ'.succ # => "AAA"

The successor to a non-alphanumeric character is the next character in the
underlying character set's collating sequence, carrying to the next-left
character for a rollover, and prepending another character if necessary:

    s = 0.chr * 3
    s # => "\x00\x00\x00"
    s.succ # => "\x00\x00\x01"
    s = 255.chr * 3
    s # => "\xFF\xFF\xFF"
    s.succ # => "\x01\x00\x00\x00"

Carrying can occur between and among mixtures of alphanumeric characters:

    s = 'zz99zz99'
    s.succ # => "aaa00aa00"
    s = '99zz99zz'
    s.succ # => "100aa00aa"

The successor to an empty `String` is a new empty `String`:

    ''.succ # => ""

**@overload** [] 

## succ!() [](#method-i-succ!)
Equivalent to String#succ, but modifies `self` in place; returns `self`.

**@overload** [] 

## sum(*args) [](#method-i-sum)
:include: doc/string/sum.rdoc

**@overload** [] 

## swapcase(*args) [](#method-i-swapcase)
Returns a string containing the characters in `self`, with cases reversed;
each uppercase character is downcased; each lowercase character is upcased:

    s = 'Hello World!' # => "Hello World!"
    s.swapcase         # => "hELLO wORLD!"

The casing may be affected by the given `options`; see [Case
Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#swapcase!.

**@overload** [] 

## swapcase!(*args) [](#method-i-swapcase!)
Upcases each lowercase character in `self`; downcases uppercase character;
returns `self` if any changes were made, `nil` otherwise:

    s = 'Hello World!' # => "Hello World!"
    s.swapcase!        # => "hELLO wORLD!"
    s                  # => "hELLO wORLD!"
    ''.swapcase!       # => nil

The casing may be affected by the given `options`; see [Case
Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#swapcase.

**@overload** [] 

## to_a() [](#method-i-to_a)

## to_c() [](#method-i-to_c)
Returns `self` interpreted as a Complex object; leading whitespace and
trailing garbage are ignored:

    '9'.to_c                 # => (9+0i)
    '2.5'.to_c               # => (2.5+0i)
    '2.5/1'.to_c             # => ((5/2)+0i)
    '-3/2'.to_c              # => ((-3/2)+0i)
    '-i'.to_c                # => (0-1i)
    '45i'.to_c               # => (0+45i)
    '3-4i'.to_c              # => (3-4i)
    '-4e2-4e-2i'.to_c        # => (-400.0-0.04i)
    '-0.0-0.0i'.to_c         # => (-0.0-0.0i)
    '1/2+3/4i'.to_c          # => ((1/2)+(3/4)*i)
    '1.0@0'.to_c             # => (1+0.0i)
    "1.0@#{Math::PI/2}".to_c # => (0.0+1i)
    "1.0@#{Math::PI}".to_c   # => (-1+0.0i)

Returns Complex zero if the string cannot be converted:

    'ruby'.to_c        # => (0+0i)

See Kernel#Complex.

**@overload** [] 

## to_f() [](#method-i-to_f)
Returns the result of interpreting leading characters in `self` as a Float:

    '3.14159'.to_f  # => 3.14159
    '1.234e-2'.to_f # => 0.01234

Characters past a leading valid number (in the given `base`) are ignored:

    '3.14 (pi to two places)'.to_f # => 3.14

Returns zero if there is no leading valid number:

    'abcdef'.to_f # => 0.0

**@overload** [] 

## to_i(*args) [](#method-i-to_i)
Returns the result of interpreting leading characters in `self` as an integer
in the given `base` (which must be in (0, 2..36)):

    '123456'.to_i     # => 123456
    '123def'.to_i(16) # => 1195503

With `base` zero, string `object` may contain leading characters to specify
the actual base:

    '123def'.to_i(0)   # => 123
    '0123def'.to_i(0)  # => 83
    '0b123def'.to_i(0) # => 1
    '0o123def'.to_i(0) # => 83
    '0d123def'.to_i(0) # => 123
    '0x123def'.to_i(0) # => 1195503

Characters past a leading valid number (in the given `base`) are ignored:

    '12.345'.to_i   # => 12
    '12345'.to_i(2) # => 1

Returns zero if there is no leading valid number:

    'abcdef'.to_i # => 0
    '2'.to_i(2)   # => 0

**@overload** [] 

## to_r() [](#method-i-to_r)
Returns the result of interpreting leading characters in `str` as a rational. 
Leading whitespace and extraneous characters past the end of a valid number
are ignored. Digit sequences can be separated by an underscore. If there is
not a valid number at the start of `str`, zero is returned.  This method never
raises an exception.

    '  2  '.to_r       #=> (2/1)
    '300/2'.to_r       #=> (150/1)
    '-9.2'.to_r        #=> (-46/5)
    '-9.2e2'.to_r      #=> (-920/1)
    '1_234_567'.to_r   #=> (1234567/1)
    '21 June 09'.to_r  #=> (21/1)
    '21/06/09'.to_r    #=> (7/2)
    'BWV 1079'.to_r    #=> (0/1)

NOTE: "0.3".to_r isn't the same as 0.3.to_r.  The former is equivalent to
"3/10".to_r, but the latter isn't so.

    "0.3".to_r == 3/10r  #=> true
    0.3.to_r   == 3/10r  #=> false

See also Kernel#Rational.

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns `self` if `self` is a `String`, or `self` converted to a `String` if
`self` is a subclass of `String`.

**@overload** [] 

## to_str() [](#method-i-to_str)
Returns `self` if `self` is a `String`, or `self` converted to a `String` if
`self` is a subclass of `String`.

**@overload** [] 

## to_sym() [](#method-i-to_sym)

## tr(src, repl) [](#method-i-tr)
Returns a copy of `self` with each character specified by string `selector`
translated to the corresponding character in string `replacements`. The
correspondence is *positional*:

*   Each occurrence of the first character specified by `selector` is
    translated to the first character in `replacements`.
*   Each occurrence of the second character specified by `selector` is
    translated to the second character in `replacements`.
*   And so on.

Example:

    'hello'.tr('el', 'ip') #=> "hippo"

If `replacements` is shorter than `selector`, it is implicitly padded with its
own last character:

    'hello'.tr('aeiou', '-')   # => "h-ll-"
    'hello'.tr('aeiou', 'AA-') # => "hAll-"

Arguments `selector` and `replacements` must be valid character selectors (see
[Character Selectors](rdoc-ref:character_selectors.rdoc)), and may use any of
its valid forms, including negation, ranges, and escaping:

    # Negation.
    'hello'.tr('^aeiou', '-') # => "-e--o"
    # Ranges.
    'ibm'.tr('b-z', 'a-z') # => "hal"
    # Escapes.
    'hel^lo'.tr('\^aeiou', '-')     # => "h-l-l-"    # Escaped leading caret.
    'i-b-m'.tr('b\-z', 'a-z')       # => "ibabm"     # Escaped embedded hyphen.
    'foo\\bar'.tr('ab\\', 'XYZ')    # => "fooZYXr"   # Escaped backslash.

**@overload** [] 

## tr!(src, repl) [](#method-i-tr!)
Like String#tr, but modifies `self` in place. Returns `self` if any changes
were made, `nil` otherwise.

**@overload** [] 

## tr_cpp() [](#method-i-tr_cpp)
Generates a string used as cpp macro name.

## tr_s(src, repl) [](#method-i-tr_s)
Like String#tr, but also squeezes the modified portions of the translated
string; returns a new string (translated and squeezed).

    'hello'.tr_s('l', 'r')   #=> "hero"
    'hello'.tr_s('el', '-')  #=> "h-o"
    'hello'.tr_s('el', 'hx') #=> "hhxo"

Related: String#squeeze.

**@overload** [] 

## tr_s!(src, repl) [](#method-i-tr_s!)
Like String#tr_s, but modifies `self` in place. Returns `self` if any changes
were made, `nil` otherwise.

Related: String#squeeze!.

**@overload** [] 

## undump() [](#method-i-undump)
Returns an unescaped version of `self`:

    s_orig = "\f\x00\xff\\\""    # => "\f\u0000\xFF\\\""
    s_dumped = s_orig.dump       # => "\"\\f\\x00\\xFF\\\\\\\"\""
    s_undumped = s_dumped.undump # => "\f\u0000\xFF\\\""
    s_undumped == s_orig         # => true

Related: String#dump (inverse of String#undump).

**@overload** [] 

## unicode_normalize(*args) [](#method-i-unicode_normalize)
Returns a copy of `self` with [Unicode
normalization](https://unicode.org/reports/tr15) applied.

Argument `form` must be one of the following symbols (see [Unicode
normalization forms](https://unicode.org/reports/tr15/#Norm_Forms)):

*   `:nfc`: Canonical decomposition, followed by canonical composition.
*   `:nfd`: Canonical decomposition.
*   `:nfkc`: Compatibility decomposition, followed by canonical composition.
*   `:nfkd`: Compatibility decomposition.

The encoding of `self` must be one of:

*   Encoding::UTF_8
*   Encoding::UTF_16BE
*   Encoding::UTF_16LE
*   Encoding::UTF_32BE
*   Encoding::UTF_32LE
*   Encoding::GB18030
*   Encoding::UCS_2BE
*   Encoding::UCS_4BE

Examples:

    "a\u0300".unicode_normalize      # => "a"
    "\u00E0".unicode_normalize(:nfd) # => "a "

Related: String#unicode_normalize!, String#unicode_normalized?.

**@overload** [] 

## unicode_normalize!(*args) [](#method-i-unicode_normalize!)
Like String#unicode_normalize, except that the normalization is performed on
`self`.

Related String#unicode_normalized?.

**@overload** [] 

## unicode_normalized?(*args) [](#method-i-unicode_normalized?)
Returns `true` if `self` is in the given `form` of Unicode normalization,
`false` otherwise. The `form` must be one of `:nfc`, `:nfd`, `:nfkc`, or
`:nfkd`.

Examples:

    "a\u0300".unicode_normalized?       # => false
    "a\u0300".unicode_normalized?(:nfd) # => true
    "\u00E0".unicode_normalized?        # => true
    "\u00E0".unicode_normalized?(:nfd)  # => false

Raises an exception if `self` is not in a Unicode encoding:

    s = "\xE0".force_encoding('ISO-8859-1')
    s.unicode_normalized? # Raises Encoding::CompatibilityError.

Related: String#unicode_normalize, String#unicode_normalize!.

**@overload** [] 

## unpack(fmt, offset:0) [](#method-i-unpack)
call-seq:
     unpack(template, offset: 0, &block) -> array

    Extracts data from +self+.

    If +block+ is not given, forming objects that become the elements
    of a new array, and returns that array.  Otherwise, yields each
    object.

    See {Packed Data}[rdoc-ref:packed_data.rdoc].

## unpack1(fmt, offset:0) [](#method-i-unpack1)
call-seq:
     unpack1(template, offset: 0) -> object

    Like String#unpack, but unpacks and returns only the first extracted object.
    See {Packed Data}[rdoc-ref:packed_data.rdoc].

## unspace() [](#method-i-unspace)
Escape whitespaces for Makefile.

## upcase(*args) [](#method-i-upcase)
Returns a string containing the upcased characters in `self`:

    s = 'Hello World!' # => "Hello World!"
    s.upcase           # => "HELLO WORLD!"

The casing may be affected by the given `options`; see [Case
Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#upcase!, String#downcase, String#downcase!.

**@overload** [] 

## upcase!(*args) [](#method-i-upcase!)
Upcases the characters in `self`; returns `self` if any changes were made,
`nil` otherwise:

    s = 'Hello World!' # => "Hello World!"
    s.upcase!          # => "HELLO WORLD!"
    s                  # => "HELLO WORLD!"
    s.upcase!          # => nil

The casing may be affected by the given `options`; see [Case
Mapping](rdoc-ref:case_mapping.rdoc).

Related: String#upcase, String#downcase, String#downcase!.

**@overload** [] 

## upto(*args) [](#method-i-upto)
With a block given, calls the block with each `String` value returned by
successive calls to String#succ; the first value is `self`, the next is
`self.succ`, and so on; the sequence terminates when value `other_string` is
reached; returns `self`:

    'a8'.upto('b6') {|s| print s, ' ' } # => "a8"

Output:

    a8 a9 b0 b1 b2 b3 b4 b5 b6

If argument `exclusive` is given as a truthy object, the last value is
omitted:

    'a8'.upto('b6', true) {|s| print s, ' ' } # => "a8"

Output:

    a8 a9 b0 b1 b2 b3 b4 b5

If `other_string` would not be reached, does not call the block:

    '25'.upto('5') {|s| fail s }
    'aa'.upto('a') {|s| fail s }

With no block given, returns a new Enumerator:

    'a8'.upto('b6') # => #<Enumerator: "a8":upto("b6")>

**@overload** [] 

**@overload** [] 

## valid_encoding?() [](#method-i-valid_encoding?)
Returns `true` if `self` is encoded correctly, `false` otherwise:

    "\xc2\xa1".force_encoding("UTF-8").valid_encoding? # => true
    "\xc2".force_encoding("UTF-8").valid_encoding?     # => false
    "\x80".force_encoding("UTF-8").valid_encoding?     # => false

**@overload** [] 

