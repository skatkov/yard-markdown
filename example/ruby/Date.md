# Class: Date
**Inherits:** Object
    
**Includes:** Comparable
  



# Class Methods
## _httpdate(*args ) [](#method-c-_httpdate)
Returns a hash of values parsed from `string`, which should be a valid [HTTP
date format](rdoc-ref:strftime_formatting.rdoc@HTTP+Format):

    d = Date.new(2001, 2, 3)
    s = d.httpdate # => "Sat, 03 Feb 2001 00:00:00 GMT"
    Date._httpdate(s)
    # => {:wday=>6, :mday=>3, :mon=>2, :year=>2001, :hour=>0, :min=>0, :sec=>0, :zone=>"GMT", :offset=>0}

Related: Date.httpdate (returns a Date object).
**@overload** [] 

## _iso8601(*args ) [](#method-c-_iso8601)
Returns a hash of values parsed from `string`, which should contain an [ISO
8601 formatted
date](rdoc-ref:strftime_formatting.rdoc@ISO+8601+Format+Specifications):

    d = Date.new(2001, 2, 3)
    s = d.iso8601    # => "2001-02-03"
    Date._iso8601(s) # => {:mday=>3, :year=>2001, :mon=>2}

See argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date.iso8601 (returns a Date object).
**@overload** [] 

## _jisx0301(*args ) [](#method-c-_jisx0301)
Returns a hash of values parsed from `string`, which should be a valid [JIS X
0301 date format](rdoc-ref:strftime_formatting.rdoc@JIS+X+0301+Format):

    d = Date.new(2001, 2, 3)
    s = d.jisx0301    # => "H13.02.03"
    Date._jisx0301(s) # => {:year=>2001, :mon=>2, :mday=>3}

See argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date.jisx0301 (returns a Date object).
**@overload** [] 

## _load(s ) [](#method-c-_load)
:nodoc:
## _parse(*args ) [](#method-c-_parse)
**Note**: This method recognizes many forms in `string`, but it is not a
validator. For formats, see ["Specialized Format Strings" in Formats for Dates
and Times](rdoc-ref:strftime_formatting.rdoc@Specialized+Format+Strings)

If `string` does not specify a valid date, the result is unpredictable;
consider using Date._strptime instead.

Returns a hash of values parsed from `string`:

    Date._parse('2001-02-03') # => {:year=>2001, :mon=>2, :mday=>3}

If `comp` is `true` and the given year is in the range `(0..99)`, the current
century is supplied; otherwise, the year is taken as given:

    Date._parse('01-02-03', true)  # => {:year=>2001, :mon=>2, :mday=>3}
    Date._parse('01-02-03', false) # => {:year=>1, :mon=>2, :mday=>3}

See argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date.parse(returns a Date object).
**@overload** [] 

## _rfc2822(*args ) [](#method-c-_rfc2822)
Returns a hash of values parsed from `string`, which should be a valid [RFC
2822 date format](rdoc-ref:strftime_formatting.rdoc@RFC+2822+Format):

    d = Date.new(2001, 2, 3)
    s = d.rfc2822 # => "Sat, 3 Feb 2001 00:00:00 +0000"
    Date._rfc2822(s)
    # => {:wday=>6, :mday=>3, :mon=>2, :year=>2001, :hour=>0, :min=>0, :sec=>0, :zone=>"+0000", :offset=>0}

See argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date.rfc2822 (returns a Date object).
**@overload** [] 

## _rfc3339(*args ) [](#method-c-_rfc3339)
Returns a hash of values parsed from `string`, which should be a valid [RFC
3339 format](rdoc-ref:strftime_formatting.rdoc@RFC+3339+Format):

    d = Date.new(2001, 2, 3)
    s = d.rfc3339     # => "2001-02-03T00:00:00+00:00"
    Date._rfc3339(s)
    # => {:year=>2001, :mon=>2, :mday=>3, :hour=>0, :min=>0, :sec=>0, :zone=>"+00:00", :offset=>0}

See argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date.rfc3339 (returns a Date object).
**@overload** [] 

## _rfc822(*args ) [](#method-c-_rfc822)
Returns a hash of values parsed from `string`, which should be a valid [RFC
2822 date format](rdoc-ref:strftime_formatting.rdoc@RFC+2822+Format):

    d = Date.new(2001, 2, 3)
    s = d.rfc2822 # => "Sat, 3 Feb 2001 00:00:00 +0000"
    Date._rfc2822(s)
    # => {:wday=>6, :mday=>3, :mon=>2, :year=>2001, :hour=>0, :min=>0, :sec=>0, :zone=>"+0000", :offset=>0}

See argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date.rfc2822 (returns a Date object).
**@overload** [] 

## _strptime(*args ) [](#method-c-_strptime)
Returns a hash of values parsed from `string` according to the given `format`:

    Date._strptime('2001-02-03', '%Y-%m-%d') # => {:year=>2001, :mon=>2, :mday=>3}

For other formats, see [Formats for Dates and
Times](rdoc-ref:strftime_formatting.rdoc). (Unlike Date.strftime, does not
support flags and width.)

See also [strptime(3)](https://man7.org/linux/man-pages/man3/strptime.3.html).

Related: Date.strptime (returns a Date object).
**@overload** [] 

## _xmlschema(*args ) [](#method-c-_xmlschema)
Returns a hash of values parsed from `string`, which should be a valid XML
date format:

    d = Date.new(2001, 2, 3)
    s = d.xmlschema    # => "2001-02-03"
    Date._xmlschema(s) # => {:year=>2001, :mon=>2, :mday=>3}

See argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date.xmlschema (returns a Date object).
**@overload** [] 

## civil(*args ) [](#method-c-civil)
Same as Date.new.
## commercial(*args ) [](#method-c-commercial)
Returns a new Date object constructed from the arguments.

Argument `cwyear` gives the year, and should be an integer.

Argument `cweek` gives the index of the week within the year, and should be in
range (1..53) or (-53..-1); in some years, 53 or -53 will be out-of-range; if
negative, counts backward from the end of the year:

    Date.commercial(2022, 1, 1).to_s  # => "2022-01-03"
    Date.commercial(2022, 52, 1).to_s # => "2022-12-26"

Argument `cwday` gives the indes of the weekday within the week, and should be
in range (1..7) or (-7..-1); 1 or -7 is Monday; if negative, counts backward
from the end of the week:

    Date.commercial(2022, 1, 1).to_s  # => "2022-01-03"
    Date.commercial(2022, 1, -7).to_s # => "2022-01-03"

When `cweek` is 1:

*   If January 1 is a Friday, Saturday, or Sunday, the first week begins in
    the week after:

        Date::ABBR_DAYNAMES[Date.new(2023, 1, 1).wday] # => "Sun"
        Date.commercial(2023, 1, 1).to_s # => "2023-01-02"
          Date.commercial(2023, 1, 7).to_s # => "2023-01-08"

*   Otherwise, the first week is the week of January 1, which may mean some of
    the days fall on the year before:

        Date::ABBR_DAYNAMES[Date.new(2020, 1, 1).wday] # => "Wed"
        Date.commercial(2020, 1, 1).to_s # => "2019-12-30"
          Date.commercial(2020, 1, 7).to_s # => "2020-01-05"

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

Related: Date.jd, Date.new, Date.ordinal.
**@overload** [] 

## gregorian_leap?(y ) [](#method-c-gregorian_leap?)
Returns `true` if the given year is a leap year in the [proleptic Gregorian
calendar](https://en.wikipedia.org/wiki/Proleptic_Gregorian_calendar), `false`
otherwise:

    Date.gregorian_leap?(2000) # => true
    Date.gregorian_leap?(2001) # => false

Related: Date.julian_leap?.
**@overload** [] 

## httpdate(*args ) [](#method-c-httpdate)
Returns a new Date object with values parsed from `string`, which should be a
valid [HTTP date format](rdoc-ref:strftime_formatting.rdoc@HTTP+Format):

    d = Date.new(2001, 2, 3)
      s = d.httpdate   # => "Sat, 03 Feb 2001 00:00:00 GMT"
      Date.httpdate(s) # => #<Date: 2001-02-03>

See:

*   Argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).
*   Argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date._httpdate (returns a hash).
**@overload** [] 

## iso8601(*args ) [](#method-c-iso8601)
Returns a new Date object with values parsed from `string`, which should
contain an [ISO 8601 formatted
date](rdoc-ref:strftime_formatting.rdoc@ISO+8601+Format+Specifications):

    d = Date.new(2001, 2, 3)
    s = d.iso8601   # => "2001-02-03"
    Date.iso8601(s) # => #<Date: 2001-02-03>

See:

*   Argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).
*   Argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date._iso8601 (returns a hash).
**@overload** [] 

## jd(*args ) [](#method-c-jd)
Returns a new Date object formed from the arguments:

    Date.jd(2451944).to_s # => "2001-02-03"
    Date.jd(2451945).to_s # => "2001-02-04"
    Date.jd(0).to_s       # => "-4712-01-01"

The returned date is:

*   Gregorian, if the argument is greater than or equal to `start`:

        Date::ITALY                         # => 2299161
        Date.jd(Date::ITALY).gregorian?     # => true
        Date.jd(Date::ITALY + 1).gregorian? # => true

*   Julian, otherwise

        Date.jd(Date::ITALY - 1).julian?    # => true

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

Related: Date.new.
**@overload** [] 

## jisx0301(*args ) [](#method-c-jisx0301)
Returns a new Date object with values parsed from `string`, which should be a
valid [JIS X 0301
format](rdoc-ref:strftime_formatting.rdoc@JIS+X+0301+Format):

    d = Date.new(2001, 2, 3)
    s = d.jisx0301   # => "H13.02.03"
    Date.jisx0301(s) # => #<Date: 2001-02-03>

For no-era year, legacy format, Heisei is assumed.

    Date.jisx0301('13.02.03') # => #<Date: 2001-02-03>

See:

*   Argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).
*   Argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date._jisx0301 (returns a hash).
**@overload** [] 

## json_create(object ) [](#method-c-json_create)
See #as_json.
## julian_leap?(y ) [](#method-c-julian_leap?)
Returns `true` if the given year is a leap year in the [proleptic Julian
calendar](https://en.wikipedia.org/wiki/Proleptic_Julian_calendar), `false`
otherwise:

    Date.julian_leap?(1900) # => true
    Date.julian_leap?(1901) # => false

Related: Date.gregorian_leap?.
**@overload** [] 

## leap?(y ) [](#method-c-leap?)
Returns `true` if the given year is a leap year in the [proleptic Gregorian
calendar](https://en.wikipedia.org/wiki/Proleptic_Gregorian_calendar), `false`
otherwise:

    Date.gregorian_leap?(2000) # => true
    Date.gregorian_leap?(2001) # => false

Related: Date.julian_leap?.
**@overload** [] 

## new!(*args ) [](#method-c-new!)
:nodoc:
## nth_kday(*args ) [](#method-c-nth_kday)
:nodoc:
## ordinal(*args ) [](#method-c-ordinal)
Returns a new Date object formed fom the arguments.

With no arguments, returns the date for January 1, -4712:

    Date.ordinal.to_s # => "-4712-01-01"

With argument `year`, returns the date for January 1 of that year:

    Date.ordinal(2001).to_s  # => "2001-01-01"
    Date.ordinal(-2001).to_s # => "-2001-01-01"

With positive argument `yday` == `n`, returns the date for the `nth` day of
the given year:

    Date.ordinal(2001, 14).to_s # => "2001-01-14"

With negative argument `yday`, counts backward from the end of the year:

    Date.ordinal(2001, -14).to_s # => "2001-12-18"

Raises an exception if `yday` is zero or out of range.

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

Related: Date.jd, Date.new.
**@overload** [] 

## parse(*args ) [](#method-c-parse)
**Note**: This method recognizes many forms in `string`, but it is not a
validator. For formats, see ["Specialized Format Strings" in Formats for Dates
and Times](rdoc-ref:strftime_formatting.rdoc@Specialized+Format+Strings) If
`string` does not specify a valid date, the result is unpredictable; consider
using Date._strptime instead.

Returns a new Date object with values parsed from `string`:

    Date.parse('2001-02-03')   # => #<Date: 2001-02-03>
    Date.parse('20010203')     # => #<Date: 2001-02-03>
    Date.parse('3rd Feb 2001') # => #<Date: 2001-02-03>

If `comp` is `true` and the given year is in the range `(0..99)`, the current
century is supplied; otherwise, the year is taken as given:

    Date.parse('01-02-03', true)  # => #<Date: 2001-02-03>
    Date.parse('01-02-03', false) # => #<Date: 0001-02-03>

See:

*   Argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).
*   Argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date._parse (returns a hash).
**@overload** [] 

## rfc2822(*args ) [](#method-c-rfc2822)
Returns a new Date object with values parsed from `string`, which should be a
valid [RFC 2822 date
format](rdoc-ref:strftime_formatting.rdoc@RFC+2822+Format):

    d = Date.new(2001, 2, 3)
    s = d.rfc2822   # => "Sat, 3 Feb 2001 00:00:00 +0000"
    Date.rfc2822(s) # => #<Date: 2001-02-03>

See:

*   Argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).
*   Argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date._rfc2822 (returns a hash).
**@overload** [] 

## rfc3339(*args ) [](#method-c-rfc3339)
Returns a new Date object with values parsed from `string`, which should be a
valid [RFC 3339 format](rdoc-ref:strftime_formatting.rdoc@RFC+3339+Format):

    d = Date.new(2001, 2, 3)
    s = d.rfc3339   # => "2001-02-03T00:00:00+00:00"
    Date.rfc3339(s) # => #<Date: 2001-02-03>

See:

*   Argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).
*   Argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date._rfc3339 (returns a hash).
**@overload** [] 

## rfc822(*args ) [](#method-c-rfc822)
Returns a new Date object with values parsed from `string`, which should be a
valid [RFC 2822 date
format](rdoc-ref:strftime_formatting.rdoc@RFC+2822+Format):

    d = Date.new(2001, 2, 3)
    s = d.rfc2822   # => "Sat, 3 Feb 2001 00:00:00 +0000"
    Date.rfc2822(s) # => #<Date: 2001-02-03>

See:

*   Argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).
*   Argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date._rfc2822 (returns a hash).
**@overload** [] 

## strptime(*args ) [](#method-c-strptime)
Returns a new Date object with values parsed from `string`, according to the
given `format`:

    Date.strptime('2001-02-03', '%Y-%m-%d')  # => #<Date: 2001-02-03>
    Date.strptime('03-02-2001', '%d-%m-%Y')  # => #<Date: 2001-02-03>
    Date.strptime('2001-034', '%Y-%j')       # => #<Date: 2001-02-03>
    Date.strptime('2001-W05-6', '%G-W%V-%u') # => #<Date: 2001-02-03>
    Date.strptime('2001 04 6', '%Y %U %w')   # => #<Date: 2001-02-03>
    Date.strptime('2001 05 6', '%Y %W %u')   # => #<Date: 2001-02-03>
    Date.strptime('sat3feb01', '%a%d%b%y')   # => #<Date: 2001-02-03>

For other formats, see [Formats for Dates and
Times](rdoc-ref:strftime_formatting.rdoc). (Unlike Date.strftime, does not
support flags and width.)

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

See also [strptime(3)](https://man7.org/linux/man-pages/man3/strptime.3.html).

Related: Date._strptime (returns a hash).
**@overload** [] 

## test_all() [](#method-c-test_all)
:nodoc:
## test_civil() [](#method-c-test_civil)
:nodoc:
## test_commercial() [](#method-c-test_commercial)
:nodoc:
## test_nth_kday() [](#method-c-test_nth_kday)
:nodoc:
## test_ordinal() [](#method-c-test_ordinal)
:nodoc:
## test_unit_conv() [](#method-c-test_unit_conv)
:nodoc:
## test_weeknum() [](#method-c-test_weeknum)
:nodoc:
## today(*args ) [](#method-c-today)
Returns a new Date object constructed from the present date:

    Date.today.to_s # => "2022-07-06"

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).
**@overload** [] 

## valid_civil?(*args ) [](#method-c-valid_civil?)
Returns `true` if the arguments define a valid ordinal date, `false`
otherwise:

    Date.valid_date?(2001, 2, 3)  # => true
    Date.valid_date?(2001, 2, 29) # => false
    Date.valid_date?(2001, 2, -1) # => true

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

Related: Date.jd, Date.new.
**@overload** [] 

## valid_commercial?(*args ) [](#method-c-valid_commercial?)
Returns `true` if the arguments define a valid commercial date, `false`
otherwise:

    Date.valid_commercial?(2001, 5, 6) # => true
    Date.valid_commercial?(2001, 5, 8) # => false

See Date.commercial.

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

Related: Date.jd, Date.commercial.
**@overload** [] 

## valid_date?(*args ) [](#method-c-valid_date?)
Returns `true` if the arguments define a valid ordinal date, `false`
otherwise:

    Date.valid_date?(2001, 2, 3)  # => true
    Date.valid_date?(2001, 2, 29) # => false
    Date.valid_date?(2001, 2, -1) # => true

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

Related: Date.jd, Date.new.
**@overload** [] 

## valid_jd?(*args ) [](#method-c-valid_jd?)
Implemented for compatibility; returns `true` unless `jd` is invalid (i.e.,
not a Numeric).

    Date.valid_jd?(2451944) # => true

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

Related: Date.jd.
**@overload** [] 

## valid_ordinal?(*args ) [](#method-c-valid_ordinal?)
Returns `true` if the arguments define a valid ordinal date, `false`
otherwise:

    Date.valid_ordinal?(2001, 34)  # => true
    Date.valid_ordinal?(2001, 366) # => false

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

Related: Date.jd, Date.ordinal.
**@overload** [] 

## weeknum(*args ) [](#method-c-weeknum)
:nodoc:
## xmlschema(*args ) [](#method-c-xmlschema)
Returns a new Date object with values parsed from `string`, which should be a
valid XML date format:

    d = Date.new(2001, 2, 3)
    s = d.xmlschema   # => "2001-02-03"
    Date.xmlschema(s) # => #<Date: 2001-02-03>

See:

*   Argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).
*   Argument [limit](rdoc-ref:Date@Argument+limit).

Related: Date._xmlschema (returns a hash).
**@overload** [] 


#Instance Methods
## +(other) [](#method-i-+)
Returns a date object pointing `other` days after self.  The other should be a
numeric value.  If the other is a fractional number, assumes its precision is
at most nanosecond.

    Date.new(2001,2,3) + 1	#=> #<Date: 2001-02-04 ...>
    DateTime.new(2001,2,3) + Rational(1,2)

			#=> #<DateTime: 2001-02-03T12:00:00+00:00 ...>
    DateTime.new(2001,2,3) + Rational(-1,2)

			#=> #<DateTime: 2001-02-02T12:00:00+00:00 ...>
    DateTime.jd(0,12) + DateTime.new(2001,2,3).ajd

			#=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>

**@overload** [] 

## -(other) [](#method-i--)
If the other is a date object, returns a Rational whose value is the
difference between the two dates in days. If the other is a numeric value,
returns a date object pointing `other` days before self. If the other is a
fractional number, assumes its precision is at most nanosecond.

    Date.new(2001,2,3) - 1	#=> #<Date: 2001-02-02 ...>
    DateTime.new(2001,2,3) - Rational(1,2)

			#=> #<DateTime: 2001-02-02T12:00:00+00:00 ...>
    Date.new(2001,2,3) - Date.new(2001)

			#=> (33/1)
    DateTime.new(2001,2,3) - DateTime.new(2001,2,2,12)

			#=> (1/2)

**@overload** [] 

## <(y) [](#method-i-<)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than 0.

**@overload** [] 

## <<(other) [](#method-i-<<)
Returns a new Date object representing the date `n` months earlier; `n` should
be a numeric:

    (Date.new(2001, 2, 3) << 1).to_s  # => "2001-01-03"
    (Date.new(2001, 2, 3) << -2).to_s # => "2001-04-03"

When the same day does not exist for the new month, the last day of that month
is used instead:

    (Date.new(2001, 3, 31) << 1).to_s  # => "2001-02-28"
    (Date.new(2001, 3, 31) << -6).to_s # => "2001-09-30"

This results in the following, possibly unexpected, behaviors:

    d0 = Date.new(2001, 3, 31)
    d0 << 2      # => #<Date: 2001-01-31>
    d0 << 1 << 1 # => #<Date: 2001-01-28>

    d0 = Date.new(2001, 3, 31)
    d1 = d0 << 1  # => #<Date: 2001-02-28>
    d2 = d1 << -1 # => #<Date: 2001-03-28>

**@overload** [] 

## <=(y) [](#method-i-<=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value less than or equal to 0.

**@overload** [] 

## <=>(other) [](#method-i-<=>)
Compares `self` and `other`, returning:

*   `-1` if `other` is larger.
*   `0` if the two are equal.
*   `1` if `other` is smaller.
*   `nil` if the two are incomparable.

Argument `other` may be:

*   Another Date object:

        d = Date.new(2022, 7, 27) # => #<Date: 2022-07-27 ((2459788j,0s,0n),+0s,2299161j)>
        prev_date = d.prev_day    # => #<Date: 2022-07-26 ((2459787j,0s,0n),+0s,2299161j)>
        next_date = d.next_day    # => #<Date: 2022-07-28 ((2459789j,0s,0n),+0s,2299161j)>
        d <=> next_date           # => -1
        d <=> d                   # => 0
        d <=> prev_date           # => 1

*   A DateTime object:

        d <=> DateTime.new(2022, 7, 26) # => 1
        d <=> DateTime.new(2022, 7, 27) # => 0
        d <=> DateTime.new(2022, 7, 28) # => -1

*   A numeric (compares `self.ajd` to `other`):

        d <=> 2459788 # => -1
        d <=> 2459787 # => 1
        d <=> 2459786 # => 1
        d <=> d.ajd   # => 0

*   Any other object:

        d <=> Object.new # => nil

**@overload** [] 

## ==(y) [](#method-i-==)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns 0. Also returns true if *obj* and *other* are the same object.

**@overload** [] 

## ===(other) [](#method-i-===)
Returns `true` if `self` and `other` represent the same date, `false` if not,
`nil` if the two are not comparable.

Argument `other` may be:

*   Another Date object:

        d = Date.new(2022, 7, 27) # => #<Date: 2022-07-27 ((2459788j,0s,0n),+0s,2299161j)>
        prev_date = d.prev_day    # => #<Date: 2022-07-26 ((2459787j,0s,0n),+0s,2299161j)>
        next_date = d.next_day    # => #<Date: 2022-07-28 ((2459789j,0s,0n),+0s,2299161j)>
        d === prev_date           # => false
        d === d                   # => true
        d === next_date           # => false

*   A DateTime object:

        d === DateTime.new(2022, 7, 26) # => false
        d === DateTime.new(2022, 7, 27) # => true
        d === DateTime.new(2022, 7, 28) # => false

*   A numeric (compares `self.jd` to `other`):

        d === 2459788 # => true
        d === 2459787 # => false
        d === 2459786 # => false
        d === d.jd    # => true

*   An object not comparable:

        d === Object.new # => nil

**@overload** [] 

## >(y) [](#method-i->)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than 0.

**@overload** [] 

## >=(y) [](#method-i->=)
Compares two objects based on the receiver's `<=>` method, returning true if
it returns a value greater than or equal to 0.

**@overload** [] 

## >>(other) [](#method-i->>)
Returns a new Date object representing the date `n` months later; `n` should
be a numeric:

    (Date.new(2001, 2, 3) >> 1).to_s  # => "2001-03-03"
    (Date.new(2001, 2, 3) >> -2).to_s # => "2000-12-03"

When the same day does not exist for the new month, the last day of that month
is used instead:

    (Date.new(2001, 1, 31) >> 1).to_s  # => "2001-02-28"
    (Date.new(2001, 1, 31) >> -4).to_s # => "2000-09-30"

This results in the following, possibly unexpected, behaviors:

    d0 = Date.new(2001, 1, 31)
    d1 = d0 >> 1 # => #<Date: 2001-02-28>
    d2 = d1 >> 1 # => #<Date: 2001-03-28>

    d0 = Date.new(2001, 1, 31)
    d1 = d0 >> 1  # => #<Date: 2001-02-28>
    d2 = d1 >> -1 # => #<Date: 2001-01-28>

**@overload** [] 

## ajd() [](#method-i-ajd)
Returns the astronomical Julian day number.  This is a fractional number,
which is not adjusted by the offset.

    DateTime.new(2001,2,3,4,5,6,'+7').ajd	#=> (11769328217/4800)
    DateTime.new(2001,2,2,14,5,6,'-7').ajd	#=> (11769328217/4800)

**@overload** [] 

## amjd() [](#method-i-amjd)
Returns the astronomical modified Julian day number.  This is a fractional
number, which is not adjusted by the offset.

    DateTime.new(2001,2,3,4,5,6,'+7').amjd	#=> (249325817/4800)
    DateTime.new(2001,2,2,14,5,6,'-7').amjd	#=> (249325817/4800)

**@overload** [] 

## as_json() [](#method-i-as_json)
Methods `Date#as_json` and `Date.json_create` may be used to serialize and
deserialize a Date object; see [Marshal](rdoc-ref:Marshal).

Method `Date#as_json` serializes `self`, returning a 2-element hash
representing `self`:

    require 'json/add/date'
    x = Date.today.as_json
    # => {"json_class"=>"Date", "y"=>2023, "m"=>11, "d"=>21, "sg"=>2299161.0}

Method `JSON.create` deserializes such a hash, returning a Date object:

    Date.json_create(x)
    # => #<Date: 2023-11-21 ((2460270j,0s,0n),+0s,2299161j)>

## asctime() [](#method-i-asctime)
Equivalent to #strftime with argument `'%a %b %e %T %Y'` (or its [shorthand
form](rdoc-ref:strftime_formatting.rdoc@Shorthand+Conversion+Specifiers)
`'%c'`):

    Date.new(2001, 2, 3).asctime # => "Sat Feb  3 00:00:00 2001"

See [asctime](https://linux.die.net/man/3/asctime).

**@overload** [] 

## between?(min, max) [](#method-i-between?)
Returns `false` if *obj* `<=>` *min* is less than zero or if *obj* `<=>` *max*
is greater than zero, `true` otherwise.

    3.between?(1, 5)               #=> true
    6.between?(1, 5)               #=> false
    'cat'.between?('ant', 'dog')   #=> true
    'gnu'.between?('ant', 'dog')   #=> false

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
Equivalent to #strftime with argument `'%a %b %e %T %Y'` (or its [shorthand
form](rdoc-ref:strftime_formatting.rdoc@Shorthand+Conversion+Specifiers)
`'%c'`):

    Date.new(2001, 2, 3).asctime # => "Sat Feb  3 00:00:00 2001"

See [asctime](https://linux.die.net/man/3/asctime).

**@overload** [] 

## cwday() [](#method-i-cwday)
Returns the commercial-date weekday index for `self` (see Date.commercial); 1
is Monday:

    Date.new(2001, 2, 3).cwday # => 6

**@overload** [] 

## cweek() [](#method-i-cweek)
Returns commercial-date week index for `self` (see Date.commercial):

    Date.new(2001, 2, 3).cweek # => 5

**@overload** [] 

## cwyear() [](#method-i-cwyear)
Returns commercial-date year for `self` (see Date.commercial):

    Date.new(2001, 2, 3).cwyear # => 2001
    Date.new(2000, 1, 1).cwyear # => 1999

**@overload** [] 

## day() [](#method-i-day)
Returns the day of the month in range (1..31):

    Date.new(2001, 2, 3).mday # => 3

**@overload** [] 

## day_fraction() [](#method-i-day_fraction)
Returns the fractional part of the day in range (Rational(0, 1)...Rational(1,
1)):

    DateTime.new(2001,2,3,12).day_fraction # => (1/2)

**@overload** [] 

## deconstruct_keys(keys) [](#method-i-deconstruct_keys)
Returns a hash of the name/value pairs, to use in pattern matching. Possible
keys are: `:year`, `:month`, `:day`, `:wday`, `:yday`.

Possible usages:

    d = Date.new(2022, 10, 5)

    if d in wday: 3, day: ..7  # uses deconstruct_keys underneath
      puts "first Wednesday of the month"
    end
    #=> prints "first Wednesday of the month"

    case d
    in year: ...2022
      puts "too old"
    in month: ..9
      puts "quarter 1-3"
    in wday: 1..5, month:
      puts "working day in month #{month}"
    end
    #=> prints "working day in month 10"

Note that deconstruction by pattern can also be combined with class check:

    if d in Date(wday: 3, day: ..7)
      puts "first Wednesday of the month"
    end

**@overload** [] 

## downto(min) [](#method-i-downto)
Equivalent to #step with arguments `min` and `-1`.

**@overload** [] 

## england() [](#method-i-england)
Equivalent to Date#new_start with argument Date::ENGLAND.

**@overload** [] 

## eql?(other) [](#method-i-eql?)
:nodoc:

**@return** [Boolean] 

## fill() [](#method-i-fill)
:nodoc:

## friday?() [](#method-i-friday?)
Returns `true` if `self` is a Friday, `false` otherwise.

**@overload** [] 

## gregorian() [](#method-i-gregorian)
Equivalent to Date#new_start with argument Date::GREGORIAN.

**@overload** [] 

## gregorian?() [](#method-i-gregorian?)
Returns `true` if the date is on or after the date of calendar reform, `false`
otherwise:

    Date.new(1582, 10, 15).gregorian?       # => true
    (Date.new(1582, 10, 15) - 1).gregorian? # => false

**@overload** [] 

## hash() [](#method-i-hash)
:nodoc:

## httpdate() [](#method-i-httpdate)
Equivalent to #strftime with argument `'%a, %d %b %Y %T GMT'`; see [Formats
for Dates and Times](rdoc-ref:strftime_formatting.rdoc):

    Date.new(2001, 2, 3).httpdate # => "Sat, 03 Feb 2001 00:00:00 GMT"

**@overload** [] 

## infinite?() [](#method-i-infinite?)
call-seq:
    infinite? -> false

Returns `false`

**@return** [Boolean] 

## initialize(*args) [](#method-i-initialize)
Returns a new Date object constructed from the given arguments:

    Date.new(2022).to_s        # => "2022-01-01"
    Date.new(2022, 2).to_s     # => "2022-02-01"
    Date.new(2022, 2, 4).to_s  # => "2022-02-04"

Argument `month` should be in range (1..12) or range (-12..-1); when the
argument is negative, counts backward from the end of the year:

    Date.new(2022, -11, 4).to_s # => "2022-02-04"

Argument `mday` should be in range (1..n) or range (-n..-1) where `n` is the
number of days in the month; when the argument is negative, counts backward
from the end of the month.

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

Related: Date.jd.

**@overload** [] 

## initialize_copy(date) [](#method-i-initialize_copy)
:nodoc:

## inspect() [](#method-i-inspect)
Returns a string representation of `self`:

    Date.new(2001, 2, 3).inspect
    # => "#<Date: 2001-02-03 ((2451944j,0s,0n),+0s,2299161j)>"

**@overload** [] 

## inspect_raw() [](#method-i-inspect_raw)
:nodoc:

## iso8601() [](#method-i-iso8601)
Equivalent to #strftime with argument `'%Y-%m-%d'` (or its [shorthand
form](rdoc-ref:strftime_formatting.rdoc@Shorthand+Conversion+Specifiers)
`'%F'`);

    Date.new(2001, 2, 3).iso8601 # => "2001-02-03"

**@overload** [] 

## italy() [](#method-i-italy)
Equivalent to Date#new_start with argument Date::ITALY.

**@overload** [] 

## jd() [](#method-i-jd)
Returns the Julian day number.  This is a whole number, which is adjusted by
the offset as the local time.

    DateTime.new(2001,2,3,4,5,6,'+7').jd	#=> 2451944
    DateTime.new(2001,2,3,4,5,6,'-7').jd	#=> 2451944

**@overload** [] 

## jisx0301() [](#method-i-jisx0301)
Returns a string representation of the date in `self` in JIS X 0301 format.

    Date.new(2001, 2, 3).jisx0301 # => "H13.02.03"

**@overload** [] 

## julian() [](#method-i-julian)
Equivalent to Date#new_start with argument Date::JULIAN.

**@overload** [] 

## julian?() [](#method-i-julian?)
Returns `true` if the date is before the date of calendar reform, `false`
otherwise:

    (Date.new(1582, 10, 15) - 1).julian? # => true
    Date.new(1582, 10, 15).julian?       # => false

**@overload** [] 

## ld() [](#method-i-ld)
Returns the [Lilian day number](https://en.wikipedia.org/wiki/Lilian_date),
which is the number of days since the beginning of the Gregorian calendar,
October 15, 1582.

    Date.new(2001, 2, 3).ld # => 152784

**@overload** [] 

## leap?() [](#method-i-leap?)
Returns `true` if the year is a leap year, `false` otherwise:

    Date.new(2000).leap? # => true
    Date.new(2001).leap? # => false

**@overload** [] 

## marshal_dump() [](#method-i-marshal_dump)
:nodoc:

## marshal_dump_old() [](#method-i-marshal_dump_old)
:nodoc:

## marshal_load(a) [](#method-i-marshal_load)
:nodoc:

## mday() [](#method-i-mday)
Returns the day of the month in range (1..31):

    Date.new(2001, 2, 3).mday # => 3

**@overload** [] 

## mjd() [](#method-i-mjd)
Returns the modified Julian day number.  This is a whole number, which is
adjusted by the offset as the local time.

    DateTime.new(2001,2,3,4,5,6,'+7').mjd	#=> 51943
    DateTime.new(2001,2,3,4,5,6,'-7').mjd	#=> 51943

**@overload** [] 

## mon() [](#method-i-mon)
Returns the month in range (1..12):

    Date.new(2001, 2, 3).mon # => 2

**@overload** [] 

## monday?() [](#method-i-monday?)
Returns `true` if `self` is a Monday, `false` otherwise.

**@overload** [] 

## month() [](#method-i-month)
Returns the month in range (1..12):

    Date.new(2001, 2, 3).mon # => 2

**@overload** [] 

## new_start(*args) [](#method-i-new_start)
Returns a copy of `self` with the given `start` value:

    d0 = Date.new(2000, 2, 3)
    d0.julian? # => false
    d1 = d0.new_start(Date::JULIAN)
    d1.julian? # => true

See argument [start](rdoc-ref:date/calendars.rdoc@Argument+start).

**@overload** [] 

## next() [](#method-i-next)
Returns a new Date object representing the following day:

    d = Date.new(2001, 2, 3)
    d.to_s      # => "2001-02-03"
    d.next.to_s # => "2001-02-04"

**@overload** [] 

## next_day(*args) [](#method-i-next_day)
Equivalent to Date#+ with argument `n`.

**@overload** [] 

## next_month(*args) [](#method-i-next_month)
Equivalent to #>> with argument `n`.

**@overload** [] 

## next_year(*args) [](#method-i-next_year)
Equivalent to #>> with argument `n * 12`.

**@overload** [] 

## nth_kday?(n, k) [](#method-i-nth_kday?)
:nodoc:

**@return** [Boolean] 

## prev_day(*args) [](#method-i-prev_day)
Equivalent to Date#- with argument `n`.

**@overload** [] 

## prev_month(*args) [](#method-i-prev_month)
Equivalent to #<< with argument `n`.

**@overload** [] 

## prev_year(*args) [](#method-i-prev_year)
Equivalent to #<< with argument `n * 12`.

**@overload** [] 

## rfc2822() [](#method-i-rfc2822)
Equivalent to #strftime with argument `'%a, %-d %b %Y %T %z'`; see [Formats
for Dates and Times](rdoc-ref:strftime_formatting.rdoc):

    Date.new(2001, 2, 3).rfc2822 # => "Sat, 3 Feb 2001 00:00:00 +0000"

**@overload** [] 

## rfc3339() [](#method-i-rfc3339)
Equivalent to #strftime with argument `'%FT%T%:z'`; see [Formats for Dates and
Times](rdoc-ref:strftime_formatting.rdoc):

    Date.new(2001, 2, 3).rfc3339 # => "2001-02-03T00:00:00+00:00"

**@overload** [] 

## rfc822() [](#method-i-rfc822)
Equivalent to #strftime with argument `'%a, %-d %b %Y %T %z'`; see [Formats
for Dates and Times](rdoc-ref:strftime_formatting.rdoc):

    Date.new(2001, 2, 3).rfc2822 # => "Sat, 3 Feb 2001 00:00:00 +0000"

**@overload** [] 

## saturday?() [](#method-i-saturday?)
Returns `true` if `self` is a Saturday, `false` otherwise.

**@overload** [] 

## step(*args) [](#method-i-step)
Calls the block with specified dates; returns `self`.

*   The first `date` is `self`.
*   Each successive `date` is `date + step`, where `step` is the numeric step
    size in days.
*   The last date is the last one that is before or equal to `limit`, which
    should be a Date object.

Example:

    limit = Date.new(2001, 12, 31)
    Date.new(2001).step(limit){|date| p date.to_s if date.mday == 31 }

Output:

    "2001-01-31"
    "2001-03-31"
    "2001-05-31"
    "2001-07-31"
    "2001-08-31"
    "2001-10-31"
    "2001-12-31"

Returns an Enumerator if no block is given.

**@overload** [] 

## strftime(*args) [](#method-i-strftime)
Returns a string representation of the date in `self`, formatted according the
given `format`:

    Date.new(2001, 2, 3).strftime # => "2001-02-03"

For other formats, see [Formats for Dates and
Times](rdoc-ref:strftime_formatting.rdoc).

**@overload** [] 

## succ() [](#method-i-succ)
Returns a new Date object representing the following day:

    d = Date.new(2001, 2, 3)
    d.to_s      # => "2001-02-03"
    d.next.to_s # => "2001-02-04"

**@overload** [] 

## sunday?() [](#method-i-sunday?)
Returns `true` if `self` is a Sunday, `false` otherwise.

**@overload** [] 

## thursday?() [](#method-i-thursday?)
Returns `true` if `self` is a Thursday, `false` otherwise.

**@overload** [] 

## to_date() [](#method-i-to_date)
Returns `self`.

**@overload** [] 

## to_datetime() [](#method-i-to_datetime)
Returns a DateTime whose value is the same as `self`:

    Date.new(2001, 2, 3).to_datetime # => #<DateTime: 2001-02-03T00:00:00+00:00>

**@overload** [] 

## to_json(*args) [](#method-i-to_json)
Returns a JSON string representing `self`:

    require 'json/add/date'
    puts Date.today.to_json

Output:

    {"json_class":"Date","y":2023,"m":11,"d":21,"sg":2299161.0}

## to_s() [](#method-i-to_s)
Returns a string representation of the date in `self` in [ISO 8601 extended
date format](rdoc-ref:strftime_formatting.rdoc@ISO+8601+Format+Specifications)
(`'%Y-%m-%d'`):

    Date.new(2001, 2, 3).to_s # => "2001-02-03"

**@overload** [] 

## to_time() [](#method-i-to_time)
Returns a new Time object with the same value as `self`; if `self` is a Julian
date, derives its Gregorian date for conversion to the Time object:

    Date.new(2001, 2, 3).to_time               # => 2001-02-03 00:00:00 -0600
    Date.new(2001, 2, 3, Date::JULIAN).to_time # => 2001-02-16 00:00:00 -0600

**@overload** [] 

## tuesday?() [](#method-i-tuesday?)
Returns `true` if `self` is a Tuesday, `false` otherwise.

**@overload** [] 

## upto(max) [](#method-i-upto)
Equivalent to #step with arguments `max` and `1`.

**@overload** [] 

## wday() [](#method-i-wday)
Returns the day of week in range (0..6); Sunday is 0:

    Date.new(2001, 2, 3).wday # => 6

**@overload** [] 

## wednesday?() [](#method-i-wednesday?)
Returns `true` if `self` is a Wednesday, `false` otherwise.

**@overload** [] 

## xmlschema() [](#method-i-xmlschema)
Equivalent to #strftime with argument `'%Y-%m-%d'` (or its [shorthand
form](rdoc-ref:strftime_formatting.rdoc@Shorthand+Conversion+Specifiers)
`'%F'`);

    Date.new(2001, 2, 3).iso8601 # => "2001-02-03"

**@overload** [] 

## yday() [](#method-i-yday)
Returns the day of the year, in range (1..366):

    Date.new(2001, 2, 3).yday # => 34

**@overload** [] 

## year() [](#method-i-year)
Returns the year:

    Date.new(2001, 2, 3).year    # => 2001
    (Date.new(1, 1, 1) - 1).year # => 0

**@overload** [] 

