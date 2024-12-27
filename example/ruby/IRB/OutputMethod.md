# Class: IRB::OutputMethod
**Inherits:** Object
    

An abstract output class for IO in irb. This is mainly used internally by
IRB::Notifier. You can define your own output method to use with Irb.new, or
Context.new



#Instance Methods
## parse_printf_format(format, opts) [](#method-i-parse_printf_format)
Returns an array of the given `format` and `opts` to be used by
Kernel#sprintf, if there was a successful Regexp match in the given `format`
from #printf

    %
    <flag>  [#0- +]
    <minimum field width> (\*|\*[1-9][0-9]*\$|[1-9][0-9]*)
    <precision>.(\*|\*[1-9][0-9]*\$|[1-9][0-9]*|)?
    #<length modifier>(hh|h|l|ll|L|q|j|z|t)
    <conversion specifier>[diouxXeEfgGcsb%]

## pp(*objs) [](#method-i-pp)
Prints the given `objs` calling Object#inspect on each.

See #puts for more detail.

## ppx(prefix, *objs) [](#method-i-ppx)
Prints the given `objs` calling Object#inspect on each and appending the given
`prefix`.

See #puts for more detail.

## print(*opts) [](#method-i-print)
Open this method to implement your own output method, raises a
NotImplementedError if you don't define #print in your own class.

**@raise** [NotImplementedError] 

## printf(format, *opts) [](#method-i-printf)
Extends IO#printf to format the given `opts` for Kernel#sprintf using
#parse_printf_format

## printn(*opts) [](#method-i-printn)
Prints the given `opts`, with a newline delimiter.

## puts(*objs) [](#method-i-puts)
Calls #print on each element in the given `objs`, followed by a newline
character.

