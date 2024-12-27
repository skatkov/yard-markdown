# Class: MatchData
**Inherits:** Object
    

:nodoc:



#Instance Methods
## ==(match2) [](#method-i-==)
Returns `true` if `object` is another MatchData object whose target string,
regexp, match, and captures are the same as `self`, `false` otherwise.

**@overload** [] 

## [](*args) [](#method-i-[])
When arguments `index`, +start and `length`, or `range` are given, returns
match and captures in the style of Array#[]:

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m[0] # => "HX1138"
    m[1, 2]  # => ["H", "X"]
    m[1..3]  # => ["H", "X", "113"]
    m[-3, 2] # => ["X", "113"]

When string or symbol argument `name` is given, returns the matched substring
for the given name:

    m = /(?<foo>.)(.)(?<bar>.+)/.match("hoge")
    # => #<MatchData "hoge" foo:"h" bar:"ge">
    m['foo'] # => "h"
    m[:bar]  # => "ge"

If multiple captures have the same name, returns the last matched substring.

    m = /(?<foo>.)(?<foo>.+)/.match("hoge")
    # => #<MatchData "hoge" foo:"h" foo:"oge">
    m[:foo] #=> "oge"

    m = /\W(?<foo>.+)|\w(?<foo>.+)|(?<foo>.+)/.match("hoge")
    #<MatchData "hoge" foo:nil foo:"oge" foo:nil>
    m[:foo] #=> "oge"

**@overload** [] 

**@overload** [] 

**@overload** [] 

**@overload** [] 

## begin(n) [](#method-i-begin)
:include: doc/matchdata/begin.rdoc

**@overload** [] 

**@overload** [] 

## bytebegin(n) [](#method-i-bytebegin)
:include: doc/matchdata/bytebegin.rdoc

**@overload** [] 

**@overload** [] 

## byteend(n) [](#method-i-byteend)
:include: doc/matchdata/byteend.rdoc

**@overload** [] 

**@overload** [] 

## byteoffset(n) [](#method-i-byteoffset)
Returns a two-element array containing the beginning and ending byte-based
offsets of the *n*th match. *n* can be a string or symbol to reference a named
capture.

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    m.byteoffset(0)      #=> [1, 7]
    m.byteoffset(4)      #=> [6, 7]

    m = /(?<foo>.)(.)(?<bar>.)/.match("hoge")
    p m.byteoffset(:foo) #=> [0, 1]
    p m.byteoffset(:bar) #=> [2, 3]

**@overload** [] 

## captures() [](#method-i-captures)
Returns the array of captures, which are all matches except `m[0]`:

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m[0]       # => "HX1138"
    m.captures # => ["H", "X", "113", "8"]

Related: MatchData.to_a.

**@overload** [] 

## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Returns a hash of the named captures for the given names.

    m = /(?<hours>\d{2}):(?<minutes>\d{2}):(?<seconds>\d{2})/.match("18:37:22")
    m.deconstruct_keys([:hours, :minutes]) # => {:hours => "18", :minutes => "37"}
    m.deconstruct_keys(nil) # => {:hours => "18", :minutes => "37", :seconds => "22"}

Returns an empty hash if no named captures were defined:

    m = /(\d{2}):(\d{2}):(\d{2})/.match("18:37:22")
    m.deconstruct_keys(nil) # => {}

**@overload** [] 

## end(n) [](#method-i-end)
:include: doc/matchdata/end.rdoc

**@overload** [] 

**@overload** [] 

## eql?(match2) [](#method-i-eql?)
Returns `true` if `object` is another MatchData object whose target string,
regexp, match, and captures are the same as `self`, `false` otherwise.

**@overload** [] 

## hash() [](#method-i-hash)
Returns the integer hash value for `self`, based on the target string, regexp,
match, and captures.

See also Object#hash.

**@overload** [] 

## initialize_copy(orig) [](#method-i-initialize_copy)
:nodoc:

## inspect() [](#method-i-inspect)
Returns a string representation of `self`:

    m = /.$/.match("foo")
    # => #<MatchData "o">
    m.inspect # => "#<MatchData \"o\">"

    m = /(.)(.)(.)/.match("foo")
    # => #<MatchData "foo" 1:"f" 2:"o" 3:"o">
    m.inspect # => "#<MatchData \"foo\" 1:\"f\" 2:\"o\

    m = /(.)(.)?(.)/.match("fo")
    # => #<MatchData "fo" 1:"f" 2:nil 3:"o">
    m.inspect # => "#<MatchData \"fo\" 1:\"f\" 2:nil 3:\"o\">"

Related: MatchData#to_s.

**@overload** [] 

## length() [](#method-i-length)
Returns size of the match array:

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m.size # => 5

**@overload** [] 

## match(n) [](#method-i-match)
Returns the matched substring corresponding to the given argument.

When non-negative argument `n` is given, returns the matched substring for the
`n`th match:

    m = /(.)(.)(\d+)(\d)(\w)?/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8" 5:nil>
    m.match(0) # => "HX1138"
    m.match(4) # => "8"
    m.match(5) # => nil

When string or symbol argument `name` is given, returns the matched substring
for the given name:

    m = /(?<foo>.)(.)(?<bar>.+)/.match("hoge")
    # => #<MatchData "hoge" foo:"h" bar:"ge">
    m.match('foo') # => "h"
    m.match(:bar)  # => "ge"

**@overload** [] 

**@overload** [] 

## match_length(n) [](#method-i-match_length)
Returns the length (in characters) of the matched substring corresponding to
the given argument.

When non-negative argument `n` is given, returns the length of the matched
substring for the `n`th match:

    m = /(.)(.)(\d+)(\d)(\w)?/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8" 5:nil>
    m.match_length(0) # => 6
    m.match_length(4) # => 1
    m.match_length(5) # => nil

When string or symbol argument `name` is given, returns the length of the
matched substring for the named match:

    m = /(?<foo>.)(.)(?<bar>.+)/.match("hoge")
    # => #<MatchData "hoge" foo:"h" bar:"ge">
    m.match_length('foo') # => 1
    m.match_length(:bar)  # => 2

**@overload** [] 

**@overload** [] 

## named_captures(*args) [](#method-i-named_captures)
Returns a hash of the named captures; each key is a capture name; each value
is its captured string or `nil`:

    m = /(?<foo>.)(.)(?<bar>.+)/.match("hoge")
    # => #<MatchData "hoge" foo:"h" bar:"ge">
    m.named_captures # => {"foo"=>"h", "bar"=>"ge"}

    m = /(?<a>.)(?<b>.)/.match("01")
    # => #<MatchData "01" a:"0" b:"1">
    m.named_captures #=> {"a" => "0", "b" => "1"}

    m = /(?<a>.)(?<b>.)?/.match("0")
    # => #<MatchData "0" a:"0" b:nil>
    m.named_captures #=> {"a" => "0", "b" => nil}

    m = /(?<a>.)(?<a>.)/.match("01")
    # => #<MatchData "01" a:"0" a:"1">
    m.named_captures #=> {"a" => "1"}

If keyword argument `symbolize_names` is given a true value, the keys in the
resulting hash are Symbols:

    m = /(?<a>.)(?<a>.)/.match("01")
    # => #<MatchData "01" a:"0" a:"1">
    m.named_captures(symbolize_names: true) #=> {:a => "1"}

**@overload** [] 

## names() [](#method-i-names)
Returns an array of the capture names (see [Named
Captures](rdoc-ref:Regexp@Named+Captures)):

    m = /(?<foo>.)(?<bar>.)(?<baz>.)/.match("hoge")
    # => #<MatchData "hog" foo:"h" bar:"o" baz:"g">
    m.names # => ["foo", "bar", "baz"]

    m = /foo/.match('foo') # => #<MatchData "foo">
    m.names # => [] # No named captures.

Equivalent to:

    m = /(?<foo>.)(?<bar>.)(?<baz>.)/.match("hoge")
    m.regexp.names # => ["foo", "bar", "baz"]

**@overload** [] 

## offset(n) [](#method-i-offset)
:include: doc/matchdata/offset.rdoc

**@overload** [] 

**@overload** [] 

## post_match() [](#method-i-post_match)
Returns the substring of the target string from the end of the first match in
`self` (that is, `self[0]`) to the end of the string; equivalent to regexp
global variable `$'`:

    m = /(.)(.)(\d+)(\d)/.match("THX1138: The Movie")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m[0]         # => "HX1138"
    m.post_match # => ": The Movie"\

Related: MatchData.pre_match.

**@overload** [] 

## pre_match() [](#method-i-pre_match)
Returns the substring of the target string from its beginning up to the first
match in `self` (that is, `self[0]`); equivalent to regexp global variable
`$``:

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m[0]        # => "HX1138"
    m.pre_match # => "T"

Related: MatchData#post_match.

**@overload** [] 

## pretty_print(q) [](#method-i-pretty_print)
:nodoc:

## regexp() [](#method-i-regexp)
Returns the regexp that produced the match:

    m = /a.*b/.match("abc") # => #<MatchData "ab">
    m.regexp                # => /a.*b/

**@overload** [] 

## size() [](#method-i-size)
Returns size of the match array:

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m.size # => 5

**@overload** [] 

## string() [](#method-i-string)
Returns the target string if it was frozen; otherwise, returns a frozen copy
of the target string:

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m.string # => "THX1138."

**@overload** [] 

## to_a() [](#method-i-to_a)
Returns the array of matches:

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m.to_a # => ["HX1138", "H", "X", "113", "8"]

Related: MatchData#captures.

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns the matched string:

    m = /(.)(.)(\d+)(\d)/.match("THX1138.")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m.to_s # => "HX1138"

    m = /(?<foo>.)(.)(?<bar>.+)/.match("hoge")
    # => #<MatchData "hoge" foo:"h" bar:"ge">
    m.to_s # => "hoge"

Related: MatchData.inspect.

**@overload** [] 

## values_at(*args) [](#method-i-values_at)
Returns match and captures at the given `indexes`, which may include any
mixture of:

*   Integers.
*   Ranges.
*   Names (strings and symbols).

Examples:

    m = /(.)(.)(\d+)(\d)/.match("THX1138: The Movie")
    # => #<MatchData "HX1138" 1:"H" 2:"X" 3:"113" 4:"8">
    m.values_at(0, 2, -2) # => ["HX1138", "X", "113"]
    m.values_at(1..2, -1) # => ["H", "X", "8"]

    m = /(?<a>\d+) *(?<op>[+\-*\/]) *(?<b>\d+)/.match("1 + 2")
    # => #<MatchData "1 + 2" a:"1" op:"+" b:"2">
    m.values_at(0, 1..2, :a, :b, :op)
    # => ["1 + 2", "1", "+", "1", "2", "+"]

**@overload** [] 

