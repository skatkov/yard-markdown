# Class: Enumerator::Yielder
**Inherits:** Object
    




#Instance Methods
## <<(arg) [](#method-i-<<)
:nodoc:

## initialize() [](#method-i-initialize)
:nodoc:

## to_proc() [](#method-i-to_proc)
Returns a Proc object that takes arguments and yields them.

This method is implemented so that a Yielder object can be directly passed to
another method as a block argument.

    enum = Enumerator.new { |y|
      Dir.glob("*.rb") { |file|
        File.open(file) { |f| f.each_line(&y) }
      }
    }

## yield(args) [](#method-i-yield)
:nodoc:

