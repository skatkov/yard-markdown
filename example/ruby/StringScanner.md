# Class: StringScanner
**Inherits:** Object
    

:markup: markdown

:include: strscan/link_refs.txt :include: strscan/strscan.md


# Class Methods
## must_C_version() [](#method-c-must_C_version)
:nodoc:

#Instance Methods
## <<(str) [](#method-i-<<)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    concat(more_string) -> self

*   Appends the given `more_string` to the [stored [string]](1).
*   Returns `self`.
*   Does not affect the [[positions]](11) or [match [values]](9).

```rb scanner = StringScanner.new('foo') scanner.string           # => "foo"
scanner.terminate scanner.concat('barbaz') # => #<StringScanner 3/9 "foo" @
"barba..."> scanner.string           # => "foobarbaz" put_situation(scanner) #
Situation: #   pos:       3 #   charpos:   3 #   rest:      "barbaz" #  
rest_size: 6 ```

## [](idx) [](#method-i-[])
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    [](specifier) -> substring or nil

Returns a captured substring or `nil`; see [Captured Match [Values]](13).

When there are captures:

```rb scanner = StringScanner.new('Fri Dec 12 1975 14:39')
scanner.scan(/(?<wday>w+) (?<month>w+) (?<day>d+) /) ```

*   `specifier` zero: returns the entire matched substring:

        ```rb
        scanner[0]         # => "Fri Dec 12 "
        scanner.pre_match  # => ""
        scanner.post_match # => "1975 14:39"
        ```

*   `specifier` positive integer. returns the `n`th capture, or `nil` if out
    of range:

        ```rb
        scanner[1] # => "Fri"
        scanner[2] # => "Dec"
        scanner[3] # => "12"
        scanner[4] # => nil
        ```

*   `specifier` negative integer. counts backward from the last subgroup:

        ```rb
        scanner[-1] # => "12"
        scanner[-4] # => "Fri Dec 12 "
        scanner[-5] # => nil
        ```

*   `specifier` symbol or string. returns the named subgroup, or `nil` if no
    such:

        ```rb
        scanner[:wday]  # => "Fri"
        scanner['wday'] # => "Fri"
        scanner[:month] # => "Dec"
        scanner[:day]   # => "12"
        scanner[:nope]  # => nil
        ```

When there are no captures, only `[0]` returns non-`nil`:

```rb scanner = StringScanner.new('foobarbaz') scanner.exist?(/bar/)
[scanner](0) # => "bar" [scanner](1) # => nil ```

For a failed match, even `[0]` returns `nil`:

```rb scanner.scan(/nope/) # => nil [scanner](0)           # => nil
[scanner](1)           # => nil ```

## beginning_of_line?() [](#method-i-beginning_of_line?)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    beginning_of_line? -> true or false

Returns whether the [[position]](2) is at the beginning of a line; that is, at
the beginning of the [stored [string]](1) or immediately after a newline:

    scanner = StringScanner.new(MULTILINE_TEXT)
    scanner.string
    # => "Go placidly amid the noise and haste,\nand remember what peace there may be in silence.\n"
    scanner.pos                # => 0
    scanner.beginning_of_line? # => true

    scanner.scan_until(/,/)    # => "Go placidly amid the noise and haste,"
    scanner.beginning_of_line? # => false

    scanner.scan(/\n/)         # => "\n"
    scanner.beginning_of_line? # => true

    scanner.terminate
    scanner.beginning_of_line? # => true

    scanner.concat('x')
    scanner.terminate
    scanner.beginning_of_line? # => false

StringScanner#bol? is an alias for StringScanner#beginning_of_line?.

**@return** [Boolean] 

## captures() [](#method-i-captures)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    captures -> substring_array or nil

Returns the array of [captured match [values]](13) at indexes `(1..)` if the
most recent match attempt succeeded, or `nil` otherwise:

```rb scanner = StringScanner.new('Fri Dec 12 1975 14:39') scanner.captures   
     # => nil

scanner.exist?(/(?<wday>w+) (?<month>w+) (?<day>d+) /) scanner.captures       
 # => ["Fri", "Dec", "12"] scanner.values_at(*0..4) # => ["Fri Dec 12 ",
"Fri", "Dec", "12", nil]

scanner.exist?(/Fri/) scanner.captures         # => []

scanner.scan(/nope/) scanner.captures         # => nil ```

## charpos() [](#method-i-charpos)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/get_charpos.md

## check(re) [](#method-i-check)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    check(pattern) -> matched_substring or nil

Attempts to [[match]](17) the given `pattern` at the beginning of the [target
[substring]](3); does not modify the [[positions]](11).

If the match succeeds:

*   Returns the matched substring.
*   Sets all [match [values]](9).

```rb scanner = StringScanner.new('foobarbaz') scanner.pos = 3
scanner.check('bar') # => "bar" put_match_values(scanner) # Basic match
values: #   matched?:       true #   matched_size:   3 #   pre_match:     
"foo" #   matched  :      "bar" #   post_match:     "baz" # Captured match
values: #   size:           1 #   captures:       [] #   named_captures: {} # 
 values_at:      ["bar", nil] #   []: #     [0]:          "bar" #     [1]:    
     nil # => 0..1 put_situation(scanner) # Situation: #   pos:       3 #  
charpos:   3 #   rest:      "barbaz" #   rest_size: 6 ```

If the match fails:

*   Returns `nil`.
*   Clears all [match [values]](9).

```rb scanner.check(/nope/)          # => nil match_values_cleared?(scanner) #
=> true ```

## check_until(re) [](#method-i-check_until)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    check_until(pattern) -> substring or nil

Attempts to [[match]](17) the given `pattern` anywhere (at any
[[position]](2)) in the [target [substring]](3); does not modify the
[[positions]](11).

If the match succeeds:

*   Sets all [match [values]](9).
*   Returns the matched substring, which extends from the current
    [[position]](2) to the end of the matched substring.

```rb scanner = StringScanner.new('foobarbazbatbam') scanner.pos = 6
scanner.check_until(/bat/) # => "bazbat" put_match_values(scanner) # Basic
match values: #   matched?:       true #   matched_size:   3 #   pre_match:   
  "foobarbaz" #   matched  :      "bat" #   post_match:     "bam" # Captured
match values: #   size:           1 #   captures:       [] #   named_captures:
{} #   values_at:      ["bat", nil] #   []: #     [0]:          "bat" #    
[1]:          nil put_situation(scanner) # Situation: #   pos:       6 #  
charpos:   6 #   rest:      "bazbatbam" #   rest_size: 9 ```

If the match fails:

*   Clears all [match [values]](9).
*   Returns `nil`.

```rb scanner.check_until(/nope/)    # => nil match_values_cleared?(scanner) #
=> true ```

## clear() [](#method-i-clear)
:nodoc:

## concat(str) [](#method-i-concat)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    concat(more_string) -> self

*   Appends the given `more_string` to the [stored [string]](1).
*   Returns `self`.
*   Does not affect the [[positions]](11) or [match [values]](9).

```rb scanner = StringScanner.new('foo') scanner.string           # => "foo"
scanner.terminate scanner.concat('barbaz') # => #<StringScanner 3/9 "foo" @
"barba..."> scanner.string           # => "foobarbaz" put_situation(scanner) #
Situation: #   pos:       3 #   charpos:   3 #   rest:      "barbaz" #  
rest_size: 6 ```

## empty?() [](#method-i-empty?)
:nodoc:

**@return** [Boolean] 

## eos?() [](#method-i-eos?)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    eos? -> true or false

Returns whether the [[position]](2) is at the end of the [stored [string]](1):

```rb scanner = StringScanner.new('foobarbaz') scanner.eos? # => false pos = 3
scanner.eos? # => false scanner.terminate scanner.eos? # => true ```

**@return** [Boolean] 

## exist?(re) [](#method-i-exist?)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    exist?(pattern) -> byte_offset or nil

Attempts to [[match]](17) the given `pattern` anywhere (at any
[[position]](2)) n the [target [substring]](3); does not modify the
[[positions]](11).

If the match succeeds:

*   Returns a byte offset: the distance in bytes between the current
    [[position]](2) and the end of the matched substring.
*   Sets all [match [values]](9).

```rb scanner = StringScanner.new('foobarbazbatbam') scanner.pos = 6
scanner.exist?(/bat/) # => 6 put_match_values(scanner) # Basic match values: #
  matched?:       true #   matched_size:   3 #   pre_match:      "foobarbaz" #
  matched  :      "bat" #   post_match:     "bam" # Captured match values: #  
size:           1 #   captures:       [] #   named_captures: {} #   values_at:
     ["bat", nil] #   []: #     [0]:          "bat" #     [1]:          nil
put_situation(scanner) # Situation: #   pos:       6 #   charpos:   6 #  
rest:      "bazbatbam" #   rest_size: 9 ```

If the match fails:

*   Returns `nil`.
*   Clears all [match [values]](9).

```rb scanner.exist?(/nope/)         # => nil match_values_cleared?(scanner) #
=> true ```

**@return** [Boolean] 

## fixed_anchor?() [](#method-i-fixed_anchor?)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    fixed_anchor? -> true or false

Returns whether the [fixed-anchor [property]](10) is set.

**@return** [Boolean] 

## get_byte() [](#method-i-get_byte)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/get_byte.md

## getbyte() [](#method-i-getbyte)
:nodoc:

## getch() [](#method-i-getch)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/getch.md

## getrows(lx, ly) [](#method-i-getrows)
lx: limit of x (columns of screen) ly: limit of y (rows of screen)

## inspect() [](#method-i-inspect)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    inspect -> string

Returns a string representation of `self` that may show:

1.  The current [[position]](2).
2.  The size (in bytes) of the [stored [string]](1).
3.  The substring preceding the current position.
4.  The substring following the current position (which is also the [target
    [substring]](3)).

```rb scanner = StringScanner.new("Fri Dec 12 1975 14:39") scanner.pos = 11
scanner.inspect # => "#<StringScanner 11/21 "...c 12 " @ "1975 ...">" ```

If at beginning-of-string, item 4 above (following substring) is omitted:

```rb scanner.reset scanner.inspect # => "#<StringScanner 0/21 @ "Fri D...">"
```

If at end-of-string, all items above are omitted:

```rb scanner.terminate scanner.inspect # => "#<StringScanner fin>" ```

## match?(re) [](#method-i-match?)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    match?(pattern) -> updated_position or nil

Attempts to [[match]](17) the given `pattern` at the beginning of the [target
[substring]](3); does not modify the [[positions]](11).

If the match succeeds:

*   Sets [match [values]](9).
*   Returns the size in bytes of the matched substring.

```rb scanner = StringScanner.new('foobarbaz') scanner.pos = 3
scanner.match?(/bar/) => 3 put_match_values(scanner) # Basic match values: #  
matched?:       true #   matched_size:   3 #   pre_match:      "foo" #  
matched  :      "bar" #   post_match:     "baz" # Captured match values: #  
size:           1 #   captures:       [] #   named_captures: {} #   values_at:
     ["bar", nil] #   []: #     [0]:          "bar" #     [1]:          nil
put_situation(scanner) # Situation: #   pos:       3 #   charpos:   3 #  
rest:      "barbaz" #   rest_size: 6 ```

If the match fails:

*   Clears match values.
*   Returns `nil`.
*   Does not increment positions.

```rb scanner.match?(/nope/)         # => nil match_values_cleared?(scanner) #
=> true ```

**@return** [Boolean] 

## matched() [](#method-i-matched)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    matched -> matched_substring or nil

Returns the matched substring from the most recent [[match]](17) attempt if it
was successful, or `nil` otherwise; see [Basic Matched [Values]](18):

```rb scanner = StringScanner.new('foobarbaz') scanner.matched        # => nil
scanner.pos = 3 scanner.match?(/bar/)  # => 3 scanner.matched        # =>
"bar" scanner.match?(/nope/) # => nil scanner.matched        # => nil ```

## matched?() [](#method-i-matched?)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    matched? -> true or false

Returns `true` of the most recent [match [attempt]](17) was successful,
`false` otherwise; see [Basic Matched [Values]](18):

```rb scanner = StringScanner.new('foobarbaz') scanner.matched?       # =>
false scanner.pos = 3 scanner.exist?(/baz/)  # => 6 scanner.matched?       #
=> true scanner.exist?(/nope/) # => nil scanner.matched?       # => false ```

**@return** [Boolean] 

## matched_size() [](#method-i-matched_size)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    matched_size -> substring_size or nil

Returns the size (in bytes) of the matched substring from the most recent
match [match [attempt]](17) if it was successful, or `nil` otherwise; see
[Basic Matched [Values]](18):

```rb scanner = StringScanner.new('foobarbaz') scanner.matched_size   # => nil

pos = 3 scanner.exist?(/baz/)  # => 9 scanner.matched_size   # => 3

scanner.exist?(/nope/) # => nil scanner.matched_size   # => nil ```

## named_captures() [](#method-i-named_captures)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    named_captures -> hash

Returns the array of captured match values at indexes (1..) if the most recent
match attempt succeeded, or nil otherwise; see [Captured Match [Values]](13):

```rb scanner = StringScanner.new('Fri Dec 12 1975 14:39')
scanner.named_captures # => {}

pattern = /(?<wday>w+) (?<month>w+) (?<day>d+) / scanner.match?(pattern)
scanner.named_captures # => {"wday"=>"Fri", "month"=>"Dec", "day"=>"12"}

scanner.string = 'nope' scanner.match?(pattern) scanner.named_captures # =>
{"wday"=>nil, "month"=>nil, "day"=>nil}

scanner.match?(/nosuch/) scanner.named_captures # => {} ```

## peek(vlen) [](#method-i-peek)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    peek(length) -> substring

Returns the substring `string[pos, length]`; does not update [match
[values]](9) or [[positions]](11):

```rb scanner = StringScanner.new('foobarbaz') scanner.pos = 3 scanner.peek(3)
  # => "bar" scanner.terminate scanner.peek(3)   # => "" ```

## peek_byte() [](#method-i-peek_byte)
Peeks at the current byte and returns it as an integer.

    s = StringScanner.new('ab')
    s.peek_byte         # => 97

## peep(vlen) [](#method-i-peep)
:nodoc:

## pointer() [](#method-i-pointer)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/get_pos.md

## pointer=(v) [](#method-i-pointer=)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/set_pos.md

## pos() [](#method-i-pos)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/get_pos.md

## pos=(v) [](#method-i-pos=)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/set_pos.md

## post_match() [](#method-i-post_match)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    post_match -> substring

Returns the substring that follows the matched substring from the most recent
match attempt if it was successful, or `nil` otherwise; see [Basic Match
[Values]](18):

```rb scanner = StringScanner.new('foobarbaz') scanner.post_match     # => nil

scanner.pos = 3 scanner.match?(/bar/)  # => 3 scanner.post_match     # =>
"baz"

scanner.match?(/nope/) # => nil scanner.post_match     # => nil ```

## pre_match() [](#method-i-pre_match)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    pre_match -> substring

Returns the substring that precedes the matched substring from the most recent
match attempt if it was successful, or `nil` otherwise; see [Basic Match
[Values]](18):

```rb scanner = StringScanner.new('foobarbaz') scanner.pre_match      # => nil

scanner.pos = 3 scanner.exist?(/baz/)  # => 6 scanner.pre_match      # =>
"foobar" # Substring of entire string, not just target string.

scanner.exist?(/nope/) # => nil scanner.pre_match      # => nil ```

## reset() [](#method-i-reset)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    reset -> self

Sets both [byte [position]](2) and [character [position]](7) to zero, and
clears [match [values]](9); returns `self`:

```rb scanner = StringScanner.new('foobarbaz') scanner.exist?(/bar/)         
# => 6 scanner.reset                  # => #<StringScanner 0/9 @ "fooba...">
put_situation(scanner) # Situation: #   pos:       0 #   charpos:   0 #  
rest:      "foobarbaz" #   rest_size: 9 # => nil
match_values_cleared?(scanner) # => true ```

## rest() [](#method-i-rest)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    rest -> target_substring

Returns the 'rest' of the [stored [string]](1) (all after the current
[[position]](2)), which is the [target [substring]](3):

```rb scanner = StringScanner.new('foobarbaz') scanner.rest # => "foobarbaz"
scanner.pos = 3 scanner.rest # => "barbaz" scanner.terminate scanner.rest # =>
"" ```

## rest?() [](#method-i-rest?)
:nodoc:

**@return** [Boolean] 

## rest_size() [](#method-i-rest_size)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    rest_size -> integer

Returns the size (in bytes) of the #rest of the [stored [string]](1):

```rb scanner = StringScanner.new('foobarbaz') scanner.rest      # =>
"foobarbaz" scanner.rest_size # => 9 scanner.pos = 3 scanner.rest      # =>
"barbaz" scanner.rest_size # => 6 scanner.terminate scanner.rest      # => ""
scanner.rest_size # => 0 ```

## restsize() [](#method-i-restsize)
:nodoc:

## scan(re) [](#method-i-scan)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/scan.md

## scan_byte() [](#method-i-scan_byte)
Scans one byte and returns it as an integer. This method is not multibyte
character sensitive. See also: #getch.

**@overload** [] 

## scan_full(re, s, f) [](#method-i-scan_full)
:nodoc:

## scan_integer(base:10) [](#method-i-scan_integer)
call-seq:
    scan_integer(base: 10)

If `base` isn't provided or is `10`, then it is equivalent to calling `#scan`
with a `[+-]?d+` pattern, and returns an Integer or nil.

If `base` is `16`, then it is equivalent to calling `#scan` with a
`[+-]?([0x)?](0-9a-fA-F)+` pattern, and returns an Integer or nil.

The scanned string must be encoded with an ASCII compatible encoding,
otherwise Encoding::CompatibilityError will be raised.

## scan_until(re) [](#method-i-scan_until)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/scan_until.md

## search_full(re, s, f) [](#method-i-search_full)
:nodoc:

## size() [](#method-i-size)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    size -> captures_count

Returns the count of captures if the most recent match attempt succeeded,
`nil` otherwise; see [Captures Match [Values]](13):

```rb scanner = StringScanner.new('Fri Dec 12 1975 14:39') scanner.size       
                # => nil

pattern = /(?<wday>w+) (?<month>w+) (?<day>d+) / scanner.match?(pattern)
scanner.values_at(*0..scanner.size) # => ["Fri Dec 12 ", "Fri", "Dec", "12",
nil] scanner.size                        # => 4

scanner.match?(/nope/)              # => nil scanner.size                     
  # => nil ```

## skip(re) [](#method-i-skip)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/skip.md

## skip_until(re) [](#method-i-skip_until)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/skip_until.md

## string() [](#method-i-string)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    string -> stored_string

Returns the [stored [string]](1):

```rb scanner = StringScanner.new('foobar') scanner.string # => "foobar"
scanner.concat('baz') scanner.string # => "foobarbaz" ```

## string=(str) [](#method-i-string=)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    string = other_string -> other_string

Replaces the [stored [string]](1) with the given `other_string`:

*   Sets both [[positions]](11) to zero.
*   Clears [match [values]](9).
*   Returns `other_string`.

```rb scanner = StringScanner.new('foobar') scanner.scan(/foo/)
put_situation(scanner) # Situation: #   pos:       3 #   charpos:   3 #  
rest:      "bar" #   rest_size: 3 match_values_cleared?(scanner) # => false

scanner.string = 'baz'         # => "baz" put_situation(scanner) # Situation:
#   pos:       0 #   charpos:   0 #   rest:      "baz" #   rest_size: 3
match_values_cleared?(scanner) # => true ```

## terminate() [](#method-i-terminate)
:markup: markdown :include: strscan/link_refs.txt :include:
strscan/methods/terminate.md

## unscan() [](#method-i-unscan)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    unscan -> self

Sets the [[position]](2) to its value previous to the recent successful
match][17
:   attempt:


```rb scanner = StringScanner.new('foobarbaz') scanner.scan(/foo/)
put_situation(scanner) # Situation: #   pos:       3 #   charpos:   3 #  
rest:      "barbaz" #   rest_size: 6 scanner.unscan # => #<StringScanner 0/9 @
"fooba..."> put_situation(scanner) # Situation: #   pos:       0 #   charpos: 
 0 #   rest:      "foobarbaz" #   rest_size: 9 ```

Raises an exception if match values are clear:

```rb scanner.scan(/nope/)           # => nil match_values_cleared?(scanner) #
=> true scanner.unscan                 # Raises StringScanner::Error. ```

## values_at(*args) [](#method-i-values_at)
:markup: markdown :include: strscan/link_refs.txt

call-seq:
    values_at(*specifiers) -> array_of_captures or nil

Returns an array of captured substrings, or `nil` of none.

For each `specifier`, the returned substring is `[specifier]`; see #[].

```rb scanner = StringScanner.new('Fri Dec 12 1975 14:39') pattern =
/(?<wday>w+) (?<month>w+) (?<day>d+) / scanner.match?(pattern)
scanner.values_at(*0..3)               # => ["Fri Dec 12 ", "Fri", "Dec",
"12"] scanner.values_at(*%i[wday month day]) # => ["Fri", "Dec", "12"] ```

