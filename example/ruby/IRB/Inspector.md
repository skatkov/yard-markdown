# Class: IRB::Inspector
**Inherits:** Object
    

An irb inspector

In order to create your own custom inspector there are two things you should
be aware of:

Inspector uses #inspect_value, or `inspect_proc`, for output of return values.

This also allows for an optional #init+, or `init_proc`, which is called when
the inspector is activated.

Knowing this, you can create a rudimentary inspector as follows:

    irb(main):001:0> ins = IRB::Inspector.new(proc{ |v| "omg! #{v}" })
    irb(main):001:0> IRB.CurrentContext.inspect_mode = ins # => omg! #<IRB::Inspector:0x007f46f7ba7d28>
    irb(main):001:0> "what?" #=> omg! what?


# Class Methods
## def_inspector(key , arg nil, &block ) [](#method-c-def_inspector)
Example

    Inspector.def_inspector(key, init_p=nil){|v| v.inspect}
    Inspector.def_inspector([key1,..], init_p=nil){|v| v.inspect}
    Inspector.def_inspector(key, inspector)
    Inspector.def_inspector([key1,...], inspector)
## keys_with_inspector(inspector ) [](#method-c-keys_with_inspector)
Determines the inspector to use where `inspector` is one of the keys passed
during inspector definition.

#Instance Methods
## init() [](#method-i-init)
Proc to call when the inspector is activated, good for requiring dependent
libraries.

## initialize(inspect_proc, init_procnil) [](#method-i-initialize)
Creates a new inspector object, using the given `inspect_proc` when output
return values in irb.

**@return** [Inspector] a new instance of Inspector

## inspect_value(v) [](#method-i-inspect_value)
Proc to call when the input is evaluated and output in irb.

