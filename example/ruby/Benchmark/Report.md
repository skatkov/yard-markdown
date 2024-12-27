# Class: Benchmark::Report
**Inherits:** Object
    

This class is used by the Benchmark.benchmark and Benchmark.bm methods. It is
of little direct interest to the user.


# Attributes
## format[RW] [](#attribute-i-format)
An array of Benchmark::Tms objects representing each item.

## list[RW] [](#attribute-i-list)
An array of Benchmark::Tms objects representing each item.

## width[RW] [](#attribute-i-width)
An array of Benchmark::Tms objects representing each item.


#Instance Methods
## initialize(width0, formatnil) [](#method-i-initialize)
Returns an initialized Report instance. Usually, one doesn't call this method
directly, as new Report objects are created by the #benchmark and #bm methods.
`width` and `format` are the label offset and format string used by
Tms#format.

**@return** [Report] a new instance of Report

## item(label"", *format, &blk) [](#method-i-item)
Prints the `label` and measured time for the block, formatted by `format`. See
Tms#format for the formatting rules.

