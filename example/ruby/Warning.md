# Module: Warning
  
**Extended by:** CompileWarning
    

The Warning module contains a single method named #warn, and the module
extends itself, making Warning.warn available. Warning.warn is called for all
warnings issued by Ruby. By default, warnings are printed to $stderr.

Changing the behavior of Warning.warn is useful to customize how warnings are
handled by Ruby, for instance by filtering some warnings, and/or outputting
warnings somewhere other than `$stderr`.

If you want to change the behavior of Warning.warn you should use
`Warning.extend(MyNewModuleWithWarnMethod)` and you can use `super` to get the
default behavior of printing the warning to `$stderr`.

Example:
    module MyWarningFilter
      def warn(message, category: nil, **kwargs)
        if /some warning I want to ignore/.match?(message)
          # ignore
        else
          super
        end
      end
    end
    Warning.extend MyWarningFilter

You should never redefine Warning#warn (the instance method), as that will
then no longer provide a way to use the default behavior.

The [warning](https://rubygems.org/gems/warning) gem provides convenient ways
to customize Warning.warn.


# Class Methods
## [](category ) [](#method-c-[])
Returns the flag to show the warning messages for `category`. Supported
categories are:

`:deprecated`
:   deprecation warnings
    *   assignment of non-nil value to `$,` and `$;`
    *   keyword arguments
    etc.


`:experimental`
:   experimental features


`:performance`
:   performance hints
    *   Shape variation limit

**@overload** [] 

## []=(category , flag ) [](#method-c-[]=)
Sets the warning flags for `category`. See Warning.[] for the categories.
**@overload** [] 

## categories() [](#method-c-categories)
Returns a list of the supported category symbols.
**@overload** [] 

## warn(message ) [](#method-c-warn)

#Instance Methods
## warn(*args) [](#method-i-warn)
Writes warning message `msg` to $stderr. This method is called by Ruby for all
emitted warnings. A `category` may be included with the warning.

See the documentation of the Warning module for how to customize this.

**@overload** [] 

