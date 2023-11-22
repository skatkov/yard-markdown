# Class: Bird
The base class for all birds.

# Constants
| Name | Value | Description |
| ---- | ---- | ----------- |
|DEFAULT_DUCK_VELOCITY | 70 | Default velocity for a flying duck.

# Public Instance Methods

## _fly_impl(_direction , _velocity ) [](#method-i-_fly_impl)
:nodoc:
## fly(direction , velocity ) [](#method-i-fly)
Fly somewhere.

Flying is the most critical feature of birds.

:args: direction, velocity

:call-seq:
  Bird.fly(symbol, number) -> bool
  Bird.fly(string, number) -> bool

= Example

  fly(:south, 70)
## speak() [](#method-i-speak)
Produce some noise.
--
FIXME: maybe extract this to a base class +Animal+?
++
