# Class: IRB::Notifier::AbstractNotifier
**Inherits:** Object
    

An abstract class, or superclass, for CompositeNotifier and LeveledNotifier to
inherit. It provides several wrapper methods for the OutputMethod object used
by the Notifier.


# Attributes
## prefix[RW] [](#attribute-i-prefix)
The `prefix` for this Notifier, which is appended to all objects being
inspected during output.


#Instance Methods
## exec_if() [](#method-i-exec_if)
Execute the given block if notifications are enabled.

**@yield** [@base_notifier] 

## initialize(prefix, base_notifier) [](#method-i-initialize)
Creates a new Notifier object

**@return** [AbstractNotifier] a new instance of AbstractNotifier

## notify?() [](#method-i-notify?)
A wrapper method used to determine whether notifications are enabled.

Defaults to `true`.

**@return** [Boolean] 

## pp(*objs) [](#method-i-pp)
Same as #ppx, except it uses the #prefix given during object initialization.
See OutputMethod#ppx for more detail.

## ppx(prefix, *objs) [](#method-i-ppx)
Same as #pp, except it concatenates the given `prefix` with the #prefix given
during object initialization.

See OutputMethod#ppx for more detail.

## print(*opts) [](#method-i-print)
See OutputMethod#print for more detail.

## printf(format, *opts) [](#method-i-printf)
See OutputMethod#printf for more detail.

## printn(*opts) [](#method-i-printn)
See OutputMethod#printn for more detail.

## puts(*objs) [](#method-i-puts)
See OutputMethod#puts for more detail.

