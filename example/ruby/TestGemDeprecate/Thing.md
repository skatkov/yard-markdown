# Class: TestGemDeprecate::Thing
**Inherits:** Object
  
**Extended by:** Gem::Deprecate
    



# Class Methods
## deprecate(name , repl , year , month ) [](#method-c-deprecate)
Simple deprecation method that deprecates `name` by wrapping it up in a dummy
method. It warns on each call to the dummy method telling the user of `repl`
(unless `repl` is :none) and the year/month that it is planned to go away.
# Attributes
## message[RW] [](#attribute-i-message)
Returns the value of attribute message.


#Instance Methods
## bar() [](#method-i-bar)

## bar_arg(msg) [](#method-i-bar_arg)

## bar_kwarg(message:) [](#method-i-bar_kwarg)

## foo() [](#method-i-foo)

## foo_arg(msg) [](#method-i-foo_arg)

## foo_kwarg(message:) [](#method-i-foo_kwarg)

