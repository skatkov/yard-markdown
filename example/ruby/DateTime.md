# Class: DateTime
**Inherits:** Date
    



# Class Methods
## _strptime(*args ) [](#method-c-_strptime)
Parses the given representation of date and time with the given template, and
returns a hash of parsed elements.  _strptime does not support specification
of flags and width unlike strftime.

See also strptime(3) and #strftime.
**@overload** [] 

## civil(*args ) [](#method-c-civil)
Same as DateTime.new.
## commercial(*args ) [](#method-c-commercial)
Creates a DateTime object denoting the given week date.

    DateTime.commercial(2001)	#=> #<DateTime: 2001-01-01T00:00:00+00:00 ...>
    DateTime.commercial(2002)	#=> #<DateTime: 2001-12-31T00:00:00+00:00 ...>
    DateTime.commercial(2001,5,6,4,5,6,'+7')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
**@overload** [] 

## httpdate(*args ) [](#method-c-httpdate)
Creates a new DateTime object by parsing from a string according to some RFC
2616 format.

    DateTime.httpdate('Sat, 03 Feb 2001 04:05:06 GMT')

			#=> #<DateTime: 2001-02-03T04:05:06+00:00 ...>

Raise an ArgumentError when the string length is longer than *limit*. You can
stop this check by passing `limit: nil`, but note that it may take a long time
to parse.
**@overload** [] 

## iso8601(*args ) [](#method-c-iso8601)
Creates a new DateTime object by parsing from a string according to some
typical ISO 8601 formats.

    DateTime.iso8601('2001-02-03T04:05:06+07:00')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.iso8601('20010203T040506+0700')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.iso8601('2001-W05-6T04:05:06+07:00')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>

Raise an ArgumentError when the string length is longer than *limit*. You can
stop this check by passing `limit: nil`, but note that it may take a long time
to parse.
**@overload** [] 

## jd(*args ) [](#method-c-jd)
Creates a DateTime object denoting the given chronological Julian day number.

    DateTime.jd(2451944)	#=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>
    DateTime.jd(2451945)	#=> #<DateTime: 2001-02-04T00:00:00+00:00 ...>
    DateTime.jd(Rational('0.5'))

				#=> #<DateTime: -4712-01-01T12:00:00+00:00 ...>
**@overload** [] 

## jisx0301(*args ) [](#method-c-jisx0301)
Creates a new DateTime object by parsing from a string according to some
typical JIS X 0301 formats.

    DateTime.jisx0301('H13.02.03T04:05:06+07:00')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>

For no-era year, legacy format, Heisei is assumed.

    DateTime.jisx0301('13.02.03T04:05:06+07:00')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>

Raise an ArgumentError when the string length is longer than *limit*. You can
stop this check by passing `limit: nil`, but note that it may take a long time
to parse.
**@overload** [] 

## json_create(object ) [](#method-c-json_create)
See #as_json.
## new(*args ) [](#method-c-new)
Same as DateTime.new.
## now(*args ) [](#method-c-now)
Creates a DateTime object denoting the present time.

    DateTime.now		#=> #<DateTime: 2011-06-11T21:20:44+09:00 ...>
**@overload** [] 

## nth_kday(*args ) [](#method-c-nth_kday)
:nodoc:
## ordinal(*args ) [](#method-c-ordinal)
Creates a DateTime object denoting the given ordinal date.

    DateTime.ordinal(2001,34)	#=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>
    DateTime.ordinal(2001,34,4,5,6,'+7')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.ordinal(2001,-332,-20,-55,-54,'+7')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
**@overload** [] 

## parse(*args ) [](#method-c-parse)
Parses the given representation of date and time, and creates a DateTime
object.

This method **does** **not** function as a validator.  If the input string
does not match valid formats strictly, you may get a cryptic result.  Should
consider to use DateTime.strptime instead of this method as possible.

If the optional second argument is true and the detected year is in the range
"00" to "99", makes it full.

    DateTime.parse('2001-02-03T04:05:06+07:00')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.parse('20010203T040506+0700')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.parse('3rd Feb 2001 04:05:06 PM')

			#=> #<DateTime: 2001-02-03T16:05:06+00:00 ...>

Raise an ArgumentError when the string length is longer than *limit*. You can
stop this check by passing `limit: nil`, but note that it may take a long time
to parse.
**@overload** [] 

## rfc2822(*args ) [](#method-c-rfc2822)
Creates a new DateTime object by parsing from a string according to some
typical RFC 2822 formats.

    DateTime.rfc2822('Sat, 3 Feb 2001 04:05:06 +0700')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>

Raise an ArgumentError when the string length is longer than *limit*. You can
stop this check by passing `limit: nil`, but note that it may take a long time
to parse.
**@overload** [] 

**@overload** [] 

## rfc3339(*args ) [](#method-c-rfc3339)
Creates a new DateTime object by parsing from a string according to some
typical RFC 3339 formats.

    DateTime.rfc3339('2001-02-03T04:05:06+07:00')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>

Raise an ArgumentError when the string length is longer than *limit*. You can
stop this check by passing `limit: nil`, but note that it may take a long time
to parse.
**@overload** [] 

## rfc822(*args ) [](#method-c-rfc822)
Creates a new DateTime object by parsing from a string according to some
typical RFC 2822 formats.

    DateTime.rfc2822('Sat, 3 Feb 2001 04:05:06 +0700')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>

Raise an ArgumentError when the string length is longer than *limit*. You can
stop this check by passing `limit: nil`, but note that it may take a long time
to parse.
**@overload** [] 

**@overload** [] 

## strptime(*args ) [](#method-c-strptime)
Parses the given representation of date and time with the given template, and
creates a DateTime object.  strptime does not support specification of flags
and width unlike strftime.

    DateTime.strptime('2001-02-03T04:05:06+07:00', '%Y-%m-%dT%H:%M:%S%z')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.strptime('03-02-2001 04:05:06 PM', '%d-%m-%Y %I:%M:%S %p')

			#=> #<DateTime: 2001-02-03T16:05:06+00:00 ...>
    DateTime.strptime('2001-W05-6T04:05:06+07:00', '%G-W%V-%uT%H:%M:%S%z')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.strptime('2001 04 6 04 05 06 +7', '%Y %U %w %H %M %S %z')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.strptime('2001 05 6 04 05 06 +7', '%Y %W %u %H %M %S %z')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>
    DateTime.strptime('-1', '%s')

			#=> #<DateTime: 1969-12-31T23:59:59+00:00 ...>
    DateTime.strptime('-1000', '%Q')

			#=> #<DateTime: 1969-12-31T23:59:59+00:00 ...>
    DateTime.strptime('sat3feb014pm+7', '%a%d%b%y%H%p%z')

			#=> #<DateTime: 2001-02-03T16:00:00+07:00 ...>

See also strptime(3) and #strftime.
**@overload** [] 

## weeknum(*args ) [](#method-c-weeknum)
:nodoc:
## xmlschema(*args ) [](#method-c-xmlschema)
Creates a new DateTime object by parsing from a string according to some
typical XML Schema formats.

    DateTime.xmlschema('2001-02-03T04:05:06+07:00')

			#=> #<DateTime: 2001-02-03T04:05:06+07:00 ...>

Raise an ArgumentError when the string length is longer than *limit*. You can
stop this check by passing `limit: nil`, but note that it may take a long time
to parse.
**@overload** [] 


#Instance Methods
## as_json() [](#method-i-as_json)
Methods `DateTime#as_json` and `DateTime.json_create` may be used to serialize
and deserialize a DateTime object; see [Marshal](rdoc-ref:Marshal).

Method `DateTime#as_json` serializes `self`, returning a 2-element hash
representing `self`:

    require 'json/add/datetime'
    x = DateTime.now.as_json
    # => {"json_class"=>"DateTime", "y"=>2023, "m"=>11, "d"=>21, "sg"=>2299161.0}

Method `JSON.create` deserializes such a hash, returning a DateTime object:

    DateTime.json_create(x) # BUG? Raises Date::Error "invalid date"

## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Returns a hash of the name/value pairs, to use in pattern matching. Possible
keys are: `:year`, `:month`, `:day`, `:wday`, `:yday`, `:hour`, `:min`,
`:sec`, `:sec_fraction`, `:zone`.

Possible usages:

    dt = DateTime.new(2022, 10, 5, 13, 30)

    if d in wday: 1..5, hour: 10..18  # uses deconstruct_keys underneath
      puts "Working time"
    end
    #=> prints "Working time"

    case dt
    in year: ...2022
      puts "too old"
    in month: ..9
      puts "quarter 1-3"
    in wday: 1..5, month:
      puts "working day in month #{month}"
    end
    #=> prints "working day in month 10"

Note that deconstruction by pattern can also be combined with class check:

    if d in DateTime(wday: 1..5, hour: 10..18, day: ..7)
      puts "Working time, first week of the month"
    end

**@overload** [] 

## hour() [](#method-i-hour)
Returns the hour in range (0..23):

    DateTime.new(2001, 2, 3, 4, 5, 6).hour # => 4

**@overload** [] 

## iso8601(*args) [](#method-i-iso8601)
This method is equivalent to strftime('%FT%T%:z'). The optional argument `n`
is the number of digits for fractional seconds.

    DateTime.parse('2001-02-03T04:05:06.123456789+07:00').iso8601(9)

			#=> "2001-02-03T04:05:06.123456789+07:00"

**@overload** [] 

**@overload** [] 

## jisx0301(*args) [](#method-i-jisx0301)
Returns a string in a JIS X 0301 format. The optional argument `n` is the
number of digits for fractional seconds.

    DateTime.parse('2001-02-03T04:05:06.123456789+07:00').jisx0301(9)

			#=> "H13.02.03T04:05:06.123456789+07:00"

**@overload** [] 

## min() [](#method-i-min)
Returns the minute in range (0..59):

    DateTime.new(2001, 2, 3, 4, 5, 6).min # => 5

**@overload** [] 

## minute() [](#method-i-minute)
Returns the minute in range (0..59):

    DateTime.new(2001, 2, 3, 4, 5, 6).min # => 5

**@overload** [] 

## new_offset(*args) [](#method-i-new_offset)
Duplicates self and resets its offset.

    d = DateTime.new(2001,2,3,4,5,6,'-02:00')

			#=> #<DateTime: 2001-02-03T04:05:06-02:00 ...>
    d.new_offset('+09:00')	#=> #<DateTime: 2001-02-03T15:05:06+09:00 ...>

**@overload** [] 

## offset() [](#method-i-offset)
Returns the offset.

    DateTime.parse('04pm+0730').offset	#=> (5/16)

**@overload** [] 

## rfc3339(*args) [](#method-i-rfc3339)
This method is equivalent to strftime('%FT%T%:z'). The optional argument `n`
is the number of digits for fractional seconds.

    DateTime.parse('2001-02-03T04:05:06.123456789+07:00').rfc3339(9)

			#=> "2001-02-03T04:05:06.123456789+07:00"

**@overload** [] 

## sec() [](#method-i-sec)
Returns the second in range (0..59):

    DateTime.new(2001, 2, 3, 4, 5, 6).sec # => 6

**@overload** [] 

## sec_fraction() [](#method-i-sec_fraction)
Returns the fractional part of the second in range (Rational(0,
1)...Rational(1, 1)):

    DateTime.new(2001, 2, 3, 4, 5, 6.5).sec_fraction # => (1/2)

**@overload** [] 

## second() [](#method-i-second)
Returns the second in range (0..59):

    DateTime.new(2001, 2, 3, 4, 5, 6).sec # => 6

**@overload** [] 

## second_fraction() [](#method-i-second_fraction)
Returns the fractional part of the second in range (Rational(0,
1)...Rational(1, 1)):

    DateTime.new(2001, 2, 3, 4, 5, 6.5).sec_fraction # => (1/2)

**@overload** [] 

## strftime(*args) [](#method-i-strftime)
Returns a string representation of `self`, formatted according the given
+format:

    DateTime.now.strftime # => "2022-07-01T11:03:19-05:00"

For other formats, see [Formats for Dates and
Times](rdoc-ref:strftime_formatting.rdoc):

**@overload** [] 

## to_date() [](#method-i-to_date)
Returns a Date object which denotes self.

**@overload** [] 

## to_datetime() [](#method-i-to_datetime)
Returns self.

**@overload** [] 

## to_json(*args) [](#method-i-to_json)
Returns a JSON string representing `self`:

    require 'json/add/datetime'
    puts DateTime.now.to_json

Output:

    {"json_class":"DateTime","y":2023,"m":11,"d":21,"sg":2299161.0}

## to_s() [](#method-i-to_s)
Returns a string in an ISO 8601 format. (This method doesn't use the expanded
representations.)

    DateTime.new(2001,2,3,4,5,6,'-7').to_s

			#=> "2001-02-03T04:05:06-07:00"

**@overload** [] 

## to_time() [](#method-i-to_time)
Returns a Time object which denotes self.

**@overload** [] 

## xmlschema(*args) [](#method-i-xmlschema)
This method is equivalent to strftime('%FT%T%:z'). The optional argument `n`
is the number of digits for fractional seconds.

    DateTime.parse('2001-02-03T04:05:06.123456789+07:00').iso8601(9)

			#=> "2001-02-03T04:05:06.123456789+07:00"

**@overload** [] 

**@overload** [] 

## zone() [](#method-i-zone)
Returns the timezone.

    DateTime.parse('04pm+0730').zone		#=> "+07:30"

**@overload** [] 

