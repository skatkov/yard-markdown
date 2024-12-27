# Class: Regexp
**Inherits:** Object
    

:include: doc/_regexp.rdoc


# Class Methods
## compile() [](#method-c-compile)
Alias for Regexp.new
## escape(str ) [](#method-c-escape)
Returns a new string that escapes any characters that have special meaning in
a regular expression:

    s = Regexp.escape('\*?{}.')      # => "\\\\\\*\\?\\{\\}\\."

For any string `s`, this call returns a MatchData object:

    r = Regexp.new(Regexp.escape(s)) # => /\\\\\\\*\\\?\\\{\\\}\\\./
    r.match(s)                       # => #<MatchData "\\\\\\*\\?\\{\\}\\.">
**@overload** [] 

## json_create(object ) [](#method-c-json_create)
See #as_json.
## last_match(*args ) [](#method-c-last_match)
With no argument, returns the value of `$~`, which is the result of the most
recent pattern match (see [Regexp global
variables](rdoc-ref:Regexp@Global+Variables)):

    /c(.)t/ =~ 'cat'  # => 0
    Regexp.last_match # => #<MatchData "cat" 1:"a">
    /a/ =~ 'foo'      # => nil
    Regexp.last_match # => nil

With non-negative integer argument `n`, returns the _n_th field in the
matchdata, if any, or nil if none:

    /c(.)t/ =~ 'cat'     # => 0
    Regexp.last_match(0) # => "cat"
    Regexp.last_match(1) # => "a"
    Regexp.last_match(2) # => nil

With negative integer argument `n`, counts backwards from the last field:

    Regexp.last_match(-1)       # => "a"

With string or symbol argument `name`, returns the string value for the named
capture, if any:

    /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ 'var = val'
    Regexp.last_match        # => #<MatchData "var = val" lhs:"var"rhs:"val">
    Regexp.last_match(:lhs)  # => "var"
    Regexp.last_match('rhs') # => "val"
    Regexp.last_match('foo') # Raises IndexError.
**@overload** [] 

**@overload** [] 

**@overload** [] 

## linear_time?(*args ) [](#method-c-linear_time?)
Returns `true` if matching against `re` can be done in linear time to the
input string.

    Regexp.linear_time?(/re/) # => true

Note that this is a property of the ruby interpreter, not of the argument
regular expression.  Identical regexp can or cannot run in linear time
depending on your ruby binary.  Neither forward nor backward compatibility is
guaranteed about the return value of this method.  Our current algorithm is
(*1) but this is subject to change in the future.  Alternative implementations
can also behave differently.  They might always return false for everything.

(*1): https://doi.org/10.1109/SP40001.2021.00032
**@overload** [] 

**@overload** [] 

**@return** [Boolean] 

## quote(str ) [](#method-c-quote)
Returns a new string that escapes any characters that have special meaning in
a regular expression:

    s = Regexp.escape('\*?{}.')      # => "\\\\\\*\\?\\{\\}\\."

For any string `s`, this call returns a MatchData object:

    r = Regexp.new(Regexp.escape(s)) # => /\\\\\\\*\\\?\\\{\\\}\\\./
    r.match(s)                       # => #<MatchData "\\\\\\*\\?\\{\\}\\.">
**@overload** [] 

## timeout() [](#method-c-timeout)
It returns the current default timeout interval for Regexp matching in second.
`nil` means no default timeout configuration.
**@overload** [] 

## timeout=(timeout ) [](#method-c-timeout=)
It sets the default timeout interval for Regexp matching in second. `nil`
means no default timeout configuration. This configuration is process-global.
If you want to set timeout for each Regexp, use `timeout` keyword for
`Regexp.new`.

    Regexp.timeout = 1
    /^a*b?a*$/ =~ "a" * 100000 + "x" #=> regexp match timeout (RuntimeError)
**@overload** [] 

## try_convert(re ) [](#method-c-try_convert)
Returns `object` if it is a regexp:

    Regexp.try_convert(/re/) # => /re/

Otherwise if `object` responds to `:to_regexp`, calls `object.to_regexp` and
returns the result.

Returns `nil` if `object` does not respond to `:to_regexp`.

    Regexp.try_convert('re') # => nil

Raises an exception unless `object.to_regexp` returns a regexp.
**@overload** [] 

## union(args ) [](#method-c-union)
Returns a new regexp that is the union of the given patterns:

    r = Regexp.union(%w[cat dog])      # => /cat|dog/
    r.match('cat')      # => #<MatchData "cat">
    r.match('dog')      # => #<MatchData "dog">
    r.match('cog')      # => nil

For each pattern that is a string, `Regexp.new(pattern)` is used:

    Regexp.union('penzance')             # => /penzance/
    Regexp.union('a+b*c')                # => /a\+b\*c/
    Regexp.union('skiing', 'sledding')   # => /skiing|sledding/
    Regexp.union(['skiing', 'sledding']) # => /skiing|sledding/

For each pattern that is a regexp, it is used as is, including its flags:

    Regexp.union(/foo/i, /bar/m, /baz/x)
    # => /(?i-mx:foo)|(?m-ix:bar)|(?x-mi:baz)/
    Regexp.union([/foo/i, /bar/m, /baz/x])
    # => /(?i-mx:foo)|(?m-ix:bar)|(?x-mi:baz)/

With no arguments, returns `/(?!)/`:

    Regexp.union # => /(?!)/

If any regexp pattern contains captures, the behavior is unspecified.
**@overload** [] 

**@overload** [] 


#Instance Methods
## ==(re2) [](#method-i-==)
Returns `true` if `object` is another Regexp whose pattern, flags, and
encoding are the same as `self`, `false` otherwise:

    /foo/ == Regexp.new('foo')                          # => true
    /foo/ == /foo/i                                     # => false
    /foo/ == Regexp.new('food')                         # => false
    /foo/ == Regexp.new("abc".force_encoding("euc-jp")) # => false

**@overload** [] 

## ===(str) [](#method-i-===)
Returns `true` if `self` finds a match in `string`:

    /^[a-z]*$/ === 'HELLO' # => false
    /^[A-Z]*$/ === 'HELLO' # => true

This method is called in case statements:

    s = 'HELLO'
    case s
    when /\A[a-z]*\z/; print "Lower case\n"
    when /\A[A-Z]*\z/; print "Upper case\n"
    else               print "Mixed case\n"
    end # => "Upper case"

**@overload** [] 

## =~(str) [](#method-i-=~)
Returns the integer index (in characters) of the first match for `self` and
`string`, or `nil` if none; also sets the [rdoc-ref:Regexp global
variables](rdoc-ref:Regexp@Global+Variables):

    /at/ =~ 'input data' # => 7
    $~                   # => #<MatchData "at">
    /ax/ =~ 'input data' # => nil
    $~                   # => nil

Assigns named captures to local variables of the same names if and only if
`self`:

*   Is a regexp literal; see [Regexp
    Literals](rdoc-ref:syntax/literals.rdoc@Regexp+Literals).
*   Does not contain interpolations; see [Regexp
    interpolation](rdoc-ref:Regexp@Interpolation+Mode).
*   Is at the left of the expression.

Example:

    /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ '  x = y  '
    p lhs # => "x"
    p rhs # => "y"

Assigns `nil` if not matched:

    /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ '  x = '
    p lhs # => nil
    p rhs # => nil

Does not make local variable assignments if `self` is not a regexp literal:

    r = /(?<foo>\w+)\s*=\s*(?<foo>\w+)/
    r =~ '  x = y  '
    p foo # Undefined local variable
    p bar # Undefined local variable

The assignment does not occur if the regexp is not at the left:

    '  x = y  ' =~ /(?<foo>\w+)\s*=\s*(?<foo>\w+)/
    p foo, foo # Undefined local variables

A regexp interpolation, `#{}`, also disables the assignment:

    r = /(?<foo>\w+)/
    /(?<foo>\w+)\s*=\s*#{r}/ =~ 'x = y'
    p foo # Undefined local variable

**@overload** [] 

## as_json() [](#method-i-as_json)
Methods `Regexp#as_json` and `Regexp.json_create` may be used to serialize and
deserialize a Regexp object; see [Marshal](rdoc-ref:Marshal).

Method `Regexp#as_json` serializes `self`, returning a 2-element hash
representing `self`:

    require 'json/add/regexp'
    x = /foo/.as_json
    # => {"json_class"=>"Regexp", "o"=>0, "s"=>"foo"}

Method `JSON.create` deserializes such a hash, returning a Regexp object:

    Regexp.json_create(x) # => /foo/

## casefold?() [](#method-i-casefold?)
Returns `true` if the case-insensitivity flag in `self` is set, `false`
otherwise:

    /a/.casefold?           # => false
    /a/i.casefold?          # => true
    /(?i:a)/.casefold?      # => false

**@overload** [] 

**@return** [Boolean] 

## encoding() [](#method-i-encoding)

## eql?(re2) [](#method-i-eql?)
Returns `true` if `object` is another Regexp whose pattern, flags, and
encoding are the same as `self`, `false` otherwise:

    /foo/ == Regexp.new('foo')                          # => true
    /foo/ == /foo/i                                     # => false
    /foo/ == Regexp.new('food')                         # => false
    /foo/ == Regexp.new("abc".force_encoding("euc-jp")) # => false

**@overload** [] 

## fixed_encoding?() [](#method-i-fixed_encoding?)
Returns `false` if `self` is applicable to a string with any ASCII-compatible
encoding; otherwise returns `true`:

    r = /a/                                          # => /a/
    r.fixed_encoding?                               # => false
    r.match?("\u{6666} a")                          # => true
    r.match?("\xa1\xa2 a".force_encoding("euc-jp")) # => true
    r.match?("abc".force_encoding("euc-jp"))        # => true

    r = /a/u                                        # => /a/
    r.fixed_encoding?                               # => true
    r.match?("\u{6666} a")                          # => true
    r.match?("\xa1\xa2".force_encoding("euc-jp"))   # Raises exception.
    r.match?("abc".force_encoding("euc-jp"))        # => true

    r = /\u{6666}/                                  # => /\u{6666}/
    r.fixed_encoding?                               # => true
    r.encoding                                      # => #<Encoding:UTF-8>
    r.match?("\u{6666} a")                          # => true
    r.match?("\xa1\xa2".force_encoding("euc-jp"))   # Raises exception.
    r.match?("abc".force_encoding("euc-jp"))        # => false

**@overload** [] 

## hash() [](#method-i-hash)
Returns the integer hash value for `self`.

Related: Object#hash.

**@overload** [] 

## initialize(*args) [](#method-i-initialize)
With argument `string` given, returns a new regexp with the given string and
options:

    r = Regexp.new('foo') # => /foo/
    r.source              # => "foo"
    r.options             # => 0

Optional argument `options` is one of the following:

*   A String of options:

        Regexp.new('foo', 'i')  # => /foo/i
        Regexp.new('foo', 'im') # => /foo/im

*   The bit-wise OR of one or more of the constants Regexp::EXTENDED,
    Regexp::IGNORECASE, Regexp::MULTILINE, and Regexp::NOENCODING:

        Regexp.new('foo', Regexp::IGNORECASE) # => /foo/i
        Regexp.new('foo', Regexp::EXTENDED)   # => /foo/x
        Regexp.new('foo', Regexp::MULTILINE)  # => /foo/m
        Regexp.new('foo', Regexp::NOENCODING)  # => /foo/n
        flags = Regexp::IGNORECASE | Regexp::EXTENDED |  Regexp::MULTILINE
        Regexp.new('foo', flags)              # => /foo/mix

*   `nil` or `false`, which is ignored.
*   Any other truthy value, in which case the regexp will be case-insensitive.

If optional keyword argument `timeout` is given, its float value overrides the
timeout interval for the class, Regexp.timeout. If `nil` is passed as
+timeout, it uses the timeout interval for the class, Regexp.timeout.

With argument `regexp` given, returns a new regexp. The source, options,
timeout are the same as `regexp`. `options` and `n_flag` arguments are
ineffective.  The timeout can be overridden by `timeout` keyword.

    options = Regexp::MULTILINE
    r = Regexp.new('foo', options, timeout: 1.1) # => /foo/m
    r2 = Regexp.new(r)                           # => /foo/m
    r2.timeout                                   # => 1.1
    r3 = Regexp.new(r, timeout: 3.14)            # => /foo/m
    r3.timeout                                   # => 3.14

**@overload** [] 

**@overload** [] 

## initialize_copy(re) [](#method-i-initialize_copy)
:nodoc:

## inspect() [](#method-i-inspect)
Returns a nicely-formatted string representation of `self`:

    /ab+c/ix.inspect # => "/ab+c/ix"

Related: Regexp#to_s.

**@overload** [] 

## match(*args) [](#method-i-match)
With no block given, returns the MatchData object that describes the match, if
any, or `nil` if none; the search begins at the given character `offset` in
`string`:

    /abra/.match('abracadabra')      # => #<MatchData "abra">
    /abra/.match('abracadabra', 4)   # => #<MatchData "abra">
    /abra/.match('abracadabra', 8)   # => nil
    /abra/.match('abracadabra', 800) # => nil

    string = "\u{5d0 5d1 5e8 5d0}cadabra"
    /abra/.match(string, 7)          #=> #<MatchData "abra">
    /abra/.match(string, 8)          #=> nil
    /abra/.match(string.b, 8)        #=> #<MatchData "abra">

With a block given, calls the block if and only if a match is found; returns
the block's value:

    /abra/.match('abracadabra') {|matchdata| p matchdata }
    # => #<MatchData "abra">
    /abra/.match('abracadabra', 4) {|matchdata| p matchdata }
    # => #<MatchData "abra">
    /abra/.match('abracadabra', 8) {|matchdata| p matchdata }
    # => nil
    /abra/.match('abracadabra', 8) {|marchdata| fail 'Cannot happen' }
    # => nil

Output (from the first two blocks above):

    #<MatchData "abra">
    #<MatchData "abra">

     /(.)(.)(.)/.match("abc")[2] # => "b"
     /(.)(.)/.match("abc", 1)[2] # => "c"

**@overload** [] 

**@overload** [] 

## match?(*args) [](#method-i-match?)
Returns `true` or `false` to indicate whether the regexp is matched or not
without updating $~ and other related variables. If the second parameter is
present, it specifies the position in the string to begin the search.

    /R.../.match?("Ruby")    # => true
    /R.../.match?("Ruby", 1) # => false
    /P.../.match?("Ruby")    # => false
    $&                       # => nil

**@overload** [] 

**@overload** [] 

## named_captures() [](#method-i-named_captures)
Returns a hash representing named captures of `self` (see [Named
Captures](rdoc-ref:Regexp@Named+Captures)):

*   Each key is the name of a named capture.
*   Each value is an array of integer indexes for that named capture.

Examples:

    /(?<foo>.)(?<bar>.)/.named_captures # => {"foo"=>[1], "bar"=>[2]}
    /(?<foo>.)(?<foo>.)/.named_captures # => {"foo"=>[1, 2]}
    /(.)(.)/.named_captures             # => {}

**@overload** [] 

## names() [](#method-i-names)
Returns an array of names of captures (see [Named
Captures](rdoc-ref:Regexp@Named+Captures)):

    /(?<foo>.)(?<bar>.)(?<baz>.)/.names # => ["foo", "bar", "baz"]
    /(?<foo>.)(?<foo>.)/.names          # => ["foo"]
    /(.)(.)/.names                      # => []

**@overload** [] 

## options() [](#method-i-options)
Returns an integer whose bits show the options set in `self`.

The option bits are:

    Regexp::IGNORECASE # => 1
    Regexp::EXTENDED   # => 2
    Regexp::MULTILINE  # => 4

Examples:

    /foo/.options    # => 0
    /foo/i.options   # => 1
    /foo/x.options   # => 2
    /foo/m.options   # => 4
    /foo/mix.options # => 7

Note that additional bits may be set in the returned integer; these are
maintained internally in `self`, are ignored if passed to Regexp.new, and may
be ignored by the caller:

Returns the set of bits corresponding to the options used when creating this
regexp (see Regexp::new for details). Note that additional bits may be set in
the returned options: these are used internally by the regular expression
code. These extra bits are ignored if the options are passed to Regexp::new:

    r = /\xa1\xa2/e                 # => /\xa1\xa2/
    r.source                        # => "\\xa1\\xa2"
    r.options                       # => 16
    Regexp.new(r.source, r.options) # => /\xa1\xa2/

**@overload** [] 

## source() [](#method-i-source)
Returns the original string of `self`:

    /ab+c/ix.source # => "ab+c"

Regexp escape sequences are retained:

    /\x20\+/.source  # => "\\x20\\+"

Lexer escape characters are not retained:

    /\//.source  # => "/"

**@overload** [] 

## timeout() [](#method-i-timeout)
It returns the timeout interval for Regexp matching in second. `nil` means no
default timeout configuration.

This configuration is per-object. The global configuration set by
Regexp.timeout= is ignored if per-object configuration is set.

    re = Regexp.new("^a*b?a*$", timeout: 1)
    re.timeout               #=> 1.0
    re =~ "a" * 100000 + "x" #=> regexp match timeout (RuntimeError)

**@overload** [] 

## to_json(*args) [](#method-i-to_json)
Returns a JSON string representing `self`:

    require 'json/add/regexp'
    puts /foo/.to_json

Output:

    {"json_class":"Regexp","o":0,"s":"foo"}

## to_s() [](#method-i-to_s)
Returns a string showing the options and string of `self`:

    r0 = /ab+c/ix
    s0 = r0.to_s # => "(?ix-m:ab+c)"

The returned string may be used as an argument to Regexp.new, or as
interpolated text for a [Regexp
interpolation](rdoc-ref:Regexp@Interpolation+Mode):

    r1 = Regexp.new(s0) # => /(?ix-m:ab+c)/
    r2 = /#{s0}/        # => /(?ix-m:ab+c)/

Note that `r1` and `r2` are not equal to `r0` because their original strings
are different:

    r0 == r1  # => false
    r0.source # => "ab+c"
    r1.source # => "(?ix-m:ab+c)"

Related: Regexp#inspect.

**@overload** [] 

## ~() [](#method-i-~)
Equivalent to *`rxp* =~ $_`:

    $_ = "input data"
    ~ /at/ # => 7

**@overload** [] 

