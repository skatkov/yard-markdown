# Class: Time
**Inherits:** Object
    
**Includes:** Comparable
  

#


# Class Methods
## apply_offset(year , mon , day , hour , min , sec , off ) [](#method-c-apply_offset)
## at(time , subsec false, unit :microsecond, in: nil) [](#method-c-at)
Returns a new `Time` object based on the given arguments.

Required argument `time` may be either of:

*   A `Time` object, whose value is the basis for the returned time; also
    influenced by optional keyword argument `in:` (see below).
*   A numeric number of [Epoch seconds](rdoc-ref:Time@Epoch+Seconds) for the
    returned time.

Examples:

    t = Time.new(2000, 12, 31, 23, 59, 59) # => 2000-12-31 23:59:59 -0600
    secs = t.to_i                          # => 978328799
    Time.at(secs)                          # => 2000-12-31 23:59:59 -0600
    Time.at(secs + 0.5)                    # => 2000-12-31 23:59:59.5 -0600
    Time.at(1000000000)                    # => 2001-09-08 20:46:40 -0500
    Time.at(0)                             # => 1969-12-31 18:00:00 -0600
    Time.at(-1000000000)                   # => 1938-04-24 17:13:20 -0500

Optional numeric argument `subsec` and optional symbol argument `units` work
together to specify subseconds for the returned time; argument `units`
specifies the units for `subsec`:

*   `:millisecond`: `subsec` in milliseconds:

        Time.at(secs, 0, :millisecond)     # => 2000-12-31 23:59:59 -0600
        Time.at(secs, 500, :millisecond)   # => 2000-12-31 23:59:59.5 -0600
        Time.at(secs, 1000, :millisecond)  # => 2001-01-01 00:00:00 -0600
        Time.at(secs, -1000, :millisecond) # => 2000-12-31 23:59:58 -0600

*   `:microsecond` or `:usec`: `subsec` in microseconds:

        Time.at(secs, 0, :microsecond)        # => 2000-12-31 23:59:59 -0600
        Time.at(secs, 500000, :microsecond)   # => 2000-12-31 23:59:59.5 -0600
        Time.at(secs, 1000000, :microsecond)  # => 2001-01-01 00:00:00 -0600
        Time.at(secs, -1000000, :microsecond) # => 2000-12-31 23:59:58 -0600

*   `:nanosecond` or `:nsec`: `subsec` in nanoseconds:

        Time.at(secs, 0, :nanosecond)           # => 2000-12-31 23:59:59 -0600
        Time.at(secs, 500000000, :nanosecond)   # => 2000-12-31 23:59:59.5 -0600
        Time.at(secs, 1000000000, :nanosecond)  # => 2001-01-01 00:00:00 -0600
        Time.at(secs, -1000000000, :nanosecond) # => 2000-12-31 23:59:58 -0600

Optional keyword argument `in: zone` specifies the timezone for the returned
time:

    Time.at(secs, in: '+12:00') # => 2001-01-01 17:59:59 +1200
    Time.at(secs, in: '-12:00') # => 2000-12-31 17:59:59 -1200

For the forms of argument `zone`, see [Timezone
Specifiers](rdoc-ref:Time@Timezone+Specifiers).
## force_zone!(t , zone , offset nil) [](#method-c-force_zone!)
## httpdate(date ) [](#method-c-httpdate)
Parses `date` as an HTTP-date defined by RFC 2616 and converts it to a Time
object.

ArgumentError is raised if `date` is not compliant with RFC 2616 or if the
Time class cannot represent specified date.

See #httpdate for more information on this format.

    require 'time'

    Time.httpdate("Thu, 06 Oct 2011 02:26:12 GMT")
    #=> 2011-10-06 02:26:12 UTC

You must require 'time' to use this method.
## iso8601() [](#method-c-iso8601)
Parses `time` as a dateTime defined by the XML Schema and converts it to a
Time object.  The format is a restricted version of the format defined by ISO
8601.

ArgumentError is raised if `time` is not compliant with the format or if the
Time class cannot represent the specified time.

See #xmlschema for more information on this format.

    require 'time'

    Time.xmlschema("2011-10-05T22:26:12-04:00")
    #=> 2011-10-05 22:26:12-04:00

You must require 'time' to use this method.
## json_create(object ) [](#method-c-json_create)
See #as_json.
## local(*args ) [](#method-c-local)
Like Time.utc, except that the returned `Time` object has the local timezone,
not the UTC timezone:

    # With seven arguments.
    Time.local(0, 1, 2, 3, 4, 5, 6)
    # => 0000-01-02 03:04:05.000006 -0600
    # With exactly ten arguments.
    Time.local(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    # => 0005-04-03 02:01:00 -0600
**@overload** [] 

**@overload** [] 

## make_time(date , year , yday , mon , day , hour , min , sec , sec_fraction , zone , now ) [](#method-c-make_time)
## month_days(y , m ) [](#method-c-month_days)
## now(in: nil) [](#method-c-now)
Creates a new `Time` object from the current system time. This is the same as
Time.new without arguments.

    Time.now               # => 2009-06-24 12:39:54 +0900
    Time.now(in: '+04:00') # => 2009-06-24 07:39:54 +0400

For forms of argument `zone`, see [Timezone
Specifiers](rdoc-ref:Time@Timezone+Specifiers).
## parse(date , now self.now) [](#method-c-parse)
Takes a string representation of a Time and attempts to parse it using a
heuristic.

This method **does not** function as a validator.  If the input string does
not match valid formats strictly, you may get a cryptic result.  Should
consider to use Time.strptime instead of this method as possible.

    require 'time'

    Time.parse("2010-10-31") #=> 2010-10-31 00:00:00 -0500

Any missing pieces of the date are inferred based on the current date.

    require 'time'

    # assuming the current date is "2011-10-31"
    Time.parse("12:00") #=> 2011-10-31 12:00:00 -0500

We can change the date used to infer our missing elements by passing a second
object that responds to #mon, #day and #year, such as Date, Time or DateTime.
We can also use our own object.

    require 'time'

    class MyDate
      attr_reader :mon, :day, :year

      def initialize(mon, day, year)
        @mon, @day, @year = mon, day, year
      end
    end

    d  = Date.parse("2010-10-28")
    t  = Time.parse("2010-10-29")
    dt = DateTime.parse("2010-10-30")
    md = MyDate.new(10,31,2010)

    Time.parse("12:00", d)  #=> 2010-10-28 12:00:00 -0500
    Time.parse("12:00", t)  #=> 2010-10-29 12:00:00 -0500
    Time.parse("12:00", dt) #=> 2010-10-30 12:00:00 -0500
    Time.parse("12:00", md) #=> 2010-10-31 12:00:00 -0500

If a block is given, the year described in `date` is converted by the block. 
This is specifically designed for handling two digit years. For example, if
you wanted to treat all two digit years prior to 70 as the year 2000+ you
could write this:

    require 'time'

    Time.parse("01-10-31") {|year| year + (year < 70 ? 2000 : 1900)}
    #=> 2001-10-31 00:00:00 -0500
    Time.parse("70-10-31") {|year| year + (year < 70 ? 2000 : 1900)}
    #=> 1970-10-31 00:00:00 -0500

If the upper components of the given time are broken or missing, they are
supplied with those of `now`.  For the lower components, the minimum values (1
or 0) are assumed if broken or missing.  For example:

    require 'time'

    # Suppose it is "Thu Nov 29 14:33:20 2001" now and
    # your time zone is EST which is GMT-5.
    now = Time.parse("Thu Nov 29 14:33:20 2001")
    Time.parse("16:30", now)     #=> 2001-11-29 16:30:00 -0500
    Time.parse("7/23", now)      #=> 2001-07-23 00:00:00 -0500
    Time.parse("Aug 31", now)    #=> 2001-08-31 00:00:00 -0500
    Time.parse("Aug 2000", now)  #=> 2000-08-01 00:00:00 -0500

Since there are numerous conflicts among locally defined time zone
abbreviations all over the world, this method is not intended to understand
all of them.  For example, the abbreviation "CST" is used variously as:

    -06:00 in America/Chicago,
    -05:00 in America/Havana,
    +08:00 in Asia/Harbin,
    +09:30 in Australia/Darwin,
    +10:30 in Australia/Adelaide,
    etc.

Based on this fact, this method only understands the time zone abbreviations
described in RFC 822 and the system time zone, in the order named. (i.e. a
definition in RFC 822 overrides the system time zone definition.)  The system
time zone is taken from `Time.local(year, 1, 1).zone` and `Time.local(year, 7,
1).zone`. If the extracted time zone abbreviation does not match any of them,
it is ignored and the given time is regarded as a local time.

ArgumentError is raised if Date._parse cannot extract information from `date`
or if the Time class cannot represent specified date.

This method can be used as a fail-safe for other parsing methods as:

    Time.rfc2822(date) rescue Time.parse(date)
    Time.httpdate(date) rescue Time.parse(date)
    Time.xmlschema(date) rescue Time.parse(date)

A failure of Time.parse should be checked, though.

You must require 'time' to use this method.
## rfc2822(date ) [](#method-c-rfc2822)
Parses `date` as date-time defined by RFC 2822 and converts it to a Time
object.  The format is identical to the date format defined by RFC 822 and
updated by RFC 1123.

ArgumentError is raised if `date` is not compliant with RFC 2822 or if the
Time class cannot represent specified date.

See #rfc2822 for more information on this format.

    require 'time'

    Time.rfc2822("Wed, 05 Oct 2011 22:26:12 -0400")
    #=> 2010-10-05 22:26:12 -0400

You must require 'time' to use this method.
## rfc822() [](#method-c-rfc822)
Parses `date` as date-time defined by RFC 2822 and converts it to a Time
object.  The format is identical to the date format defined by RFC 822 and
updated by RFC 1123.

ArgumentError is raised if `date` is not compliant with RFC 2822 or if the
Time class cannot represent specified date.

See #rfc2822 for more information on this format.

    require 'time'

    Time.rfc2822("Wed, 05 Oct 2011 22:26:12 -0400")
    #=> 2010-10-05 22:26:12 -0400

You must require 'time' to use this method.
## strptime(date , format , now self.now) [](#method-c-strptime)
Works similar to `parse` except that instead of using a heuristic to detect
the format of the input string, you provide a second argument that describes
the format of the string.

Raises ArgumentError if the date or format is invalid.

If a block is given, the year described in `date` is converted by the block. 
For example:

    Time.strptime(...) {|y| y < 100 ? (y >= 69 ? y + 1900 : y + 2000) : y}

Below is a list of the formatting options:

%a
:   The abbreviated weekday name ("Sun")

%A
:   The  full  weekday  name ("Sunday")

%b
:   The abbreviated month name ("Jan")

%B
:   The  full  month  name ("January")

%c
:   The preferred local date and time representation

%C
:   Century (20 in 2009)

%d
:   Day of the month (01..31)

%D
:   Date (%m/%d/%y)

%e
:   Day of the month, blank-padded ( 1..31)

%F
:   Equivalent to %Y-%m-%d (the ISO 8601 date format)

%g
:   The last two digits of the commercial year

%G
:   The week-based year according to ISO-8601 (week 1 starts on Monday and
    includes January 4)

%h
:   Equivalent to %b

%H
:   Hour of the day, 24-hour clock (00..23)

%I
:   Hour of the day, 12-hour clock (01..12)

%j
:   Day of the year (001..366)

%k
:   hour, 24-hour clock, blank-padded ( 0..23)

%l
:   hour, 12-hour clock, blank-padded ( 0..12)

%L
:   Millisecond of the second (000..999)

%m
:   Month of the year (01..12)

%M
:   Minute of the hour (00..59)

%n
:   Newline (n)

%N
:   Fractional seconds digits

%p
:   Meridian indicator ("AM" or "PM")

%P
:   Meridian indicator ("am" or "pm")

%r
:   time, 12-hour (same as %I:%M:%S %p)

%R
:   time, 24-hour (%H:%M)

%s
:   Number of seconds since 1970-01-01 00:00:00 UTC.

%S
:   Second of the minute (00..60)

%t
:   Tab character (t)

%T
:   time, 24-hour (%H:%M:%S)

%u
:   Day of the week as a decimal, Monday being 1. (1..7)

%U
:   Week number of the current year, starting with the first Sunday as the
    first day of the first week (00..53)

%v
:   VMS date (%e-%b-%Y)

%V
:   Week number of year according to ISO 8601 (01..53)

%W
:   Week  number  of the current year, starting with the first Monday as the
    first day of the first week (00..53)

%w
:   Day of the week (Sunday is 0, 0..6)

%x
:   Preferred representation for the date alone, no time

%X
:   Preferred representation for the time alone, no date

%y
:   Year without a century (00..99)

%Y
:   Year which may include century, if provided

%z
:   Time zone as hour offset from UTC (e.g. +0900)

%Z
:   Time zone name

%%
:   Literal "%" character

%+
:   date(1) (%a %b %e %H:%M:%S %Z %Y)


    require 'time'

    Time.strptime("2000-10-31", "%Y-%m-%d") #=> 2000-10-31 00:00:00 -0500

You must require 'time' to use this method.
**@raise** [ArgumentError] 

## utc(*args ) [](#method-c-utc)
Returns a new `Time` object based the on given arguments, in the UTC timezone.

With one to seven arguments given, the arguments are interpreted as in the
first calling sequence above:

    Time.utc(year, month = 1, mday = 1, hour = 0, min = 0, sec = 0, usec = 0)

Examples:

    Time.utc(2000)  # => 2000-01-01 00:00:00 UTC
    Time.utc(-2000) # => -2000-01-01 00:00:00 UTC

There are no minimum and maximum values for the required argument `year`.

For the optional arguments:

*   `month`: Month in range (1..12), or case-insensitive 3-letter month name:

        Time.utc(2000, 1)     # => 2000-01-01 00:00:00 UTC
        Time.utc(2000, 12)    # => 2000-12-01 00:00:00 UTC
        Time.utc(2000, 'jan') # => 2000-01-01 00:00:00 UTC
        Time.utc(2000, 'JAN') # => 2000-01-01 00:00:00 UTC

*   `mday`: Month day in range(1..31):

        Time.utc(2000, 1, 1)  # => 2000-01-01 00:00:00 UTC
        Time.utc(2000, 1, 31) # => 2000-01-31 00:00:00 UTC

*   `hour`: Hour in range (0..23), or 24 if `min`, `sec`, and `usec` are zero:

        Time.utc(2000, 1, 1, 0)  # => 2000-01-01 00:00:00 UTC
        Time.utc(2000, 1, 1, 23) # => 2000-01-01 23:00:00 UTC
        Time.utc(2000, 1, 1, 24) # => 2000-01-02 00:00:00 UTC

*   `min`: Minute in range (0..59):

        Time.utc(2000, 1, 1, 0, 0)  # => 2000-01-01 00:00:00 UTC
        Time.utc(2000, 1, 1, 0, 59) # => 2000-01-01 00:59:00 UTC

*   `sec`: Second in range (0..59), or 60 if `usec` is zero:

        Time.utc(2000, 1, 1, 0, 0, 0)  # => 2000-01-01 00:00:00 UTC
        Time.utc(2000, 1, 1, 0, 0, 59) # => 2000-01-01 00:00:59 UTC
        Time.utc(2000, 1, 1, 0, 0, 60) # => 2000-01-01 00:01:00 UTC

*   `usec`: Microsecond in range (0..999999):

        Time.utc(2000, 1, 1, 0, 0, 0, 0)      # => 2000-01-01 00:00:00 UTC
        Time.utc(2000, 1, 1, 0, 0, 0, 999999) # => 2000-01-01 00:00:00.999999 UTC

The values may be:

*   Integers, as above.
*   Numerics convertible to integers:

        Time.utc(Float(0.0), Rational(1, 1), 1.0, 0.0, 0.0, 0.0, 0.0)
        # => 0000-01-01 00:00:00 UTC

*   String integers:

        a = %w[0 1 1 0 0 0 0 0]
        # => ["0", "1", "1", "0", "0", "0", "0", "0"]
        Time.utc(*a) # => 0000-01-01 00:00:00 UTC

When exactly ten arguments are given, the arguments are interpreted as in the
second calling sequence above:

    Time.utc(sec, min, hour, mday, month, year, dummy, dummy, dummy, dummy)

where the `dummy` arguments are ignored:

    a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    Time.utc(*a) # => 0005-04-03 02:01:00 UTC

This form is useful for creating a `Time` object from a 10-element array
returned by Time.to_a:

    t = Time.new(2000, 1, 2, 3, 4, 5, 6) # => 2000-01-02 03:04:05 +000006
    a = t.to_a   # => [5, 4, 3, 2, 1, 2000, 0, 2, false, nil]
    Time.utc(*a) # => 2000-01-02 03:04:05 UTC

The two forms have their first six arguments in common, though in different
orders; the ranges of these common arguments are the same for both forms; see
above.

Raises an exception if the number of arguments is eight, nine, or greater than
ten.

Related: Time.local.
**@overload** [] 

**@overload** [] 

## xmlschema(time ) [](#method-c-xmlschema)
Parses `time` as a dateTime defined by the XML Schema and converts it to a
Time object.  The format is a restricted version of the format defined by ISO
8601.

ArgumentError is raised if `time` is not compliant with the format or if the
Time class cannot represent the specified time.

See #xmlschema for more information on this format.

    require 'time'

    Time.xmlschema("2011-10-05T22:26:12-04:00")
    #=> 2011-10-05 22:26:12-04:00

You must require 'time' to use this method.
## zone_offset(zone , year self.now.year) [](#method-c-zone_offset)
Return the number of seconds the specified time zone differs from UTC.

Numeric time zones that include minutes, such as `-10:00` or `+1330` will
work, as will simpler hour-only time zones like `-10` or `+13`.

Textual time zones listed in ZoneOffset are also supported.

If the time zone does not match any of the above, `zone_offset` will check if
the local time zone (both with and without potential Daylight Saving Time
changes being in effect) matches `zone`. Specifying a value for `year` will
change the year used to find the local time zone.

If `zone_offset` is unable to determine the offset, nil will be returned.

    require 'time'

    Time.zone_offset("EST") #=> -18000

You must require 'time' to use this method.
## zone_utc?(zone ) [](#method-c-zone_utc?)
:stopdoc:
**@return** [Boolean] 


#Instance Methods
## +(time2) [](#method-i-+)
Returns a new `Time` object whose value is the sum of the numeric value of
`self` and the given `numeric`:

    t = Time.new(2000) # => 2000-01-01 00:00:00 -0600
    t + (60 * 60 * 24) # => 2000-01-02 00:00:00 -0600
    t + 0.5            # => 2000-01-01 00:00:00.5 -0600

Related: Time#-.

**@overload** [] 

## -(time2) [](#method-i--)
When `numeric` is given, returns a new `Time` object whose value is the
difference of the numeric value of `self` and `numeric`:

    t = Time.new(2000) # => 2000-01-01 00:00:00 -0600
    t - (60 * 60 * 24) # => 1999-12-31 00:00:00 -0600
    t - 0.5            # => 1999-12-31 23:59:59.5 -0600

When `other_time` is given, returns a Float whose value is the difference of
the numeric values of `self` and `other_time` in seconds:

    t - t # => 0.0

Related: Time#+.

**@overload** [] 

**@overload** [] 

## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>(time2) [](#method-i-<=>)
Compares `self` with `other_time`; returns:

*   `-1`, if `self` is less than `other_time`.
*   `0`, if `self` is equal to `other_time`.
*   `1`, if `self` is greater then `other_time`.
*   `nil`, if `self` and `other_time` are incomparable.

Examples:

    t = Time.now     # => 2007-11-19 08:12:12 -0600
    t2 = t + 2592000 # => 2007-12-19 08:12:12 -0600
    t <=> t2         # => -1
    t2 <=> t         # => 1

    t = Time.now     # => 2007-11-19 08:13:38 -0600
    t2 = t + 0.1     # => 2007-11-19 08:13:38 -0600
    t.nsec           # => 98222999
    t2.nsec          # => 198222999
    t <=> t2         # => -1
    t2 <=> t         # => 1
    t <=> t          # => 0

**@overload** [] 

## ==(y) [](#method-i-==)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns 0. Also returns true if *obj* and *other* are the same object.

**@overload** [] 

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## as_json() [](#method-i-as_json)
Methods `Time#as_json` and `Time.json_create` may be used to serialize and
deserialize a Time object; see [Marshal](rdoc-ref:Marshal).

Method `Time#as_json` serializes `self`, returning a 2-element hash
representing `self`:

    require 'json/add/time'
    x = Time.now.as_json
    # => {"json_class"=>"Time", "s"=>1700931656, "n"=>472846644}

Method `JSON.create` deserializes such a hash, returning a Time object:

    Time.json_create(x)
    # => 2023-11-25 11:00:56.472846644 -0600

## asctime() [](#method-i-asctime)
Returns a string representation of `self`, formatted by `strftime('%a %b %e %T
%Y')` or its shorthand version `strftime('%c')`; see [Formats for Dates and
Times](rdoc-ref:strftime_formatting.rdoc):

    t = Time.new(2000, 12, 31, 23, 59, 59, 0.5)
    t.ctime                      # => "Sun Dec 31 23:59:59 2000"
    t.strftime('%a %b %e %T %Y') # => "Sun Dec 31 23:59:59 2000"
    t.strftime('%c')             # => "Sun Dec 31 23:59:59 2000"

Related: Time#to_s, Time#inspect:

    t.inspect                    # => "2000-12-31 23:59:59.5 +000001"
    t.to_s                       # => "2000-12-31 23:59:59 +0000"

**@overload** [] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

**@overload** [] 

## ceil(*args) [](#method-i-ceil)
Returns a new `Time` object whose numerical value is greater than or equal to
`self` with its seconds truncated to precision `ndigits`:

    t = Time.utc(2010, 3, 30, 5, 43, 25.123456789r)
    t          # => 2010-03-30 05:43:25.123456789 UTC
    t.ceil     # => 2010-03-30 05:43:26 UTC
    t.ceil(2)  # => 2010-03-30 05:43:25.13 UTC
    t.ceil(4)  # => 2010-03-30 05:43:25.1235 UTC
    t.ceil(6)  # => 2010-03-30 05:43:25.123457 UTC
    t.ceil(8)  # => 2010-03-30 05:43:25.12345679 UTC
    t.ceil(10) # => 2010-03-30 05:43:25.123456789 UTC

    t = Time.utc(1999, 12, 31, 23, 59, 59)
    t              # => 1999-12-31 23:59:59 UTC
    (t + 0.4).ceil # => 2000-01-01 00:00:00 UTC
    (t + 0.9).ceil # => 2000-01-01 00:00:00 UTC
    (t + 1.4).ceil # => 2000-01-01 00:00:01 UTC
    (t + 1.9).ceil # => 2000-01-01 00:00:01 UTC

Related: Time#floor, Time#round.

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

## ctime() [](#method-i-ctime)
Returns a string representation of `self`, formatted by `strftime('%a %b %e %T
%Y')` or its shorthand version `strftime('%c')`; see [Formats for Dates and
Times](rdoc-ref:strftime_formatting.rdoc):

    t = Time.new(2000, 12, 31, 23, 59, 59, 0.5)
    t.ctime                      # => "Sun Dec 31 23:59:59 2000"
    t.strftime('%a %b %e %T %Y') # => "Sun Dec 31 23:59:59 2000"
    t.strftime('%c')             # => "Sun Dec 31 23:59:59 2000"

Related: Time#to_s, Time#inspect:

    t.inspect                    # => "2000-12-31 23:59:59.5 +000001"
    t.to_s                       # => "2000-12-31 23:59:59 +0000"

**@overload** [] 

## day() [](#method-i-day)
Returns the integer day of the month for `self`, in range (1..31):

    t = Time.new(2000, 1, 2, 3, 4, 5, 6)
    # => 2000-01-02 03:04:05 +000006
    t.mday # => 2

Related: Time#year, Time#hour, Time#min.

**@overload** [] 

## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Returns a hash of the name/value pairs, to use in pattern matching. Possible
keys are: `:year`, `:month`, `:day`, `:yday`, `:wday`, `:hour`, `:min`,
`:sec`, `:subsec`, `:dst`, `:zone`.

Possible usages:

    t = Time.utc(2022, 10, 5, 21, 25, 30)

    if t in wday: 3, day: ..7  # uses deconstruct_keys underneath
      puts "first Wednesday of the month"
    end
    #=> prints "first Wednesday of the month"

    case t
    in year: ...2022
      puts "too old"
    in month: ..9
      puts "quarter 1-3"
    in wday: 1..5, month:
      puts "working day in month #{month}"
    end
    #=> prints "working day in month 10"

Note that deconstruction by pattern can also be combined with class check:

    if t in Time(wday: 3, day: ..7)
      puts "first Wednesday of the month"
    end

**@overload** [] 

## dst?() [](#method-i-dst?)
Returns `true` if `self` is in daylight saving time, `false` otherwise:

    t = Time.local(2000, 1, 1) # => 2000-01-01 00:00:00 -0600
    t.zone                     # => "Central Standard Time"
    t.dst?                     # => false
    t = Time.local(2000, 7, 1) # => 2000-07-01 00:00:00 -0500
    t.zone                     # => "Central Daylight Time"
    t.dst?                     # => true

**@overload** [] 

## eql?(time2) [](#method-i-eql?)
Returns `true` if `self` and `other_time` are both `Time` objects with the
exact same time value.

**@overload** [] 

**@return** [Boolean] 

## floor(*args) [](#method-i-floor)
Returns a new `Time` object whose numerical value is less than or equal to
`self` with its seconds truncated to precision `ndigits`:

    t = Time.utc(2010, 3, 30, 5, 43, 25.123456789r)
    t           # => 2010-03-30 05:43:25.123456789 UTC
    t.floor     # => 2010-03-30 05:43:25 UTC
    t.floor(2)  # => 2010-03-30 05:43:25.12 UTC
    t.floor(4)  # => 2010-03-30 05:43:25.1234 UTC
    t.floor(6)  # => 2010-03-30 05:43:25.123456 UTC
    t.floor(8)  # => 2010-03-30 05:43:25.12345678 UTC
    t.floor(10) # => 2010-03-30 05:43:25.123456789 UTC

    t = Time.utc(1999, 12, 31, 23, 59, 59)
    t               # => 1999-12-31 23:59:59 UTC
    (t + 0.4).floor # => 1999-12-31 23:59:59 UTC
    (t + 0.9).floor # => 1999-12-31 23:59:59 UTC
    (t + 1.4).floor # => 2000-01-01 00:00:00 UTC
    (t + 1.9).floor # => 2000-01-01 00:00:00 UTC

Related: Time#ceil, Time#round.

**@overload** [] 

## friday?() [](#method-i-friday?)
Returns `true` if `self` represents a Friday, `false` otherwise:

    t = Time.utc(2000, 1, 7) # => 2000-01-07 00:00:00 UTC
    t.friday?                # => true

Related: Time#saturday?, Time#sunday?, Time#monday?.

**@overload** [] 

## getgm() [](#method-i-getgm)
Returns a new `Time` object representing the value of `self` converted to the
UTC timezone:

    local = Time.local(2000) # => 2000-01-01 00:00:00 -0600
    local.utc?               # => false
    utc = local.getutc       # => 2000-01-01 06:00:00 UTC
    utc.utc?                 # => true
    utc == local             # => true

**@overload** [] 

## getlocal(*args) [](#method-i-getlocal)
Returns a new `Time` object representing the value of `self` converted to a
given timezone; if `zone` is `nil`, the local timezone is used:

    t = Time.utc(2000)                    # => 2000-01-01 00:00:00 UTC
    t.getlocal                            # => 1999-12-31 18:00:00 -0600
    t.getlocal('+12:00')                  # => 2000-01-01 12:00:00 +1200

For forms of argument `zone`, see [Timezone
Specifiers](rdoc-ref:Time@Timezone+Specifiers).

**@overload** [] 

## getutc() [](#method-i-getutc)
Returns a new `Time` object representing the value of `self` converted to the
UTC timezone:

    local = Time.local(2000) # => 2000-01-01 00:00:00 -0600
    local.utc?               # => false
    utc = local.getutc       # => 2000-01-01 06:00:00 UTC
    utc.utc?                 # => true
    utc == local             # => true

**@overload** [] 

## gmt?() [](#method-i-gmt?)
Returns `true` if `self` represents a time in UTC (GMT):

    now = Time.now
    # => 2022-08-18 10:24:13.5398485 -0500
    now.utc? # => false
    utc = Time.utc(2000, 1, 1, 20, 15, 1)
    # => 2000-01-01 20:15:01 UTC
    utc.utc? # => true

Related: Time.utc.

**@overload** [] 

## gmt_offset() [](#method-i-gmt_offset)
Returns the offset in seconds between the timezones of UTC and `self`:

    Time.utc(2000, 1, 1).utc_offset   # => 0
    Time.local(2000, 1, 1).utc_offset # => -21600 # -6*3600, or minus six hours.

**@overload** [] 

## gmtime() [](#method-i-gmtime)
Returns `self`, converted to the UTC timezone:

    t = Time.new(2000) # => 2000-01-01 00:00:00 -0600
    t.utc?             # => false
    t.utc              # => 2000-01-01 06:00:00 UTC
    t.utc?             # => true

Related: Time#getutc (returns a new converted `Time` object).

**@overload** [] 

## gmtoff() [](#method-i-gmtoff)
Returns the offset in seconds between the timezones of UTC and `self`:

    Time.utc(2000, 1, 1).utc_offset   # => 0
    Time.local(2000, 1, 1).utc_offset # => -21600 # -6*3600, or minus six hours.

**@overload** [] 

## hash() [](#method-i-hash)
Returns the integer hash code for `self`.

Related: Object#hash.

**@overload** [] 

## hour() [](#method-i-hour)
Returns the integer hour of the day for `self`, in range (0..23):

    t = Time.new(2000, 1, 2, 3, 4, 5, 6)
    # => 2000-01-02 03:04:05 +000006
    t.hour # => 3

Related: Time#year, Time#mon, Time#min.

**@overload** [] 

## httpdate() [](#method-i-httpdate)
Returns a string which represents the time as RFC 1123 date of HTTP-date
defined by RFC 2616:

    day-of-week, DD month-name CCYY hh:mm:ss GMT

Note that the result is always UTC (GMT).

    require 'time'

    t = Time.now
    t.httpdate # => "Thu, 06 Oct 2011 02:26:12 GMT"

You must require 'time' to use this method.

## initialize(year(now = true), mon(str = year; nil), mdaynil, hournil, minnil, secnil, zonenil, in:nil, precision:9) [](#method-i-initialize)
call-seq:
    Time.new(year = nil, mon = nil, mday = nil, hour = nil, min = nil, sec = nil, zone = nil, in: nil, precision: 9)

Returns a new `Time` object based on the given arguments, by default in the
local timezone.

With no positional arguments, returns the value of Time.now:

    Time.new # => 2021-04-24 17:27:46.0512465 -0500

With one string argument that represents a time, returns a new `Time` object
based on the given argument, in the local timezone.

    Time.new('2000-12-31 23:59:59.5')              # => 2000-12-31 23:59:59.5 -0600
    Time.new('2000-12-31 23:59:59.5 +0900')        # => 2000-12-31 23:59:59.5 +0900
    Time.new('2000-12-31 23:59:59.5', in: '+0900') # => 2000-12-31 23:59:59.5 +0900
    Time.new('2000-12-31 23:59:59.5')              # => 2000-12-31 23:59:59.5 -0600
    Time.new('2000-12-31 23:59:59.56789', precision: 3) # => 2000-12-31 23:59:59.567 -0600

With one to six arguments, returns a new `Time` object based on the given
arguments, in the local timezone.

    Time.new(2000, 1, 2, 3, 4, 5) # => 2000-01-02 03:04:05 -0600

For the positional arguments (other than `zone`):

*   `year`: Year, with no range limits:

        Time.new(999999999)  # => 999999999-01-01 00:00:00 -0600
        Time.new(-999999999) # => -999999999-01-01 00:00:00 -0600

*   `month`: Month in range (1..12), or case-insensitive 3-letter month name:

        Time.new(2000, 1)     # => 2000-01-01 00:00:00 -0600
        Time.new(2000, 12)    # => 2000-12-01 00:00:00 -0600
        Time.new(2000, 'jan') # => 2000-01-01 00:00:00 -0600
        Time.new(2000, 'JAN') # => 2000-01-01 00:00:00 -0600

*   `mday`: Month day in range(1..31):

        Time.new(2000, 1, 1)  # => 2000-01-01 00:00:00 -0600
        Time.new(2000, 1, 31) # => 2000-01-31 00:00:00 -0600

*   `hour`: Hour in range (0..23), or 24 if `min`, `sec`, and `usec` are zero:

        Time.new(2000, 1, 1, 0)  # => 2000-01-01 00:00:00 -0600
        Time.new(2000, 1, 1, 23) # => 2000-01-01 23:00:00 -0600
        Time.new(2000, 1, 1, 24) # => 2000-01-02 00:00:00 -0600

*   `min`: Minute in range (0..59):

        Time.new(2000, 1, 1, 0, 0)  # => 2000-01-01 00:00:00 -0600
        Time.new(2000, 1, 1, 0, 59) # => 2000-01-01 00:59:00 -0600

*   `sec`: Second in range (0...61):

        Time.new(2000, 1, 1, 0, 0, 0)  # => 2000-01-01 00:00:00 -0600
        Time.new(2000, 1, 1, 0, 0, 59) # => 2000-01-01 00:00:59 -0600
        Time.new(2000, 1, 1, 0, 0, 60) # => 2000-01-01 00:01:00 -0600

    `sec` may be Float or Rational.

        Time.new(2000, 1, 1, 0, 0, 59.5)  # => 2000-12-31 23:59:59.5 +0900
        Time.new(2000, 1, 1, 0, 0, 59.7r) # => 2000-12-31 23:59:59.7 +0900

These values may be:

*   Integers, as above.
*   Numerics convertible to integers:

        Time.new(Float(0.0), Rational(1, 1), 1.0, 0.0, 0.0, 0.0)
        # => 0000-01-01 00:00:00 -0600

*   String integers:

        a = %w[0 1 1 0 0 0]
        # => ["0", "1", "1", "0", "0", "0"]
        Time.new(*a) # => 0000-01-01 00:00:00 -0600

When positional argument `zone` or keyword argument `in:` is given, the new
`Time` object is in the specified timezone. For the forms of argument `zone`,
see [Timezone Specifiers](rdoc-ref:Time@Timezone+Specifiers):

    Time.new(2000, 1, 1, 0, 0, 0, '+12:00')
    # => 2000-01-01 00:00:00 +1200
    Time.new(2000, 1, 1, 0, 0, 0, in: '-12:00')
    # => 2000-01-01 00:00:00 -1200
    Time.new(in: '-12:00')
    # => 2022-08-23 08:49:26.1941467 -1200

Since `in:` keyword argument just provides the default, so if the first
argument in single string form contains time zone information, this keyword
argument will be silently ignored.

    Time.new('2000-01-01 00:00:00 +0100', in: '-0500').utc_offset  # => 3600

*   `precision`: maximum effective digits in sub-second part, default is 9.
    More digits will be truncated, as other operations of `Time`. Ignored
    unless the first argument is a string.

**@return** [Time] a new instance of Time

## initialize_copy(time) [](#method-i-initialize_copy)
:nodoc:

## inspect() [](#method-i-inspect)
Returns a string representation of `self` with subseconds:

    t = Time.new(2000, 12, 31, 23, 59, 59, 0.5)
    t.inspect # => "2000-12-31 23:59:59.5 +000001"

Related: Time#ctime, Time#to_s:

    t.ctime   # => "Sun Dec 31 23:59:59 2000"
    t.to_s    # => "2000-12-31 23:59:59 +0000"

**@overload** [] 

## isdst() [](#method-i-isdst)
Returns `true` if `self` is in daylight saving time, `false` otherwise:

    t = Time.local(2000, 1, 1) # => 2000-01-01 00:00:00 -0600
    t.zone                     # => "Central Standard Time"
    t.dst?                     # => false
    t = Time.local(2000, 7, 1) # => 2000-07-01 00:00:00 -0500
    t.zone                     # => "Central Daylight Time"
    t.dst?                     # => true

**@overload** [] 

## localtime(*args) [](#method-i-localtime)
With no argument given:

*   Returns `self` if `self` is a local time.
*   Otherwise returns a new `Time` in the user's local timezone:

        t = Time.utc(2000, 1, 1, 20, 15, 1) # => 2000-01-01 20:15:01 UTC
        t.localtime                         # => 2000-01-01 14:15:01 -0600

With argument `zone` given, returns the new `Time` object created by
converting `self` to the given time zone:

    t = Time.utc(2000, 1, 1, 20, 15, 1) # => 2000-01-01 20:15:01 UTC
    t.localtime("-09:00")               # => 2000-01-01 11:15:01 -0900

For forms of argument `zone`, see [Timezone
Specifiers](rdoc-ref:Time@Timezone+Specifiers).

**@overload** [] 

**@overload** [] 

## mday() [](#method-i-mday)
Returns the integer day of the month for `self`, in range (1..31):

    t = Time.new(2000, 1, 2, 3, 4, 5, 6)
    # => 2000-01-02 03:04:05 +000006
    t.mday # => 2

Related: Time#year, Time#hour, Time#min.

**@overload** [] 

## min() [](#method-i-min)
Returns the integer minute of the hour for `self`, in range (0..59):

    t = Time.new(2000, 1, 2, 3, 4, 5, 6)
    # => 2000-01-02 03:04:05 +000006
    t.min # => 4

Related: Time#year, Time#mon, Time#sec.

**@overload** [] 

## mon() [](#method-i-mon)
Returns the integer month of the year for `self`, in range (1..12):

    t = Time.new(2000, 1, 2, 3, 4, 5, 6)
    # => 2000-01-02 03:04:05 +000006
    t.mon # => 1

Related: Time#year, Time#hour, Time#min.

**@overload** [] 

## monday?() [](#method-i-monday?)
Returns `true` if `self` represents a Monday, `false` otherwise:

    t = Time.utc(2000, 1, 3) # => 2000-01-03 00:00:00 UTC
    t.monday?                # => true

Related: Time#tuesday?, Time#wednesday?, Time#thursday?.

**@overload** [] 

## month() [](#method-i-month)
Returns the integer month of the year for `self`, in range (1..12):

    t = Time.new(2000, 1, 2, 3, 4, 5, 6)
    # => 2000-01-02 03:04:05 +000006
    t.mon # => 1

Related: Time#year, Time#hour, Time#min.

**@overload** [] 

## nsec() [](#method-i-nsec)
Returns the number of nanoseconds in the subseconds part of `self` in the
range (0..999_999_999); lower-order digits are truncated, not rounded:

    t = Time.now # => 2022-07-11 15:04:53.3219637 -0500
    t.nsec       # => 321963700

Related: Time#subsec (returns exact subseconds).

**@overload** [] 

## rfc2822() [](#method-i-rfc2822)
Returns a string which represents the time as date-time defined by RFC 2822:

    day-of-week, DD month-name CCYY hh:mm:ss zone

where zone is [+-]hhmm.

If `self` is a UTC time, -0000 is used as zone.

    require 'time'

    t = Time.now
    t.rfc2822  # => "Wed, 05 Oct 2011 22:26:12 -0400"

You must require 'time' to use this method.

## round(*args) [](#method-i-round)
Returns a new `Time` object whose numeric value is that of `self`, with its
seconds value rounded to precision `ndigits`:

    t = Time.utc(2010, 3, 30, 5, 43, 25.123456789r)
    t          # => 2010-03-30 05:43:25.123456789 UTC
    t.round    # => 2010-03-30 05:43:25 UTC
    t.round(0) # => 2010-03-30 05:43:25 UTC
    t.round(1) # => 2010-03-30 05:43:25.1 UTC
    t.round(2) # => 2010-03-30 05:43:25.12 UTC
    t.round(3) # => 2010-03-30 05:43:25.123 UTC
    t.round(4) # => 2010-03-30 05:43:25.1235 UTC

    t = Time.utc(1999, 12,31, 23, 59, 59)
    t                # => 1999-12-31 23:59:59 UTC
    (t + 0.4).round  # => 1999-12-31 23:59:59 UTC
    (t + 0.49).round # => 1999-12-31 23:59:59 UTC
    (t + 0.5).round  # => 2000-01-01 00:00:00 UTC
    (t + 1.4).round  # => 2000-01-01 00:00:00 UTC
    (t + 1.49).round # => 2000-01-01 00:00:00 UTC
    (t + 1.5).round  # => 2000-01-01 00:00:01 UTC

Related: Time#ceil, Time#floor.

**@overload** [] 

## saturday?() [](#method-i-saturday?)
Returns `true` if `self` represents a Saturday, `false` otherwise:

    t = Time.utc(2000, 1, 1) # => 2000-01-01 00:00:00 UTC
    t.saturday?              # => true

Related: Time#sunday?, Time#monday?, Time#tuesday?.

**@overload** [] 

## sec() [](#method-i-sec)
Returns the integer second of the minute for `self`, in range (0..60):

    t = Time.new(2000, 1, 2, 3, 4, 5, 6)
    # => 2000-01-02 03:04:05 +000006
    t.sec # => 5

Note: the second value may be 60 when there is a [leap
second](https://en.wikipedia.org/wiki/Leap_second).

Related: Time#year, Time#mon, Time#min.

**@overload** [] 

## strftime(format) [](#method-i-strftime)
Returns a string representation of `self`, formatted according to the given
string `format`. See [Formats for Dates and
Times](rdoc-ref:strftime_formatting.rdoc).

**@overload** [] 

## subsec() [](#method-i-subsec)
Returns the exact subseconds for `self` as a Numeric (Integer or Rational):

    t = Time.now # => 2022-07-11 15:11:36.8490302 -0500
    t.subsec     # => (4245151/5000000)

If the subseconds is zero, returns integer zero:

    t = Time.new(2000, 1, 1, 2, 3, 4) # => 2000-01-01 02:03:04 -0600
    t.subsec                          # => 0

**@overload** [] 

## sunday?() [](#method-i-sunday?)
Returns `true` if `self` represents a Sunday, `false` otherwise:

    t = Time.utc(2000, 1, 2) # => 2000-01-02 00:00:00 UTC
    t.sunday?                # => true

Related: Time#monday?, Time#tuesday?, Time#wednesday?.

**@overload** [] 

## thursday?() [](#method-i-thursday?)
Returns `true` if `self` represents a Thursday, `false` otherwise:

    t = Time.utc(2000, 1, 6) # => 2000-01-06 00:00:00 UTC
    t.thursday?              # => true

Related: Time#friday?, Time#saturday?, Time#sunday?.

**@overload** [] 

## to_a() [](#method-i-to_a)
Returns a 10-element array of values representing `self`:

    Time.utc(2000, 1, 1).to_a
    # => [0,   0,   0,    1,   1,   2000, 6,    1,    false, "UTC"]
    #    [sec, min, hour, day, mon, year, wday, yday, dst?,   zone]

The returned array is suitable for use as an argument to Time.utc or
Time.local to create a new `Time` object.

**@overload** [] 

## to_date() [](#method-i-to_date)
Returns a Date object which denotes self.

**@overload** [] 

## to_datetime() [](#method-i-to_datetime)
Returns a DateTime object which denotes self.

**@overload** [] 

## to_f() [](#method-i-to_f)
Returns the value of `self` as a Float number [Epoch
seconds](rdoc-ref:Time@Epoch+Seconds); subseconds are included.

The stored value of `self` is a [Rational](rdoc-ref:Rational@#method-i-to_f),
which means that the returned value may be approximate:

    Time.utc(1970, 1, 1, 0, 0, 0).to_f         # => 0.0
    Time.utc(1970, 1, 1, 0, 0, 0, 999999).to_f # => 0.999999
    Time.utc(1950, 1, 1, 0, 0, 0).to_f         # => -631152000.0
    Time.utc(1990, 1, 1, 0, 0, 0).to_f         # => 631152000.0

Related: Time#to_i, Time#to_r.

**@overload** [] 

## to_i() [](#method-i-to_i)
Returns the value of `self` as integer [Epoch
seconds](rdoc-ref:Time@Epoch+Seconds); subseconds are truncated (not rounded):

    Time.utc(1970, 1, 1, 0, 0, 0).to_i         # => 0
    Time.utc(1970, 1, 1, 0, 0, 0, 999999).to_i # => 0
    Time.utc(1950, 1, 1, 0, 0, 0).to_i         # => -631152000
    Time.utc(1990, 1, 1, 0, 0, 0).to_i         # => 631152000

Related: Time#to_f Time#to_r.

**@overload** [] 

## to_json(*args) [](#method-i-to_json)
Returns a JSON string representing `self`:

    require 'json/add/time'
    puts Time.now.to_json

Output:

    {"json_class":"Time","s":1700931678,"n":980650786}

## to_r() [](#method-i-to_r)
Returns the value of `self` as a Rational exact number of [Epoch
seconds](rdoc-ref:Time@Epoch+Seconds);

    Time.now.to_r # => (16571402750320203/10000000)

Related: Time#to_f, Time#to_i.

**@overload** [] 

## to_s() [](#method-i-to_s)
Returns a string representation of `self`, without subseconds:

    t = Time.new(2000, 12, 31, 23, 59, 59, 0.5)
    t.to_s    # => "2000-12-31 23:59:59 +0000"

Related: Time#ctime, Time#inspect:

    t.ctime   # => "Sun Dec 31 23:59:59 2000"
    t.inspect # => "2000-12-31 23:59:59.5 +000001"

**@overload** [] 

## to_time() [](#method-i-to_time)
Returns self.

**@overload** [] 

## tuesday?() [](#method-i-tuesday?)
Returns `true` if `self` represents a Tuesday, `false` otherwise:

    t = Time.utc(2000, 1, 4) # => 2000-01-04 00:00:00 UTC
    t.tuesday?               # => true

Related: Time#wednesday?, Time#thursday?, Time#friday?.

**@overload** [] 

## tv_nsec() [](#method-i-tv_nsec)
Returns the number of nanoseconds in the subseconds part of `self` in the
range (0..999_999_999); lower-order digits are truncated, not rounded:

    t = Time.now # => 2022-07-11 15:04:53.3219637 -0500
    t.nsec       # => 321963700

Related: Time#subsec (returns exact subseconds).

**@overload** [] 

## tv_sec() [](#method-i-tv_sec)
Returns the value of `self` as integer [Epoch
seconds](rdoc-ref:Time@Epoch+Seconds); subseconds are truncated (not rounded):

    Time.utc(1970, 1, 1, 0, 0, 0).to_i         # => 0
    Time.utc(1970, 1, 1, 0, 0, 0, 999999).to_i # => 0
    Time.utc(1950, 1, 1, 0, 0, 0).to_i         # => -631152000
    Time.utc(1990, 1, 1, 0, 0, 0).to_i         # => 631152000

Related: Time#to_f Time#to_r.

**@overload** [] 

## tv_usec() [](#method-i-tv_usec)
Returns the number of microseconds in the subseconds part of `self` in the
range (0..999_999); lower-order digits are truncated, not rounded:

    t = Time.now # => 2022-07-11 14:59:47.5484697 -0500
    t.usec       # => 548469

Related: Time#subsec (returns exact subseconds).

**@overload** [] 

## usec() [](#method-i-usec)
Returns the number of microseconds in the subseconds part of `self` in the
range (0..999_999); lower-order digits are truncated, not rounded:

    t = Time.now # => 2022-07-11 14:59:47.5484697 -0500
    t.usec       # => 548469

Related: Time#subsec (returns exact subseconds).

**@overload** [] 

## utc() [](#method-i-utc)
Returns `self`, converted to the UTC timezone:

    t = Time.new(2000) # => 2000-01-01 00:00:00 -0600
    t.utc?             # => false
    t.utc              # => 2000-01-01 06:00:00 UTC
    t.utc?             # => true

Related: Time#getutc (returns a new converted `Time` object).

**@overload** [] 

## utc?() [](#method-i-utc?)
Returns `true` if `self` represents a time in UTC (GMT):

    now = Time.now
    # => 2022-08-18 10:24:13.5398485 -0500
    now.utc? # => false
    utc = Time.utc(2000, 1, 1, 20, 15, 1)
    # => 2000-01-01 20:15:01 UTC
    utc.utc? # => true

Related: Time.utc.

**@overload** [] 

## utc_offset() [](#method-i-utc_offset)
Returns the offset in seconds between the timezones of UTC and `self`:

    Time.utc(2000, 1, 1).utc_offset   # => 0
    Time.local(2000, 1, 1).utc_offset # => -21600 # -6*3600, or minus six hours.

**@overload** [] 

## wday() [](#method-i-wday)
Returns the integer day of the week for `self`, in range (0..6), with Sunday
as zero.

    t = Time.new(2000, 1, 2, 3, 4, 5, 6)
    # => 2000-01-02 03:04:05 +000006
    t.wday    # => 0
    t.sunday? # => true

Related: Time#year, Time#hour, Time#min.

**@overload** [] 

## wednesday?() [](#method-i-wednesday?)
Returns `true` if `self` represents a Wednesday, `false` otherwise:

    t = Time.utc(2000, 1, 5) # => 2000-01-05 00:00:00 UTC
    t.wednesday?             # => true

Related: Time#thursday?, Time#friday?, Time#saturday?.

**@overload** [] 

## xmlschema(*args) [](#method-i-xmlschema)
Returns a string which represents the time as a dateTime defined by XML
Schema:

    CCYY-MM-DDThh:mm:ssTZD
    CCYY-MM-DDThh:mm:ss.sssTZD

where TZD is Z or [+-]hh:mm.

If self is a UTC time, Z is used as TZD.  [+-]hh:mm is used otherwise.

`fraction_digits` specifies a number of digits to use for fractional seconds. 
Its default value is 0.

    t = Time.now
    t.xmlschema  # => "2011-10-05T22:26:12-04:00"

**@overload** [] 

## yday() [](#method-i-yday)
Returns the integer day of the year of `self`, in range (1..366).

    Time.new(2000, 1, 1).yday   # => 1
    Time.new(2000, 12, 31).yday # => 366

**@overload** [] 

## year() [](#method-i-year)
Returns the integer year for `self`:

    t = Time.new(2000, 1, 2, 3, 4, 5, 6)
    # => 2000-01-02 03:04:05 +000006
    t.year # => 2000

Related: Time#mon, Time#hour, Time#min.

**@overload** [] 

## zone() [](#method-i-zone)
Returns the string name of the time zone for `self`:

    Time.utc(2000, 1, 1).zone # => "UTC"
    Time.new(2000, 1, 1).zone # => "Central Standard Time"

**@overload** [] 

