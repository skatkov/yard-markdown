# Class: Benchmark::Tms
**Inherits:** Object
    

A data object, representing the times associated with a benchmark measurement.


# Attributes
## cstime[RW] [](#attribute-i-cstime)
System CPU time of children

## cutime[RW] [](#attribute-i-cutime)
User CPU time of children

## label[RW] [](#attribute-i-label)
Label

## real[RW] [](#attribute-i-real)
Elapsed real time

## stime[RW] [](#attribute-i-stime)
System CPU time

## total[RW] [](#attribute-i-total)
Total time, that is `utime` + `stime` + `cutime` + `cstime`

## utime[RW] [](#attribute-i-utime)
User CPU time


#Instance Methods
## *(x) [](#method-i-*)
Returns a new Tms object obtained by memberwise multiplication of the
individual times for this Tms object by `x`.

## +(other) [](#method-i-+)
Returns a new Tms object obtained by memberwise summation of the individual
times for this Tms object with those of the `other` Tms object. This method
and #/() are useful for taking statistics.

## -(other) [](#method-i--)
Returns a new Tms object obtained by memberwise subtraction of the individual
times for the `other` Tms object from those of this Tms object.

## /(x) [](#method-i-/)
Returns a new Tms object obtained by memberwise division of the individual
times for this Tms object by `x`. This method and #+() are useful for taking
statistics.

## add(&blk) [](#method-i-add)
Returns a new Tms object whose times are the sum of the times for this Tms
object, plus the time required to execute the code block (`blk`).

## add!(&blk) [](#method-i-add!)
An in-place version of #add. Changes the times of this Tms object by making it
the sum of the times for this Tms object, plus the time required to execute
the code block (`blk`).

## format(formatnil, *args) [](#method-i-format)
Returns the contents of this Tms object as a formatted string, according to a
`format` string like that passed to Kernel.format. In addition, #format
accepts the following extensions:

`%u`
:   Replaced by the user CPU time, as reported by Tms#utime.

`%y`
:   Replaced by the system CPU time, as reported by #stime (Mnemonic: y of
    "s*y*stem")

`%U`
:   Replaced by the children's user CPU time, as reported by Tms#cutime

`%Y`
:   Replaced by the children's system CPU time, as reported by Tms#cstime

`%t`
:   Replaced by the total CPU time, as reported by Tms#total

`%r`
:   Replaced by the elapsed real time, as reported by Tms#real

`%n`
:   Replaced by the label string, as reported by Tms#label (Mnemonic: n of
    "*n*ame")


If `format` is not given, FORMAT is used as default value, detailing the user,
system and real elapsed time.

## initialize(utime0.0, stime0.0, cutime0.0, cstime0.0, real0.0, labelnil) [](#method-i-initialize)
Returns an initialized Tms object which has `utime` as the user CPU time,
`stime` as the system CPU time, `cutime` as the children's user CPU time,
`cstime` as the children's system CPU time, `real` as the elapsed real time
and `label` as the label.

**@return** [Tms] a new instance of Tms

## to_a() [](#method-i-to_a)
Returns a new 6-element array, consisting of the label, user CPU time, system
CPU time, children's user CPU time, children's system CPU time and elapsed
real time.

## to_h() [](#method-i-to_h)
Returns a hash containing the same data as `to_a`.

## to_s() [](#method-i-to_s)
Same as #format.

