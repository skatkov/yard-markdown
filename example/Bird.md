# Class: Bird
**Inherits:** Object
    
**Defined in:** example_rdoc.rb

The base class for all birds.

# Public Instance Methods
## _fly_impl(_direction, _velocity) [](#method-i-_fly_impl)
:nodoc:

## fly(direction, velocity) [](#method-i-fly)
Fly somewhere.

Flying is the most critical feature of birds.

:args: direction, velocity

:call-seq:
    Bird.fly(symbol, number) -> bool
    Bird.fly(string, number) -> bool

# Example

    fly(:south, 70)

## speak() [](#method-i-speak)
Produce some noise. -- FIXME: maybe extract this to a base class `Animal`? ++

**yield** ["tweet"] 


# Constants
## DEFAULT_DUCK_VELOCITY [](#constant-DEFAULT_DUCK_VELOCITY)
Default velocity for a flying duck.


## DEFAULT_SPEED [](#constant-DEFAULT_SPEED)
Maximum speed for a swimming duck.


